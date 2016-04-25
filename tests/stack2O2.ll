; ModuleID = 'stack2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.node = type { i32, %struct.node* }

@.str = private unnamed_addr constant [12 x i8] c"pivot = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"element trait\C3\A9 : %d\0A\00", align 1
@.str2 = private unnamed_addr constant [36 x i8] c"Enter the number of stack elements:\00", align 1
@.str3 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str6 = private unnamed_addr constant [37 x i8] c"--- Ajout de 2 elements en queue ---\00", align 1
@.str11 = private unnamed_addr constant [8 x i8] c"Stack: \00", align 1
@.str12 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@str = private unnamed_addr constant [19 x i8] c"The Stack is empty\00"
@str15 = private unnamed_addr constant [44 x i8] c"--- Push elements into the linked stack ---\00"
@str16 = private unnamed_addr constant [19 x i8] c"--- Reversing --- \00"
@str17 = private unnamed_addr constant [16 x i8] c"--- concat --- \00"
@str18 = private unnamed_addr constant [26 x i8] c"--- permut(head,2,4) --- \00"
@str19 = private unnamed_addr constant [27 x i8] c"--- Sort by quicksort --- \00"
@str20 = private unnamed_addr constant [7 x i8] c"FINISH\00"

; Function Attrs: nounwind uwtable
define void @permut(%struct.node* %head, i32 %i, i32 %j) #0 {
entry:
  br label %while.cond

while.cond:                                       ; preds = %if.end8, %entry
  %count.0 = phi i32 [ 0, %entry ], [ %inc, %if.end8 ]
  %tmp.0 = phi %struct.node* [ %head, %entry ], [ %0, %if.end8 ]
  %first.0 = phi %struct.node* [ null, %entry ], [ %first.1, %if.end8 ]
  %next.i = getelementptr inbounds %struct.node* %tmp.0, i64 0, i32 1
  %0 = load %struct.node** %next.i, align 8, !tbaa !1
  %cmp4 = icmp eq i32 %count.0, %i
  %cmp5 = icmp eq i32 %count.0, %j
  %or.cond = or i1 %cmp4, %cmp5
  br i1 %or.cond, label %if.then, label %if.end8

if.then:                                          ; preds = %while.cond
  %cmp6 = icmp eq %struct.node* %first.0, null
  br i1 %cmp6, label %if.end8, label %while.end

if.end8:                                          ; preds = %if.then, %while.cond
  %first.1 = phi %struct.node* [ %first.0, %while.cond ], [ %tmp.0, %if.then ]
  %inc = add nsw i32 %count.0, 1
  br label %while.cond

while.end:                                        ; preds = %if.then
  %first.0.lcssa = phi %struct.node* [ %first.0, %if.then ]
  %tmp.0.lcssa = phi %struct.node* [ %tmp.0, %if.then ]
  %data = getelementptr inbounds %struct.node* %tmp.0.lcssa, i64 0, i32 0
  %1 = load i32* %data, align 4, !tbaa !7
  %data9 = getelementptr inbounds %struct.node* %first.0.lcssa, i64 0, i32 0
  %2 = load i32* %data9, align 4, !tbaa !7
  store i32 %2, i32* %data, align 4, !tbaa !7
  store i32 %1, i32* %data9, align 4, !tbaa !7
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
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i32 %0) #4
  br label %while.cond.outer

while.cond.outer:                                 ; preds = %permut.exit41, %entry
  %tmp.0.ph = phi %struct.node* [ %.lcssa61, %permut.exit41 ], [ %head, %entry ]
  %last.0.ph = phi %struct.node* [ %tmp.0.lcssa58, %permut.exit41 ], [ %head, %entry ]
  %i.0.ph = phi i32 [ %phitmp, %permut.exit41 ], [ 1, %entry ]
  %j.0.ph = phi i32 [ %inc.lcssa, %permut.exit41 ], [ 0, %entry ]
  br label %while.cond

while.cond:                                       ; preds = %while.cond.outer, %while.body
  %tmp.0 = phi %struct.node* [ %2, %while.body ], [ %tmp.0.ph, %while.cond.outer ]
  %last.0 = phi %struct.node* [ %tmp.0, %while.body ], [ %last.0.ph, %while.cond.outer ]
  %j.0 = phi i32 [ %inc, %while.body ], [ %j.0.ph, %while.cond.outer ]
  %cmp = icmp eq %struct.node* %tmp.0, null
  br i1 %cmp, label %while.cond.i.preheader, label %while.body

