; ModuleID = 'Tiger jit'
source_filename = "Tiger jit"

@0 = private unnamed_addr constant [2 x i8] c"[\00"
@1 = private unnamed_addr constant [47 x i8] c"test/bubble_sort.tig::6.67: Array out of bound\00"
@2 = private unnamed_addr constant [1 x i8] zeroinitializer
@3 = private unnamed_addr constant [2 x i8] c"]\00"
@4 = private unnamed_addr constant [48 x i8] c"test/bubble_sort.tig::16.41: Array out of bound\00"
@5 = private unnamed_addr constant [48 x i8] c"test/bubble_sort.tig::30.46: Array out of bound\00"
@6 = private unnamed_addr constant [48 x i8] c"test/bubble_sort.tig::31.43: Array out of bound\00"
@7 = private unnamed_addr constant [48 x i8] c"test/bubble_sort.tig::35.35: Array out of bound\00"
@8 = private unnamed_addr constant [48 x i8] c"test/bubble_sort.tig::36.35: Array out of bound\00"
@9 = private unnamed_addr constant [15 x i8] c"Before sorting\00"
@10 = private unnamed_addr constant [15 x i8] c"==============\00"
@11 = private unnamed_addr constant [14 x i8] c"After sorting\00"

declare void @tig_print_int(i32)

declare void @tig_print(i8*)

declare void @print_arr_int_ele(i32)

declare i32* @tig_init_array(i32, i32)

declare i32* @tig_init_record(i32)

declare i32 @tig_array_length(i8*)

declare i32 @tig_nillable(i8*)

declare void @tig_check_array_bound(i8*, i32, i8*)

declare i32 @tig_random(i32)

declare void @tig_exit(i32)

declare void @tig_flush()

declare i8* @tig_getchar()

declare i32 @tig_ord(i8*)

declare i8* @tig_chr(i32)

declare i32 @tig_string_cmp(i8*, i8*)

declare i32 @tig_size(i8*)

declare i8* @tig_substring(i8*, i32, i32)

declare i8* @tig_concat(i8*, i8*)

declare i32 @tig_not(i32)

define i32 @main() {
entry:
  %arr = alloca { i32, i32* }*
  %frame_pointer = alloca { i32 }
  %0 = call { i32, i32* }* @create_array({ i32 }* %frame_pointer)
  store { i32, i32* }* %0, { i32, i32* }** %arr
  call void @tig_print(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @9, i32 0, i32 0))
  %arr1 = load { i32, i32* }*, { i32, i32* }** %arr
  call void @print_array({ i32 }* %frame_pointer, { i32, i32* }* %arr1)
  call void @tig_print(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @10, i32 0, i32 0))
  %arr2 = load { i32, i32* }*, { i32, i32* }** %arr
  call void @bubble_sort({ i32 }* %frame_pointer, { i32, i32* }* %arr2)
  call void @tig_print(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @11, i32 0, i32 0))
  %arr3 = load { i32, i32* }*, { i32, i32* }** %arr
  call void @print_array({ i32 }* %frame_pointer, { i32, i32* }* %arr3)
  ret i32 0

break_loop:                                       ; No predecessors!
  ret i32 0
}

define void @print_array({ i32 }*, { i32, i32* }*) {
entry:
  %_limit = alloca i32
  %i = alloca i32
  %arr = alloca { i32, i32* }*
  %frame_pointer = alloca { { i32 }* }
  %arg_address = getelementptr { { i32 }* }, { { i32 }* }* %frame_pointer, i32 0, i32 0
  store { i32 }* %0, { i32 }** %arg_address
  store { i32, i32* }* %1, { i32, i32* }** %arr
  call void @tig_print(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @0, i32 0, i32 0))
  %arr1 = load { i32, i32* }*, { i32, i32* }** %arr
  %2 = bitcast { i32, i32* }* %arr1 to i8*
  %3 = call i32 @tig_array_length(i8* %2)
  %minus_tmp = sub i32 %3, 1
  store i32 0, i32* %i
  %arr2 = load { i32, i32* }*, { i32, i32* }** %arr
  %4 = bitcast { i32, i32* }* %arr2 to i8*
  %5 = call i32 @tig_array_length(i8* %4)
  %minus_tmp3 = sub i32 %5, 1
  store i32 %minus_tmp3, i32* %_limit
  br label %test

