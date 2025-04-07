; ModuleID = 'C:/Users/Burak/Desktop/TAU/HLS/PositFFT/PositFFT/PositFFT/hls/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: noinline
define void @apatb_dFFT_ir(double* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="1024" %signal, double* noalias nocapture nonnull "fpga.decayed.dim.hint"="1024" %real, double* noalias nocapture nonnull "fpga.decayed.dim.hint"="1024" %imag, i32 %sampleCount) local_unnamed_addr #0 {
entry:
  %0 = bitcast double* %signal to [1024 x double]*
  %1 = call i8* @malloc(i64 8192)
  %signal_copy = bitcast i8* %1 to [1024 x double]*
  %2 = bitcast double* %real to [1024 x double]*
  %3 = call i8* @malloc(i64 8192)
  %real_copy = bitcast i8* %3 to [1024 x double]*
  %4 = bitcast double* %imag to [1024 x double]*
  %5 = call i8* @malloc(i64 8192)
  %imag_copy = bitcast i8* %5 to [1024 x double]*
  call fastcc void @copy_in([1024 x double]* nonnull %0, [1024 x double]* %signal_copy, [1024 x double]* nonnull %2, [1024 x double]* %real_copy, [1024 x double]* nonnull %4, [1024 x double]* %imag_copy)
  call void @apatb_dFFT_hw([1024 x double]* %signal_copy, [1024 x double]* %real_copy, [1024 x double]* %imag_copy, i32 %sampleCount)
  call void @copy_back([1024 x double]* %0, [1024 x double]* %signal_copy, [1024 x double]* %2, [1024 x double]* %real_copy, [1024 x double]* %4, [1024 x double]* %imag_copy)
  tail call void @free(i8* %1)
  tail call void @free(i8* %3)
  tail call void @free(i8* %5)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_in([1024 x double]* readonly, [1024 x double]*, [1024 x double]* readonly, [1024 x double]*, [1024 x double]* readonly, [1024 x double]*) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0a1024f64([1024 x double]* %1, [1024 x double]* %0)
  call fastcc void @onebyonecpy_hls.p0a1024f64([1024 x double]* %3, [1024 x double]* %2)
  call fastcc void @onebyonecpy_hls.p0a1024f64([1024 x double]* %5, [1024 x double]* %4)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0a1024f64([1024 x double]* %dst, [1024 x double]* readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [1024 x double]* %dst, null
  %1 = icmp eq [1024 x double]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a1024f64([1024 x double]* nonnull %dst, [1024 x double]* nonnull %src, i64 1024)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a1024f64([1024 x double]* %dst, [1024 x double]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [1024 x double]* %src, null
  %1 = icmp eq [1024 x double]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [1024 x double], [1024 x double]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [1024 x double], [1024 x double]* %src, i64 0, i64 %for.loop.idx2
  %3 = load double, double* %src.addr, align 8
  store double %3, double* %dst.addr, align 8
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_out([1024 x double]*, [1024 x double]* readonly, [1024 x double]*, [1024 x double]* readonly, [1024 x double]*, [1024 x double]* readonly) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a1024f64([1024 x double]* %0, [1024 x double]* %1)
  call fastcc void @onebyonecpy_hls.p0a1024f64([1024 x double]* %2, [1024 x double]* %3)
  call fastcc void @onebyonecpy_hls.p0a1024f64([1024 x double]* %4, [1024 x double]* %5)
  ret void
}

declare i8* @malloc(i64) local_unnamed_addr

declare void @free(i8*) local_unnamed_addr

declare void @apatb_dFFT_hw([1024 x double]*, [1024 x double]*, [1024 x double]*, i32)

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_back([1024 x double]*, [1024 x double]* readonly, [1024 x double]*, [1024 x double]* readonly, [1024 x double]*, [1024 x double]* readonly) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a1024f64([1024 x double]* %2, [1024 x double]* %3)
  call fastcc void @onebyonecpy_hls.p0a1024f64([1024 x double]* %4, [1024 x double]* %5)
  ret void
}

declare void @dFFT_hw_stub(double* noalias nocapture nonnull readonly, double* noalias nocapture nonnull, double* noalias nocapture nonnull, i32)

define void @dFFT_hw_stub_wrapper([1024 x double]*, [1024 x double]*, [1024 x double]*, i32) #5 {
entry:
  call void @copy_out([1024 x double]* null, [1024 x double]* %0, [1024 x double]* null, [1024 x double]* %1, [1024 x double]* null, [1024 x double]* %2)
  %4 = bitcast [1024 x double]* %0 to double*
  %5 = bitcast [1024 x double]* %1 to double*
  %6 = bitcast [1024 x double]* %2 to double*
  call void @dFFT_hw_stub(double* %4, double* %5, double* %6, i32 %3)
  call void @copy_in([1024 x double]* null, [1024 x double]* %0, [1024 x double]* null, [1024 x double]* %1, [1024 x double]* null, [1024 x double]* %2)
  ret void
}

attributes #0 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="arraycpy_hls" }
attributes #4 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="copyout" }
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