while.cond.i.preheader:                           ; preds = %while.cond
  %i.0.ph.lcssa = phi i32 [ %i.0.ph, %while.cond ]
  %tmp.0.ph.lcssa = phi %struct.node* [ %tmp.0.ph, %while.cond ]
  %j.0.lcssa = phi i32 [ %j.0, %while.cond ]
  %last.0.lcssa = phi %struct.node* [ %last.0, %while.cond ]
  br label %while.cond.i

while.body:                                       ; preds = %while.cond
  %data.i42 = getelementptr inbounds %struct.node* %tmp.0, i64 0, i32 0
  %1 = load i32* %data.i42, align 4, !tbaa !7
  %next.i43 = getelementptr inbounds %struct.node* %tmp.0, i64 0, i32 1
  %2 = load %struct.node** %next.i43, align 8, !tbaa !1
  %call9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i64 0, i64 0), i32 %1) #4
  %inc = add nsw i32 %j.0, 1
  %cmp10 = icmp sgt i32 %1, %0
  br i1 %cmp10, label %while.cond, label %if.then

if.then:                                          ; preds = %while.body
  %inc.lcssa = phi i32 [ %inc, %while.body ]
  %.lcssa61 = phi %struct.node* [ %2, %while.body ]
  %.lcssa = phi i32 [ %1, %while.body ]
  %tmp.0.lcssa58 = phi %struct.node* [ %tmp.0, %while.body ]
  %call11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i64 0, i64 0), i32 %.lcssa) #4
  br label %while.cond.i33

while.cond.i33:                                   ; preds = %if.end8.i38, %if.then
  %count.0.i26 = phi i32 [ 0, %if.then ], [ %inc.i37, %if.end8.i38 ]
  %tmp.0.i27 = phi %struct.node* [ %head, %if.then ], [ %3, %if.end8.i38 ]
  %first.0.i28 = phi %struct.node* [ null, %if.then ], [ %first.1.i36, %if.end8.i38 ]
  %next.i.i29 = getelementptr inbounds %struct.node* %tmp.0.i27, i64 0, i32 1
  %3 = load %struct.node** %next.i.i29, align 8, !tbaa !1
  %cmp4.i30 = icmp eq i32 %count.0.i26, %i.0.ph
  %cmp5.i31 = icmp eq i32 %count.0.i26, %inc.lcssa
  %or.cond.i32 = or i1 %cmp4.i30, %cmp5.i31
  br i1 %or.cond.i32, label %if.then.i35, label %if.end8.i38

if.then.i35:                                      ; preds = %while.cond.i33
  %cmp6.i34 = icmp eq %struct.node* %first.0.i28, null
  br i1 %cmp6.i34, label %if.end8.i38, label %permut.exit41

if.end8.i38:                                      ; preds = %if.then.i35, %while.cond.i33
  %first.1.i36 = phi %struct.node* [ %first.0.i28, %while.cond.i33 ], [ %tmp.0.i27, %if.then.i35 ]
  %inc.i37 = add nsw i32 %count.0.i26, 1
  br label %while.cond.i33

permut.exit41:                                    ; preds = %if.then.i35
  %first.0.i28.lcssa = phi %struct.node* [ %first.0.i28, %if.then.i35 ]
  %tmp.0.i27.lcssa = phi %struct.node* [ %tmp.0.i27, %if.then.i35 ]
  %data.i39 = getelementptr inbounds %struct.node* %tmp.0.i27.lcssa, i64 0, i32 0
  %4 = load i32* %data.i39, align 4, !tbaa !7
  %data9.i40 = getelementptr inbounds %struct.node* %first.0.i28.lcssa, i64 0, i32 0
  %5 = load i32* %data9.i40, align 4, !tbaa !7
  store i32 %5, i32* %data.i39, align 4, !tbaa !7
  store i32 %4, i32* %data9.i40, align 4, !tbaa !7
  %phitmp = add i32 %i.0.ph, 1
  br label %while.cond.outer

