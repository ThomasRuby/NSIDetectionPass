; ModuleID = 'stack2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.node = type { i32, %struct.node* }

@.str = private unnamed_addr constant [36 x i8] c"Enter the number of stack elements:\00", align 1
@.str1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str4 = private unnamed_addr constant [37 x i8] c"--- Ajout de 2 elements en queue ---\00", align 1
@.str8 = private unnamed_addr constant [8 x i8] c"Stack: \00", align 1
@.str9 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@str = private unnamed_addr constant [19 x i8] c"The Stack is empty\00"
@str12 = private unnamed_addr constant [44 x i8] c"--- Push elements into the linked stack ---\00"
@str13 = private unnamed_addr constant [19 x i8] c"--- Reversing --- \00"
@str14 = private unnamed_addr constant [16 x i8] c"--- concat --- \00"
@str15 = private unnamed_addr constant [27 x i8] c"--- Sort by insertion --- \00"
@str16 = private unnamed_addr constant [26 x i8] c"--- permut(head,2,4) --- \00"

; Function Attrs: nounwind uwtable
define void @permut(%struct.node* %head, i32 %i, i32 %j) #0 {
entry:
  %cmp5 = icmp eq i32 %i, 0
  %cmp6 = icmp eq i32 %j, 0
  %or.cond20 = or i1 %cmp5, %cmp6
  br i1 %or.cond20, label %while.cond.outer.us.preheader, label %while.cond.us.preheader

while.cond.us.preheader:                          ; preds = %entry
  br label %while.cond.us

while.cond.outer.us.preheader:                    ; preds = %entry
  br label %while.cond.outer.us

while.cond.outer.us:                              ; preds = %while.cond.outer.us.preheader, %while.cond.outer.split.us.split.us.us
  %tmp.0.ph.us = phi %struct.node* [ %0, %while.cond.outer.split.us.split.us.us ], [ %head, %while.cond.outer.us.preheader ]
  %first.0.ph.us = phi %struct.node* [ %tmp.0.first.0.us, %while.cond.outer.split.us.split.us.us ], [ null, %while.cond.outer.us.preheader ]
  %second.0.ph.us = phi %struct.node* [ %.tmp.0.ph.us, %while.cond.outer.split.us.split.us.us ], [ null, %while.cond.outer.us.preheader ]
  %cmp4.us = icmp eq %struct.node* %second.0.ph.us, null
  br i1 %cmp4.us, label %while.cond.outer.split.us.split.us.us, label %while.end

while.cond.outer.split.us.split.us.us:            ; preds = %while.cond.outer.us
  %next.i.us.us.us = getelementptr inbounds %struct.node* %tmp.0.ph.us, i64 0, i32 1
  %0 = load %struct.node** %next.i.us.us.us, align 8, !tbaa !1
  %cmp7.us = icmp eq %struct.node* %first.0.ph.us, null
  %tmp.0.first.0.us = select i1 %cmp7.us, %struct.node* %tmp.0.ph.us, %struct.node* %first.0.ph.us
  %.tmp.0.ph.us = select i1 %cmp7.us, %struct.node* null, %struct.node* %tmp.0.ph.us
  br label %while.cond.outer.us

while.cond.us:                                    ; preds = %while.cond.us.preheader, %while.cond.us
  %tmp.0.us = phi %struct.node* [ %1, %while.cond.us ], [ %head, %while.cond.us.preheader ]
  %next.i.us = getelementptr inbounds %struct.node* %tmp.0.us, i64 0, i32 1
  %1 = load %struct.node** %next.i.us, align 8, !tbaa !1
  br label %while.cond.us

while.end:                                        ; preds = %while.cond.outer.us
  %second.0.ph.us.lcssa = phi %struct.node* [ %second.0.ph.us, %while.cond.outer.us ]
  %first.0.ph.us.lcssa = phi %struct.node* [ %first.0.ph.us, %while.cond.outer.us ]
  %data = getelementptr inbounds %struct.node* %second.0.ph.us.lcssa, i64 0, i32 0
  %2 = load i32* %data, align 4, !tbaa !7
  %data10 = getelementptr inbounds %struct.node* %first.0.ph.us.lcssa, i64 0, i32 0
  %3 = load i32* %data10, align 4, !tbaa !7
  store i32 %3, i32* %data, align 4, !tbaa !7
  store i32 %2, i32* %data10, align 4, !tbaa !7
  ret void
}

; Function Attrs: nounwind uwtable
define %struct.node* @visit(%struct.node* nocapture readonly %head, i32* nocapture %element) #0 {
entry:
  %data = getelementptr inbounds %struct.node* %head, i64 0, i32 0
  %0 = load i32* %data, align 4, !tbaa !7
  store i32 %0, i32* %element, align 4, !tbaa !8
  %next = getelementptr inbounds %struct.node* %head, i64 0, i32 1
  %1 = load %struct.node** %next, align 8, !tbaa !1
  ret %struct.node* %1
}

; Function Attrs: nounwind uwtable
define %struct.node* @partition(%struct.node* %head) #0 {
entry:
  %data.i = getelementptr inbounds %struct.node* %head, i64 0, i32 0
  %0 = load i32* %data.i, align 4, !tbaa !7
  br label %while.cond.outer

while.cond.outer:                                 ; preds = %permut.exit41, %entry
  %tmp.0.ph = phi %struct.node* [ %.lcssa, %permut.exit41 ], [ %head, %entry ]
  %last.0.ph = phi %struct.node* [ %tmp.0.lcssa66, %permut.exit41 ], [ %head, %entry ]
  %i.0.ph = phi i32 [ %inc9, %permut.exit41 ], [ 0, %entry ]
  br label %while.cond

while.cond:                                       ; preds = %while.cond.outer, %while.body
  %tmp.0 = phi %struct.node* [ %2, %while.body ], [ %tmp.0.ph, %while.cond.outer ]
  %last.0 = phi %struct.node* [ %tmp.0, %while.body ], [ %last.0.ph, %while.cond.outer ]
  %j.0 = phi i32 [ %inc, %while.body ], [ 0, %while.cond.outer ]
  %cmp = icmp eq %struct.node* %tmp.0, null
  br i1 %cmp, label %while.end, label %while.body

while.body:                                       ; preds = %while.cond
  %data.i42 = getelementptr inbounds %struct.node* %tmp.0, i64 0, i32 0
  %1 = load i32* %data.i42, align 4, !tbaa !7
  %next.i43 = getelementptr inbounds %struct.node* %tmp.0, i64 0, i32 1
  %2 = load %struct.node** %next.i43, align 8, !tbaa !1
  %inc = add nsw i32 %j.0, 1
  %cmp8 = icmp sgt i32 %1, %0
  br i1 %cmp8, label %while.cond, label %if.then

if.then:                                          ; preds = %while.body
  %inc.lcssa = phi i32 [ %inc, %while.body ]
  %.lcssa = phi %struct.node* [ %2, %while.body ]
  %tmp.0.lcssa66 = phi %struct.node* [ %tmp.0, %while.body ]
  %inc9 = add nsw i32 %i.0.ph, 1
  %cmp6.i24 = icmp eq i32 %inc.lcssa, 0
  br i1 %cmp6.i24, label %while.cond.outer.split.us.split.us.us.i35.preheader, label %while.cond.us.i38.preheader

