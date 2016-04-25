; ModuleID = 'stack2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.node = type { i32, %struct.node* }

@.str = private unnamed_addr constant [12 x i8] c"pivot = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"element trait\C3\A9 : %d\0A\00", align 1
@.str2 = private unnamed_addr constant [36 x i8] c"Enter the number of stack elements:\00", align 1
@.str3 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str4 = private unnamed_addr constant [45 x i8] c"--- Push elements into the linked stack ---\0A\00", align 1
@.str5 = private unnamed_addr constant [20 x i8] c"--- Reversing --- \0A\00", align 1
@.str6 = private unnamed_addr constant [37 x i8] c"--- Ajout de 2 elements en queue ---\00", align 1
@.str7 = private unnamed_addr constant [17 x i8] c"--- concat --- \0A\00", align 1
@.str8 = private unnamed_addr constant [27 x i8] c"--- permut(head,2,4) --- \0A\00", align 1
@.str9 = private unnamed_addr constant [28 x i8] c"--- Sort by quicksort --- \0A\00", align 1
@.str10 = private unnamed_addr constant [8 x i8] c"FINISH\0A\00", align 1
@.str11 = private unnamed_addr constant [8 x i8] c"Stack: \00", align 1
@.str12 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str13 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str14 = private unnamed_addr constant [20 x i8] c"The Stack is empty\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @permut(%struct.node* %head, i32 %i, i32 %j) #0 {
entry:
  %head.addr = alloca %struct.node*, align 8
  %i.addr = alloca i32, align 4
  %j.addr = alloca i32, align 4
  %count = alloca i32, align 4
  %element = alloca i32, align 4
  %tmp = alloca %struct.node*, align 8
  %first = alloca %struct.node*, align 8
  %second = alloca %struct.node*, align 8
  %last = alloca %struct.node*, align 8
  store %struct.node* %head, %struct.node** %head.addr, align 8
  store i32 %i, i32* %i.addr, align 4
  store i32 %j, i32* %j.addr, align 4
  store i32 0, i32* %count, align 4
  %0 = load %struct.node** %head.addr, align 8
  store %struct.node* %0, %struct.node** %tmp, align 8
  store %struct.node* null, %struct.node** %first, align 8
  store %struct.node* null, %struct.node** %second, align 8
  store %struct.node* null, %struct.node** %last, align 8
  br label %while.cond

while.cond:                                       ; preds = %if.end8, %entry
  %1 = load %struct.node** %tmp, align 8
  %cmp = icmp ne %struct.node* %1, null
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %2 = load %struct.node** %tmp, align 8
  store %struct.node* %2, %struct.node** %last, align 8
  %3 = load %struct.node** %tmp, align 8
  %call = call %struct.node* @visit(%struct.node* %3, i32* %element)
  store %struct.node* %call, %struct.node** %tmp, align 8
  %4 = load i32* %count, align 4
  %5 = load i32* %i.addr, align 4
  %cmp4 = icmp eq i32 %4, %5
  br i1 %cmp4, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %while.body
  %6 = load i32* %count, align 4
  %7 = load i32* %j.addr, align 4
  %cmp5 = icmp eq i32 %6, %7
  br i1 %cmp5, label %if.then, label %if.end8

if.then:                                          ; preds = %lor.lhs.false, %while.body
  %8 = load %struct.node** %first, align 8
  %cmp6 = icmp eq %struct.node* %8, null
  br i1 %cmp6, label %if.then7, label %if.else

if.then7:                                         ; preds = %if.then
  %9 = load %struct.node** %last, align 8
  store %struct.node* %9, %struct.node** %first, align 8
  br label %if.end

if.else:                                          ; preds = %if.then
  %10 = load %struct.node** %last, align 8
  store %struct.node* %10, %struct.node** %second, align 8
  br label %while.end

if.end:                                           ; preds = %if.then7
  br label %if.end8

if.end8:                                          ; preds = %if.end, %lor.lhs.false
  %11 = load i32* %count, align 4
  %inc = add nsw i32 %11, 1
  store i32 %inc, i32* %count, align 4
  br label %while.cond

