; ModuleID = 'C:/Users/Burak/Desktop/TAU/HLS/PositFFT/PositFFT/PositFFT/hls/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%struct.POSIT = type { i1, i1, i1, %"struct.ap_int<6>", %"struct.ap_uint<1>", %"struct.ap_uint<30>" }
%"struct.ap_int<6>" = type { %"struct.ap_int_base<6, true>" }
%"struct.ap_int_base<6, true>" = type { %"struct.ssdm_int<6, true>" }
%"struct.ssdm_int<6, true>" = type { i6 }
%"struct.ap_uint<1>" = type { %"struct.ap_int_base<1, false>" }
%"struct.ap_int_base<1, false>" = type { %"struct.ssdm_int<1, false>" }
%"struct.ssdm_int<1, false>" = type { i1 }
%"struct.ap_uint<30>" = type { %"struct.ap_int_base<30, false>" }
%"struct.ap_int_base<30, false>" = type { %"struct.ssdm_int<30, false>" }
%"struct.ssdm_int<30, false>" = type { i30 }
%struct.pFFTResult = type { [64 x %struct.POSIT], [64 x %struct.POSIT] }

; Function Attrs: argmemonly noinline willreturn
define void @apatb_pFFT_ir(%struct.POSIT* noalias nocapture nonnull readonly %signal, %struct.pFFTResult* noalias nocapture nonnull dereferenceable(1536) %result) local_unnamed_addr #0 {
entry:
  %signal_copy = alloca i40, align 512
  %result_copy.0 = alloca [64 x i40], align 512
  %result_copy.1 = alloca [64 x i40], align 512
  call fastcc void @copy_in(%struct.POSIT* nonnull %signal, i40* nonnull align 512 %signal_copy, %struct.pFFTResult* nonnull %result, [64 x i40]* nonnull align 512 %result_copy.0, [64 x i40]* nonnull align 512 %result_copy.1)
  call void @apatb_pFFT_hw(i40* %signal_copy, [64 x i40]* %result_copy.0, [64 x i40]* %result_copy.1)
  call void @copy_back(%struct.POSIT* %signal, i40* %signal_copy, %struct.pFFTResult* %result, [64 x i40]* %result_copy.0, [64 x i40]* %result_copy.1)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_in(%struct.POSIT* noalias readonly "unpacked"="0", i40* noalias align 512 "unpacked"="1", %struct.pFFTResult* noalias readonly "unpacked"="2", [64 x i40]* noalias align 512 "unpacked"="3.0" %.0, [64 x i40]* noalias align 512 "unpacked"="3.1" %.1) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0struct.POSIT.1249(i40* align 512 %1, %struct.POSIT* %0)
  call fastcc void @onebyonecpy_hls.p0struct.pFFTResult([64 x i40]* align 512 %.0, [64 x i40]* align 512 %.1, %struct.pFFTResult* %2)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0struct.POSIT(%struct.POSIT* noalias %dst, i40* noalias readonly align 512 %src) unnamed_addr #2 {