test:                                             ; preds = %loop, %entry
  %_limit4 = load i32, i32* %_limit
  %i5 = load i32, i32* %i
  %ge_tmp = icmp sge i32 %_limit4, %i5
  %bool_tmp = zext i1 %ge_tmp to i32
  %cond = icmp eq i32 %bool_tmp, 1
  br i1 %cond, label %loop, label %end

loop:                                             ; preds = %test
  %arr6 = load { i32, i32* }*, { i32, i32* }** %arr
  %i7 = load i32, i32* %i
  %6 = bitcast { i32, i32* }* %arr6 to i8*
  call void @tig_check_array_bound(i8* %6, i32 %i7, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @1, i32 0, i32 0))
  %array_pointer = getelementptr { i32, i32* }, { i32, i32* }* %arr6, i32 0, i32 1
  %arr_addr = load i32*, i32** %array_pointer
  %arr_ele_addr = getelementptr i32, i32* %arr_addr, i32 %i7
  %arr_ele = load i32, i32* %arr_ele_addr
  call void @print_arr_int_ele(i32 %arr_ele)
  %i8 = load i32, i32* %i
  %add_tmp = add i32 %i8, 1
  store i32 %add_tmp, i32* %i
  br label %test

end:                                              ; preds = %test
  call void @tig_print(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @2, i32 0, i32 0))
  call void @tig_print(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @3, i32 0, i32 0))
  ret void
}

define { i32, i32* }* @create_array({ i32 }*) {
entry:
  %_limit = alloca i32
  %i7 = alloca i32
  %arr = alloca { i32, i32* }*
  %i = alloca i32
  %size = alloca i32
  %frame_pointer = alloca { { i32 }* }
  %arg_address = getelementptr { { i32 }* }, { { i32 }* }* %frame_pointer, i32 0, i32 0
  store { i32 }* %0, { i32 }** %arg_address
  store i32 8, i32* %size
  %size1 = load i32, i32* %size
  %mallocsize = mul i32 %size1, ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32)
  %malloccall = tail call i8* @malloc(i32 %mallocsize)
  %array_init = bitcast i8* %malloccall to i32*
  store i32 0, i32* %i
  br label %test

test:                                             ; preds = %loop, %entry
  %i2 = load i32, i32* %i
  %lt_tmp = icmp slt i32 %i2, %size1
  %bool_tmp = zext i1 %lt_tmp to i32
  %cond = icmp eq i32 %bool_tmp, 1
  br i1 %cond, label %loop, label %end

loop:                                             ; preds = %test
  %i3 = load i32, i32* %i
  %Element = getelementptr i32, i32* %array_init, i32 %i3
  store i32 1, i32* %Element
  %add_tmp = add i32 %i3, 1
  store i32 %add_tmp, i32* %i
  br label %test

end:                                              ; preds = %test
  %malloccall4 = tail call i8* @malloc(i32 ptrtoint ({ i32, i32* }* getelementptr ({ i32, i32* }, { i32, i32* }* null, i32 1) to i32))
  %array_wrapper = bitcast i8* %malloccall4 to { i32, i32* }*
  %array_info = getelementptr { i32, i32* }, { i32, i32* }* %array_wrapper, i32 0, i32 0
  store i32 %size1, i32* %array_info
  %array_info5 = getelementptr { i32, i32* }, { i32, i32* }* %array_wrapper, i32 0, i32 1
  store i32* %array_init, i32** %array_info5
  store { i32, i32* }* %array_wrapper, { i32, i32* }** %arr
  %size6 = load i32, i32* %size
  %minus_tmp = sub i32 %size6, 1
  store i32 0, i32* %i7
  %size8 = load i32, i32* %size
  %minus_tmp9 = sub i32 %size8, 1
  store i32 %minus_tmp9, i32* %_limit
  br label %test10