while.cond.outer.split.us.split.us.us.i35.preheader: ; preds = %if.then
  br label %while.cond.outer.split.us.split.us.us.i35

while.cond.us.i38.preheader:                      ; preds = %if.then
  br label %while.cond.us.i38

while.cond.outer.split.us.split.us.us.i35:        ; preds = %while.cond.outer.split.us.split.us.us.i35.preheader, %while.cond.outer.split.us.split.us.us.i35
  %first.0.ph.us.i2753 = phi %struct.node* [ %tmp.0.first.0.us.i33, %while.cond.outer.split.us.split.us.us.i35 ], [ null, %while.cond.outer.split.us.split.us.us.i35.preheader ]
  %tmp.0.ph.us.i2652 = phi %struct.node* [ %3, %while.cond.outer.split.us.split.us.us.i35 ], [ %head, %while.cond.outer.split.us.split.us.us.i35.preheader ]
  %next.i.us.us.us.i31 = getelementptr inbounds %struct.node* %tmp.0.ph.us.i2652, i64 0, i32 1
  %3 = load %struct.node** %next.i.us.us.us.i31, align 8, !tbaa !1
  %cmp7.us.i32 = icmp eq %struct.node* %first.0.ph.us.i2753, null
  %tmp.0.first.0.us.i33 = select i1 %cmp7.us.i32, %struct.node* %tmp.0.ph.us.i2652, %struct.node* %first.0.ph.us.i2753
  %cmp4.us.i2954 = icmp eq %struct.node* %tmp.0.ph.us.i2652, null
  %cmp4.us.i29 = or i1 %cmp7.us.i32, %cmp4.us.i2954
  br i1 %cmp4.us.i29, label %while.cond.outer.split.us.split.us.us.i35, label %permut.exit41

while.cond.us.i38:                                ; preds = %while.cond.us.i38.preheader, %while.cond.us.i38
  br label %while.cond.us.i38

permut.exit41:                                    ; preds = %while.cond.outer.split.us.split.us.us.i35
  %tmp.0.first.0.us.i33.lcssa = phi %struct.node* [ %tmp.0.first.0.us.i33, %while.cond.outer.split.us.split.us.us.i35 ]
  %tmp.0.ph.us.i2652.lcssa = phi %struct.node* [ %tmp.0.ph.us.i2652, %while.cond.outer.split.us.split.us.us.i35 ]
  %data.i39 = getelementptr inbounds %struct.node* %tmp.0.ph.us.i2652.lcssa, i64 0, i32 0
  %4 = load i32* %data.i39, align 4, !tbaa !7
  %data10.i40 = getelementptr inbounds %struct.node* %tmp.0.first.0.us.i33.lcssa, i64 0, i32 0
  %5 = load i32* %data10.i40, align 4, !tbaa !7
  store i32 %5, i32* %data.i39, align 4, !tbaa !7
  store i32 %4, i32* %data10.i40, align 4, !tbaa !7
  br label %while.cond.outer

while.end:                                        ; preds = %while.cond
  %i.0.ph.lcssa = phi i32 [ %i.0.ph, %while.cond ]
  %tmp.0.ph.lcssa = phi %struct.node* [ %tmp.0.ph, %while.cond ]
  %j.0.lcssa = phi i32 [ %j.0, %while.cond ]
  %last.0.lcssa = phi %struct.node* [ %last.0, %while.cond ]
  %cmp5.i = icmp eq i32 %i.0.ph.lcssa, -1
  %cmp6.i = icmp eq i32 %j.0.lcssa, 0
  %or.cond20.i = or i1 %cmp5.i, %cmp6.i
  br i1 %or.cond20.i, label %while.cond.outer.split.us.split.us.us.i.preheader, label %while.cond.us.i.preheader

while.cond.us.i.preheader:                        ; preds = %while.end
  br label %while.cond.us.i

while.cond.outer.split.us.split.us.us.i.preheader: ; preds = %while.end
  br label %while.cond.outer.split.us.split.us.us.i

while.cond.outer.split.us.split.us.us.i:          ; preds = %while.cond.outer.split.us.split.us.us.i.preheader, %while.cond.outer.split.us.split.us.us.i
  %first.0.ph.us.i51 = phi %struct.node* [ %tmp.0.first.0.us.i, %while.cond.outer.split.us.split.us.us.i ], [ null, %while.cond.outer.split.us.split.us.us.i.preheader ]
  %tmp.0.ph.us.i50 = phi %struct.node* [ %6, %while.cond.outer.split.us.split.us.us.i ], [ %head, %while.cond.outer.split.us.split.us.us.i.preheader ]
  %next.i.us.us.us.i = getelementptr inbounds %struct.node* %tmp.0.ph.us.i50, i64 0, i32 1
  %6 = load %struct.node** %next.i.us.us.us.i, align 8, !tbaa !1
  %cmp7.us.i = icmp eq %struct.node* %first.0.ph.us.i51, null
  %tmp.0.first.0.us.i = select i1 %cmp7.us.i, %struct.node* %tmp.0.ph.us.i50, %struct.node* %first.0.ph.us.i51
  %cmp4.us.i55 = icmp eq %struct.node* %tmp.0.ph.us.i50, null
  %cmp4.us.i = or i1 %cmp7.us.i, %cmp4.us.i55
  br i1 %cmp4.us.i, label %while.cond.outer.split.us.split.us.us.i, label %permut.exit

while.cond.us.i:                                  ; preds = %while.cond.us.i.preheader, %while.cond.us.i
  br label %while.cond.us.i

permut.exit:                                      ; preds = %while.cond.outer.split.us.split.us.us.i
  %tmp.0.first.0.us.i.lcssa = phi %struct.node* [ %tmp.0.first.0.us.i, %while.cond.outer.split.us.split.us.us.i ]
  %tmp.0.ph.us.i50.lcssa = phi %struct.node* [ %tmp.0.ph.us.i50, %while.cond.outer.split.us.split.us.us.i ]
  %data.i22 = getelementptr inbounds %struct.node* %tmp.0.ph.us.i50.lcssa, i64 0, i32 0
  %7 = load i32* %data.i22, align 4, !tbaa !7
  %data10.i = getelementptr inbounds %struct.node* %tmp.0.first.0.us.i.lcssa, i64 0, i32 0
  %8 = load i32* %data10.i, align 4, !tbaa !7
  store i32 %8, i32* %data.i22, align 4, !tbaa !7
  store i32 %7, i32* %data10.i, align 4, !tbaa !7
  %next = getelementptr inbounds %struct.node* %last.0.lcssa, i64 0, i32 1
  store %struct.node* null, %struct.node** %next, align 8, !tbaa !1
  ret %struct.node* %tmp.0.ph.lcssa
}

; Function Attrs: nounwind uwtable
define %struct.node* @concat(%struct.node* %head1, %struct.node* %head2) #0 {
entry:
  %cmp = icmp eq %struct.node* %head2, null
  br i1 %cmp, label %return, label %if.end

if.end:                                           ; preds = %entry
  %cmp6.i = icmp eq %struct.node* %head1, null
  br i1 %cmp6.i, label %return, label %while.body.i.preheader

while.body.i.preheader:                           ; preds = %if.end
  br label %while.body.i