while.cond.i:                                     ; preds = %while.cond.i.preheader, %if.end8.i
  %count.0.i = phi i32 [ %inc.i, %if.end8.i ], [ 0, %while.cond.i.preheader ]
  %tmp.0.i = phi %struct.node* [ %6, %if.end8.i ], [ %head, %while.cond.i.preheader ]
  %first.0.i = phi %struct.node* [ %first.1.i, %if.end8.i ], [ null, %while.cond.i.preheader ]
  %next.i.i = getelementptr inbounds %struct.node* %tmp.0.i, i64 0, i32 1
  %6 = load %struct.node** %next.i.i, align 8, !tbaa !1
  %cmp4.i = icmp eq i32 %count.0.i, %i.0.ph.lcssa
  %cmp5.i = icmp eq i32 %count.0.i, %j.0.lcssa
  %or.cond.i = or i1 %cmp4.i, %cmp5.i
  br i1 %or.cond.i, label %if.then.i, label %if.end8.i

if.then.i:                                        ; preds = %while.cond.i
  %cmp6.i = icmp eq %struct.node* %first.0.i, null
  br i1 %cmp6.i, label %if.end8.i, label %permut.exit

if.end8.i:                                        ; preds = %if.then.i, %while.cond.i
  %first.1.i = phi %struct.node* [ %first.0.i, %while.cond.i ], [ %tmp.0.i, %if.then.i ]
  %inc.i = add nsw i32 %count.0.i, 1
  br label %while.cond.i

permut.exit:                                      ; preds = %if.then.i
  %first.0.i.lcssa = phi %struct.node* [ %first.0.i, %if.then.i ]
  %tmp.0.i.lcssa = phi %struct.node* [ %tmp.0.i, %if.then.i ]
  %data.i25 = getelementptr inbounds %struct.node* %tmp.0.i.lcssa, i64 0, i32 0
  %7 = load i32* %data.i25, align 4, !tbaa !7
  %data9.i = getelementptr inbounds %struct.node* %first.0.i.lcssa, i64 0, i32 0
  %8 = load i32* %data9.i, align 4, !tbaa !7
  store i32 %8, i32* %data.i25, align 4, !tbaa !7
  store i32 %7, i32* %data9.i, align 4, !tbaa !7
  %next = getelementptr inbounds %struct.node* %last.0.lcssa, i64 0, i32 1
  store %struct.node* null, %struct.node** %next, align 8, !tbaa !1
  ret %struct.node* %tmp.0.ph.lcssa
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

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
define %struct.node* @quicksort(%struct.node* %head) #0 {
entry:
  %cmp.i = icmp eq %struct.node* %head, null
  br i1 %cmp.i, label %return, label %land.lhs.true

land.lhs.true:                                    ; preds = %entry
  %next = getelementptr inbounds %struct.node* %head, i64 0, i32 1
  %0 = load %struct.node** %next, align 8, !tbaa !1
  %cmp = icmp eq %struct.node* %0, null
  br i1 %cmp, label %return, label %if.then

if.then:                                          ; preds = %land.lhs.true
  %call1 = tail call %struct.node* @partition(%struct.node* %head)
  %call2 = tail call %struct.node* @quicksort(%struct.node* %head)
  %call3 = tail call %struct.node* @quicksort(%struct.node* %call1)
  %call4 = tail call %struct.node* @concat(%struct.node* %call2, %struct.node* %call3)
  ret %struct.node* %call4

return:                                           ; preds = %entry, %land.lhs.true
  ret %struct.node* %head
}

; Function Attrs: nounwind readnone uwtable
define i32 @empty(%struct.node* readnone %head) #2 {
entry:
  %cmp = icmp eq %struct.node* %head, null
  %cond = zext i1 %cmp to i32
  ret i32 %cond
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
  %call.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str11, i64 0, i64 0)) #4
  br label %do.body.i

do.body.i:                                        ; preds = %do.body.i, %if.then.i
  %current.0.i = phi %struct.node* [ %call1, %if.then.i ], [ %4, %do.body.i ]
  %data.i5 = getelementptr inbounds %struct.node* %current.0.i, i64 0, i32 0
  %3 = load i32* %data.i5, align 4, !tbaa !7
  %call1.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str12, i64 0, i64 0), i32 %3) #4
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
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str11, i64 0, i64 0)) #4
  br label %do.body

