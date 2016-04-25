; ModuleID = 'stack2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.node = type { i32, %struct.node* }

@.str = private unnamed_addr constant [36 x i8] c"Enter the number of stack elements:\00", align 1
@.str1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str2 = private unnamed_addr constant [45 x i8] c"--- Push elements into the linked stack ---\0A\00", align 1
@.str3 = private unnamed_addr constant [20 x i8] c"--- Reversing --- \0A\00", align 1
@.str4 = private unnamed_addr constant [37 x i8] c"--- Ajout de 2 elements en queue ---\00", align 1
@.str5 = private unnamed_addr constant [17 x i8] c"--- concat --- \0A\00", align 1
@.str6 = private unnamed_addr constant [27 x i8] c"--- permut(head,2,4) --- \0A\00", align 1
@.str7 = private unnamed_addr constant [28 x i8] c"--- Sort by quicksort --- \0A\00", align 1
@.str8 = private unnamed_addr constant [8 x i8] c"FINISH\0A\00", align 1
@.str9 = private unnamed_addr constant [8 x i8] c"Stack: \00", align 1
@.str10 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str11 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str12 = private unnamed_addr constant [20 x i8] c"The Stack is empty\0A\00", align 1
@str = private unnamed_addr constant [19 x i8] c"The Stack is empty\00"
@str13 = private unnamed_addr constant [44 x i8] c"--- Push elements into the linked stack ---\00"
@str14 = private unnamed_addr constant [19 x i8] c"--- Reversing --- \00"
@str15 = private unnamed_addr constant [16 x i8] c"--- concat --- \00"
@str16 = private unnamed_addr constant [26 x i8] c"--- permut(head,2,4) --- \00"
@str17 = private unnamed_addr constant [27 x i8] c"--- Sort by quicksort --- \00"
@str18 = private unnamed_addr constant [7 x i8] c"FINISH\00"

; Function Attrs: nounwind uwtable
define void @permut(%struct.node* %head, i32 %i, i32 %j) #0 {
entry:
  %element = alloca i32, align 4
  %cmp = icmp eq i32 %i, %j
  br i1 %cmp, label %if.end19, label %while.cond.preheader

while.cond.preheader:                             ; preds = %entry
  %cmp434 = icmp eq %struct.node* %head, null
  br i1 %cmp434, label %while.end, label %while.body

while.body:                                       ; preds = %while.cond.preheader, %if.end10
  %first.037 = phi %struct.node* [ %first.1, %if.end10 ], [ null, %while.cond.preheader ]
  %tmp.036 = phi %struct.node* [ %call, %if.end10 ], [ %head, %while.cond.preheader ]
  %count.035 = phi i32 [ %inc, %if.end10 ], [ 0, %while.cond.preheader ]
  %call = call %struct.node* @visit(%struct.node* %tmp.036, i32* %element)
  %cmp5 = icmp eq i32 %count.035, %i
  %cmp6 = icmp eq i32 %count.035, %j
  %or.cond = or i1 %cmp5, %cmp6
  br i1 %or.cond, label %if.then7, label %if.end10

if.then7:                                         ; preds = %while.body
  %cmp8 = icmp eq %struct.node* %first.037, null
  br i1 %cmp8, label %if.end10, label %while.end

if.end10:                                         ; preds = %if.then7, %while.body
  %first.1 = phi %struct.node* [ %first.037, %while.body ], [ %tmp.036, %if.then7 ]
  %inc = add nsw i32 %count.035, 1
  %cmp4 = icmp eq %struct.node* %call, null
  br i1 %cmp4, label %while.end, label %while.body