while.end:                                        ; preds = %if.else, %while.cond
  %12 = load %struct.node** %second, align 8
  %data = getelementptr inbounds %struct.node* %12, i32 0, i32 0
  %13 = load i32* %data, align 4
  store i32 %13, i32* %element, align 4
  %14 = load %struct.node** %first, align 8
  %data9 = getelementptr inbounds %struct.node* %14, i32 0, i32 0
  %15 = load i32* %data9, align 4
  %16 = load %struct.node** %second, align 8
  %data10 = getelementptr inbounds %struct.node* %16, i32 0, i32 0
  store i32 %15, i32* %data10, align 4
  %17 = load i32* %element, align 4
  %18 = load %struct.node** %first, align 8
  %data11 = getelementptr inbounds %struct.node* %18, i32 0, i32 0
  store i32 %17, i32* %data11, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define %struct.node* @visit(%struct.node* %head, i32* %element) #0 {
entry:
  %head.addr = alloca %struct.node*, align 8
  %element.addr = alloca i32*, align 8
  store %struct.node* %head, %struct.node** %head.addr, align 8
  store i32* %element, i32** %element.addr, align 8
  %0 = load %struct.node** %head.addr, align 8
  %data = getelementptr inbounds %struct.node* %0, i32 0, i32 0
  %1 = load i32* %data, align 4
  %2 = load i32** %element.addr, align 8
  store i32 %1, i32* %2, align 4
  %3 = load %struct.node** %head.addr, align 8
  %next = getelementptr inbounds %struct.node* %3, i32 0, i32 1
  %4 = load %struct.node** %next, align 8
  store %struct.node* %4, %struct.node** %head.addr, align 8
  %5 = load %struct.node** %head.addr, align 8
  ret %struct.node* %5
}

; Function Attrs: nounwind uwtable
define %struct.node* @partition(%struct.node* %head) #0 {
entry:
  %head.addr = alloca %struct.node*, align 8
  %tmp = alloca %struct.node*, align 8
  %last = alloca %struct.node*, align 8
  %A2 = alloca %struct.node*, align 8
  %element = alloca i32, align 4
  %pivot = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store %struct.node* %head, %struct.node** %head.addr, align 8
  %0 = load %struct.node** %head.addr, align 8
  store %struct.node* %0, %struct.node** %tmp, align 8
  %1 = load %struct.node** %tmp, align 8
  store %struct.node* %1, %struct.node** %last, align 8
  %2 = load %struct.node** %head.addr, align 8
  store %struct.node* %2, %struct.node** %A2, align 8
  %3 = load %struct.node** %head.addr, align 8
  %call = call %struct.node* @visit(%struct.node* %3, i32* %pivot)
  %4 = load i32* %pivot, align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i32 %4)
  store i32 0, i32* %i, align 4
  store i32 0, i32* %j, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %5 = load %struct.node** %tmp, align 8
  %cmp = icmp ne %struct.node* %5, null
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %6 = load %struct.node** %tmp, align 8
  store %struct.node* %6, %struct.node** %last, align 8
  %7 = load %struct.node** %tmp, align 8
  %call8 = call %struct.node* @visit(%struct.node* %7, i32* %element)
  store %struct.node* %call8, %struct.node** %tmp, align 8
  %8 = load i32* %element, align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %8)
  %9 = load i32* %j, align 4
  %inc = add nsw i32 %9, 1
  store i32 %inc, i32* %j, align 4
  %10 = load i32* %element, align 4
  %11 = load i32* %pivot, align 4
  %cmp10 = icmp sle i32 %10, %11
  br i1 %cmp10, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  %12 = load i32* %element, align 4
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %12)
  %13 = load i32* %i, align 4
  %inc12 = add nsw i32 %13, 1
  store i32 %inc12, i32* %i, align 4
  %14 = load %struct.node** %tmp, align 8
  store %struct.node* %14, %struct.node** %A2, align 8
  %15 = load %struct.node** %head.addr, align 8
  %16 = load i32* %i, align 4
  %17 = load i32* %j, align 4
  call void @permut(%struct.node* %15, i32 %16, i32 %17)
  br label %if.end