entry:
  %0 = icmp eq %struct.POSIT* %dst, null
  %1 = icmp eq i40* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %dst.0 = getelementptr %struct.POSIT, %struct.POSIT* %dst, i64 0, i32 0
  %3 = load i40, i40* %src, align 512
  %.partselect5 = trunc i40 %3 to i1
  store i1 %.partselect5, i1* %dst.0, align 512
  %dst.1 = getelementptr %struct.POSIT, %struct.POSIT* %dst, i64 0, i32 1
  %4 = lshr i40 %3, 1
  %.partselect4 = trunc i40 %4 to i1
  store i1 %.partselect4, i1* %dst.1, align 1
  %dst.2 = getelementptr %struct.POSIT, %struct.POSIT* %dst, i64 0, i32 2
  %5 = lshr i40 %3, 2
  %.partselect3 = trunc i40 %5 to i1
  store i1 %.partselect3, i1* %dst.2, align 2
  %dst.3.0.0.06 = getelementptr %struct.POSIT, %struct.POSIT* %dst, i64 0, i32 3, i32 0, i32 0, i32 0
  %6 = lshr i40 %3, 3
  %.partselect2 = trunc i40 %6 to i6
  store i6 %.partselect2, i6* %dst.3.0.0.06, align 1
  %dst.4.0.0.012 = getelementptr %struct.POSIT, %struct.POSIT* %dst, i64 0, i32 4, i32 0, i32 0, i32 0
  %7 = lshr i40 %3, 9
  %.partselect1 = trunc i40 %7 to i1
  store i1 %.partselect1, i1* %dst.4.0.0.012, align 4
  %dst.5.0.0.018 = getelementptr %struct.POSIT, %struct.POSIT* %dst, i64 0, i32 5, i32 0, i32 0, i32 0
  %8 = lshr i40 %3, 10
  %.partselect = trunc i40 %8 to i30
  store i30 %.partselect, i30* %dst.5.0.0.018, align 8
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0struct.pFFTResult([64 x i40]* noalias align 512 "unpacked"="0.0" %dst.01, [64 x i40]* noalias align 512 "unpacked"="0.1" %dst.12, %struct.pFFTResult* noalias readonly "unpacked"="1" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq %struct.pFFTResult* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %src.0 = getelementptr %struct.pFFTResult, %struct.pFFTResult* %src, i64 0, i32 0
  call void @arraycpy_hls.p0a64struct.POSIT([64 x i40]* %dst.01, [64 x %struct.POSIT]* %src.0, i64 64)
  %src.1 = getelementptr %struct.pFFTResult, %struct.pFFTResult* %src, i64 0, i32 1
  call void @arraycpy_hls.p0a64struct.POSIT([64 x i40]* %dst.12, [64 x %struct.POSIT]* %src.1, i64 64)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_out(%struct.POSIT* noalias "unpacked"="0", i40* noalias readonly align 512 "unpacked"="1", %struct.pFFTResult* noalias "unpacked"="2", [64 x i40]* noalias readonly align 512 "unpacked"="3.0" %.0, [64 x i40]* noalias readonly align 512 "unpacked"="3.1" %.1) unnamed_addr #3 {
entry:
  call fastcc void @onebyonecpy_hls.p0struct.POSIT(%struct.POSIT* %0, i40* align 512 %1)
  call fastcc void @onebyonecpy_hls.p0struct.pFFTResult.1225(%struct.pFFTResult* %2, [64 x i40]* align 512 %.0, [64 x i40]* align 512 %.1)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0struct.pFFTResult.1225(%struct.pFFTResult* noalias "unpacked"="0" %dst, [64 x i40]* noalias readonly align 512 "unpacked"="1.0" %src.01, [64 x i40]* noalias readonly align 512 "unpacked"="1.1" %src.12) unnamed_addr #2 {
entry:
  %0 = icmp eq %struct.pFFTResult* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %dst.0 = getelementptr %struct.pFFTResult, %struct.pFFTResult* %dst, i64 0, i32 0
  call void @arraycpy_hls.p0a64struct.POSIT.1239([64 x %struct.POSIT]* %dst.0, [64 x i40]* %src.01, i64 64)
  %dst.1 = getelementptr %struct.pFFTResult, %struct.pFFTResult* %dst, i64 0, i32 1
  call void @arraycpy_hls.p0a64struct.POSIT.1239([64 x %struct.POSIT]* %dst.1, [64 x i40]* %src.12, i64 64)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a64struct.POSIT([64 x i40]* %dst, [64 x %struct.POSIT]* readonly %src, i64 %num) local_unnamed_addr #4 {
entry:
  %0 = icmp eq [64 x %struct.POSIT]* %src, null
  %1 = icmp eq [64 x i40]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond31 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond31, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx32 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.01 = getelementptr [64 x %struct.POSIT], [64 x %struct.POSIT]* %src, i64 0, i64 %for.loop.idx32, i32 0
  %3 = getelementptr [64 x i40], [64 x i40]* %dst, i64 0, i64 %for.loop.idx32
  %4 = bitcast i1* %src.addr.01 to i8*
  %5 = load i8, i8* %4
  %6 = trunc i8 %5 to i1
  %7 = load i40, i40* %3, align 1
  %8 = zext i1 %6 to i40
  %9 = and i40 %7, -2
  %.partset5 = or i40 %9, %8
  store i40 %.partset5, i40* %3, align 1
  %src.addr.13 = getelementptr [64 x %struct.POSIT], [64 x %struct.POSIT]* %src, i64 0, i64 %for.loop.idx32, i32 1
  %10 = bitcast i1* %src.addr.13 to i8*
  %11 = load i8, i8* %10
  %12 = trunc i8 %11 to i1
  %13 = zext i1 %12 to i40
  %14 = shl i40 %13, 1
  %15 = and i40 %.partset5, -3
  %.partset4 = or i40 %15, %14
  store i40 %.partset4, i40* %3, align 1
  %src.addr.25 = getelementptr [64 x %struct.POSIT], [64 x %struct.POSIT]* %src, i64 0, i64 %for.loop.idx32, i32 2
  %16 = bitcast i1* %src.addr.25 to i8*
  %17 = load i8, i8* %16
  %18 = trunc i8 %17 to i1
  %19 = zext i1 %18 to i40
  %20 = shl i40 %19, 2
  %21 = and i40 %.partset4, -5
  %.partset3 = or i40 %21, %20
  store i40 %.partset3, i40* %3, align 1
  %src.addr.3.0.0.013 = getelementptr [64 x %struct.POSIT], [64 x %struct.POSIT]* %src, i64 0, i64 %for.loop.idx32, i32 3, i32 0, i32 0, i32 0
  %22 = bitcast i6* %src.addr.3.0.0.013 to i8*
  %23 = load i8, i8* %22
  %24 = trunc i8 %23 to i6
  %25 = zext i6 %24 to i40
  %26 = shl i40 %25, 3
  %27 = and i40 %.partset3, -505
  %.partset2 = or i40 %27, %26
  store i40 %.partset2, i40* %3, align 1
  %src.addr.4.0.0.021 = getelementptr [64 x %struct.POSIT], [64 x %struct.POSIT]* %src, i64 0, i64 %for.loop.idx32, i32 4, i32 0, i32 0, i32 0
  %28 = bitcast i1* %src.addr.4.0.0.021 to i8*
  %29 = load i8, i8* %28
  %30 = trunc i8 %29 to i1
  %31 = zext i1 %30 to i40
  %32 = shl i40 %31, 9
  %33 = and i40 %.partset2, -513
  %.partset1 = or i40 %33, %32
  store i40 %.partset1, i40* %3, align 1
  %src.addr.5.0.0.029 = getelementptr [64 x %struct.POSIT], [64 x %struct.POSIT]* %src, i64 0, i64 %for.loop.idx32, i32 5, i32 0, i32 0, i32 0
  %34 = bitcast i30* %src.addr.5.0.0.029 to i32*
  %35 = load i32, i32* %34
  %36 = trunc i32 %35 to i30
  %37 = zext i30 %36 to i40
  %38 = shl i40 %37, 10
  %39 = and i40 %.partset1, 1023
  %.partset = or i40 %39, %38
  store i40 %.partset, i40* %3, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx32, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a64struct.POSIT.1239([64 x %struct.POSIT]* %dst, [64 x i40]* readonly %src, i64 %num) local_unnamed_addr #4 {
entry:
  %0 = icmp eq [64 x i40]* %src, null
  %1 = icmp eq [64 x %struct.POSIT]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond31 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond31, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx32 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %3 = getelementptr [64 x i40], [64 x i40]* %src, i64 0, i64 %for.loop.idx32
  %dst.addr.02 = getelementptr [64 x %struct.POSIT], [64 x %struct.POSIT]* %dst, i64 0, i64 %for.loop.idx32, i32 0
  %4 = load i40, i40* %3, align 1
  %.partselect5 = trunc i40 %4 to i1
  store i1 %.partselect5, i1* %dst.addr.02, align 1
  %dst.addr.14 = getelementptr [64 x %struct.POSIT], [64 x %struct.POSIT]* %dst, i64 0, i64 %for.loop.idx32, i32 1
  %5 = load i40, i40* %3, align 1
  %6 = lshr i40 %5, 1
  %.partselect4 = trunc i40 %6 to i1
  store i1 %.partselect4, i1* %dst.addr.14, align 1
  %dst.addr.26 = getelementptr [64 x %struct.POSIT], [64 x %struct.POSIT]* %dst, i64 0, i64 %for.loop.idx32, i32 2
  %7 = load i40, i40* %3, align 1
  %8 = lshr i40 %7, 2
  %.partselect3 = trunc i40 %8 to i1
  store i1 %.partselect3, i1* %dst.addr.26, align 1
  %dst.addr.3.0.0.014 = getelementptr [64 x %struct.POSIT], [64 x %struct.POSIT]* %dst, i64 0, i64 %for.loop.idx32, i32 3, i32 0, i32 0, i32 0
  %9 = load i40, i40* %3, align 1
  %10 = lshr i40 %9, 3
  %.partselect2 = trunc i40 %10 to i6
  store i6 %.partselect2, i6* %dst.addr.3.0.0.014, align 1
  %dst.addr.4.0.0.022 = getelementptr [64 x %struct.POSIT], [64 x %struct.POSIT]* %dst, i64 0, i64 %for.loop.idx32, i32 4, i32 0, i32 0, i32 0
  %11 = load i40, i40* %3, align 1
  %12 = lshr i40 %11, 9
  %.partselect1 = trunc i40 %12 to i1
  store i1 %.partselect1, i1* %dst.addr.4.0.0.022, align 1
  %dst.addr.5.0.0.030 = getelementptr [64 x %struct.POSIT], [64 x %struct.POSIT]* %dst, i64 0, i64 %for.loop.idx32, i32 5, i32 0, i32 0, i32 0
  %13 = load i40, i40* %3, align 4
  %14 = lshr i40 %13, 10
  %.partselect = trunc i40 %14 to i30
  store i30 %.partselect, i30* %dst.addr.5.0.0.030, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx32, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0struct.POSIT.1249(i40* noalias align 512 %dst, %struct.POSIT* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq i40* %dst, null
  %1 = icmp eq %struct.POSIT* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %src.0 = getelementptr %struct.POSIT, %struct.POSIT* %src, i64 0, i32 0
  %3 = bitcast i1* %src.0 to i8*
  %4 = load i8, i8* %3
  %5 = trunc i8 %4 to i1
  %6 = zext i1 %5 to i40
  %src.1 = getelementptr %struct.POSIT, %struct.POSIT* %src, i64 0, i32 1
  %7 = bitcast i1* %src.1 to i8*
  %8 = load i8, i8* %7
  %9 = trunc i8 %8 to i1
  %10 = zext i1 %9 to i40
  %11 = shl i40 %10, 1
  %.partset4 = or i40 %11, %6
  %src.2 = getelementptr %struct.POSIT, %struct.POSIT* %src, i64 0, i32 2
  %12 = bitcast i1* %src.2 to i8*
  %13 = load i8, i8* %12
  %14 = trunc i8 %13 to i1
  %15 = zext i1 %14 to i40
  %16 = shl i40 %15, 2
  %.partset3 = or i40 %.partset4, %16
  %src.3.0.0.05 = getelementptr %struct.POSIT, %struct.POSIT* %src, i64 0, i32 3, i32 0, i32 0, i32 0
  %17 = bitcast i6* %src.3.0.0.05 to i8*
  %18 = load i8, i8* %17
  %19 = trunc i8 %18 to i6
  %20 = zext i6 %19 to i40
  %21 = shl i40 %20, 3
  %.partset2 = or i40 %.partset3, %21
  %src.4.0.0.011 = getelementptr %struct.POSIT, %struct.POSIT* %src, i64 0, i32 4, i32 0, i32 0, i32 0
  %22 = bitcast i1* %src.4.0.0.011 to i8*
  %23 = load i8, i8* %22
  %24 = trunc i8 %23 to i1
  %25 = zext i1 %24 to i40
  %26 = shl i40 %25, 9
  %src.5.0.0.017 = getelementptr %struct.POSIT, %struct.POSIT* %src, i64 0, i32 5, i32 0, i32 0, i32 0
  %27 = bitcast i30* %src.5.0.0.017 to i32*
  %28 = load i32, i32* %27
  %29 = trunc i32 %28 to i30
  %30 = zext i30 %29 to i40
  %31 = shl i40 %30, 10
  %32 = or i40 %.partset2, %26
  %.partset = or i40 %32, %31
  store i40 %.partset, i40* %dst, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

declare i8* @malloc(i64)

declare void @free(i8*)

declare void @apatb_pFFT_hw(i40*, [64 x i40]*, [64 x i40]*)

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_back(%struct.POSIT* noalias "unpacked"="0", i40* noalias readonly align 512 "unpacked"="1", %struct.pFFTResult* noalias "unpacked"="2", [64 x i40]* noalias readonly align 512 "unpacked"="3.0" %.0, [64 x i40]* noalias readonly align 512 "unpacked"="3.1" %.1) unnamed_addr #3 {
entry:
  call fastcc void @onebyonecpy_hls.p0struct.pFFTResult.1225(%struct.pFFTResult* %2, [64 x i40]* align 512 %.0, [64 x i40]* align 512 %.1)
  ret void
}

declare void @pFFT_hw_stub(%struct.POSIT* noalias nocapture nonnull readonly, %struct.pFFTResult* noalias nocapture nonnull)

define void @pFFT_hw_stub_wrapper(i40*, [64 x i40]*, [64 x i40]*) #5 {
entry:
  %3 = call i8* @malloc(i64 12)
  %4 = bitcast i8* %3 to %struct.POSIT*
  %5 = call i8* @malloc(i64 1536)
  %6 = bitcast i8* %5 to %struct.pFFTResult*
  call void @copy_out(%struct.POSIT* %4, i40* %0, %struct.pFFTResult* %6, [64 x i40]* %1, [64 x i40]* %2)
  call void @pFFT_hw_stub(%struct.POSIT* %4, %struct.pFFTResult* %6)
  call void @copy_in(%struct.POSIT* %4, i40* %0, %struct.pFFTResult* %6, [64 x i40]* %1, [64 x i40]* %2)
  call void @free(i8* %3)
  call void @free(i8* %5)
  ret void
}

attributes #0 = { argmemonly noinline willreturn "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="copyout" }
attributes #4 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="arraycpy_hls" }
attributes #5 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