test10:                                           ; preds = %loop11, %end
  %_limit13 = load i32, i32* %_limit
  %i14 = load i32, i32* %i7
  %ge_tmp = icmp sge i32 %_limit13, %i14
  %bool_tmp15 = zext i1 %ge_tmp to i32
  %cond16 = icmp eq i32 %bool_tmp15, 1
  br i1 %cond16, label %loop11, label %end12

loop11:                                           ; preds = %test10
  %i17 = load i32, i32* %i7
  %load_left = load { i32, i32* }*, { i32, i32* }** %arr
  %1 = bitcast { i32, i32* }* %load_left to i8*
  call void @tig_check_array_bound(i8* %1, i32 %i17, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @4, i32 0, i32 0))
  %array_addr_ptr = getelementptr { i32, i32* }, { i32, i32* }* %load_left, i32 0, i32 1
  %arr_addr = load i32*, i32** %array_addr_ptr
  %arr_ele_addr = getelementptr i32, i32* %arr_addr, i32 %i17
  %2 = call i32 @tig_random(i32 50)
  store i32 %2, i32* %arr_ele_addr
  %i18 = load i32, i32* %i7
  %add_tmp19 = add i32 %i18, 1
  store i32 %add_tmp19, i32* %i7
  br label %test10

end12:                                            ; preds = %test10
  %arr20 = load { i32, i32* }*, { i32, i32* }** %arr
  ret { i32, i32* }* %arr20
}

define void @bubble_sort({ i32 }*, { i32, i32* }*) {
entry:
  %if_result_addr = alloca i32
  %next = alloca i32
  %current = alloca i32
  %_limit = alloca i32
  %i = alloca i32
  %is_sorted = alloca i32
  %arr_size = alloca i32
  %should_stop = alloca i32
  %arr = alloca { i32, i32* }*
  %frame_pointer = alloca { { i32 }* }
  %arg_address = getelementptr { { i32 }* }, { { i32 }* }* %frame_pointer, i32 0, i32 0
  store { i32 }* %0, { i32 }** %arg_address
  store { i32, i32* }* %1, { i32, i32* }** %arr
  store i32 0, i32* %should_stop
  %arr1 = load { i32, i32* }*, { i32, i32* }** %arr
  %2 = bitcast { i32, i32* }* %arr1 to i8*
  %3 = call i32 @tig_array_length(i8* %2)
  store i32 %3, i32* %arr_size
  br label %test

test:                                             ; preds = %end8, %entry
  %should_stop2 = load i32, i32* %should_stop
  %4 = call i32 @tig_not(i32 %should_stop2)
  %cond = icmp eq i32 %4, 1
  br i1 %cond, label %loop, label %end

loop:                                             ; preds = %test
  store i32 1, i32* %is_sorted
  %arr_size3 = load i32, i32* %arr_size
  %minus_tmp = sub i32 %arr_size3, 2
  store i32 0, i32* %i
  %arr_size4 = load i32, i32* %arr_size
  %minus_tmp5 = sub i32 %arr_size4, 2
  store i32 %minus_tmp5, i32* %_limit
  br label %test6

end:                                              ; preds = %test
  ret void

test6:                                            ; preds = %merge, %loop
  %_limit9 = load i32, i32* %_limit
  %i10 = load i32, i32* %i
  %ge_tmp = icmp sge i32 %_limit9, %i10
  %bool_tmp = zext i1 %ge_tmp to i32
  %cond11 = icmp eq i32 %bool_tmp, 1
  br i1 %cond11, label %loop7, label %end8

loop7:                                            ; preds = %test6
  %arr12 = load { i32, i32* }*, { i32, i32* }** %arr
  %i13 = load i32, i32* %i
  %5 = bitcast { i32, i32* }* %arr12 to i8*
  call void @tig_check_array_bound(i8* %5, i32 %i13, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @5, i32 0, i32 0))
  %array_pointer = getelementptr { i32, i32* }, { i32, i32* }* %arr12, i32 0, i32 1
  %arr_addr = load i32*, i32** %array_pointer
  %arr_ele_addr = getelementptr i32, i32* %arr_addr, i32 %i13
  %arr_ele = load i32, i32* %arr_ele_addr
  store i32 %arr_ele, i32* %current
  %arr14 = load { i32, i32* }*, { i32, i32* }** %arr
  %i15 = load i32, i32* %i
  %add_tmp = add i32 %i15, 1
  %6 = bitcast { i32, i32* }* %arr14 to i8*
  call void @tig_check_array_bound(i8* %6, i32 %add_tmp, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @6, i32 0, i32 0))
  %array_pointer16 = getelementptr { i32, i32* }, { i32, i32* }* %arr14, i32 0, i32 1
  %arr_addr17 = load i32*, i32** %array_pointer16
  %arr_ele_addr18 = getelementptr i32, i32* %arr_addr17, i32 %add_tmp
  %arr_ele19 = load i32, i32* %arr_ele_addr18
  store i32 %arr_ele19, i32* %next
  br label %test20