while.end:                                        ; preds = %if.end10, %if.then7, %while.cond.preheader
  %first.0.lcssa = phi %struct.node* [ null, %while.cond.preheader ], [ %first.1, %if.end10 ], [ %first.037, %if.then7 ]
  %count.0.lcssa = phi i32 [ 0, %while.cond.preheader ], [ %inc, %if.end10 ], [ %count.035, %if.then7 ]
  %second.0 = phi %struct.node* [ null, %while.cond.preheader ], [ null, %if.end10 ], [ %tmp.036, %if.then7 ]
  %cmp11 = icmp sgt i32 %count.0.lcssa, %i
  %cmp13 = icmp sgt i32 %count.0.lcssa, %j
  %or.cond33 = and i1 %cmp11, %cmp13
  br i1 %or.cond33, label %if.end19, label %if.then14

if.then14:                                        ; preds = %while.end
  %data = getelementptr inbounds %struct.node* %second.0, i64 0, i32 0
  %0 = load i32* %data, align 4, !tbaa !1
  store i32 %0, i32* %element, align 4, !tbaa !7
  %data15 = getelementptr inbounds %struct.node* %first.0.lcssa, i64 0, i32 0
  %1 = load i32* %data15, align 4, !tbaa !1
  store i32 %1, i32* %data, align 4, !tbaa !1
  %2 = load i32* %element, align 4, !tbaa !7
  store i32 %2, i32* %data15, align 4, !tbaa !1
  br label %if.end19

if.end19:                                         ; preds = %while.end, %entry, %if.then14
  ret void
}

; Function Attrs: nounwind uwtable
define %struct.node* @visit(%struct.node* nocapture readonly %head, i32* nocapture %element) #0 {
entry:
  %data = getelementptr inbounds %struct.node* %head, i64 0, i32 0
  %0 = load i32* %data, align 4, !tbaa !1
  store i32 %0, i32* %element, align 4, !tbaa !7
  %next = getelementptr inbounds %struct.node* %head, i64 0, i32 1
  %1 = load %struct.node** %next, align 8, !tbaa !8
  ret %struct.node* %1
}

; Function Attrs: nounwind uwtable
define %struct.node* @partition(%struct.node* %head) #0 {
entry:
  %element = alloca i32, align 4
  %pivot = alloca i32, align 4
  %call = tail call %struct.node* @reverse_malloc(%struct.node* %head)
  %call6 = call %struct.node* @visit(%struct.node* %call, i32* %pivot)
  %call7 = tail call %struct.node* @reverse_malloc(%struct.node* %call)
  br label %while.cond.outer

while.cond.outer:                                 ; preds = %if.then, %entry
  %tmp.0.ph = phi %struct.node* [ %call10, %if.then ], [ %call7, %entry ]
  %lastH.0.ph = phi %struct.node* [ %tmp.0, %if.then ], [ %head, %entry ]
  %i.0.ph = phi i32 [ %phitmp, %if.then ], [ 0, %entry ]
  %j.0.ph = phi i32 [ %inc, %if.then ], [ -1, %entry ]
  br label %while.cond

while.cond:                                       ; preds = %while.cond.outer, %while.body
  %tmp.0 = phi %struct.node* [ %call10, %while.body ], [ %tmp.0.ph, %while.cond.outer ]
  %j.0 = phi i32 [ %inc, %while.body ], [ %j.0.ph, %while.cond.outer ]
  %next = getelementptr inbounds %struct.node* %tmp.0, i64 0, i32 1
  %0 = load %struct.node** %next, align 8, !tbaa !8
  %cmp = icmp eq %struct.node* %0, null
  br i1 %cmp, label %while.end, label %while.body

while.body:                                       ; preds = %while.cond
  %call10 = call %struct.node* @visit(%struct.node* %tmp.0, i32* %element)
  %inc = add nsw i32 %j.0, 1
  %1 = load i32* %element, align 4, !tbaa !7
  %2 = load i32* %pivot, align 4, !tbaa !7
  %cmp11 = icmp slt i32 %1, %2
  br i1 %cmp11, label %if.then, label %while.cond

if.then:                                          ; preds = %while.body
  tail call void @permut(%struct.node* %head, i32 %i.0.ph, i32 %inc)
  %phitmp = add i32 %i.0.ph, 1
  br label %while.cond.outer