if.end:                                           ; preds = %if.then, %while.body
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %18 = load %struct.node** %head.addr, align 8
  %19 = load i32* %i, align 4
  %add = add nsw i32 %19, 1
  %20 = load i32* %j, align 4
  call void @permut(%struct.node* %18, i32 %add, i32 %20)
  %21 = load %struct.node** %last, align 8
  %next = getelementptr inbounds %struct.node* %21, i32 0, i32 1
  store %struct.node* null, %struct.node** %next, align 8
  %22 = load %struct.node** %A2, align 8
  ret %struct.node* %22
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define %struct.node* @concat(%struct.node* %head1, %struct.node* %head2) #0 {
entry:
  %retval = alloca %struct.node*, align 8
  %head1.addr = alloca %struct.node*, align 8
  %head2.addr = alloca %struct.node*, align 8
  %element = alloca i32, align 4
  store %struct.node* %head1, %struct.node** %head1.addr, align 8
  store %struct.node* %head2, %struct.node** %head2.addr, align 8
  %0 = load %struct.node** %head2.addr, align 8
  %cmp = icmp eq %struct.node* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load %struct.node** %head1.addr, align 8
  store %struct.node* %1, %struct.node** %retval
  br label %return

if.end:                                           ; preds = %entry
  %2 = load %struct.node** %head1.addr, align 8
  %call = call %struct.node* @reverse_malloc(%struct.node* %2)
  store %struct.node* %call, %struct.node** %head1.addr, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.end
  %3 = load %struct.node** %head1.addr, align 8
  %cmp1 = icmp ne %struct.node* %3, null
  br i1 %cmp1, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %4 = load %struct.node** %head1.addr, align 8
  %call2 = call %struct.node* @pop(%struct.node* %4, i32* %element)
  store %struct.node* %call2, %struct.node** %head1.addr, align 8
  %5 = load %struct.node** %head2.addr, align 8
  %6 = load i32* %element, align 4
  %call3 = call %struct.node* @push(%struct.node* %5, i32 %6)
  store %struct.node* %call3, %struct.node** %head2.addr, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %7 = load %struct.node** %head2.addr, align 8
  store %struct.node* %7, %struct.node** %retval
  br label %return

return:                                           ; preds = %while.end, %if.then
  %8 = load %struct.node** %retval
  ret %struct.node* %8
}

; Function Attrs: nounwind uwtable
define %struct.node* @reverse_malloc(%struct.node* %head) #0 {
entry:
  %head.addr = alloca %struct.node*, align 8
  %element = alloca i32, align 4
  %temp = alloca %struct.node*, align 8
  store %struct.node* %head, %struct.node** %head.addr, align 8
  store %struct.node* null, %struct.node** %temp, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = load %struct.node** %head.addr, align 8
  %cmp = icmp ne %struct.node* %0, null
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load %struct.node** %head.addr, align 8
  %call = call %struct.node* @pop(%struct.node* %1, i32* %element)
  store %struct.node* %call, %struct.node** %head.addr, align 8
  %2 = load %struct.node** %temp, align 8
  %3 = load i32* %element, align 4
  %call1 = call %struct.node* @push(%struct.node* %2, i32 %3)
  store %struct.node* %call1, %struct.node** %temp, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %4 = load %struct.node** %temp, align 8
  ret %struct.node* %4
}

; Function Attrs: nounwind uwtable
define %struct.node* @pop(%struct.node* %head, i32* %element) #0 {
entry:
  %head.addr = alloca %struct.node*, align 8
  %element.addr = alloca i32*, align 8
  %tmp = alloca %struct.node*, align 8
  store %struct.node* %head, %struct.node** %head.addr, align 8
  store i32* %element, i32** %element.addr, align 8
  %0 = load %struct.node** %head.addr, align 8
  store %struct.node* %0, %struct.node** %tmp, align 8
  %1 = load %struct.node** %head.addr, align 8
  %data = getelementptr inbounds %struct.node* %1, i32 0, i32 0
  %2 = load i32* %data, align 4
  %3 = load i32** %element.addr, align 8
  store i32 %2, i32* %3, align 4
  %4 = load %struct.node** %head.addr, align 8
  %next = getelementptr inbounds %struct.node* %4, i32 0, i32 1
  %5 = load %struct.node** %next, align 8
  store %struct.node* %5, %struct.node** %head.addr, align 8
  %6 = load %struct.node** %tmp, align 8
  %7 = bitcast %struct.node* %6 to i8*
  call void @free(i8* %7) #4
  %8 = load %struct.node** %head.addr, align 8
  ret %struct.node* %8
}