do.body:                                          ; preds = %do.body, %if.then
  %current.0 = phi %struct.node* [ %head, %if.then ], [ %1, %do.body ]
  %data = getelementptr inbounds %struct.node* %current.0, i64 0, i32 0
  %0 = load i32* %data, align 4, !tbaa !7
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str12, i64 0, i64 0), i32 %0) #4
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
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str2, i64 0, i64 0)) #4
  %call2 = call i32 (i8*, ...)* @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8]* @.str3, i64 0, i64 0), i32* %size) #4
  %puts = call i32 @puts(i8* getelementptr inbounds ([44 x i8]* @str15, i64 0, i64 0))
  %0 = load i32* %size, align 4, !tbaa !8
  %cmp142 = icmp sgt i32 %0, 0
  br i1 %cmp142, label %for.body.preheader, label %for.end.thread

for.body.preheader:                               ; preds = %entry
  br label %for.body

for.end.thread:                                   ; preds = %entry
  %puts44148 = call i32 @puts(i8* getelementptr inbounds ([19 x i8]* @str16, i64 0, i64 0))
  br label %if.else.i80

for.body:                                         ; preds = %for.body.preheader, %do.end.i63
  %head.0144 = phi %struct.node* [ %1, %do.end.i63 ], [ null, %for.body.preheader ]
  %i.0143 = phi i32 [ %inc7, %do.end.i63 ], [ 0, %for.body.preheader ]
  %call5 = call i32 @rand() #4
  %call.i49 = call noalias i8* @malloc(i64 16) #4
  %cmp.i50 = icmp eq i8* %call.i49, null
  br i1 %cmp.i50, label %if.then.i51, label %push.exit

if.then.i51:                                      ; preds = %for.body
  call void @exit(i32 0) #5
  unreachable

push.exit:                                        ; preds = %for.body
  %rem = srem i32 %call5, 100
  %1 = bitcast i8* %call.i49 to %struct.node*
  %data1.i = bitcast i8* %call.i49 to i32*
  store i32 %rem, i32* %data1.i, align 4, !tbaa !7
  %next.i52 = getelementptr inbounds i8* %call.i49, i64 8
  %2 = bitcast i8* %next.i52 to %struct.node**
  store %struct.node* %head.0144, %struct.node** %2, align 8, !tbaa !1
  %call.i54 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str11, i64 0, i64 0)) #4
  br label %do.body.i61

do.body.i61:                                      ; preds = %do.body.i61, %push.exit
  %current.0.i56 = phi %struct.node* [ %1, %push.exit ], [ %4, %do.body.i61 ]
  %data.i57 = getelementptr inbounds %struct.node* %current.0.i56, i64 0, i32 0
  %3 = load i32* %data.i57, align 4, !tbaa !7
  %call1.i58 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str12, i64 0, i64 0), i32 %3) #4
  %next.i59 = getelementptr inbounds %struct.node* %current.0.i56, i64 0, i32 1
  %4 = load %struct.node** %next.i59, align 8, !tbaa !1
  %cmp2.i60 = icmp eq %struct.node* %4, null
  br i1 %cmp2.i60, label %do.end.i63, label %do.body.i61

do.end.i63:                                       ; preds = %do.body.i61
  %putchar.i62 = call i32 @putchar(i32 10) #4
  %inc7 = add nsw i32 %i.0143, 1
  %5 = load i32* %size, align 4, !tbaa !8
  %cmp = icmp slt i32 %inc7, %5
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %do.end.i63
  %.lcssa153 = phi %struct.node* [ %1, %do.end.i63 ]
  %call.i49.lcssa152 = phi i8* [ %call.i49, %do.end.i63 ]
  %puts44 = call i32 @puts(i8* getelementptr inbounds ([19 x i8]* @str16, i64 0, i64 0))
  %cmp6.i = icmp eq i8* %call.i49.lcssa152, null
  br i1 %cmp6.i, label %if.else.i80, label %while.body.i.preheader

while.body.i.preheader:                           ; preds = %for.end
  br label %while.body.i

while.body.i:                                     ; preds = %while.body.i.preheader, %push.exit.i
  %temp.08.i = phi %struct.node* [ %9, %push.exit.i ], [ null, %while.body.i.preheader ]
  %head.addr.07.i = phi %struct.node* [ %7, %push.exit.i ], [ %.lcssa153, %while.body.i.preheader ]
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
  %cmp.i67 = icmp eq %struct.node* %7, null
  br i1 %cmp.i67, label %if.then.i70, label %while.body.i

if.then.i70:                                      ; preds = %push.exit.i
  %.lcssa = phi %struct.node* [ %9, %push.exit.i ]
  %call.i69 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str11, i64 0, i64 0)) #4
  br label %do.body.i76

