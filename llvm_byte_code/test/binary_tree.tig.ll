; ModuleID = 'Tiger jit'
source_filename = "Tiger jit"

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

declare void @assert_equal_int(i32, i32)

declare void @assert_equal_string(i8*, i8*)

define i32 @main() {
entry:
  %f = alloca { i32, i8*, i8* }*
  %e = alloca { i32, i8*, i8* }*
  %d = alloca { i32, i8*, i8* }*
  %c = alloca { i32, i8*, i8* }*
  %b = alloca { i32, i8*, i8* }*
  %a = alloca { i32, i8*, i8* }*
  %root = alloca { i32, i8*, i8* }*
  %frame_pointer = alloca { i32 }
  %malloccall = tail call i8* @malloc(i32 ptrtoint ({ i32, i8*, i8* }* getelementptr ({ i32, i8*, i8* }, { i32, i8*, i8* }* null, i32 1) to i32))
  %record_init = bitcast i8* %malloccall to { i32, i8*, i8* }*
  %Element = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %record_init, i32 0, i32 0
  store i32 5, i32* %Element
  %Element1 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %record_init, i32 0, i32 1
  store i8* null, i8** %Element1
  %Element2 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %record_init, i32 0, i32 2
  store i8* null, i8** %Element2
  store { i32, i8*, i8* }* %record_init, { i32, i8*, i8* }** %root
  %malloccall3 = tail call i8* @malloc(i32 ptrtoint ({ i32, i8*, i8* }* getelementptr ({ i32, i8*, i8* }, { i32, i8*, i8* }* null, i32 1) to i32))
  %record_init4 = bitcast i8* %malloccall3 to { i32, i8*, i8* }*
  %Element5 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %record_init4, i32 0, i32 0
  store i32 1, i32* %Element5
  %Element6 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %record_init4, i32 0, i32 1
  store i8* null, i8** %Element6
  %Element7 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %record_init4, i32 0, i32 2
  store i8* null, i8** %Element7
  store { i32, i8*, i8* }* %record_init4, { i32, i8*, i8* }** %a
  %malloccall8 = tail call i8* @malloc(i32 ptrtoint ({ i32, i8*, i8* }* getelementptr ({ i32, i8*, i8* }, { i32, i8*, i8* }* null, i32 1) to i32))
  %record_init9 = bitcast i8* %malloccall8 to { i32, i8*, i8* }*
  %Element10 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %record_init9, i32 0, i32 0
  store i32 2, i32* %Element10
  %Element11 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %record_init9, i32 0, i32 1
  store i8* null, i8** %Element11
  %Element12 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %record_init9, i32 0, i32 2
  store i8* null, i8** %Element12
  store { i32, i8*, i8* }* %record_init9, { i32, i8*, i8* }** %b
  %malloccall13 = tail call i8* @malloc(i32 ptrtoint ({ i32, i8*, i8* }* getelementptr ({ i32, i8*, i8* }, { i32, i8*, i8* }* null, i32 1) to i32))
  %record_init14 = bitcast i8* %malloccall13 to { i32, i8*, i8* }*
  %Element15 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %record_init14, i32 0, i32 0
  store i32 3, i32* %Element15
  %Element16 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %record_init14, i32 0, i32 1
  store i8* null, i8** %Element16
  %Element17 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %record_init14, i32 0, i32 2
  store i8* null, i8** %Element17
  store { i32, i8*, i8* }* %record_init14, { i32, i8*, i8* }** %c
  %malloccall18 = tail call i8* @malloc(i32 ptrtoint ({ i32, i8*, i8* }* getelementptr ({ i32, i8*, i8* }, { i32, i8*, i8* }* null, i32 1) to i32))
  %record_init19 = bitcast i8* %malloccall18 to { i32, i8*, i8* }*
  %Element20 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %record_init19, i32 0, i32 0
  store i32 6, i32* %Element20
  %Element21 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %record_init19, i32 0, i32 1
  store i8* null, i8** %Element21
  %Element22 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %record_init19, i32 0, i32 2
  store i8* null, i8** %Element22
  store { i32, i8*, i8* }* %record_init19, { i32, i8*, i8* }** %d
  %malloccall23 = tail call i8* @malloc(i32 ptrtoint ({ i32, i8*, i8* }* getelementptr ({ i32, i8*, i8* }, { i32, i8*, i8* }* null, i32 1) to i32))
  %record_init24 = bitcast i8* %malloccall23 to { i32, i8*, i8* }*
  %Element25 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %record_init24, i32 0, i32 0
  store i32 8, i32* %Element25
  %Element26 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %record_init24, i32 0, i32 1
  store i8* null, i8** %Element26
  %Element27 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %record_init24, i32 0, i32 2
  store i8* null, i8** %Element27
  store { i32, i8*, i8* }* %record_init24, { i32, i8*, i8* }** %e
  %malloccall28 = tail call i8* @malloc(i32 ptrtoint ({ i32, i8*, i8* }* getelementptr ({ i32, i8*, i8* }, { i32, i8*, i8* }* null, i32 1) to i32))
  %record_init29 = bitcast i8* %malloccall28 to { i32, i8*, i8* }*
  %Element30 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %record_init29, i32 0, i32 0
  store i32 9, i32* %Element30
  %Element31 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %record_init29, i32 0, i32 1
  store i8* null, i8** %Element31
  %Element32 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %record_init29, i32 0, i32 2
  store i8* null, i8** %Element32
  store { i32, i8*, i8* }* %record_init29, { i32, i8*, i8* }** %f
  %load_left = load { i32, i8*, i8* }*, { i32, i8*, i8* }** %root
  %element_left = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %load_left, i32 0, i32 1
  %b33 = load { i32, i8*, i8* }*, { i32, i8*, i8* }** %b
  %0 = bitcast { i32, i8*, i8* }* %b33 to i8*
  store i8* %0, i8** %element_left
  %load_left34 = load { i32, i8*, i8* }*, { i32, i8*, i8* }** %root
  %element_left35 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %load_left34, i32 0, i32 2
  %e36 = load { i32, i8*, i8* }*, { i32, i8*, i8* }** %e
  %1 = bitcast { i32, i8*, i8* }* %e36 to i8*
  store i8* %1, i8** %element_left35
  %load_left37 = load { i32, i8*, i8* }*, { i32, i8*, i8* }** %b
  %element_left38 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %load_left37, i32 0, i32 1
  %a39 = load { i32, i8*, i8* }*, { i32, i8*, i8* }** %a
  %2 = bitcast { i32, i8*, i8* }* %a39 to i8*
  store i8* %2, i8** %element_left38
  %load_left40 = load { i32, i8*, i8* }*, { i32, i8*, i8* }** %b
  %element_left41 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %load_left40, i32 0, i32 2
  %c42 = load { i32, i8*, i8* }*, { i32, i8*, i8* }** %c
  %3 = bitcast { i32, i8*, i8* }* %c42 to i8*
  store i8* %3, i8** %element_left41
  %load_left43 = load { i32, i8*, i8* }*, { i32, i8*, i8* }** %e
  %element_left44 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %load_left43, i32 0, i32 1
  %d45 = load { i32, i8*, i8* }*, { i32, i8*, i8* }** %d
  %4 = bitcast { i32, i8*, i8* }* %d45 to i8*
  store i8* %4, i8** %element_left44
  %load_left46 = load { i32, i8*, i8* }*, { i32, i8*, i8* }** %e
  %element_left47 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %load_left46, i32 0, i32 2
  %f48 = load { i32, i8*, i8* }*, { i32, i8*, i8* }** %f
  %5 = bitcast { i32, i8*, i8* }* %f48 to i8*
  store i8* %5, i8** %element_left47
  %root49 = load { i32, i8*, i8* }*, { i32, i8*, i8* }** %root
  %6 = call i32 @eval_sum({ i32 }* %frame_pointer, { i32, i8*, i8* }* %root49)
  call void @tig_print_int(i32 %6)
  %root50 = load { i32, i8*, i8* }*, { i32, i8*, i8* }** %root
  %7 = call i32 @eval_sum({ i32 }* %frame_pointer, { i32, i8*, i8* }* %root50)
  call void @assert_equal_int(i32 %7, i32 34)
  ret i32 0

break_loop:                                       ; No predecessors!
  ret i32 0
}