while.body.i:                                     ; preds = %while.body.i.preheader, %push.exit.i
  %temp.08.i = phi %struct.node* [ %3, %push.exit.i ], [ null, %while.body.i.preheader ]
  %head.addr.07.i = phi %struct.node* [ %1, %push.exit.i ], [ %head1, %while.body.i.preheader ]
  %data.i.i = getelementptr inbounds %struct.node* %head.addr.07.i, i64 0, i32 0
  %0 = load i32* %data.i.i, align 4, !tbaa !7
  %next.i.i = getelementptr inbounds %struct.node* %head.addr.07.i, i64 0, i32 1
  %1 = load %struct.node** %next.i.i, align 8, !tbaa !1
  %2 = bitcast %struct.node* %head.addr.07.i to i8*
  tail call void @free(i8* %2) #4
  %call.i.i = tail call noalias i8* @malloc(i64 16) #4
  %cmp.i.i = icmp eq i8* %call.i.i, null
  br i1 %cmp.i.i, label %if.then.i.i, label %push.exit.i

if.then.i.i:                                      ; preds = %while.body.i
  tail call void @exit(i32 0) #5
  unreachable

push.exit.i:                                      ; preds = %while.body.i
  %3 = bitcast i8* %call.i.i to %struct.node*
  %data1.i.i = bitcast i8* %call.i.i to i32*
  store i32 %0, i32* %data1.i.i, align 4, !tbaa !7
  %next.i4.i = getelementptr inbounds i8* %call.i.i, i64 8
  %4 = bitcast i8* %next.i4.i to %struct.node**
  store %struct.node* %temp.08.i, %struct.node** %4, align 8, !tbaa !1
  %cmp.i = icmp eq %struct.node* %1, null
  br i1 %cmp.i, label %while.cond.preheader, label %while.body.i

while.cond.preheader:                             ; preds = %push.exit.i
  %.lcssa19 = phi %struct.node* [ %3, %push.exit.i ]
  %call.i.i.lcssa18 = phi i8* [ %call.i.i, %push.exit.i ]
  %cmp111 = icmp eq i8* %call.i.i.lcssa18, null
  br i1 %cmp111, label %return, label %while.body.preheader

while.body.preheader:                             ; preds = %while.cond.preheader
  br label %while.body

while.body:                                       ; preds = %while.body.preheader, %push.exit
  %head2.addr.013 = phi %struct.node* [ %8, %push.exit ], [ %head2, %while.body.preheader ]
  %head1.addr.012 = phi %struct.node* [ %6, %push.exit ], [ %.lcssa19, %while.body.preheader ]
  %data.i = getelementptr inbounds %struct.node* %head1.addr.012, i64 0, i32 0
  %5 = load i32* %data.i, align 4, !tbaa !7
  %next.i = getelementptr inbounds %struct.node* %head1.addr.012, i64 0, i32 1
  %6 = load %struct.node** %next.i, align 8, !tbaa !1
  %7 = bitcast %struct.node* %head1.addr.012 to i8*
  tail call void @free(i8* %7) #4
  %call.i = tail call noalias i8* @malloc(i64 16) #4
  %cmp.i8 = icmp eq i8* %call.i, null
  br i1 %cmp.i8, label %if.then.i, label %push.exit

if.then.i:                                        ; preds = %while.body
  tail call void @exit(i32 0) #5
  unreachable

push.exit:                                        ; preds = %while.body
  %8 = bitcast i8* %call.i to %struct.node*
  %data1.i = bitcast i8* %call.i to i32*
  store i32 %5, i32* %data1.i, align 4, !tbaa !7
  %next.i9 = getelementptr inbounds i8* %call.i, i64 8
  %9 = bitcast i8* %next.i9 to %struct.node**
  store %struct.node* %head2.addr.013, %struct.node** %9, align 8, !tbaa !1
  %cmp1 = icmp eq %struct.node* %6, null
  br i1 %cmp1, label %return.loopexit, label %while.body

return.loopexit:                                  ; preds = %push.exit
  %.lcssa = phi %struct.node* [ %8, %push.exit ]
  br label %return

return:                                           ; preds = %return.loopexit, %if.end, %while.cond.preheader, %entry
  %retval.0 = phi %struct.node* [ %head1, %entry ], [ %head2, %while.cond.preheader ], [ %head2, %if.end ], [ %.lcssa, %return.loopexit ]
  ret %struct.node* %retval.0
}

; Function Attrs: nounwind uwtable
define %struct.node* @reverse_malloc(%struct.node* %head) #0 {
entry:
  %cmp6 = icmp eq %struct.node* %head, null
  br i1 %cmp6, label %while.end, label %while.body.preheader

while.body.preheader:                             ; preds = %entry
  br label %while.body

while.body:                                       ; preds = %while.body.preheader, %push.exit
  %temp.08 = phi %struct.node* [ %3, %push.exit ], [ null, %while.body.preheader ]
  %head.addr.07 = phi %struct.node* [ %1, %push.exit ], [ %head, %while.body.preheader ]
  %data.i = getelementptr inbounds %struct.node* %head.addr.07, i64 0, i32 0
  %0 = load i32* %data.i, align 4, !tbaa !7
  %next.i = getelementptr inbounds %struct.node* %head.addr.07, i64 0, i32 1
  %1 = load %struct.node** %next.i, align 8, !tbaa !1
  %2 = bitcast %struct.node* %head.addr.07 to i8*
  tail call void @free(i8* %2) #4
  %call.i = tail call noalias i8* @malloc(i64 16) #4
  %cmp.i = icmp eq i8* %call.i, null
  br i1 %cmp.i, label %if.then.i, label %push.exit

if.then.i:                                        ; preds = %while.body
  tail call void @exit(i32 0) #5
  unreachable

push.exit:                                        ; preds = %while.body
  %3 = bitcast i8* %call.i to %struct.node*
  %data1.i = bitcast i8* %call.i to i32*
  store i32 %0, i32* %data1.i, align 4, !tbaa !7
  %next.i4 = getelementptr inbounds i8* %call.i, i64 8
  %4 = bitcast i8* %next.i4 to %struct.node**
  store %struct.node* %temp.08, %struct.node** %4, align 8, !tbaa !1
  %cmp = icmp eq %struct.node* %1, null
  br i1 %cmp, label %while.end.loopexit, label %while.body

while.end.loopexit:                               ; preds = %push.exit
  %.lcssa = phi %struct.node* [ %3, %push.exit ]
  br label %while.end

while.end:                                        ; preds = %while.end.loopexit, %entry
  %temp.0.lcssa = phi %struct.node* [ null, %entry ], [ %.lcssa, %while.end.loopexit ]
  ret %struct.node* %temp.0.lcssa
}

; Function Attrs: nounwind uwtable
define %struct.node* @pop(%struct.node* nocapture %head, i32* nocapture %element) #0 {
entry:
  %data = getelementptr inbounds %struct.node* %head, i64 0, i32 0
  %0 = load i32* %data, align 4, !tbaa !7
  store i32 %0, i32* %element, align 4, !tbaa !8
  %next = getelementptr inbounds %struct.node* %head, i64 0, i32 1
  %1 = load %struct.node** %next, align 8, !tbaa !1
  %2 = bitcast %struct.node* %head to i8*
  tail call void @free(i8* %2) #4
  ret %struct.node* %1
}