do.body.i76:                                      ; preds = %do.body.i76, %if.then.i70
  %current.0.i71 = phi %struct.node* [ %.lcssa, %if.then.i70 ], [ %12, %do.body.i76 ]
  %data.i72 = getelementptr inbounds %struct.node* %current.0.i71, i64 0, i32 0
  %11 = load i32* %data.i72, align 4, !tbaa !7
  %call1.i73 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str12, i64 0, i64 0), i32 %11) #4
  %next.i74 = getelementptr inbounds %struct.node* %current.0.i71, i64 0, i32 1
  %12 = load %struct.node** %next.i74, align 8, !tbaa !1
  %cmp2.i75 = icmp eq %struct.node* %12, null
  br i1 %cmp2.i75, label %do.end.i78, label %do.body.i76

do.end.i78:                                       ; preds = %do.body.i76
  %putchar.i77 = call i32 @putchar(i32 10) #4
  br label %display.exit81

if.else.i80:                                      ; preds = %for.end.thread, %for.end
  %puts.i79 = call i32 @puts(i8* getelementptr inbounds ([19 x i8]* @str, i64 0, i64 0)) #4
  br label %display.exit81

display.exit81:                                   ; preds = %do.end.i78, %if.else.i80
  %temp.0.lcssa.i135 = phi %struct.node* [ %.lcssa, %do.end.i78 ], [ null, %if.else.i80 ]
  %call10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str6, i64 0, i64 0)) #4
  %call16 = call i32 @rand() #4
  %call.i82 = call noalias i8* @malloc(i64 16) #4
  %cmp.i83 = icmp eq i8* %call.i82, null
  br i1 %cmp.i83, label %if.then.i84, label %push.exit87

if.then.i84:                                      ; preds = %do.end.i98, %display.exit81
  call void @exit(i32 0) #5
  unreachable

push.exit87:                                      ; preds = %display.exit81
  %rem17 = srem i32 %call16, 100
  %13 = bitcast i8* %call.i82 to %struct.node*
  %data1.i85 = bitcast i8* %call.i82 to i32*
  store i32 %rem17, i32* %data1.i85, align 4, !tbaa !7
  %next.i86 = getelementptr inbounds i8* %call.i82, i64 8
  %14 = bitcast i8* %next.i86 to %struct.node**
  store %struct.node* null, %struct.node** %14, align 8, !tbaa !1
  %call.i89 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str11, i64 0, i64 0)) #4
  br label %do.body.i96

do.body.i96:                                      ; preds = %do.body.i96, %push.exit87
  %current.0.i91 = phi %struct.node* [ %13, %push.exit87 ], [ %16, %do.body.i96 ]
  %data.i92 = getelementptr inbounds %struct.node* %current.0.i91, i64 0, i32 0
  %15 = load i32* %data.i92, align 4, !tbaa !7
  %call1.i93 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str12, i64 0, i64 0), i32 %15) #4
  %next.i94 = getelementptr inbounds %struct.node* %current.0.i91, i64 0, i32 1
  %16 = load %struct.node** %next.i94, align 8, !tbaa !1
  %cmp2.i95 = icmp eq %struct.node* %16, null
  br i1 %cmp2.i95, label %do.end.i98, label %do.body.i96

do.end.i98:                                       ; preds = %do.body.i96
  %putchar.i97 = call i32 @putchar(i32 10) #4
  %call16.1 = call i32 @rand() #4
  %call.i82.1 = call noalias i8* @malloc(i64 16) #4
  %cmp.i83.1 = icmp eq i8* %call.i82.1, null
  br i1 %cmp.i83.1, label %if.then.i84, label %push.exit87.1

if.then.i104:                                     ; preds = %do.end.i98.1
  %call.i103 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str11, i64 0, i64 0)) #4
  br label %do.body.i110

do.body.i110:                                     ; preds = %do.body.i110, %if.then.i104
  %current.0.i105 = phi %struct.node* [ %call23, %if.then.i104 ], [ %18, %do.body.i110 ]
  %data.i106 = getelementptr inbounds %struct.node* %current.0.i105, i64 0, i32 0
  %17 = load i32* %data.i106, align 4, !tbaa !7
  %call1.i107 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str12, i64 0, i64 0), i32 %17) #4
  %next.i108 = getelementptr inbounds %struct.node* %current.0.i105, i64 0, i32 1
  %18 = load %struct.node** %next.i108, align 8, !tbaa !1
  %cmp2.i109 = icmp eq %struct.node* %18, null
  br i1 %cmp2.i109, label %do.end.i112, label %do.body.i110