; Function Attrs: nounwind uwtable
define %struct.node* @push(%struct.node* %head, i32 %data) #0 {
entry:
  %head.addr = alloca %struct.node*, align 8
  %data.addr = alloca i32, align 4
  %tmp = alloca %struct.node*, align 8
  store %struct.node* %head, %struct.node** %head.addr, align 8
  store i32 %data, i32* %data.addr, align 4
  %call = call noalias i8* @malloc(i64 16) #4
  %0 = bitcast i8* %call to %struct.node*
  store %struct.node* %0, %struct.node** %tmp, align 8
  %1 = load %struct.node** %tmp, align 8
  %cmp = icmp eq %struct.node* %1, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @exit(i32 0) #5
  unreachable

if.end:                                           ; preds = %entry
  %2 = load i32* %data.addr, align 4
  %3 = load %struct.node** %tmp, align 8
  %data1 = getelementptr inbounds %struct.node* %3, i32 0, i32 0
  store i32 %2, i32* %data1, align 4
  %4 = load %struct.node** %head.addr, align 8
  %5 = load %struct.node** %tmp, align 8
  %next = getelementptr inbounds %struct.node* %5, i32 0, i32 1
  store %struct.node* %4, %struct.node** %next, align 8
  %6 = load %struct.node** %tmp, align 8
  store %struct.node* %6, %struct.node** %head.addr, align 8
  %7 = load %struct.node** %head.addr, align 8
  ret %struct.node* %7
}

; Function Attrs: nounwind uwtable
define %struct.node* @quicksort(%struct.node* %head) #0 {
entry:
  %retval = alloca %struct.node*, align 8
  %head.addr = alloca %struct.node*, align 8
  %A2 = alloca %struct.node*, align 8
  store %struct.node* %head, %struct.node** %head.addr, align 8
  %0 = load %struct.node** %head.addr, align 8
  %call = call i32 @empty(%struct.node* %0)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.end, label %land.lhs.true

land.lhs.true:                                    ; preds = %entry
  %1 = load %struct.node** %head.addr, align 8
  %next = getelementptr inbounds %struct.node* %1, i32 0, i32 1
  %2 = load %struct.node** %next, align 8
  %cmp = icmp ne %struct.node* %2, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %3 = load %struct.node** %head.addr, align 8
  %call1 = call %struct.node* @partition(%struct.node* %3)
  store %struct.node* %call1, %struct.node** %A2, align 8
  %4 = load %struct.node** %head.addr, align 8
  %call2 = call %struct.node* @quicksort(%struct.node* %4)
  store %struct.node* %call2, %struct.node** %head.addr, align 8
  %5 = load %struct.node** %A2, align 8
  %call3 = call %struct.node* @quicksort(%struct.node* %5)
  store %struct.node* %call3, %struct.node** %A2, align 8
  %6 = load %struct.node** %head.addr, align 8
  %7 = load %struct.node** %A2, align 8
  %call4 = call %struct.node* @concat(%struct.node* %6, %struct.node* %7)
  store %struct.node* %call4, %struct.node** %retval
  br label %return

if.end:                                           ; preds = %land.lhs.true, %entry
  %8 = load %struct.node** %head.addr, align 8
  store %struct.node* %8, %struct.node** %retval
  br label %return

return:                                           ; preds = %if.end, %if.then
  %9 = load %struct.node** %retval
  ret %struct.node* %9
}

; Function Attrs: nounwind uwtable
define i32 @empty(%struct.node* %head) #0 {
entry:
  %head.addr = alloca %struct.node*, align 8
  store %struct.node* %head, %struct.node** %head.addr, align 8
  %0 = load %struct.node** %head.addr, align 8
  %cmp = icmp eq %struct.node* %0, null
  %cond = select i1 %cmp, i32 1, i32 0
  ret i32 %cond
}

