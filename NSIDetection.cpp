//===- NSIDetection.cpp - Proof of concept for detection NSI --------------===//
//
//                     The LLVM Compiler Infrastructure
//			
//						
//
//===----------------------------------------------------------------------===//
//
// This file implements a pass for detecting Non Size Increasing Programs 
//
//===----------------------------------------------------------------------===//

#include "llvm/IR/Function.h"
#include "llvm/IR/CallingConv.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Module.h"
#include "llvm/Pass.h"
#include "llvm/Support/raw_ostream.h"
#include <map>

using namespace llvm;

#define DEBUG_TYPE "nsidetection"

//NSI Detection pass
namespace{
	struct GimmeWeight : public FunctionPass {
		static char ID;

		GimmeWeight() : FunctionPass(ID){}
		//an Edge is a pair of BasicBlock: B1 → B2
		typedef std::pair<llvm::BasicBlock*, llvm::BasicBlock*>Edge;
		//each edge has a weight
		typedef std::map<Edge, int> Edges;
		typedef llvm::BasicBlock* Vertex;
		typedef std::map<Vertex, bool> VerticesB;

		//each function has a weight precomputed 
		std::map<std::string, int> DFSWeight;
		std::map<std::string, int> FunctionWeight;
		std::vector<Vertex> vertices;
		//each vertex is marked visited or not
		VerticesB BBmap;
		VerticesB BBmap2;
		Edges edges;
		//each vertex has a distance and boolean to know if it's infinity
		std::map<Vertex, std::pair<int,bool>> distance;

		void getAnalysisUsage(AnalysisUsage &AU) const{
			AU.setPreservesAll();
		}

		//build edges by traversing each BB in a DFS way
		virtual void gimmeEdgesDFS(BasicBlock *succ){
				int weight = 0;
				for(BasicBlock::iterator bi=(succ)->begin(),bend=(succ)->end();
						bi!=bend; ++bi){
					if (const CallInst *CI = dyn_cast<CallInst>(bi))
						if (const Function *F = CI->getCalledFunction()){
							if(F->getName() == "malloc")
								weight++;
							else if(F->getName() == "free")
								weight--;
							else
								weight += FunctionWeight[F->getName()];
						}
				}
				//for each BB get the list of successors
				const TerminatorInst *TInst = (succ)->getTerminator();
				BBmap2[succ]=true;
				vertices.push_back(succ);
				if(TInst->getNumSuccessors()==0)
					edges[std::make_pair(succ,nullptr)]=weight; //if no successor found
				else{
					for (unsigned I = 0, NSucc = TInst->getNumSuccessors(); I < NSucc; 
							++I) {
						BasicBlock *newSucc = TInst->getSuccessor(I);
						edges[std::make_pair(succ,newSucc)]=weight;
						if(!BBmap2[newSucc]) //protection against infinite loops
							gimmeEdgesDFS(newSucc);
					}
				} //end of else successors not empty
		} //end of gimmeEdgesDFS

		//implementation of Bellman-Ford algorithm
		virtual bool bellmanFord(BasicBlock *entry){ 
			std::map<Vertex,Vertex>predecessors;

			//initialization
			for(std::vector<Vertex>::iterator it=vertices.begin();
					it!=vertices.end(); ++it){
				if(*it==entry)
					distance[*it]=std::make_pair(0,false);
				else 
					distance[*it]=std::make_pair(-100,true); //supposed minus infinity
				predecessors[*it]=nullptr;	
			}

			//relaxation
			for(unsigned long i=1; i<vertices.size(); i++){
				for(Edges::iterator ed=edges.begin(); ed!=edges.end(); ed++){
					//first element is a pair of BB
					Vertex u = ed->first.first;
					Vertex v = ed->first.second; 
					//second element of ed is the weight
					if(distance[v].second || (!distance[u].second && distance[u].first +
								ed->second > distance[v].first)){
						distance[v].second = false; //not minus infinity anymore
						distance[v].first = distance[u].first + ed->second;
						predecessors[v] = u;
					}
				}
			}

			//negatives loops detection
			for(Edges::iterator ed=edges.begin(); ed!=edges.end(); ed++){
				Vertex u = ed->first.first; 
				Vertex v = ed->first.second; 
				//DEBUG info
				/* errs() << "DEBUG " << u->getName() << "=" << distance[u].first; */
				/* if(v != nullptr){ */
				/* 	errs() << " and " << v->getName() << "=" << distance[v].first; */
				/* } */
				/* else{ */
				/* 	errs() << " and v is nullptr "; */
				/* } */
				/* errs() << " edge weight =" << ed->second << "\n"; */
				//END DEBUG info
				if(distance[u].first + ed->second > distance[v].first 
						&& predecessors[v] == u){
					return false;
				}
			}
			return true;
		}