do.end.i112:                                      ; preds = %do.body.i110
  %putchar.i111 = call i32 @putchar(i32 10) #4
  br label %display.exit115

if.else.i114:                                     ; preds = %do.end.i98.1
  %puts.i113 = call i32 @puts(i8* getelementptr inbounds ([19 x i8]* @str, i64 0, i64 0)) #4
  br label %display.exit115

display.exit115:                                  ; preds = %do.end.i112, %if.else.i114
  %puts46 = call i32 @puts(i8* getelementptr inbounds ([26 x i8]* @str18, i64 0, i64 0))
  br label %while.cond.i

while.cond.i:                                     ; preds = %if.end8.i, %display.exit115
  %count.0.i = phi i32 [ 0, %display.exit115 ], [ %inc.i, %if.end8.i ]
  %tmp.0.i = phi %struct.node* [ %call23, %display.exit115 ], [ %19, %if.end8.i ]
  %first.0.i = phi %struct.node* [ null, %display.exit115 ], [ %first.1.i, %if.end8.i ]
  %next.i.i116 = getelementptr inbounds %struct.node* %tmp.0.i, i64 0, i32 1
  %19 = load %struct.node** %next.i.i116, align 8, !tbaa !1
  switch i32 %count.0.i, label %if.end8.i [
    i32 4, label %if.then.i118
    i32 2, label %if.then.i118
  ]

if.then.i118:                                     ; preds = %while.cond.i, %while.cond.i
  %cmp6.i117 = icmp eq %struct.node* %first.0.i, null
  br i1 %cmp6.i117, label %if.end8.i, label %permut.exit

if.end8.i:                                        ; preds = %while.cond.i, %if.then.i118
  %first.1.i = phi %struct.node* [ %first.0.i, %while.cond.i ], [ %tmp.0.i, %if.then.i118 ]
  %inc.i = add nsw i32 %count.0.i, 1
  br label %while.cond.i

permut.exit:                                      ; preds = %if.then.i118
  %first.0.i.lcssa = phi %struct.node* [ %first.0.i, %if.then.i118 ]
  %tmp.0.i.lcssa = phi %struct.node* [ %tmp.0.i, %if.then.i118 ]
  %data.i119 = getelementptr inbounds %struct.node* %tmp.0.i.lcssa, i64 0, i32 0
  %20 = load i32* %data.i119, align 4, !tbaa !7
  %data9.i = getelementptr inbounds %struct.node* %first.0.i.lcssa, i64 0, i32 0
  %21 = load i32* %data9.i, align 4, !tbaa !7
  store i32 %21, i32* %data.i119, align 4, !tbaa !7
  store i32 %20, i32* %data9.i, align 4, !tbaa !7
  br i1 %cmp.i102, label %if.else.i132, label %if.then.i122

if.then.i122:                                     ; preds = %permut.exit
  %call.i121 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str11, i64 0, i64 0)) #4
  br label %do.body.i128

do.body.i128:                                     ; preds = %do.body.i128, %if.then.i122
  %current.0.i123 = phi %struct.node* [ %call23, %if.then.i122 ], [ %23, %do.body.i128 ]
  %data.i124 = getelementptr inbounds %struct.node* %current.0.i123, i64 0, i32 0
  %22 = load i32* %data.i124, align 4, !tbaa !7
  %call1.i125 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str12, i64 0, i64 0), i32 %22) #4
  %next.i126 = getelementptr inbounds %struct.node* %current.0.i123, i64 0, i32 1
  %23 = load %struct.node** %next.i126, align 8, !tbaa !1
  %cmp2.i127 = icmp eq %struct.node* %23, null
  br i1 %cmp2.i127, label %do.end.i130, label %do.body.i128

do.end.i130:                                      ; preds = %do.body.i128
  %putchar.i129 = call i32 @putchar(i32 10) #4
  br label %display.exit133

if.else.i132:                                     ; preds = %permut.exit
  %puts.i131 = call i32 @puts(i8* getelementptr inbounds ([19 x i8]* @str, i64 0, i64 0)) #4
  br label %display.exit133