; Function Attrs: nounwind uwtable
define noalias %struct.node* @push(%struct.node* %head, i32 %data) #0 {
entry:
  %call = tail call noalias i8* @malloc(i64 16) #4
  %cmp = icmp eq i8* %call, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @exit(i32 0) #5
  unreachable

if.end:                                           ; preds = %entry
  %0 = bitcast i8* %call to %struct.node*
  %data1 = bitcast i8* %call to i32*
  store i32 %data, i32* %data1, align 4, !tbaa !7
  %next = getelementptr inbounds i8* %call, i64 8
  %1 = bitcast i8* %next to %struct.node**
  store %struct.node* %head, %struct.node** %1, align 8, !tbaa !1
  ret %struct.node* %0
}

; Function Attrs: nounwind uwtable
define %struct.node* @insert(%struct.node* %head, i32 %data) #0 {
entry:
  %cmp.i = icmp eq %struct.node* %head, null
  br i1 %cmp.i, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %data1 = getelementptr inbounds %struct.node* %head, i64 0, i32 0
  %0 = load i32* %data1, align 4, !tbaa !7
  %cmp = icmp sgt i32 %0, %data
  br i1 %cmp, label %while.body.preheader, label %if.then

while.body.preheader:                             ; preds = %lor.lhs.false
  br label %while.body

if.then:                                          ; preds = %entry, %lor.lhs.false
  %call.i = tail call noalias i8* @malloc(i64 16) #4
  %cmp.i47 = icmp eq i8* %call.i, null
  br i1 %cmp.i47, label %if.then.i, label %push.exit

if.then.i:                                        ; preds = %if.then
  tail call void @exit(i32 0) #5
  unreachable

push.exit:                                        ; preds = %if.then
  %1 = bitcast i8* %call.i to %struct.node*
  %data1.i = bitcast i8* %call.i to i32*
  store i32 %data, i32* %data1.i, align 4, !tbaa !7
  %next.i = getelementptr inbounds i8* %call.i, i64 8
  %2 = bitcast i8* %next.i to %struct.node**
  store %struct.node* %head, %struct.node** %2, align 8, !tbaa !1
  br label %return

while.body:                                       ; preds = %while.body.preheader, %while.cond.backedge.while.body_crit_edge
  %3 = phi i32 [ %.pre, %while.cond.backedge.while.body_crit_edge ], [ %0, %while.body.preheader ]
  %newhead.0133 = phi %struct.node* [ %22, %while.cond.backedge.while.body_crit_edge ], [ null, %while.body.preheader ]
  %head.addr.0132 = phi %struct.node* [ %4, %while.cond.backedge.while.body_crit_edge ], [ %head, %while.body.preheader ]
  %next.i48 = getelementptr inbounds %struct.node* %head.addr.0132, i64 0, i32 1
  %4 = load %struct.node** %next.i48, align 8, !tbaa !1
  %5 = bitcast %struct.node* %head.addr.0132 to i8*
  tail call void @free(i8* %5) #4
  %cmp5 = icmp eq %struct.node* %4, null
  br i1 %cmp5, label %if.then6, label %if.end15

if.then6:                                         ; preds = %while.body
  %newhead.0133.lcssa = phi %struct.node* [ %newhead.0133, %while.body ]
  %.lcssa166 = phi i32 [ %3, %while.body ]
  %cmp7 = icmp slt i32 %.lcssa166, %data
  %call.i62 = tail call noalias i8* @malloc(i64 16) #4
  %cmp.i63 = icmp eq i8* %call.i62, null
  br i1 %cmp7, label %if.else, label %if.then8

if.then8:                                         ; preds = %if.then6
  br i1 %cmp.i63, label %if.then.i51, label %push.exit54

if.then.i51:                                      ; preds = %if.then8
  tail call void @exit(i32 0) #5
  unreachable

push.exit54:                                      ; preds = %if.then8
  %data1.i52 = bitcast i8* %call.i62 to i32*
  store i32 %.lcssa166, i32* %data1.i52, align 4, !tbaa !7
  %next.i53 = getelementptr inbounds i8* %call.i62, i64 8
  %6 = bitcast i8* %next.i53 to %struct.node**
  store %struct.node* %newhead.0133.lcssa, %struct.node** %6, align 8, !tbaa !1
  %call.i55 = tail call noalias i8* @malloc(i64 16) #4
  %cmp.i56 = icmp eq i8* %call.i55, null
  br i1 %cmp.i56, label %if.then.i57, label %push.exit60

if.then.i57:                                      ; preds = %push.exit54
  tail call void @exit(i32 0) #5
  unreachable

push.exit60:                                      ; preds = %push.exit54
  %7 = bitcast i8* %call.i55 to %struct.node*
  %data1.i58 = bitcast i8* %call.i55 to i32*
  store i32 %data, i32* %data1.i58, align 4, !tbaa !7
  %next.i59 = getelementptr inbounds i8* %call.i55, i64 8
  %8 = bitcast i8* %next.i59 to i8**
  store i8* %call.i62, i8** %8, align 8, !tbaa !1
  br label %while.body.i

while.body.i:                                     ; preds = %push.exit60, %push.exit.i
  %temp.08.i = phi %struct.node* [ %12, %push.exit.i ], [ null, %push.exit60 ]
  %head.addr.07.i = phi %struct.node* [ %10, %push.exit.i ], [ %7, %push.exit60 ]
  %data.i.i = getelementptr inbounds %struct.node* %head.addr.07.i, i64 0, i32 0
  %9 = load i32* %data.i.i, align 4, !tbaa !7
  %next.i.i = getelementptr inbounds %struct.node* %head.addr.07.i, i64 0, i32 1
  %10 = load %struct.node** %next.i.i, align 8, !tbaa !1
  %11 = bitcast %struct.node* %head.addr.07.i to i8*
  tail call void @free(i8* %11) #4
  %call.i.i = tail call noalias i8* @malloc(i64 16) #4
  %cmp.i.i = icmp eq i8* %call.i.i, null
  br i1 %cmp.i.i, label %if.then.i.i, label %push.exit.i

if.then.i.i:                                      ; preds = %while.body.i
  tail call void @exit(i32 0) #5
  unreachable

push.exit.i:                                      ; preds = %while.body.i
  %12 = bitcast i8* %call.i.i to %struct.node*
  %data1.i.i = bitcast i8* %call.i.i to i32*
  store i32 %9, i32* %data1.i.i, align 4, !tbaa !7
  %next.i4.i = getelementptr inbounds i8* %call.i.i, i64 8
  %13 = bitcast i8* %next.i4.i to %struct.node**
  store %struct.node* %temp.08.i, %struct.node** %13, align 8, !tbaa !1
  %cmp.i61 = icmp eq %struct.node* %10, null
  br i1 %cmp.i61, label %return.loopexit163, label %while.body.i

if.else:                                          ; preds = %if.then6
  br i1 %cmp.i63, label %if.then.i64, label %push.exit67

if.then.i64:                                      ; preds = %if.else
  tail call void @exit(i32 0) #5
  unreachable