; Function Attrs: nounwind uwtable
define %struct.node* @insert(%struct.node* %head, i32 %data) #0 {
entry:
  %retval = alloca %struct.node*, align 8
  %head.addr = alloca %struct.node*, align 8
  %data.addr = alloca i32, align 4
  %element = alloca i32, align 4
  %newhead = alloca %struct.node*, align 8
  store %struct.node* %head, %struct.node** %head.addr, align 8
  store i32 %data, i32* %data.addr, align 4
  %0 = load %struct.node** %head.addr, align 8
  %call = call i32 @empty(%struct.node* %0)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct.node** %head.addr, align 8
  %data1 = getelementptr inbounds %struct.node* %1, i32 0, i32 0
  %2 = load i32* %data1, align 4
  %3 = load i32* %data.addr, align 4
  %cmp = icmp sle i32 %2, %3
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  %4 = load %struct.node** %head.addr, align 8
  %5 = load i32* %data.addr, align 4
  %call2 = call %struct.node* @push(%struct.node* %4, i32 %5)
  store %struct.node* %call2, %struct.node** %retval
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  store %struct.node* null, %struct.node** %newhead, align 8
  br label %while.cond

while.cond:                                       ; preds = %if.end22, %if.end
  %6 = load %struct.node** %head.addr, align 8
  %cmp3 = icmp ne %struct.node* %6, null
  br i1 %cmp3, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %7 = load %struct.node** %head.addr, align 8
  %call4 = call %struct.node* @pop(%struct.node* %7, i32* %element)
  store %struct.node* %call4, %struct.node** %head.addr, align 8
  %8 = load %struct.node** %head.addr, align 8
  %cmp5 = icmp eq %struct.node* %8, null
  br i1 %cmp5, label %if.then6, label %if.end15

if.then6:                                         ; preds = %while.body
  %9 = load i32* %element, align 4
  %10 = load i32* %data.addr, align 4
  %cmp7 = icmp sge i32 %9, %10
  br i1 %cmp7, label %if.then8, label %if.else

if.then8:                                         ; preds = %if.then6
  %11 = load %struct.node** %newhead, align 8
  %12 = load i32* %element, align 4
  %call9 = call %struct.node* @push(%struct.node* %11, i32 %12)
  store %struct.node* %call9, %struct.node** %newhead, align 8
  %13 = load %struct.node** %newhead, align 8
  %14 = load i32* %data.addr, align 4
  %call10 = call %struct.node* @push(%struct.node* %13, i32 %14)
  store %struct.node* %call10, %struct.node** %newhead, align 8
  %15 = load %struct.node** %newhead, align 8
  %call11 = call %struct.node* @reverse_malloc(%struct.node* %15)
  store %struct.node* %call11, %struct.node** %retval
  br label %return

if.else:                                          ; preds = %if.then6
  %16 = load %struct.node** %newhead, align 8
  %17 = load i32* %data.addr, align 4
  %call12 = call %struct.node* @push(%struct.node* %16, i32 %17)
  store %struct.node* %call12, %struct.node** %newhead, align 8
  %18 = load %struct.node** %newhead, align 8
  %19 = load i32* %element, align 4
  %call13 = call %struct.node* @push(%struct.node* %18, i32 %19)
  store %struct.node* %call13, %struct.node** %newhead, align 8
  %20 = load %struct.node** %newhead, align 8
  %call14 = call %struct.node* @reverse_malloc(%struct.node* %20)
  store %struct.node* %call14, %struct.node** %retval
  br label %return

if.end15:                                         ; preds = %while.body
  %21 = load %struct.node** %newhead, align 8
  %22 = load i32* %element, align 4
  %call16 = call %struct.node* @push(%struct.node* %21, i32 %22)
  store %struct.node* %call16, %struct.node** %newhead, align 8
  %23 = load i32* %element, align 4
  %24 = load i32* %data.addr, align 4
  %cmp17 = icmp sge i32 %23, %24
  br i1 %cmp17, label %land.lhs.true, label %if.end22

land.lhs.true:                                    ; preds = %if.end15
  %25 = load %struct.node** %head.addr, align 8
  %data18 = getelementptr inbounds %struct.node* %25, i32 0, i32 0
  %26 = load i32* %data18, align 4
  %27 = load i32* %data.addr, align 4
  %cmp19 = icmp sle i32 %26, %27
  br i1 %cmp19, label %if.then20, label %if.end22

