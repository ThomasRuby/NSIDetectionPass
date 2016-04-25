; ModuleID = 'stack2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.node = type { i32, %struct.node* }

@.str = private unnamed_addr constant [36 x i8] c"Enter the number of stack elements:\00", align 1
@.str1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str2 = private unnamed_addr constant [45 x i8] c"--- Push elements into the linked stack ---\0A\00", align 1
@.str3 = private unnamed_addr constant [20 x i8] c"--- Reversing --- \0A\00", align 1
@.str4 = private unnamed_addr constant [8 x i8] c"Stack: \00", align 1
@.str5 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str6 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str7 = private unnamed_addr constant [20 x i8] c"The Stack is empty\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %head = alloca %struct.node*, align 8
  %size = alloca i32, align 4
  %element = alloca i32, align 4
  %i = alloca i32, align 4
  %counter = alloca i32, align 4
  store i32 0, i32* %retval
  store %struct.node* null, %struct.node** %head, align 8
  store i32 0, i32* %counter, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str, i32 0, i32 0))
  %call1 = call i32 (i8*, ...)* @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0), i32* %size)
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([45 x i8]* @.str2, i32 0, i32 0))
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
  %3 = load %struct.node** %head, align 8
  %4 = load i32* %i, align 4
  %call3 = call %struct.node* @push(%struct.node* %3, i32 %4)
  store %struct.node* %call3, %struct.node** %head, align 8
  %5 = load %struct.node** %head, align 8
  call void @display(%struct.node* %5)
  %6 = load i32* %counter, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %counter, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %7 = load i32* %i, align 4
  %inc4 = add nsw i32 %7, 1
  store i32 %inc4, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str3, i32 0, i32 0))
  %8 = load %struct.node** %head, align 8
  %call6 = call %struct.node* @reverse_malloc_rec(%struct.node* %8)
  store %struct.node* %call6, %struct.node** %head, align 8
  %9 = load %struct.node** %head, align 8
  call void @display(%struct.node* %9)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

declare i32 @__isoc99_scanf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define void @init(%struct.node* %head) #0 {
entry:
  %head.addr = alloca %struct.node*, align 8
  store %struct.node* %head, %struct.node** %head.addr, align 8
  store %struct.node* null, %struct.node** %head.addr, align 8
  ret void
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
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str4, i32 0, i32 0))
  br label %do.body

do.body:                                          ; preds = %do.cond, %if.then
  %2 = load %struct.node** %current, align 8
  %data = getelementptr inbounds %struct.node* %2, i32 0, i32 0
  %3 = load i32* %data, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str5, i32 0, i32 0), i32 %3)
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
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str6, i32 0, i32 0))
  br label %if.end

if.else:                                          ; preds = %entry
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str7, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.else, %do.end
  ret void
}

; Function Attrs: nounwind uwtable
define %struct.node* @reverse_malloc_rec(%struct.node* %head) #0 {
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

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

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

; Function Attrs: nounwind
declare void @free(i8*) #2

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

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.0 (http://llvm.org/git/clang.git 4a1c320799579cc42eef78e294997c86e7e4c604) (http://llvm.org/git/llvm.git c0bd970d0e639d026705c11404efb984e4ea008d)"}