push.exit67:                                      ; preds = %if.else
  %data1.i65 = bitcast i8* %call.i62 to i32*
  store i32 %data, i32* %data1.i65, align 4, !tbaa !7
  %next.i66 = getelementptr inbounds i8* %call.i62, i64 8
  %14 = bitcast i8* %next.i66 to %struct.node**
  store %struct.node* %newhead.0133.lcssa, %struct.node** %14, align 8, !tbaa !1
  %call.i68 = tail call noalias i8* @malloc(i64 16) #4
  %cmp.i69 = icmp eq i8* %call.i68, null
  br i1 %cmp.i69, label %if.then.i70, label %push.exit73

if.then.i70:                                      ; preds = %push.exit67
  tail call void @exit(i32 0) #5
  unreachable

push.exit73:                                      ; preds = %push.exit67
  %15 = bitcast i8* %call.i68 to %struct.node*
  %data1.i71 = bitcast i8* %call.i68 to i32*
  store i32 %.lcssa166, i32* %data1.i71, align 4, !tbaa !7
  %next.i72 = getelementptr inbounds i8* %call.i68, i64 8
  %16 = bitcast i8* %next.i72 to i8**
  store i8* %call.i62, i8** %16, align 8, !tbaa !1
  br label %while.body.i81

while.body.i81:                                   ; preds = %push.exit73, %push.exit.i86
  %temp.08.i75 = phi %struct.node* [ %20, %push.exit.i86 ], [ null, %push.exit73 ]
  %head.addr.07.i76 = phi %struct.node* [ %18, %push.exit.i86 ], [ %15, %push.exit73 ]
  %data.i.i77 = getelementptr inbounds %struct.node* %head.addr.07.i76, i64 0, i32 0
  %17 = load i32* %data.i.i77, align 4, !tbaa !7
  %next.i.i78 = getelementptr inbounds %struct.node* %head.addr.07.i76, i64 0, i32 1
  %18 = load %struct.node** %next.i.i78, align 8, !tbaa !1
  %19 = bitcast %struct.node* %head.addr.07.i76 to i8*
  tail call void @free(i8* %19) #4
  %call.i.i79 = tail call noalias i8* @malloc(i64 16) #4
  %cmp.i.i80 = icmp eq i8* %call.i.i79, null
  br i1 %cmp.i.i80, label %if.then.i.i82, label %push.exit.i86

if.then.i.i82:                                    ; preds = %while.body.i81
  tail call void @exit(i32 0) #5
  unreachable

push.exit.i86:                                    ; preds = %while.body.i81
  %20 = bitcast i8* %call.i.i79 to %struct.node*
  %data1.i.i83 = bitcast i8* %call.i.i79 to i32*
  store i32 %17, i32* %data1.i.i83, align 4, !tbaa !7
  %next.i4.i84 = getelementptr inbounds i8* %call.i.i79, i64 8
  %21 = bitcast i8* %next.i4.i84 to %struct.node**
  store %struct.node* %temp.08.i75, %struct.node** %21, align 8, !tbaa !1
  %cmp.i85 = icmp eq %struct.node* %18, null
  br i1 %cmp.i85, label %return.loopexit, label %while.body.i81

if.end15:                                         ; preds = %while.body
  %call.i89 = tail call noalias i8* @malloc(i64 16) #4
  %cmp.i90 = icmp eq i8* %call.i89, null
  br i1 %cmp.i90, label %if.then.i91, label %push.exit94

if.then.i91:                                      ; preds = %if.end15
  tail call void @exit(i32 0) #5
  unreachable

push.exit94:                                      ; preds = %if.end15
  %22 = bitcast i8* %call.i89 to %struct.node*
  %data1.i92 = bitcast i8* %call.i89 to i32*
  store i32 %3, i32* %data1.i92, align 4, !tbaa !7
  %next.i93 = getelementptr inbounds i8* %call.i89, i64 8
  %23 = bitcast i8* %next.i93 to %struct.node**
  store %struct.node* %newhead.0133, %struct.node** %23, align 8, !tbaa !1
  %cmp17 = icmp slt i32 %3, %data
  br i1 %cmp17, label %while.cond.backedge.while.body_crit_edge, label %land.lhs.true

while.cond.backedge.while.body_crit_edge:         ; preds = %land.lhs.true, %push.exit94
  %data.i.phi.trans.insert = getelementptr inbounds %struct.node* %4, i64 0, i32 0
  %.pre = load i32* %data.i.phi.trans.insert, align 4, !tbaa !7
  br label %while.body

land.lhs.true:                                    ; preds = %push.exit94
  %data18 = getelementptr inbounds %struct.node* %4, i64 0, i32 0
  %24 = load i32* %data18, align 4, !tbaa !7
  %cmp19 = icmp sgt i32 %24, %data
  br i1 %cmp19, label %while.cond.backedge.while.body_crit_edge, label %if.then20

if.then20:                                        ; preds = %land.lhs.true
  %call.i89.lcssa174 = phi i8* [ %call.i89, %land.lhs.true ]
  %.lcssa173 = phi %struct.node* [ %4, %land.lhs.true ]
  %call.i95 = tail call noalias i8* @malloc(i64 16) #4
  %cmp.i96 = icmp eq i8* %call.i95, null
  br i1 %cmp.i96, label %if.then.i97, label %while.end

if.then.i97:                                      ; preds = %if.then20
  tail call void @exit(i32 0) #5
  unreachable

while.end:                                        ; preds = %if.then20
  %data1.i98 = bitcast i8* %call.i95 to i32*
  store i32 %data, i32* %data1.i98, align 4, !tbaa !7
  %next.i99 = getelementptr inbounds i8* %call.i95, i64 8
  %25 = bitcast i8* %next.i99 to i8**
  store i8* %call.i89.lcssa174, i8** %25, align 8, !tbaa !1
  %26 = bitcast i8* %call.i95 to %struct.node*
  br label %while.body.i108

while.body.i108:                                  ; preds = %while.end, %push.exit.i113
  %temp.08.i102 = phi %struct.node* [ %30, %push.exit.i113 ], [ null, %while.end ]
  %head.addr.07.i103 = phi %struct.node* [ %28, %push.exit.i113 ], [ %26, %while.end ]
  %data.i.i104 = getelementptr inbounds %struct.node* %head.addr.07.i103, i64 0, i32 0
  %27 = load i32* %data.i.i104, align 4, !tbaa !7
  %next.i.i105 = getelementptr inbounds %struct.node* %head.addr.07.i103, i64 0, i32 1
  %28 = load %struct.node** %next.i.i105, align 8, !tbaa !1
  %29 = bitcast %struct.node* %head.addr.07.i103 to i8*
  tail call void @free(i8* %29) #4
  %call.i.i106 = tail call noalias i8* @malloc(i64 16) #4
  %cmp.i.i107 = icmp eq i8* %call.i.i106, null
  br i1 %cmp.i.i107, label %if.then.i.i109, label %push.exit.i113

if.then.i.i109:                                   ; preds = %while.body.i108
  tail call void @exit(i32 0) #5
  unreachable

push.exit.i113:                                   ; preds = %while.body.i108
  %30 = bitcast i8* %call.i.i106 to %struct.node*
  %data1.i.i110 = bitcast i8* %call.i.i106 to i32*
  store i32 %27, i32* %data1.i.i110, align 4, !tbaa !7
  %next.i4.i111 = getelementptr inbounds i8* %call.i.i106, i64 8
  %31 = bitcast i8* %next.i4.i111 to %struct.node**
  store %struct.node* %temp.08.i102, %struct.node** %31, align 8, !tbaa !1
  %cmp.i112 = icmp eq %struct.node* %28, null
  br i1 %cmp.i112, label %reverse_malloc.exit115, label %while.body.i108