if.then20:                                        ; preds = %land.lhs.true
  %28 = load %struct.node** %newhead, align 8
  %29 = load i32* %data.addr, align 4
  %call21 = call %struct.node* @push(%struct.node* %28, i32 %29)
  store %struct.node* %call21, %struct.node** %newhead, align 8
  br label %while.end

if.end22:                                         ; preds = %land.lhs.true, %if.end15
  br label %while.cond

while.end:                                        ; preds = %if.then20, %while.cond
  %30 = load %struct.node** %newhead, align 8
  %call23 = call %struct.node* @reverse_malloc(%struct.node* %30)
  %31 = load %struct.node** %head.addr, align 8
  %call24 = call %struct.node* @concat(%struct.node* %call23, %struct.node* %31)
  store %struct.node* %call24, %struct.node** %head.addr, align 8
  %32 = load %struct.node** %head.addr, align 8
  store %struct.node* %32, %struct.node** %retval
  br label %return

return:                                           ; preds = %while.end, %if.else, %if.then8, %if.then
  %33 = load %struct.node** %retval
  ret %struct.node* %33
}

; Function Attrs: nounwind uwtable
define %struct.node* @sort_by_insert(%struct.node* %head) #0 {
entry:
  %head.addr = alloca %struct.node*, align 8
  %element = alloca i32, align 4
  %temp = alloca %struct.node*, align 8
  store %struct.node* %head, %struct.node** %head.addr, align 8
  store %struct.node* null, %struct.node** %temp, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = load %struct.node** %head.addr, align 8
  %cmp = icmp ne %struct.node* %0, null
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load %struct.node** %head.addr, align 8
  %call = call %struct.node* @pop(%struct.node* %1, i32* %element)
  store %struct.node* %call, %struct.node** %head.addr, align 8
  %2 = load %struct.node** %temp, align 8
  %3 = load i32* %element, align 4
  %call1 = call %struct.node* @insert(%struct.node* %2, i32 %3)
  store %struct.node* %call1, %struct.node** %temp, align 8
  %4 = load %struct.node** %temp, align 8
  call void @display(%struct.node* %4)
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %5 = load %struct.node** %temp, align 8
  ret %struct.node* %5
}

; Function Attrs: nounwind uwtable
define void @display(%struct.node* %head) #0 {
entry:
  %head.addr = alloca %struct.node*, align 8
  %current = alloca %struct.node*, align 8
  store %struct.node* %head, %struct.node** %head.addr, align 8
  %0 = load %struct.node** %head.addr, align 8
  store %struct.node* %0, %struct.node** %current, align 8
  %1 = load %struct.node** %current, align 8
  %cmp = icmp ne %struct.node* %1, null
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str11, i32 0, i32 0))
  br label %do.body

do.body:                                          ; preds = %do.cond, %if.then
  %2 = load %struct.node** %current, align 8
  %data = getelementptr inbounds %struct.node* %2, i32 0, i32 0
  %3 = load i32* %data, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str12, i32 0, i32 0), i32 %3)
  %4 = load %struct.node** %current, align 8
  %next = getelementptr inbounds %struct.node* %4, i32 0, i32 1
  %5 = load %struct.node** %next, align 8
  store %struct.node* %5, %struct.node** %current, align 8
  br label %do.cond

do.cond:                                          ; preds = %do.body
  %6 = load %struct.node** %current, align 8
  %cmp2 = icmp ne %struct.node* %6, null
  br i1 %cmp2, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str13, i32 0, i32 0))
  br label %if.end