while.end:                                        ; preds = %while.cond
  %inc13 = add nsw i32 %j.0, 1
  tail call void @permut(%struct.node* %head, i32 %i.0.ph, i32 %inc13)
  %next14 = getelementptr inbounds %struct.node* %lastH.0.ph, i64 0, i32 1
  %3 = load %struct.node** %next14, align 8, !tbaa !8
  store %struct.node* null, %struct.node** %next14, align 8, !tbaa !8
  ret %struct.node* %3
}

; Function Attrs: nounwind uwtable
define %struct.node* @reverse_malloc(%struct.node* %head) #0 {
entry:
  %element = alloca i32, align 4
  %cmp4 = icmp eq %struct.node* %head, null
  br i1 %cmp4, label %while.end, label %while.body

while.body:                                       ; preds = %entry, %while.body
  %temp.06 = phi %struct.node* [ %call1, %while.body ], [ null, %entry ]
  %head.addr.05 = phi %struct.node* [ %call, %while.body ], [ %head, %entry ]
  %call = call %struct.node* @pop(%struct.node* %head.addr.05, i32* %element)
  %0 = load i32* %element, align 4, !tbaa !7
  %call1 = tail call %struct.node* @push(%struct.node* %temp.06, i32 %0)
  %cmp = icmp eq %struct.node* %call, null
  br i1 %cmp, label %while.end, label %while.body

while.end:                                        ; preds = %while.body, %entry
  %temp.0.lcssa = phi %struct.node* [ null, %entry ], [ %call1, %while.body ]
  ret %struct.node* %temp.0.lcssa
}

; Function Attrs: nounwind uwtable
define %struct.node* @concat(%struct.node* %head1, %struct.node* %head2) #0 {
entry:
  %element = alloca i32, align 4
  %cmp = icmp eq %struct.node* %head2, null
  br i1 %cmp, label %return, label %if.end

if.end:                                           ; preds = %entry
  %call = tail call %struct.node* @reverse_malloc(%struct.node* %head1)
  %cmp18 = icmp eq %struct.node* %call, null
  br i1 %cmp18, label %return, label %while.body

while.body:                                       ; preds = %if.end, %while.body
  %head2.addr.010 = phi %struct.node* [ %call3, %while.body ], [ %head2, %if.end ]
  %head1.addr.09 = phi %struct.node* [ %call2, %while.body ], [ %call, %if.end ]
  %call2 = call %struct.node* @pop(%struct.node* %head1.addr.09, i32* %element)
  %0 = load i32* %element, align 4, !tbaa !7
  %call3 = tail call %struct.node* @push(%struct.node* %head2.addr.010, i32 %0)
  %cmp1 = icmp eq %struct.node* %call2, null
  br i1 %cmp1, label %return, label %while.body

return:                                           ; preds = %while.body, %if.end, %entry
  %retval.0 = phi %struct.node* [ %head1, %entry ], [ %head2, %if.end ], [ %call3, %while.body ]
  ret %struct.node* %retval.0
}

; Function Attrs: nounwind uwtable
define %struct.node* @pop(%struct.node* nocapture %head, i32* nocapture %element) #0 {
entry:
  %data = getelementptr inbounds %struct.node* %head, i64 0, i32 0
  %0 = load i32* %data, align 4, !tbaa !1
  store i32 %0, i32* %element, align 4, !tbaa !7
  %next = getelementptr inbounds %struct.node* %head, i64 0, i32 1
  %1 = load %struct.node** %next, align 8, !tbaa !8
  %2 = bitcast %struct.node* %head to i8*
  tail call void @free(i8* %2) #5
  ret %struct.node* %1
}

; Function Attrs: nounwind uwtable
define noalias %struct.node* @push(%struct.node* %head, i32 %data) #0 {
entry:
  %call = tail call noalias i8* @malloc(i64 16) #5
  %cmp = icmp eq i8* %call, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @exit(i32 0) #6
  unreachable