reverse_malloc.exit115:                           ; preds = %push.exit.i113
  %.lcssa165 = phi %struct.node* [ %30, %push.exit.i113 ]
  %call24 = tail call %struct.node* @concat(%struct.node* %.lcssa165, %struct.node* %.lcssa173)
  br label %return

return.loopexit:                                  ; preds = %push.exit.i86
  %.lcssa = phi %struct.node* [ %20, %push.exit.i86 ]
  br label %return

return.loopexit163:                               ; preds = %push.exit.i
  %.lcssa164 = phi %struct.node* [ %12, %push.exit.i ]
  br label %return

return:                                           ; preds = %return.loopexit163, %return.loopexit, %reverse_malloc.exit115, %push.exit
  %retval.0 = phi %struct.node* [ %1, %push.exit ], [ %call24, %reverse_malloc.exit115 ], [ %.lcssa, %return.loopexit ], [ %.lcssa164, %return.loopexit163 ]
  ret %struct.node* %retval.0
}

; Function Attrs: nounwind readnone uwtable
define i32 @empty(%struct.node* readnone %head) #1 {
entry:
  %cmp = icmp eq %struct.node* %head, null
  %cond = zext i1 %cmp to i32
  ret i32 %cond
}

; Function Attrs: nounwind uwtable
define %struct.node* @sort_by_insert(%struct.node* %head) #0 {
entry:
  %cmp7 = icmp eq %struct.node* %head, null
  br i1 %cmp7, label %while.end, label %while.body.preheader

while.body.preheader:                             ; preds = %entry
  br label %while.body

while.body:                                       ; preds = %while.body.preheader, %while.cond.backedge
  %temp.09 = phi %struct.node* [ %temp.0.be, %while.cond.backedge ], [ null, %while.body.preheader ]
  %head.addr.08 = phi %struct.node* [ %1, %while.cond.backedge ], [ %head, %while.body.preheader ]
  %data.i = getelementptr inbounds %struct.node* %head.addr.08, i64 0, i32 0
  %0 = load i32* %data.i, align 4, !tbaa !7
  %next.i = getelementptr inbounds %struct.node* %head.addr.08, i64 0, i32 1
  %1 = load %struct.node** %next.i, align 8, !tbaa !1
  %2 = bitcast %struct.node* %head.addr.08 to i8*
  tail call void @free(i8* %2) #4
  %call1 = tail call %struct.node* @insert(%struct.node* %temp.09, i32 %0)
  %cmp.i = icmp eq %struct.node* %call1, null
  br i1 %cmp.i, label %if.else.i, label %if.then.i

if.then.i:                                        ; preds = %while.body
  %call.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str8, i64 0, i64 0)) #4
  br label %do.body.i

do.body.i:                                        ; preds = %do.body.i, %if.then.i
  %current.0.i = phi %struct.node* [ %call1, %if.then.i ], [ %4, %do.body.i ]
  %data.i5 = getelementptr inbounds %struct.node* %current.0.i, i64 0, i32 0
  %3 = load i32* %data.i5, align 4, !tbaa !7
  %call1.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str9, i64 0, i64 0), i32 %3) #4
  %next.i6 = getelementptr inbounds %struct.node* %current.0.i, i64 0, i32 1
  %4 = load %struct.node** %next.i6, align 8, !tbaa !1
  %cmp2.i = icmp eq %struct.node* %4, null
  br i1 %cmp2.i, label %do.end.i, label %do.body.i

do.end.i:                                         ; preds = %do.body.i
  %putchar.i = tail call i32 @putchar(i32 10) #4
  br label %while.cond.backedge

while.cond.backedge:                              ; preds = %do.end.i, %if.else.i
  %temp.0.be = phi %struct.node* [ %call1, %do.end.i ], [ null, %if.else.i ]
  %cmp = icmp eq %struct.node* %1, null
  br i1 %cmp, label %while.end.loopexit, label %while.body

if.else.i:                                        ; preds = %while.body
  %puts.i = tail call i32 @puts(i8* getelementptr inbounds ([19 x i8]* @str, i64 0, i64 0)) #4
  br label %while.cond.backedge

while.end.loopexit:                               ; preds = %while.cond.backedge
  %temp.0.be.lcssa = phi %struct.node* [ %temp.0.be, %while.cond.backedge ]
  br label %while.end

while.end:                                        ; preds = %while.end.loopexit, %entry
  %temp.0.lcssa = phi %struct.node* [ null, %entry ], [ %temp.0.be.lcssa, %while.end.loopexit ]
  ret %struct.node* %temp.0.lcssa
}

; Function Attrs: nounwind uwtable
define void @display(%struct.node* readonly %head) #0 {
entry:
  %cmp = icmp eq %struct.node* %head, null
  br i1 %cmp, label %if.else, label %if.then

if.then:                                          ; preds = %entry
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str8, i64 0, i64 0)) #4
  br label %do.body

do.body:                                          ; preds = %do.body, %if.then
  %current.0 = phi %struct.node* [ %head, %if.then ], [ %1, %do.body ]
  %data = getelementptr inbounds %struct.node* %current.0, i64 0, i32 0
  %0 = load i32* %data, align 4, !tbaa !7
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str9, i64 0, i64 0), i32 %0) #4
  %next = getelementptr inbounds %struct.node* %current.0, i64 0, i32 1
  %1 = load %struct.node** %next, align 8, !tbaa !1
  %cmp2 = icmp eq %struct.node* %1, null
  br i1 %cmp2, label %do.end, label %do.body

do.end:                                           ; preds = %do.body
  %putchar = tail call i32 @putchar(i32 10) #4
  br label %if.end

if.else:                                          ; preds = %entry
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([19 x i8]* @str, i64 0, i64 0))
  br label %if.end

if.end:                                           ; preds = %if.else, %do.end
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %size = alloca i32, align 4
  %call = tail call i64 @time(i64* null) #4
  %conv = trunc i64 %call to i32
  tail call void @srand(i32 %conv) #4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str, i64 0, i64 0)) #4
  %call2 = call i32 (i8*, ...)* @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8]* @.str1, i64 0, i64 0), i32* %size) #4
  %puts = call i32 @puts(i8* getelementptr inbounds ([44 x i8]* @str12, i64 0, i64 0))
  %0 = load i32* %size, align 4, !tbaa !8
  %cmp136 = icmp sgt i32 %0, 0
  br i1 %cmp136, label %for.body.preheader, label %for.end.thread

for.body.preheader:                               ; preds = %entry
  br label %for.body

for.end.thread:                                   ; preds = %entry
  %puts43142 = call i32 @puts(i8* getelementptr inbounds ([19 x i8]* @str13, i64 0, i64 0))
  br label %if.else.i78

for.body:                                         ; preds = %for.body.preheader, %do.end.i61
  %head.0138 = phi %struct.node* [ %1, %do.end.i61 ], [ null, %for.body.preheader ]
  %i.0137 = phi i32 [ %inc7, %do.end.i61 ], [ 0, %for.body.preheader ]
  %call5 = call i32 @rand() #4
  %call.i47 = call noalias i8* @malloc(i64 16) #4
  %cmp.i48 = icmp eq i8* %call.i47, null
  br i1 %cmp.i48, label %if.then.i49, label %push.exit