if.else:                                          ; preds = %entry
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str14, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.else, %do.end
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %head = alloca %struct.node*, align 8
  %tail = alloca %struct.node*, align 8
  %size = alloca i32, align 4
  %i = alloca i32, align 4
  %counter = alloca i32, align 4
  %r = alloca i32, align 4
  %r15 = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i64 @time(i64* null) #4
  %conv = trunc i64 %call to i32
  call void @srand(i32 %conv) #4
  store %struct.node* null, %struct.node** %head, align 8
  store %struct.node* null, %struct.node** %tail, align 8
  store i32 0, i32* %counter, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str2, i32 0, i32 0))
  %call2 = call i32 (i8*, ...)* @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8]* @.str3, i32 0, i32 0), i32* %size)
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([45 x i8]* @.str4, i32 0, i32 0))
  %0 = load %struct.node** %head, align 8
  call void @init(%struct.node* %0)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32* %i, align 4
  %2 = load i32* %size, align 4
  %cmp = icmp slt i32 %1, %2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %call5 = call i32 @rand() #4
  %rem = srem i32 %call5, 100
  store i32 %rem, i32* %r, align 4
  %3 = load %struct.node** %head, align 8
  %4 = load i32* %r, align 4
  %call6 = call %struct.node* @push(%struct.node* %3, i32 %4)
  store %struct.node* %call6, %struct.node** %head, align 8
  %5 = load %struct.node** %head, align 8
  call void @display(%struct.node* %5)
  %6 = load i32* %counter, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %counter, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %7 = load i32* %i, align 4
  %inc7 = add nsw i32 %7, 1
  store i32 %inc7, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %call8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str5, i32 0, i32 0))
  %8 = load %struct.node** %head, align 8
  %call9 = call %struct.node* @reverse_malloc(%struct.node* %8)
  store %struct.node* %call9, %struct.node** %head, align 8
  %9 = load %struct.node** %head, align 8
  call void @display(%struct.node* %9)
  %10 = load %struct.node** %tail, align 8
  call void @init(%struct.node* %10)
  %call10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str6, i32 0, i32 0))
  store i32 0, i32* %i, align 4
  br label %for.cond11

for.cond11:                                       ; preds = %for.inc19, %for.end
  %11 = load i32* %i, align 4
  %cmp12 = icmp slt i32 %11, 2
  br i1 %cmp12, label %for.body14, label %for.end21

for.body14:                                       ; preds = %for.cond11
  %call16 = call i32 @rand() #4
  %rem17 = srem i32 %call16, 100
  store i32 %rem17, i32* %r15, align 4
  %12 = load %struct.node** %tail, align 8
  %13 = load i32* %r15, align 4
  %call18 = call %struct.node* @push(%struct.node* %12, i32 %13)
  store %struct.node* %call18, %struct.node** %tail, align 8
  %14 = load %struct.node** %tail, align 8
  call void @display(%struct.node* %14)
  br label %for.inc19

for.inc19:                                        ; preds = %for.body14
  %15 = load i32* %i, align 4
  %inc20 = add nsw i32 %15, 1
  store i32 %inc20, i32* %i, align 4
  br label %for.cond11

for.end21:                                        ; preds = %for.cond11
  %call22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str7, i32 0, i32 0))
  %16 = load %struct.node** %head, align 8
  %17 = load %struct.node** %tail, align 8
  %call23 = call %struct.node* @concat(%struct.node* %16, %struct.node* %17)
  store %struct.node* %call23, %struct.node** %head, align 8
  %18 = load %struct.node** %head, align 8
  call void @display(%struct.node* %18)
  %call24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str8, i32 0, i32 0))
  %19 = load %struct.node** %head, align 8
  call void @permut(%struct.node* %19, i32 2, i32 4)
  %20 = load %struct.node** %head, align 8
  call void @display(%struct.node* %20)
  %call25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str9, i32 0, i32 0))
  %21 = load %struct.node** %head, align 8
  %call26 = call %struct.node* @quicksort(%struct.node* %21)
  store %struct.node* %call26, %struct.node** %head, align 8
  %22 = load %struct.node** %head, align 8
  call void @display(%struct.node* %22)
  %call27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str10, i32 0, i32 0))
  ret i32 0
}

; Function Attrs: nounwind
declare void @srand(i32) #2

; Function Attrs: nounwind
declare i64 @time(i64*) #2

declare i32 @__isoc99_scanf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define void @init(%struct.node* %head) #0 {
entry:
  %head.addr = alloca %struct.node*, align 8
  store %struct.node* %head, %struct.node** %head.addr, align 8
  store %struct.node* null, %struct.node** %head.addr, align 8
  ret void
}

; Function Attrs: nounwind
declare i32 @rand() #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

; Function Attrs: nounwind
declare void @free(i8*) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.0 (http://llvm.org/git/clang.git 4a1c320799579cc42eef78e294997c86e7e4c604) (http://llvm.org/git/llvm.git c0bd970d0e639d026705c11404efb984e4ea008d)"}