if.end:                                           ; preds = %entry
  %0 = bitcast i8* %call to %struct.node*
  %data1 = bitcast i8* %call to i32*
  store i32 %data, i32* %data1, align 4, !tbaa !1
  %next = getelementptr inbounds i8* %call, i64 8
  %1 = bitcast i8* %next to %struct.node**
  store %struct.node* %head, %struct.node** %1, align 8, !tbaa !8
  ret %struct.node* %0
}

; Function Attrs: nounwind uwtable
define %struct.node* @quicksort(%struct.node* %head) #0 {
entry:
  %call = tail call i32 @empty(%struct.node* %head)
  %tobool = icmp eq i32 %call, 0
  br i1 %tobool, label %land.lhs.true, label %return

land.lhs.true:                                    ; preds = %entry
  %next = getelementptr inbounds %struct.node* %head, i64 0, i32 1
  %0 = load %struct.node** %next, align 8, !tbaa !8
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
define i32 @empty(%struct.node* readnone %head) #1 {
entry:
  %cmp = icmp eq %struct.node* %head, null
  %cond = zext i1 %cmp to i32
  ret i32 %cond
}

; Function Attrs: nounwind uwtable
define %struct.node* @insert(%struct.node* %head, i32 %data) #0 {
entry:
  %element = alloca i32, align 4
  %call = tail call i32 @empty(%struct.node* %head)
  %tobool = icmp eq i32 %call, 0
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %data1 = getelementptr inbounds %struct.node* %head, i64 0, i32 0
  %0 = load i32* %data1, align 4, !tbaa !1
  %cmp = icmp sgt i32 %0, %data
  br i1 %cmp, label %while.body, label %if.then

if.then:                                          ; preds = %lor.lhs.false, %entry
  %call2 = tail call %struct.node* @push(%struct.node* %head, i32 %data)
  br label %return

while.body:                                       ; preds = %land.lhs.true, %if.end15, %lor.lhs.false
  %newhead.053 = phi %struct.node* [ null, %lor.lhs.false ], [ %call16, %if.end15 ], [ %call16, %land.lhs.true ]
  %head.addr.052 = phi %struct.node* [ %head, %lor.lhs.false ], [ %call4, %if.end15 ], [ %call4, %land.lhs.true ]
  %call4 = call %struct.node* @pop(%struct.node* %head.addr.052, i32* %element)
  %cmp5 = icmp eq %struct.node* %call4, null
  %1 = load i32* %element, align 4, !tbaa !7
  br i1 %cmp5, label %if.then6, label %if.end15

if.then6:                                         ; preds = %while.body
  %cmp7 = icmp slt i32 %1, %data
  br i1 %cmp7, label %if.else, label %if.then8

if.then8:                                         ; preds = %if.then6
  %call9 = tail call %struct.node* @push(%struct.node* %newhead.053, i32 %1)
  %call10 = tail call %struct.node* @push(%struct.node* %call9, i32 %data)
  %call11 = tail call %struct.node* @reverse_malloc(%struct.node* %call10)
  br label %return

if.else:                                          ; preds = %if.then6
  %call12 = tail call %struct.node* @push(%struct.node* %newhead.053, i32 %data)
  %2 = load i32* %element, align 4, !tbaa !7
  %call13 = tail call %struct.node* @push(%struct.node* %call12, i32 %2)
  %call14 = tail call %struct.node* @reverse_malloc(%struct.node* %call13)
  br label %return

if.end15:                                         ; preds = %while.body
  %call16 = tail call %struct.node* @push(%struct.node* %newhead.053, i32 %1)
  %3 = load i32* %element, align 4, !tbaa !7
  %cmp17 = icmp slt i32 %3, %data
  br i1 %cmp17, label %while.body, label %land.lhs.true

land.lhs.true:                                    ; preds = %if.end15
  %data18 = getelementptr inbounds %struct.node* %call4, i64 0, i32 0
  %4 = load i32* %data18, align 4, !tbaa !1
  %cmp19 = icmp sgt i32 %4, %data
  br i1 %cmp19, label %while.body, label %while.end