if.then.i49:                                      ; preds = %for.body
  call void @exit(i32 0) #5
  unreachable

push.exit:                                        ; preds = %for.body
  %rem = srem i32 %call5, 100
  %1 = bitcast i8* %call.i47 to %struct.node*
  %data1.i = bitcast i8* %call.i47 to i32*
  store i32 %rem, i32* %data1.i, align 4, !tbaa !7
  %next.i50 = getelementptr inbounds i8* %call.i47, i64 8
  %2 = bitcast i8* %next.i50 to %struct.node**
  store %struct.node* %head.0138, %struct.node** %2, align 8, !tbaa !1
  %call.i52 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str8, i64 0, i64 0)) #4
  br label %do.body.i59

do.body.i59:                                      ; preds = %do.body.i59, %push.exit
  %current.0.i54 = phi %struct.node* [ %1, %push.exit ], [ %4, %do.body.i59 ]
  %data.i55 = getelementptr inbounds %struct.node* %current.0.i54, i64 0, i32 0
  %3 = load i32* %data.i55, align 4, !tbaa !7
  %call1.i56 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str9, i64 0, i64 0), i32 %3) #4
  %next.i57 = getelementptr inbounds %struct.node* %current.0.i54, i64 0, i32 1
  %4 = load %struct.node** %next.i57, align 8, !tbaa !1
  %cmp2.i58 = icmp eq %struct.node* %4, null
  br i1 %cmp2.i58, label %do.end.i61, label %do.body.i59

do.end.i61:                                       ; preds = %do.body.i59
  %putchar.i60 = call i32 @putchar(i32 10) #4
  %inc7 = add nsw i32 %i.0137, 1
  %5 = load i32* %size, align 4, !tbaa !8
  %cmp = icmp slt i32 %inc7, %5
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %do.end.i61
  %.lcssa147 = phi %struct.node* [ %1, %do.end.i61 ]
  %call.i47.lcssa146 = phi i8* [ %call.i47, %do.end.i61 ]
  %puts43 = call i32 @puts(i8* getelementptr inbounds ([19 x i8]* @str13, i64 0, i64 0))
  %cmp6.i = icmp eq i8* %call.i47.lcssa146, null
  br i1 %cmp6.i, label %if.else.i78, label %while.body.i.preheader

while.body.i.preheader:                           ; preds = %for.end
  br label %while.body.i

while.body.i:                                     ; preds = %while.body.i.preheader, %push.exit.i
  %temp.08.i = phi %struct.node* [ %9, %push.exit.i ], [ null, %while.body.i.preheader ]
  %head.addr.07.i = phi %struct.node* [ %7, %push.exit.i ], [ %.lcssa147, %while.body.i.preheader ]
  %data.i.i = getelementptr inbounds %struct.node* %head.addr.07.i, i64 0, i32 0
  %6 = load i32* %data.i.i, align 4, !tbaa !7
  %next.i.i = getelementptr inbounds %struct.node* %head.addr.07.i, i64 0, i32 1
  %7 = load %struct.node** %next.i.i, align 8, !tbaa !1
  %8 = bitcast %struct.node* %head.addr.07.i to i8*
  call void @free(i8* %8) #4
  %call.i.i = call noalias i8* @malloc(i64 16) #4
  %cmp.i.i = icmp eq i8* %call.i.i, null
  br i1 %cmp.i.i, label %if.then.i.i, label %push.exit.i

if.then.i.i:                                      ; preds = %while.body.i
  call void @exit(i32 0) #5
  unreachable

push.exit.i:                                      ; preds = %while.body.i
  %9 = bitcast i8* %call.i.i to %struct.node*
  %data1.i.i = bitcast i8* %call.i.i to i32*
  store i32 %6, i32* %data1.i.i, align 4, !tbaa !7
  %next.i4.i = getelementptr inbounds i8* %call.i.i, i64 8
  %10 = bitcast i8* %next.i4.i to %struct.node**
  store %struct.node* %temp.08.i, %struct.node** %10, align 8, !tbaa !1
  %cmp.i65 = icmp eq %struct.node* %7, null
  br i1 %cmp.i65, label %if.then.i68, label %while.body.i

if.then.i68:                                      ; preds = %push.exit.i
  %.lcssa = phi %struct.node* [ %9, %push.exit.i ]
  %call.i67 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str8, i64 0, i64 0)) #4
  br label %do.body.i74

do.body.i74:                                      ; preds = %do.body.i74, %if.then.i68
  %current.0.i69 = phi %struct.node* [ %.lcssa, %if.then.i68 ], [ %12, %do.body.i74 ]
  %data.i70 = getelementptr inbounds %struct.node* %current.0.i69, i64 0, i32 0
  %11 = load i32* %data.i70, align 4, !tbaa !7
  %call1.i71 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str9, i64 0, i64 0), i32 %11) #4
  %next.i72 = getelementptr inbounds %struct.node* %current.0.i69, i64 0, i32 1
  %12 = load %struct.node** %next.i72, align 8, !tbaa !1
  %cmp2.i73 = icmp eq %struct.node* %12, null
  br i1 %cmp2.i73, label %do.end.i76, label %do.body.i74

do.end.i76:                                       ; preds = %do.body.i74
  %putchar.i75 = call i32 @putchar(i32 10) #4
  br label %display.exit79

if.else.i78:                                      ; preds = %for.end.thread, %for.end
  %puts.i77 = call i32 @puts(i8* getelementptr inbounds ([19 x i8]* @str, i64 0, i64 0)) #4
  br label %display.exit79

display.exit79:                                   ; preds = %do.end.i76, %if.else.i78
  %temp.0.lcssa.i129 = phi %struct.node* [ %.lcssa, %do.end.i76 ], [ null, %if.else.i78 ]
  %call10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str4, i64 0, i64 0)) #4
  %call16 = call i32 @rand() #4
  %call.i80 = call noalias i8* @malloc(i64 16) #4
  %cmp.i81 = icmp eq i8* %call.i80, null
  br i1 %cmp.i81, label %if.then.i82, label %push.exit85

if.then.i82:                                      ; preds = %do.end.i96, %display.exit79
  call void @exit(i32 0) #5
  unreachable

push.exit85:                                      ; preds = %display.exit79
  %rem17 = srem i32 %call16, 100
  %13 = bitcast i8* %call.i80 to %struct.node*
  %data1.i83 = bitcast i8* %call.i80 to i32*
  store i32 %rem17, i32* %data1.i83, align 4, !tbaa !7
  %next.i84 = getelementptr inbounds i8* %call.i80, i64 8
  %14 = bitcast i8* %next.i84 to %struct.node**
  store %struct.node* null, %struct.node** %14, align 8, !tbaa !1
  %call.i87 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str8, i64 0, i64 0)) #4
  br label %do.body.i94