end8:                                             ; preds = %test6
  %is_sorted38 = load i32, i32* %is_sorted
  store i32 %is_sorted38, i32* %should_stop
  br label %test

test20:                                           ; preds = %loop7
  %current21 = load i32, i32* %current
  %next22 = load i32, i32* %next
  %gt_tmp = icmp sgt i32 %current21, %next22
  %bool_tmp23 = zext i1 %gt_tmp to i32
  %cond24 = icmp eq i32 %bool_tmp23, 1
  br i1 %cond24, label %then, label %else

then:                                             ; preds = %test20
  %i25 = load i32, i32* %i
  %load_left = load { i32, i32* }*, { i32, i32* }** %arr
  %7 = bitcast { i32, i32* }* %load_left to i8*
  call void @tig_check_array_bound(i8* %7, i32 %i25, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @7, i32 0, i32 0))
  %array_addr_ptr = getelementptr { i32, i32* }, { i32, i32* }* %load_left, i32 0, i32 1
  %arr_addr26 = load i32*, i32** %array_addr_ptr
  %arr_ele_addr27 = getelementptr i32, i32* %arr_addr26, i32 %i25
  %next28 = load i32, i32* %next
  store i32 %next28, i32* %arr_ele_addr27
  %i29 = load i32, i32* %i
  %add_tmp30 = add i32 %i29, 1
  %load_left31 = load { i32, i32* }*, { i32, i32* }** %arr
  %8 = bitcast { i32, i32* }* %load_left31 to i8*
  call void @tig_check_array_bound(i8* %8, i32 %add_tmp30, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @8, i32 0, i32 0))
  %array_addr_ptr32 = getelementptr { i32, i32* }, { i32, i32* }* %load_left31, i32 0, i32 1
  %arr_addr33 = load i32*, i32** %array_addr_ptr32
  %arr_ele_addr34 = getelementptr i32, i32* %arr_addr33, i32 %add_tmp30
  %current35 = load i32, i32* %current
  store i32 %current35, i32* %arr_ele_addr34
  store i32 0, i32* %is_sorted
  store i32 0, i32* %if_result_addr
  br label %merge

else:                                             ; preds = %test20
  store i32 0, i32* %if_result_addr
  br label %merge

merge:                                            ; preds = %else, %then
  %if_result = load i32, i32* %if_result_addr
  %i36 = load i32, i32* %i
  %add_tmp37 = add i32 %i36, 1
  store i32 %add_tmp37, i32* %i
  br label %test6
}

declare noalias i8* @malloc(i32)