display.exit133:                                  ; preds = %do.end.i130, %if.else.i132
  %puts47 = call i32 @puts(i8* getelementptr inbounds ([27 x i8]* @str19, i64 0, i64 0))
  %call26 = call %struct.node* @quicksort(%struct.node* %call23)
  %cmp.i = icmp eq %struct.node* %call26, null
  br i1 %cmp.i, label %if.else.i, label %if.then.i

if.then.i:                                        ; preds = %display.exit133
  %call.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str11, i64 0, i64 0)) #4
  br label %do.body.i

do.body.i:                                        ; preds = %do.body.i, %if.then.i
  %current.0.i = phi %struct.node* [ %call26, %if.then.i ], [ %25, %do.body.i ]
  %data.i = getelementptr inbounds %struct.node* %current.0.i, i64 0, i32 0
  %24 = load i32* %data.i, align 4, !tbaa !7
  %call1.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str12, i64 0, i64 0), i32 %24) #4
  %next.i = getelementptr inbounds %struct.node* %current.0.i, i64 0, i32 1
  %25 = load %struct.node** %next.i, align 8, !tbaa !1
  %cmp2.i = icmp eq %struct.node* %25, null
  br i1 %cmp2.i, label %do.end.i, label %do.body.i

do.end.i:                                         ; preds = %do.body.i
  %putchar.i = call i32 @putchar(i32 10) #4
  br label %display.exit

if.else.i:                                        ; preds = %display.exit133
  %puts.i = call i32 @puts(i8* getelementptr inbounds ([19 x i8]* @str, i64 0, i64 0)) #4
  br label %display.exit

display.exit:                                     ; preds = %do.end.i, %if.else.i
  %puts48 = call i32 @puts(i8* getelementptr inbounds ([7 x i8]* @str20, i64 0, i64 0))
  ret i32 0

push.exit87.1:                                    ; preds = %do.end.i98
  %rem17.1 = srem i32 %call16.1, 100
  %26 = bitcast i8* %call.i82.1 to %struct.node*
  %data1.i85.1 = bitcast i8* %call.i82.1 to i32*
  store i32 %rem17.1, i32* %data1.i85.1, align 4, !tbaa !7
  %next.i86.1 = getelementptr inbounds i8* %call.i82.1, i64 8
  %27 = bitcast i8* %next.i86.1 to i8**
  store i8* %call.i82, i8** %27, align 8, !tbaa !1
  %call.i89.1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str11, i64 0, i64 0)) #4
  br label %do.body.i96.1

do.body.i96.1:                                    ; preds = %do.body.i96.1, %push.exit87.1
  %current.0.i91.1 = phi %struct.node* [ %26, %push.exit87.1 ], [ %29, %do.body.i96.1 ]
  %data.i92.1 = getelementptr inbounds %struct.node* %current.0.i91.1, i64 0, i32 0
  %28 = load i32* %data.i92.1, align 4, !tbaa !7
  %call1.i93.1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str12, i64 0, i64 0), i32 %28) #4
  %next.i94.1 = getelementptr inbounds %struct.node* %current.0.i91.1, i64 0, i32 1
  %29 = load %struct.node** %next.i94.1, align 8, !tbaa !1
  %cmp2.i95.1 = icmp eq %struct.node* %29, null
  br i1 %cmp2.i95.1, label %do.end.i98.1, label %do.body.i96.1

do.end.i98.1:                                     ; preds = %do.body.i96.1
  %putchar.i97.1 = call i32 @putchar(i32 10) #4
  %puts45 = call i32 @puts(i8* getelementptr inbounds ([16 x i8]* @str17, i64 0, i64 0))
  %call23 = call %struct.node* @concat(%struct.node* %temp.0.lcssa.i135, %struct.node* %26)
  %cmp.i102 = icmp eq %struct.node* %call23, null
  br i1 %cmp.i102, label %if.else.i114, label %if.then.i104
}

; Function Attrs: nounwind
declare void @srand(i32) #1

; Function Attrs: nounwind
declare i64 @time(i64*) #1

; Function Attrs: nounwind
declare i32 @__isoc99_scanf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind readnone uwtable
define void @init(%struct.node* nocapture %head) #2 {
entry:
  ret void
}

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

; Function Attrs: nounwind
declare void @free(i8* nocapture) #1

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #4

; Function Attrs: nounwind
declare i32 @putchar(i32) #4

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
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