		//weight computation in a DFS way → pessimist and recursive
		virtual int evalBlockDFS(BasicBlock *succ, int prof){
			int weight=0;
			//this function draw a kind of tree in the same time…
			for(int i=0;i<prof;i++)
				errs() << "\t|";
			errs() << (succ)->getName() << ": \n";
			//for each instruction in the given BB
			for(BasicBlock::iterator bi=(succ)->begin(),bend=(succ)->end();
					bi!=bend; ++bi){
				//detect dynamic allocations and count them
				if (isa<AllocaInst>(bi) || isa<InvokeInst>(bi))
					errs() << "\tInstruction of type alloca or invoke \n";
				else if (const CallInst *CI = dyn_cast<CallInst>(bi))
					if (const Function *F = CI->getCalledFunction()){
						if(F->getName() == "malloc"){
							for(int i=0;i<prof;i++)
								errs() << "\t|";
							errs() << "\tmalloc here... \n";
							weight++;
						}
						else if(F->getName() == "free"){
							for(int i=0;i<prof;i++)
								errs() << "\t|";
							errs() << "\tfree there... \n";
							weight--;
						} else {
							//Count also functions weight (TODO need a bottom up for that)
							for(int i=0;i<prof;i++)
								errs() << "\t|";
							errs() << "\tcall @" << F->getName() << " : " 
								<< FunctionWeight[F->getName()] << "\n";
							weight += FunctionWeight[F->getName()];
						}
					}
			} //end of for I

			//Get successors
			const TerminatorInst *TInst = (succ)->getTerminator();
			int weightMax=0;
			//need to know if BBs have been visited or not
			BBmap[succ]=true;
			for(int i=0;i<prof;i++)
				errs() << "\t|";
			errs() << "-There are " << TInst->getNumSuccessors() << " successors \n";
			for (unsigned I = 0, NSucc = TInst->getNumSuccessors(); I < NSucc; ++I) {
				int currentWeight;
				BasicBlock *newSucc = TInst->getSuccessor(I);
				if(!BBmap[newSucc]){ //protection against infinite loops
					//recursive call on successors
					currentWeight = evalBlockDFS(newSucc , prof+1);
					//consider only worst case
					if(currentWeight>weightMax)
						weightMax = currentWeight;
				} else {
					for(int i=0;i<prof+1;i++)
						errs() << "\t|";
					errs() << "Loop !\n";
				}
			}
			return weight+weightMax;
		}

		//run on each functions regarding to the order in the IR…
		virtual bool runOnFunction(Function &F){
			errs() << "\nBB of " << F.getName() << " \n";
			BasicBlock *first = &F.getEntryBlock();
			errs() << "first block " << first->getName() << "\n";
			//enrich the map of functions weights
			DFSWeight[F.getName()] = evalBlockDFS(first,0);
			errs() << "Evaluation DFS weight : " << DFSWeight[F.getName()];
			errs() << "\n";

			gimmeEdgesDFS(first);
			if(bellmanFord(first)){
				int weight=0;
				for(Edges::iterator ed=edges.begin(); ed!=edges.end(); ed++){
					Vertex u = ed->first.first;
					Vertex v = ed->first.second;
					//case of there is only the entry block
					if(u == first && v == nullptr)
						weight = ed->second;
					//terminating functions
					else if(v == nullptr && distance[u].first + ed->second > weight)
						weight = distance[u].first + ed->second;
				}
				errs() << "Max weight : " << weight << "\n";
				FunctionWeight[F.getName()]=weight; //Bellman-Ford's Weight
			} else errs() << "Cycle detected! \n";
			edges.clear();
			return false;
		}
	};
}

char GimmeWeight::ID = 0;	
static RegisterPass<GimmeWeight> SCC("GimmeWeight", 
		"Gives the Weight for each function");