do.body.i94:                                      ; preds = %do.body.i94, %push.exit85
  %current.0.i89 = phi %struct.node* [ %13, %push.exit85 ], [ %16, %do.body.i94 ]
  %data.i90 = getelementptr inbounds %struct.node* %current.0.i89, i64 0, i32 0
  %15 = load i32* %data.i90, align 4, !tbaa !7
  %call1.i91 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str9, i64 0, i64 0), i32 %15) #4
  %next.i92 = getelementptr inbounds %struct.node* %current.0.i89, i64 0, i32 1
  %16 = load %struct.node** %next.i92, align 8, !tbaa !1
  %cmp2.i93 = icmp eq %struct.node* %16, null
  br i1 %cmp2.i93, label %do.end.i96, label %do.body.i94

do.end.i96:                                       ; preds = %do.body.i94
  %putchar.i95 = call i32 @putchar(i32 10) #4
  %call16.1 = call i32 @rand() #4
  %call.i80.1 = call noalias i8* @malloc(i64 16) #4
  %cmp.i81.1 = icmp eq i8* %call.i80.1, null
  br i1 %cmp.i81.1, label %if.then.i82, label %push.exit85.1

if.then.i102:                                     ; preds = %do.end.i96.1
  %call.i101 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str8, i64 0, i64 0)) #4
  br label %do.body.i108

do.body.i108:                                     ; preds = %do.body.i108, %if.then.i102
  %current.0.i103 = phi %struct.node* [ %call23, %if.then.i102 ], [ %18, %do.body.i108 ]
  %data.i104 = getelementptr inbounds %struct.node* %current.0.i103, i64 0, i32 0
  %17 = load i32* %data.i104, align 4, !tbaa !7
  %call1.i105 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str9, i64 0, i64 0), i32 %17) #4
  %next.i106 = getelementptr inbounds %struct.node* %current.0.i103, i64 0, i32 1
  %18 = load %struct.node** %next.i106, align 8, !tbaa !1
  %cmp2.i107 = icmp eq %struct.node* %18, null
  br i1 %cmp2.i107, label %do.end.i110, label %do.body.i108

do.end.i110:                                      ; preds = %do.body.i108
  %putchar.i109 = call i32 @putchar(i32 10) #4
  br label %display.exit113

if.else.i112:                                     ; preds = %do.end.i96.1
  %puts.i111 = call i32 @puts(i8* getelementptr inbounds ([19 x i8]* @str, i64 0, i64 0)) #4
  br label %display.exit113

display.exit113:                                  ; preds = %do.end.i110, %if.else.i112
  %puts45 = call i32 @puts(i8* getelementptr inbounds ([27 x i8]* @str15, i64 0, i64 0))
  %call25 = call %struct.node* @sort_by_insert(%struct.node* %call23)
  %cmp.i114 = icmp eq %struct.node* %call25, null
  br i1 %cmp.i114, label %if.else.i126, label %if.then.i116

if.then.i116:                                     ; preds = %display.exit113
  %call.i115 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str8, i64 0, i64 0)) #4
  br label %do.body.i122

do.body.i122:                                     ; preds = %do.body.i122, %if.then.i116
  %current.0.i117 = phi %struct.node* [ %call25, %if.then.i116 ], [ %20, %do.body.i122 ]
  %data.i118 = getelementptr inbounds %struct.node* %current.0.i117, i64 0, i32 0
  %19 = load i32* %data.i118, align 4, !tbaa !7
  %call1.i119 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str9, i64 0, i64 0), i32 %19) #4
  %next.i120 = getelementptr inbounds %struct.node* %current.0.i117, i64 0, i32 1
  %20 = load %struct.node** %next.i120, align 8, !tbaa !1
  %cmp2.i121 = icmp eq %struct.node* %20, null
  br i1 %cmp2.i121, label %do.end.i124, label %do.body.i122

do.end.i124:                                      ; preds = %do.body.i122
  %putchar.i123 = call i32 @putchar(i32 10) #4
  br label %display.exit127

if.else.i126:                                     ; preds = %display.exit113
  %puts.i125 = call i32 @puts(i8* getelementptr inbounds ([19 x i8]* @str, i64 0, i64 0)) #4
  br label %display.exit127

display.exit127:                                  ; preds = %do.end.i124, %if.else.i126
  %puts46 = call i32 @puts(i8* getelementptr inbounds ([26 x i8]* @str16, i64 0, i64 0))
  br label %while.cond.us.i

while.cond.us.i:                                  ; preds = %while.cond.us.i, %display.exit127
  br label %while.cond.us.i

push.exit85.1:                                    ; preds = %do.end.i96
  %rem17.1 = srem i32 %call16.1, 100
  %21 = bitcast i8* %call.i80.1 to %struct.node*
  %data1.i83.1 = bitcast i8* %call.i80.1 to i32*
  store i32 %rem17.1, i32* %data1.i83.1, align 4, !tbaa !7
  %next.i84.1 = getelementptr inbounds i8* %call.i80.1, i64 8
  %22 = bitcast i8* %next.i84.1 to i8**
  store i8* %call.i80, i8** %22, align 8, !tbaa !1
  %call.i87.1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str8, i64 0, i64 0)) #4
  br label %do.body.i94.1

do.body.i94.1:                                    ; preds = %do.body.i94.1, %push.exit85.1
  %current.0.i89.1 = phi %struct.node* [ %21, %push.exit85.1 ], [ %24, %do.body.i94.1 ]
  %data.i90.1 = getelementptr inbounds %struct.node* %current.0.i89.1, i64 0, i32 0
  %23 = load i32* %data.i90.1, align 4, !tbaa !7
  %call1.i91.1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str9, i64 0, i64 0), i32 %23) #4
  %next.i92.1 = getelementptr inbounds %struct.node* %current.0.i89.1, i64 0, i32 1
  %24 = load %struct.node** %next.i92.1, align 8, !tbaa !1
  %cmp2.i93.1 = icmp eq %struct.node* %24, null
  br i1 %cmp2.i93.1, label %do.end.i96.1, label %do.body.i94.1

do.end.i96.1:                                     ; preds = %do.body.i94.1
  %putchar.i95.1 = call i32 @putchar(i32 10) #4
  %puts44 = call i32 @puts(i8* getelementptr inbounds ([16 x i8]* @str14, i64 0, i64 0))
  %call23 = call %struct.node* @concat(%struct.node* %temp.0.lcssa.i129, %struct.node* %21)
  %cmp.i100 = icmp eq %struct.node* %call23, null
  br i1 %cmp.i100, label %if.else.i112, label %if.then.i102
}

; Function Attrs: nounwind
declare void @srand(i32) #2

; Function Attrs: nounwind
declare i64 @time(i64*) #2

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind
declare i32 @__isoc99_scanf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind readnone uwtable
define void @init(%struct.node* nocapture %head) #1 {
entry:
  ret void
}

; Function Attrs: nounwind
declare i32 @rand() #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

; Function Attrs: nounwind
declare void @free(i8* nocapture) #2

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #4

; Function Attrs: nounwind
declare i32 @putchar(i32) #4

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.0 (http://llvm.org/git/clang.git 4a1c320799579cc42eef78e294997c86e7e4c604) (http://llvm.org/git/llvm.git c0bd970d0e639d026705c11404efb984e4ea008d)"}
!1 = !{!2, !6, i64 8}
!2 = !{!"node", !3, i64 0, !6, i64 8}
!3 = !{!"int", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!"any pointer", !4, i64 0}
!7 = !{!2, !3, i64 0}
!8 = !{!3, !3, i64 0}
