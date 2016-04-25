#include <time.h>
#include <stdio.h>
#include <stdlib.h>

struct node{
    int data;
    struct node* next;
};

void init(struct node* head);
struct node* push(struct node* head, int data);
struct node* pop(struct node* head, int* element);
struct node* visit(struct node* head, int* element);
int empty(struct node* head);
void display(struct node* head);
int size(struct node* head);
struct node* reverse_malloc(struct node* head);
struct node* partition(struct node* head);
struct node* quicksort(struct node* head);
struct node* sort_by_insert(struct node* head);

void test(int i){
    if(i==0){ 
        struct node * tmp = (struct node*)malloc(sizeof(struct node*));
        tmp->data = 1;
    }
    else test(i-1);
}

void permut(struct node * head, int i, int j){
    if(i!=j){
        int count=0;
        int element;
        struct node * tmp = head;
        struct node * first = NULL;
        struct node * second = NULL;
        struct node * last = NULL;
        while(tmp!=NULL){	
            last = tmp;
            tmp = visit(tmp,&element);
            if(count==i || count==j){
                if(first==NULL)
                    first = last;
                else {
                    second = last;
                    break;
                }
            }
            count++;
        }
        if(count <= i || count <= j){
            element = second->data;	
            second->data = first->data;
            first->data = element;
        }
    }
}

struct node * partition(struct node *head){ 
    struct node * tmp = head;
    struct node * last = tmp;
    struct node * lastH = tmp;
    struct node * A2 = head;
    int element,pivot;
    tmp=reverse_malloc(tmp);
    visit(tmp,&pivot);
    tmp=reverse_malloc(tmp);
    int i = -1;
    int j = -1;
    while(tmp->next!=NULL){ // on parcours la liste - le pivot
        last = tmp;
        tmp = visit(tmp,&element);		
        j++;
        if(element < pivot){
            i++;
            lastH = last;
            permut(head,i,j);
        }
    }
    j++;
    permut(head,i+1,j);
    A2=lastH->next; // on décale le point de rupture des deux piles
    lastH->next = NULL;
    return A2;
}

struct node * concat(struct node *head1, struct node *head2){
    if(head2==NULL)
        return head1;
    int element;
    head1 = reverse_malloc(head1);
    while(head1!=NULL){
        head1 = pop(head1,&element);
        head2 = push(head2,element);
    }
    return head2;
}

struct node * quicksort(struct node *head){
    if(!empty(head) && head->next!=NULL){
        struct node* A2;
        A2 = partition(head);
        head = quicksort(head);
        A2 = quicksort(A2);
        return concat(head,A2);
    }
    return head;
}

struct node * insert_rec(struct node *head, int data){
    if(empty(head))
        return push(head,data);
    else {
        int element;
        head = pop(head,&element);
        if(element < data)
            return push(insert_rec(head,data),element);
        else 
            return push(push(head,element),data);
    }
}

struct node * insert(struct node *head, int data){
    // cas de base
    if(empty(head) || head->data <= data)
        return push(head,data);

    int element;
    struct node * newhead = NULL;
    while(head!=NULL){
        head = pop(head,&element);
        if(head==NULL){ //si c'est le dernier el
            if(element >= data){ //si il est plus grand
                newhead = push(newhead,element);
                newhead = push(newhead,data);
                return reverse_malloc(newhead);
            }
            else{ //si il est toujours plus petit
                newhead = push(newhead,data);
                newhead = push(newhead,element);
                return reverse_malloc(newhead);
            }
        }
        newhead = push(newhead,element);
        if(element >= data && head->data <= data){
            newhead = push(newhead,data);
            break;
        }
    }
    head = concat(reverse_malloc(newhead),head);
    return head;
}

struct node * sort_by_insert(struct node *head){
    int element;
    struct node * temp = NULL;
    while(head!=NULL){
        head = pop(head,&element);
        temp = insert(temp,element);
        display(temp);
    }
    return temp;
}

struct node * reverse_malloc(struct node *head){
    int element;
    struct node * temp = NULL;
    while(head!=NULL){
        head = pop(head,&element);
        temp = push(temp,element);
    }
    return temp;
}

int main(){
    srand(time(NULL));
    struct node* head = NULL; 
    struct node* tail = NULL;
    int size, i;
    int counter = 0;

    printf("Enter the number of stack elements:");
    scanf("%d",&size);

    printf("--- Push elements into the linked stack ---\n");

    init(head);

    for (i = 0; i < size; i++) {
        int r = rand()%100;		
        head = push(head,r);
        display(head);
        counter++;
    }

    printf("--- Reversing --- \n");
    head = reverse_malloc(head);
    display(head);

    init(tail);

    printf("--- Ajout de 2 elements en queue ---");
    for (i = 0; i < 2; i++) {
        int r = rand()%100;		
        tail = push(tail,r);
        display(tail);
    }

    printf("--- concat --- \n");
    head = concat(head,tail);
    display(head);

    printf("--- permut(head,2,4) --- \n");
    permut(head,2,4);
    display(head);

    printf("--- Sort by quicksort --- \n");
    head = quicksort(head);
    display(head);

    printf("FINISH\n");
    return 0;
}

void init(struct node* head){
    head = NULL;
}

struct node* push(struct node* head,int data){
    struct node* tmp = (struct node*)malloc(sizeof(struct node));
    if(tmp == NULL)
        exit(0);
    tmp->data = data;
    tmp->next = head;
    head = tmp;
    return head;
}

struct node* visit(struct node *head,int *element){
    *element = head->data;
    head = head->next;
    return head;
}

struct node* pop(struct node *head,int *element){
    struct node* tmp = head;
    *element = head->data;
    head = head->next;
    free(tmp);
    return head;
}

int empty(struct node* head){
    return head == NULL ? 1 : 0;
}

int size(struct node* head){
    struct node *current;
    int size = 0;
    current = head;
    if(current!= NULL){
        do{
            size++;	
            current = current->next;
        } while (current!= NULL);
    } 
    return size;
}

void display(struct node* head){
    struct node *current;
    current = head;
    if(current!= NULL){
        printf("Stack: ");
        do{
            printf("%d ",current->data);
            current = current->next;
        } while (current!= NULL);
        printf("\n");
    } else printf("The Stack is empty\n");
}