while.end:                                        ; preds = %land.lhs.true
  %call21 = tail call %struct.node* @push(%struct.node* %call16, i32 %data)
  %call23 = tail call %struct.node* @reverse_malloc(%struct.node* %call21)
  %call24 = tail call %struct.node* @concat(%struct.node* %call23, %struct.node* %call4)
  br label %return

return:                                           ; preds = %while.end, %if.else, %if.then8, %if.then
  %retval.0 = phi %struct.node* [ %call2, %if.then ], [ %call11, %if.then8 ], [ %call14, %if.else ], [ %call24, %while.end ]
  ret %struct.node* %retval.0
}

; Function Attrs: nounwind uwtable
define %struct.node* @sort_by_insert(%struct.node* %head) #0 {
entry:
  %element = alloca i32, align 4
  %cmp5 = icmp eq %struct.node* %head, null
  br i1 %cmp5, label %while.end, label %while.body

while.body:                                       ; preds = %entry, %while.body
  %temp.07 = phi %struct.node* [ %call1, %while.body ], [ null, %entry ]
  %head.addr.06 = phi %struct.node* [ %call, %while.body ], [ %head, %entry ]
  %call = call %struct.node* @pop(%struct.node* %head.addr.06, i32* %element)
  %0 = load i32* %element, align 4, !tbaa !7
  %call1 = tail call %struct.node* @insert(%struct.node* %temp.07, i32 %0)
  tail call void @display(%struct.node* %call1)
  %cmp = icmp eq %struct.node* %call, null
  br i1 %cmp, label %while.end, label %while.body

while.end:                                        ; preds = %while.body, %entry
  %temp.0.lcssa = phi %struct.node* [ null, %entry ], [ %call1, %while.body ]
  ret %struct.node* %temp.0.lcssa
}

; Function Attrs: nounwind uwtable
define void @display(%struct.node* readonly %head) #0 {
entry:
  %cmp = icmp eq %struct.node* %head, null
  br i1 %cmp, label %if.else, label %if.then

if.then:                                          ; preds = %entry
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str9, i64 0, i64 0)) #5
  br label %do.body

do.body:                                          ; preds = %do.body, %if.then
  %current.0 = phi %struct.node* [ %head, %if.then ], [ %1, %do.body ]
  %data = getelementptr inbounds %struct.node* %current.0, i64 0, i32 0
  %0 = load i32* %data, align 4, !tbaa !1
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str10, i64 0, i64 0), i32 %0) #5
  %next = getelementptr inbounds %struct.node* %current.0, i64 0, i32 1
  %1 = load %struct.node** %next, align 8, !tbaa !8
  %cmp2 = icmp eq %struct.node* %1, null
  br i1 %cmp2, label %do.end, label %do.body

do.end:                                           ; preds = %do.body
  %putchar = tail call i32 @putchar(i32 10) #5
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
  %call = tail call i64 @time(i64* null) #5
  %conv = trunc i64 %call to i32
  tail call void @srand(i32 %conv) #5
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str, i64 0, i64 0)) #5
  %call2 = call i32 (i8*, ...)* @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8]* @.str1, i64 0, i64 0), i32* %size) #5
  %puts = call i32 @puts(i8* getelementptr inbounds ([44 x i8]* @str13, i64 0, i64 0))
  %0 = load i32* %size, align 4, !tbaa !7
  %cmp51 = icmp sgt i32 %0, 0
  br i1 %cmp51, label %for.body, label %for.end