define i32 @eval_sum({ i32 }*, { i32, i8*, i8* }*) {
entry:
  %if_result_addr = alloca i32
  %root = alloca { i32, i8*, i8* }*
  %frame_pointer = alloca { { i32 }* }
  %arg_address = getelementptr { { i32 }* }, { { i32 }* }* %frame_pointer, i32 0, i32 0
  store { i32 }* %0, { i32 }** %arg_address
  store { i32, i8*, i8* }* %1, { i32, i8*, i8* }** %root
  br label %test

test:                                             ; preds = %entry
  %root1 = load { i32, i8*, i8* }*, { i32, i8*, i8* }** %root
  %2 = bitcast { i32, i8*, i8* }* %root1 to i8*
  %3 = call i32 @tig_nillable(i8* %2)
  %cond = icmp eq i32 %3, 1
  br i1 %cond, label %then, label %else

then:                                             ; preds = %test
  store i32 0, i32* %if_result_addr
  br label %merge

else:                                             ; preds = %test
  %root2 = load { i32, i8*, i8* }*, { i32, i8*, i8* }** %root
  %element = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %root2, i32 0, i32 0
  %field_var = load i32, i32* %element
  %root3 = load { i32, i8*, i8* }*, { i32, i8*, i8* }** %root
  %element4 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %root3, i32 0, i32 1
  %field_var5 = load i8*, i8** %element4
  %4 = bitcast i8* %field_var5 to { i32, i8*, i8* }*
  %fp_addr_in_sl = getelementptr { { i32 }* }, { { i32 }* }* %frame_pointer, i32 0, i32 0
  %fp_addr = load { i32 }*, { i32 }** %fp_addr_in_sl
  %5 = call i32 @eval_sum({ i32 }* %fp_addr, { i32, i8*, i8* }* %4)
  %add_tmp = add i32 %field_var, %5
  %root6 = load { i32, i8*, i8* }*, { i32, i8*, i8* }** %root
  %element7 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %root6, i32 0, i32 2
  %field_var8 = load i8*, i8** %element7
  %6 = bitcast i8* %field_var8 to { i32, i8*, i8* }*
  %fp_addr_in_sl9 = getelementptr { { i32 }* }, { { i32 }* }* %frame_pointer, i32 0, i32 0
  %fp_addr10 = load { i32 }*, { i32 }** %fp_addr_in_sl9
  %7 = call i32 @eval_sum({ i32 }* %fp_addr10, { i32, i8*, i8* }* %6)
  %add_tmp11 = add i32 %add_tmp, %7
  store i32 %add_tmp11, i32* %if_result_addr
  br label %merge

merge:                                            ; preds = %else, %then
  %if_result = load i32, i32* %if_result_addr
  ret i32 %if_result
}

declare noalias i8* @malloc(i32)