for.body:                                         ; preds = %entry, %for.body
  %head.053 = phi %struct.node* [ %call6, %for.body ], [ null, %entry ]
  %i.052 = phi i32 [ %inc7, %for.body ], [ 0, %entry ]
  %call5 = call i32 @rand() #5
  %rem = srem i32 %call5, 100
  %call6 = call %struct.node* @push(%struct.node* %head.053, i32 %rem)
  call void @display(%struct.node* %call6)
  %inc7 = add nsw i32 %i.052, 1
  %1 = load i32* %size, align 4, !tbaa !7
  %cmp = icmp slt i32 %inc7, %1
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %for.body, %entry
  %head.0.lcssa = phi %struct.node* [ null, %entry ], [ %call6, %for.body ]
  %puts44 = call i32 @puts(i8* getelementptr inbounds ([19 x i8]* @str14, i64 0, i64 0))
  %call9 = call %struct.node* @reverse_malloc(%struct.node* %head.0.lcssa)
  call void @display(%struct.node* %call9)
  %call10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str4, i64 0, i64 0)) #5
  br label %for.body14

for.body14:                                       ; preds = %for.body14, %for.end
  %tail.050 = phi %struct.node* [ null, %for.end ], [ %call18, %for.body14 ]
  %i.149 = phi i32 [ 0, %for.end ], [ %inc20, %for.body14 ]
  %call16 = call i32 @rand() #5
  %rem17 = srem i32 %call16, 100
  %call18 = call %struct.node* @push(%struct.node* %tail.050, i32 %rem17)
  call void @display(%struct.node* %call18)
  %inc20 = add nsw i32 %i.149, 1
  %exitcond = icmp eq i32 %inc20, 2
  br i1 %exitcond, label %for.end21, label %for.body14

for.end21:                                        ; preds = %for.body14
  %puts45 = call i32 @puts(i8* getelementptr inbounds ([16 x i8]* @str15, i64 0, i64 0))
  %call23 = call %struct.node* @concat(%struct.node* %call9, %struct.node* %call18)
  call void @display(%struct.node* %call23)
  %puts46 = call i32 @puts(i8* getelementptr inbounds ([26 x i8]* @str16, i64 0, i64 0))
  call void @permut(%struct.node* %call23, i32 2, i32 4)
  call void @display(%struct.node* %call23)
  %puts47 = call i32 @puts(i8* getelementptr inbounds ([27 x i8]* @str17, i64 0, i64 0))
  %call26 = call %struct.node* @quicksort(%struct.node* %call23)
  call void @display(%struct.node* %call26)
  %puts48 = call i32 @puts(i8* getelementptr inbounds ([7 x i8]* @str18, i64 0, i64 0))
  ret i32 0
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

; Function Attrs: nounwind readonly uwtable
define i32 @size(%struct.node* readonly %head) #4 {
entry:
  %cmp = icmp eq %struct.node* %head, null
  br i1 %cmp, label %if.end, label %do.body

do.body:                                          ; preds = %entry, %do.body
  %current.0 = phi %struct.node* [ %0, %do.body ], [ %head, %entry ]
  %size.0 = phi i32 [ %inc, %do.body ], [ 0, %entry ]
  %inc = add nsw i32 %size.0, 1
  %next = getelementptr inbounds %struct.node* %current.0, i64 0, i32 1
  %0 = load %struct.node** %next, align 8, !tbaa !8
  %cmp1 = icmp eq %struct.node* %0, null
  br i1 %cmp1, label %if.end, label %do.body

if.end:                                           ; preds = %do.body, %entry
  %size.1 = phi i32 [ 0, %entry ], [ %inc, %do.body ]
  ret i32 %size.1
}

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #5

; Function Attrs: nounwind
declare i32 @putchar(i32) #5

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.0 (http://llvm.org/git/clang.git 4a1c320799579cc42eef78e294997c86e7e4c604) (http://llvm.org/git/llvm.git c0bd970d0e639d026705c11404efb984e4ea008d)"}
!1 = !{!2, !3, i64 0}
!2 = !{!"node", !3, i64 0, !6, i64 8}
!3 = !{!"int", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!"any pointer", !4, i64 0}
!7 = !{!3, !3, i64 0}
!8 = !{!2, !6, i64 8}
