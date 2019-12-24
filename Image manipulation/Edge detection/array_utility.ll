; ModuleID = 'array_utility.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [50 x i8] c"Unable to allocate memory for 1D double array...\0A\00", align 1
@.str1 = private unnamed_addr constant [49 x i8] c"Unable to allocate memory for 2D float array...\0A\00", align 1
@.str2 = private unnamed_addr constant [49 x i8] c"Unable to allocate memory for 1D float array...\0A\00", align 1
@.str3 = private unnamed_addr constant [49 x i8] c"Unable to allocate memory for 3D float array...\0A\00", align 1
@.str4 = private unnamed_addr constant [49 x i8] c"Unable to allocate memory for 4D float array...\0A\00", align 1
@.str5 = private unnamed_addr constant [47 x i8] c"Unable to allocate memory for 1D int array...\0A\00", align 1
@.str6 = private unnamed_addr constant [47 x i8] c"Unable to allocate memory for 2D int array...\0A\00", align 1
@.str7 = private unnamed_addr constant [47 x i8] c"Unable to allocate memory for 3D int array...\0A\00", align 1
@.str8 = private unnamed_addr constant [35 x i8] c"Unexpected end of file, exiting. \0A\00", align 1
@.str9 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str10 = private unnamed_addr constant [47 x i8] c"Unable to open file: %s for reading, exiting.\0A\00", align 1
@.str11 = private unnamed_addr constant [3 x i8] c"P5\00", align 1
@.str12 = private unnamed_addr constant [3 x i8] c"P6\00", align 1
@.str13 = private unnamed_addr constant [59 x i8] c"\0ABad file type, use raw grayscale (pgm) or raw color (ppm)\00", align 1
@.str14 = private unnamed_addr constant [7 x i8] c"file.\0A\00", align 1
@.str15 = private unnamed_addr constant [41 x i8] c"Write color image: min=%f, max=%f, v=%f\0A\00", align 1
@.str16 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@stderr = external global %struct._IO_FILE*
@.str17 = private unnamed_addr constant [47 x i8] c"Unable to open image %s for writing, exiting.\0A\00", align 1
@.str18 = private unnamed_addr constant [13 x i8] c"%s\0A%d %d\0A%d\0A\00", align 1
@.str19 = private unnamed_addr constant [47 x i8] c"\0AWrite black/white image %s of size (%d, %d).\0A\00", align 1
@.str20 = private unnamed_addr constant [35 x i8] c"Write image: min=%f, max=%f, v=%f\0A\00", align 1
@fname = common global [50 x i8] zeroinitializer, align 16
@fp = common global %struct._IO_FILE* null, align 8

; Function Attrs: nounwind uwtable
define double* @alloc1dd(i32 %n) #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %array = alloca double*, align 8
  store i32 %n, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = sext i32 %2 to i64
  %4 = mul i64 %3, 8
  %5 = call noalias i8* @malloc(i64 %4) #6
  %6 = bitcast i8* %5 to double*
  store double* %6, double** %array, align 8
  %7 = icmp eq double* %6, null
  br i1 %7, label %8, label %10

; <label>:8                                       ; preds = %0
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([50 x i8]* @.str, i32 0, i32 0))
  call void @exit(i32 0) #7
  unreachable

; <label>:10                                      ; preds = %0
  store i32 0, i32* %i, align 4
  br label %11

; <label>:11                                      ; preds = %20, %10
  %12 = load i32* %i, align 4
  %13 = load i32* %1, align 4
  %14 = icmp slt i32 %12, %13
  br i1 %14, label %15, label %23

; <label>:15                                      ; preds = %11
  %16 = load i32* %i, align 4
  %17 = sext i32 %16 to i64
  %18 = load double** %array, align 8
  %19 = getelementptr inbounds double* %18, i64 %17
  store double 0.000000e+00, double* %19, align 8
  br label %20

; <label>:20                                      ; preds = %15
  %21 = load i32* %i, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, i32* %i, align 4
  br label %11

; <label>:23                                      ; preds = %11
  %24 = load double** %array, align 8
  ret double* %24
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

; Function Attrs: nounwind uwtable
define double** @alloc2dd(i32 %m, i32 %n) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %array = alloca double**, align 8
  store i32 %m, i32* %1, align 4
  store i32 %n, i32* %2, align 4
  %3 = load i32* %1, align 4
  %4 = sext i32 %3 to i64
  %5 = mul i64 %4, 8
  %6 = call noalias i8* @malloc(i64 %5) #6
  %7 = bitcast i8* %6 to double**
  store double** %7, double*** %array, align 8
  %8 = icmp eq double** %7, null
  br i1 %8, label %9, label %11

; <label>:9                                       ; preds = %0
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([49 x i8]* @.str1, i32 0, i32 0))
  call void @exit(i32 0) #7
  unreachable

; <label>:11                                      ; preds = %0
  store i32 0, i32* %i, align 4
  br label %12

; <label>:12                                      ; preds = %23, %11
  %13 = load i32* %i, align 4
  %14 = load i32* %1, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %26

; <label>:16                                      ; preds = %12
  %17 = load i32* %2, align 4
  %18 = call double* @alloc1dd(i32 %17)
  %19 = load i32* %i, align 4
  %20 = sext i32 %19 to i64
  %21 = load double*** %array, align 8
  %22 = getelementptr inbounds double** %21, i64 %20
  store double* %18, double** %22, align 8
  br label %23

; <label>:23                                      ; preds = %16
  %24 = load i32* %i, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, i32* %i, align 4
  br label %12

; <label>:26                                      ; preds = %12
  %27 = load double*** %array, align 8
  ret double** %27
}

; Function Attrs: nounwind uwtable
define float* @alloc1df(i32 %n) #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %array = alloca float*, align 8
  store i32 %n, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = sext i32 %2 to i64
  %4 = mul i64 %3, 4
  %5 = call noalias i8* @malloc(i64 %4) #6
  %6 = bitcast i8* %5 to float*
  store float* %6, float** %array, align 8
  %7 = icmp eq float* %6, null
  br i1 %7, label %8, label %10

; <label>:8                                       ; preds = %0
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([49 x i8]* @.str2, i32 0, i32 0))
  call void @exit(i32 0) #7
  unreachable

; <label>:10                                      ; preds = %0
  store i32 0, i32* %i, align 4
  br label %11

; <label>:11                                      ; preds = %20, %10
  %12 = load i32* %i, align 4
  %13 = load i32* %1, align 4
  %14 = icmp slt i32 %12, %13
  br i1 %14, label %15, label %23

; <label>:15                                      ; preds = %11
  %16 = load i32* %i, align 4
  %17 = sext i32 %16 to i64
  %18 = load float** %array, align 8
  %19 = getelementptr inbounds float* %18, i64 %17
  store float 0.000000e+00, float* %19, align 4
  br label %20

; <label>:20                                      ; preds = %15
  %21 = load i32* %i, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, i32* %i, align 4
  br label %11

; <label>:23                                      ; preds = %11
  %24 = load float** %array, align 8
  ret float* %24
}

; Function Attrs: nounwind uwtable
define float** @alloc2df(i32 %m, i32 %n) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %array = alloca float**, align 8
  store i32 %m, i32* %1, align 4
  store i32 %n, i32* %2, align 4
  %3 = load i32* %1, align 4
  %4 = sext i32 %3 to i64
  %5 = mul i64 %4, 8
  %6 = call noalias i8* @malloc(i64 %5) #6
  %7 = bitcast i8* %6 to float**
  store float** %7, float*** %array, align 8
  %8 = icmp eq float** %7, null
  br i1 %8, label %9, label %11

; <label>:9                                       ; preds = %0
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([49 x i8]* @.str1, i32 0, i32 0))
  call void @exit(i32 0) #7
  unreachable

; <label>:11                                      ; preds = %0
  store i32 0, i32* %i, align 4
  br label %12

; <label>:12                                      ; preds = %23, %11
  %13 = load i32* %i, align 4
  %14 = load i32* %1, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %26

; <label>:16                                      ; preds = %12
  %17 = load i32* %2, align 4
  %18 = call float* @alloc1df(i32 %17)
  %19 = load i32* %i, align 4
  %20 = sext i32 %19 to i64
  %21 = load float*** %array, align 8
  %22 = getelementptr inbounds float** %21, i64 %20
  store float* %18, float** %22, align 8
  br label %23

; <label>:23                                      ; preds = %16
  %24 = load i32* %i, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, i32* %i, align 4
  br label %12

; <label>:26                                      ; preds = %12
  %27 = load float*** %array, align 8
  ret float** %27
}

; Function Attrs: nounwind uwtable
define float*** @alloc3df(i32 %l, i32 %m, i32 %n) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %i = alloca i32, align 4
  %array = alloca float***, align 8
  store i32 %l, i32* %1, align 4
  store i32 %m, i32* %2, align 4
  store i32 %n, i32* %3, align 4
  %4 = load i32* %1, align 4
  %5 = sext i32 %4 to i64
  %6 = mul i64 %5, 8
  %7 = call noalias i8* @malloc(i64 %6) #6
  %8 = bitcast i8* %7 to float***
  store float*** %8, float**** %array, align 8
  %9 = icmp eq float*** %8, null
  br i1 %9, label %10, label %12

; <label>:10                                      ; preds = %0
  %11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([49 x i8]* @.str3, i32 0, i32 0))
  call void @exit(i32 0) #7
  unreachable

; <label>:12                                      ; preds = %0
  store i32 0, i32* %i, align 4
  br label %13

; <label>:13                                      ; preds = %25, %12
  %14 = load i32* %i, align 4
  %15 = load i32* %1, align 4
  %16 = icmp slt i32 %14, %15
  br i1 %16, label %17, label %28

; <label>:17                                      ; preds = %13
  %18 = load i32* %2, align 4
  %19 = load i32* %3, align 4
  %20 = call float** @alloc2df(i32 %18, i32 %19)
  %21 = load i32* %i, align 4
  %22 = sext i32 %21 to i64
  %23 = load float**** %array, align 8
  %24 = getelementptr inbounds float*** %23, i64 %22
  store float** %20, float*** %24, align 8
  br label %25

; <label>:25                                      ; preds = %17
  %26 = load i32* %i, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, i32* %i, align 4
  br label %13

; <label>:28                                      ; preds = %13
  %29 = load float**** %array, align 8
  ret float*** %29
}

; Function Attrs: nounwind uwtable
define float**** @alloc4df(i32 %k, i32 %l, i32 %m, i32 %n) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %i = alloca i32, align 4
  %array = alloca float****, align 8
  store i32 %k, i32* %1, align 4
  store i32 %l, i32* %2, align 4
  store i32 %m, i32* %3, align 4
  store i32 %n, i32* %4, align 4
  %5 = load i32* %1, align 4
  %6 = sext i32 %5 to i64
  %7 = mul i64 %6, 8
  %8 = call noalias i8* @malloc(i64 %7) #6
  %9 = bitcast i8* %8 to float****
  store float**** %9, float***** %array, align 8
  %10 = icmp eq float**** %9, null
  br i1 %10, label %11, label %13

; <label>:11                                      ; preds = %0
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([49 x i8]* @.str4, i32 0, i32 0))
  call void @exit(i32 0) #7
  unreachable

; <label>:13                                      ; preds = %0
  store i32 0, i32* %i, align 4
  br label %14

; <label>:14                                      ; preds = %27, %13
  %15 = load i32* %i, align 4
  %16 = load i32* %1, align 4
  %17 = icmp slt i32 %15, %16
  br i1 %17, label %18, label %30

; <label>:18                                      ; preds = %14
  %19 = load i32* %2, align 4
  %20 = load i32* %3, align 4
  %21 = load i32* %4, align 4
  %22 = call float*** @alloc3df(i32 %19, i32 %20, i32 %21)
  %23 = load i32* %i, align 4
  %24 = sext i32 %23 to i64
  %25 = load float***** %array, align 8
  %26 = getelementptr inbounds float**** %25, i64 %24
  store float*** %22, float**** %26, align 8
  br label %27

; <label>:27                                      ; preds = %18
  %28 = load i32* %i, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, i32* %i, align 4
  br label %14

; <label>:30                                      ; preds = %14
  %31 = load float***** %array, align 8
  ret float**** %31
}

; Function Attrs: nounwind uwtable
define void @dealloc2df(float** %array, i32 %m, i32 %n) #0 {
  %1 = alloca float**, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %i = alloca i32, align 4
  store float** %array, float*** %1, align 8
  store i32 %m, i32* %2, align 4
  store i32 %n, i32* %3, align 4
  store i32 0, i32* %i, align 4
  br label %4

; <label>:4                                       ; preds = %15, %0
  %5 = load i32* %i, align 4
  %6 = load i32* %2, align 4
  %7 = icmp slt i32 %5, %6
  br i1 %7, label %8, label %18

; <label>:8                                       ; preds = %4
  %9 = load i32* %i, align 4
  %10 = sext i32 %9 to i64
  %11 = load float*** %1, align 8
  %12 = getelementptr inbounds float** %11, i64 %10
  %13 = load float** %12, align 8
  %14 = bitcast float* %13 to i8*
  call void @free(i8* %14) #6
  br label %15

; <label>:15                                      ; preds = %8
  %16 = load i32* %i, align 4
  %17 = add nsw i32 %16, 1
  store i32 %17, i32* %i, align 4
  br label %4

; <label>:18                                      ; preds = %4
  %19 = load float*** %1, align 8
  %20 = bitcast float** %19 to i8*
  call void @free(i8* %20) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind uwtable
define void @dealloc3df(float*** %array, i32 %l, i32 %m, i32 %n) #0 {
  %1 = alloca float***, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %i = alloca i32, align 4
  store float*** %array, float**** %1, align 8
  store i32 %l, i32* %2, align 4
  store i32 %m, i32* %3, align 4
  store i32 %n, i32* %4, align 4
  store i32 0, i32* %i, align 4
  br label %5

; <label>:5                                       ; preds = %17, %0
  %6 = load i32* %i, align 4
  %7 = load i32* %2, align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %20

; <label>:9                                       ; preds = %5
  %10 = load i32* %i, align 4
  %11 = sext i32 %10 to i64
  %12 = load float**** %1, align 8
  %13 = getelementptr inbounds float*** %12, i64 %11
  %14 = load float*** %13, align 8
  %15 = load i32* %3, align 4
  %16 = load i32* %4, align 4
  call void @dealloc2df(float** %14, i32 %15, i32 %16)
  br label %17

; <label>:17                                      ; preds = %9
  %18 = load i32* %i, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, i32* %i, align 4
  br label %5

; <label>:20                                      ; preds = %5
  %21 = load float**** %1, align 8
  %22 = bitcast float*** %21 to i8*
  call void @free(i8* %22) #6
  ret void
}

; Function Attrs: nounwind uwtable
define void @dealloc4df(float**** %array, i32 %k, i32 %l, i32 %m, i32 %n) #0 {
  %1 = alloca float****, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %i = alloca i32, align 4
  store float**** %array, float***** %1, align 8
  store i32 %k, i32* %2, align 4
  store i32 %l, i32* %3, align 4
  store i32 %m, i32* %4, align 4
  store i32 %n, i32* %5, align 4
  store i32 0, i32* %i, align 4
  br label %6

; <label>:6                                       ; preds = %19, %0
  %7 = load i32* %i, align 4
  %8 = load i32* %2, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %22

; <label>:10                                      ; preds = %6
  %11 = load i32* %i, align 4
  %12 = sext i32 %11 to i64
  %13 = load float***** %1, align 8
  %14 = getelementptr inbounds float**** %13, i64 %12
  %15 = load float**** %14, align 8
  %16 = load i32* %3, align 4
  %17 = load i32* %4, align 4
  %18 = load i32* %5, align 4
  call void @dealloc3df(float*** %15, i32 %16, i32 %17, i32 %18)
  br label %19

; <label>:19                                      ; preds = %10
  %20 = load i32* %i, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, i32* %i, align 4
  br label %6

; <label>:22                                      ; preds = %6
  %23 = load float***** %1, align 8
  %24 = bitcast float**** %23 to i8*
  call void @free(i8* %24) #6
  ret void
}

; Function Attrs: nounwind uwtable
define i32* @alloc1di(i32 %n) #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %array = alloca i32*, align 8
  store i32 %n, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = sext i32 %2 to i64
  %4 = mul i64 %3, 4
  %5 = call noalias i8* @malloc(i64 %4) #6
  %6 = bitcast i8* %5 to i32*
  store i32* %6, i32** %array, align 8
  %7 = icmp eq i32* %6, null
  br i1 %7, label %8, label %10

; <label>:8                                       ; preds = %0
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([47 x i8]* @.str5, i32 0, i32 0))
  call void @exit(i32 0) #7
  unreachable

; <label>:10                                      ; preds = %0
  store i32 0, i32* %i, align 4
  br label %11

; <label>:11                                      ; preds = %20, %10
  %12 = load i32* %i, align 4
  %13 = load i32* %1, align 4
  %14 = icmp slt i32 %12, %13
  br i1 %14, label %15, label %23

; <label>:15                                      ; preds = %11
  %16 = load i32* %i, align 4
  %17 = sext i32 %16 to i64
  %18 = load i32** %array, align 8
  %19 = getelementptr inbounds i32* %18, i64 %17
  store i32 0, i32* %19, align 4
  br label %20

; <label>:20                                      ; preds = %15
  %21 = load i32* %i, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, i32* %i, align 4
  br label %11

; <label>:23                                      ; preds = %11
  %24 = load i32** %array, align 8
  ret i32* %24
}

; Function Attrs: nounwind uwtable
define i32** @alloc2di(i32 %m, i32 %n) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %i = alloca i32, align 4
  %array = alloca i32**, align 8
  store i32 %m, i32* %1, align 4
  store i32 %n, i32* %2, align 4
  %3 = load i32* %1, align 4
  %4 = sext i32 %3 to i64
  %5 = mul i64 %4, 8
  %6 = call noalias i8* @malloc(i64 %5) #6
  %7 = bitcast i8* %6 to i32**
  store i32** %7, i32*** %array, align 8
  %8 = icmp eq i32** %7, null
  br i1 %8, label %9, label %11

; <label>:9                                       ; preds = %0
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([47 x i8]* @.str6, i32 0, i32 0))
  call void @exit(i32 0) #7
  unreachable

; <label>:11                                      ; preds = %0
  store i32 0, i32* %i, align 4
  br label %12

; <label>:12                                      ; preds = %23, %11
  %13 = load i32* %i, align 4
  %14 = load i32* %1, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %26

; <label>:16                                      ; preds = %12
  %17 = load i32* %2, align 4
  %18 = call i32* @alloc1di(i32 %17)
  %19 = load i32* %i, align 4
  %20 = sext i32 %19 to i64
  %21 = load i32*** %array, align 8
  %22 = getelementptr inbounds i32** %21, i64 %20
  store i32* %18, i32** %22, align 8
  br label %23

; <label>:23                                      ; preds = %16
  %24 = load i32* %i, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, i32* %i, align 4
  br label %12

; <label>:26                                      ; preds = %12
  %27 = load i32*** %array, align 8
  ret i32** %27
}

; Function Attrs: nounwind uwtable
define i32*** @alloc3di(i32 %l, i32 %m, i32 %n) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %i = alloca i32, align 4
  %array = alloca i32***, align 8
  store i32 %l, i32* %1, align 4
  store i32 %m, i32* %2, align 4
  store i32 %n, i32* %3, align 4
  %4 = load i32* %1, align 4
  %5 = sext i32 %4 to i64
  %6 = mul i64 %5, 8
  %7 = call noalias i8* @malloc(i64 %6) #6
  %8 = bitcast i8* %7 to i32***
  store i32*** %8, i32**** %array, align 8
  %9 = icmp eq i32*** %8, null
  br i1 %9, label %10, label %12

; <label>:10                                      ; preds = %0
  %11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([47 x i8]* @.str7, i32 0, i32 0))
  call void @exit(i32 0) #7
  unreachable

; <label>:12                                      ; preds = %0
  store i32 0, i32* %i, align 4
  br label %13

; <label>:13                                      ; preds = %25, %12
  %14 = load i32* %i, align 4
  %15 = load i32* %1, align 4
  %16 = icmp slt i32 %14, %15
  br i1 %16, label %17, label %28

; <label>:17                                      ; preds = %13
  %18 = load i32* %2, align 4
  %19 = load i32* %3, align 4
  %20 = call i32** @alloc2di(i32 %18, i32 %19)
  %21 = load i32* %i, align 4
  %22 = sext i32 %21 to i64
  %23 = load i32**** %array, align 8
  %24 = getelementptr inbounds i32*** %23, i64 %22
  store i32** %20, i32*** %24, align 8
  br label %25

; <label>:25                                      ; preds = %17
  %26 = load i32* %i, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, i32* %i, align 4
  br label %13

; <label>:28                                      ; preds = %13
  %29 = load i32**** %array, align 8
  ret i32*** %29
}

; Function Attrs: nounwind uwtable
define void @dealloc2di(i32** %array, i32 %m, i32 %n) #0 {
  %1 = alloca i32**, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %i = alloca i32, align 4
  store i32** %array, i32*** %1, align 8
  store i32 %m, i32* %2, align 4
  store i32 %n, i32* %3, align 4
  store i32 0, i32* %i, align 4
  br label %4

; <label>:4                                       ; preds = %15, %0
  %5 = load i32* %i, align 4
  %6 = load i32* %2, align 4
  %7 = icmp slt i32 %5, %6
  br i1 %7, label %8, label %18

; <label>:8                                       ; preds = %4
  %9 = load i32* %i, align 4
  %10 = sext i32 %9 to i64
  %11 = load i32*** %1, align 8
  %12 = getelementptr inbounds i32** %11, i64 %10
  %13 = load i32** %12, align 8
  %14 = bitcast i32* %13 to i8*
  call void @free(i8* %14) #6
  br label %15

; <label>:15                                      ; preds = %8
  %16 = load i32* %i, align 4
  %17 = add nsw i32 %16, 1
  store i32 %17, i32* %i, align 4
  br label %4

; <label>:18                                      ; preds = %4
  %19 = load i32*** %1, align 8
  %20 = bitcast i32** %19 to i8*
  call void @free(i8* %20) #6
  ret void
}

; Function Attrs: nounwind uwtable
define void @dealloc3di(i32*** %array, i32 %l, i32 %m, i32 %n) #0 {
  %1 = alloca i32***, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %i = alloca i32, align 4
  store i32*** %array, i32**** %1, align 8
  store i32 %l, i32* %2, align 4
  store i32 %m, i32* %3, align 4
  store i32 %n, i32* %4, align 4
  store i32 0, i32* %i, align 4
  br label %5

; <label>:5                                       ; preds = %17, %0
  %6 = load i32* %i, align 4
  %7 = load i32* %2, align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %20

; <label>:9                                       ; preds = %5
  %10 = load i32* %i, align 4
  %11 = sext i32 %10 to i64
  %12 = load i32**** %1, align 8
  %13 = getelementptr inbounds i32*** %12, i64 %11
  %14 = load i32*** %13, align 8
  %15 = load i32* %3, align 4
  %16 = load i32* %4, align 4
  call void @dealloc2di(i32** %14, i32 %15, i32 %16)
  br label %17

; <label>:17                                      ; preds = %9
  %18 = load i32* %i, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, i32* %i, align 4
  br label %5

; <label>:20                                      ; preds = %5
  %21 = load i32**** %1, align 8
  %22 = bitcast i32*** %21 to i8*
  call void @free(i8* %22) #6
  ret void
}

; Function Attrs: nounwind uwtable
define void @eof_err() #0 {
  %1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([35 x i8]* @.str8, i32 0, i32 0))
  call void @exit(i32 0) #7
  unreachable
                                                  ; No predecessors!
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @getword(%struct._IO_FILE* %fp, i8* %word) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct._IO_FILE*, align 8
  %3 = alloca i8*, align 8
  %i = alloca i32, align 4
  %cha = alloca i32, align 4
  %end = alloca i16, align 2
  store %struct._IO_FILE* %fp, %struct._IO_FILE** %2, align 8
  store i8* %word, i8** %3, align 8
  store i32 0, i32* %i, align 4
  store i32 32, i32* %cha, align 4
  store i16 0, i16* %end, align 2
  br label %4

; <label>:4                                       ; preds = %32, %0
  %5 = load %struct._IO_FILE** %2, align 8
  %6 = call i32 @fgetc(%struct._IO_FILE* %5)
  store i32 %6, i32* %cha, align 4
  %7 = load i32* %cha, align 4
  %8 = icmp eq i32 %7, 35
  br i1 %8, label %9, label %18

; <label>:9                                       ; preds = %4
  br label %10

; <label>:10                                      ; preds = %13, %9
  %11 = load %struct._IO_FILE** %2, align 8
  %12 = call i32 @fgetc(%struct._IO_FILE* %11)
  store i32 %12, i32* %cha, align 4
  br label %13

; <label>:13                                      ; preds = %10
  %14 = load i32* %cha, align 4
  %15 = icmp eq i32 %14, 10
  %16 = xor i1 %15, true
  br i1 %16, label %10, label %17

; <label>:17                                      ; preds = %13
  br label %18

; <label>:18                                      ; preds = %17, %4
  br label %19

; <label>:19                                      ; preds = %18
  %20 = load i32* %cha, align 4
  %21 = sext i32 %20 to i64
  %22 = call i16** @__ctype_b_loc() #8
  %23 = load i16** %22, align 8
  %24 = getelementptr inbounds i16* %23, i64 %21
  %25 = load i16* %24, align 2
  %26 = zext i16 %25 to i32
  %27 = and i32 %26, 8192
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %29, label %32

; <label>:29                                      ; preds = %19
  %30 = load i32* %cha, align 4
  %31 = icmp ne i32 %30, -1
  br label %32

; <label>:32                                      ; preds = %29, %19
  %33 = phi i1 [ false, %19 ], [ %31, %29 ]
  br i1 %33, label %4, label %34

; <label>:34                                      ; preds = %32
  %35 = load i32* %cha, align 4
  %36 = icmp eq i32 %35, -1
  br i1 %36, label %37, label %38

; <label>:37                                      ; preds = %34
  store i32 -1, i32* %1
  br label %76

; <label>:38                                      ; preds = %34
  br label %39

; <label>:39                                      ; preds = %62, %38
  %40 = load i32* %cha, align 4
  %41 = trunc i32 %40 to i8
  %42 = load i32* %i, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, i32* %i, align 4
  %44 = sext i32 %42 to i64
  %45 = load i8** %3, align 8
  %46 = getelementptr inbounds i8* %45, i64 %44
  store i8 %41, i8* %46, align 1
  %47 = load %struct._IO_FILE** %2, align 8
  %48 = call i32 @fgetc(%struct._IO_FILE* %47)
  store i32 %48, i32* %cha, align 4
  br label %49

; <label>:49                                      ; preds = %39
  %50 = load i32* %cha, align 4
  %51 = sext i32 %50 to i64
  %52 = call i16** @__ctype_b_loc() #8
  %53 = load i16** %52, align 8
  %54 = getelementptr inbounds i16* %53, i64 %51
  %55 = load i16* %54, align 2
  %56 = zext i16 %55 to i32
  %57 = and i32 %56, 8192
  %58 = icmp ne i32 %57, 0
  br i1 %58, label %62, label %59

; <label>:59                                      ; preds = %49
  %60 = load i32* %cha, align 4
  %61 = icmp ne i32 %60, -1
  br label %62

; <label>:62                                      ; preds = %59, %49
  %63 = phi i1 [ false, %49 ], [ %61, %59 ]
  br i1 %63, label %39, label %64

; <label>:64                                      ; preds = %62
  br label %65

; <label>:65                                      ; preds = %64
  %66 = load i32* %cha, align 4
  %67 = icmp eq i32 %66, -1
  br i1 %67, label %68, label %69

; <label>:68                                      ; preds = %65
  store i16 1, i16* %end, align 2
  br label %69

; <label>:69                                      ; preds = %68, %65
  %70 = load i32* %i, align 4
  %71 = sext i32 %70 to i64
  %72 = load i8** %3, align 8
  %73 = getelementptr inbounds i8* %72, i64 %71
  store i8 0, i8* %73, align 1
  %74 = load i16* %end, align 2
  %75 = sext i16 %74 to i32
  store i32 %75, i32* %1
  br label %76

; <label>:76                                      ; preds = %69, %37
  %77 = load i32* %1
  ret i32 %77
}

declare i32 @fgetc(%struct._IO_FILE*) #2

; Function Attrs: nounwind readnone
declare i16** @__ctype_b_loc() #4

; Function Attrs: nounwind uwtable
define float*** @read_color_image(i8* %fname, i32* %m, i32* %n) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i32*, align 8
  %3 = alloca i32*, align 8
  %c = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %Max = alloca i32, align 4
  %img = alloca float***, align 8
  %word = alloca [10 x i8], align 1
  %fp = alloca %struct._IO_FILE*, align 8
  %magic = alloca [4 x i8], align 1
  store i8* %fname, i8** %1, align 8
  store i32* %m, i32** %2, align 8
  store i32* %n, i32** %3, align 8
  %4 = load i8** %1, align 8
  %5 = call %struct._IO_FILE* @fopen(i8* %4, i8* getelementptr inbounds ([2 x i8]* @.str9, i32 0, i32 0))
  store %struct._IO_FILE* %5, %struct._IO_FILE** %fp, align 8
  %6 = icmp eq %struct._IO_FILE* %5, null
  br i1 %6, label %7, label %10

; <label>:7                                       ; preds = %0
  %8 = load i8** %1, align 8
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([47 x i8]* @.str10, i32 0, i32 0), i8* %8)
  call void @exit(i32 0) #7
  unreachable

; <label>:10                                      ; preds = %0
  %11 = load %struct._IO_FILE** %fp, align 8
  %12 = getelementptr inbounds [10 x i8]* %word, i32 0, i32 0
  %13 = call i32 @getword(%struct._IO_FILE* %11, i8* %12)
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %15, label %16

; <label>:15                                      ; preds = %10
  call void @eof_err()
  br label %16

; <label>:16                                      ; preds = %15, %10
  %17 = getelementptr inbounds [4 x i8]* %magic, i32 0, i32 0
  %18 = getelementptr inbounds [10 x i8]* %word, i32 0, i32 0
  %19 = call i8* @strcpy(i8* %17, i8* %18) #6
  %20 = getelementptr inbounds [4 x i8]* %magic, i32 0, i32 0
  %21 = call i32 @strcmp(i8* %20, i8* getelementptr inbounds ([3 x i8]* @.str11, i32 0, i32 0)) #9
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %23, label %30

; <label>:23                                      ; preds = %16
  %24 = getelementptr inbounds [4 x i8]* %magic, i32 0, i32 0
  %25 = call i32 @strcmp(i8* %24, i8* getelementptr inbounds ([3 x i8]* @.str12, i32 0, i32 0)) #9
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %27, label %30

; <label>:27                                      ; preds = %23
  %28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([59 x i8]* @.str13, i32 0, i32 0))
  %29 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str14, i32 0, i32 0))
  call void @exit(i32 0) #7
  unreachable

; <label>:30                                      ; preds = %23, %16
  %31 = load %struct._IO_FILE** %fp, align 8
  %32 = getelementptr inbounds [10 x i8]* %word, i32 0, i32 0
  %33 = call i32 @getword(%struct._IO_FILE* %31, i8* %32)
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %35, label %36

; <label>:35                                      ; preds = %30
  call void @eof_err()
  br label %36

; <label>:36                                      ; preds = %35, %30
  %37 = getelementptr inbounds [10 x i8]* %word, i32 0, i32 0
  %38 = call i32 @atoi(i8* %37) #9
  %39 = load i32** %3, align 8
  store i32 %38, i32* %39, align 4
  %40 = load %struct._IO_FILE** %fp, align 8
  %41 = getelementptr inbounds [10 x i8]* %word, i32 0, i32 0
  %42 = call i32 @getword(%struct._IO_FILE* %40, i8* %41)
  %43 = icmp ne i32 %42, 0
  br i1 %43, label %44, label %45

; <label>:44                                      ; preds = %36
  call void @eof_err()
  br label %45

; <label>:45                                      ; preds = %44, %36
  %46 = getelementptr inbounds [10 x i8]* %word, i32 0, i32 0
  %47 = call i32 @atoi(i8* %46) #9
  %48 = load i32** %2, align 8
  store i32 %47, i32* %48, align 4
  %49 = load %struct._IO_FILE** %fp, align 8
  %50 = getelementptr inbounds [10 x i8]* %word, i32 0, i32 0
  %51 = call i32 @getword(%struct._IO_FILE* %49, i8* %50)
  %52 = icmp ne i32 %51, 0
  br i1 %52, label %53, label %54

; <label>:53                                      ; preds = %45
  call void @eof_err()
  br label %54

; <label>:54                                      ; preds = %53, %45
  %55 = getelementptr inbounds [10 x i8]* %word, i32 0, i32 0
  %56 = call i32 @atoi(i8* %55) #9
  store i32 %56, i32* %Max, align 4
  %57 = load i32** %2, align 8
  %58 = load i32* %57, align 4
  %59 = load i32** %3, align 8
  %60 = load i32* %59, align 4
  %61 = call float*** @alloc3df(i32 3, i32 %58, i32 %60)
  store float*** %61, float**** %img, align 8
  store i32 0, i32* %i, align 4
  br label %62

; <label>:62                                      ; preds = %106, %54
  %63 = load i32* %i, align 4
  %64 = load i32** %2, align 8
  %65 = load i32* %64, align 4
  %66 = icmp slt i32 %63, %65
  br i1 %66, label %67, label %109

; <label>:67                                      ; preds = %62
  store i32 0, i32* %j, align 4
  br label %68

; <label>:68                                      ; preds = %102, %67
  %69 = load i32* %j, align 4
  %70 = load i32** %3, align 8
  %71 = load i32* %70, align 4
  %72 = icmp slt i32 %69, %71
  br i1 %72, label %73, label %105

; <label>:73                                      ; preds = %68
  store i32 0, i32* %k, align 4
  br label %74

; <label>:74                                      ; preds = %98, %73
  %75 = load i32* %k, align 4
  %76 = icmp slt i32 %75, 3
  br i1 %76, label %77, label %101

; <label>:77                                      ; preds = %74
  %78 = load %struct._IO_FILE** %fp, align 8
  %79 = call i32 @fgetc(%struct._IO_FILE* %78)
  store i32 %79, i32* %c, align 4
  %80 = load i32* %c, align 4
  %81 = icmp eq i32 %80, -1
  br i1 %81, label %82, label %83

; <label>:82                                      ; preds = %77
  call void @eof_err()
  br label %83

; <label>:83                                      ; preds = %82, %77
  %84 = load i32* %c, align 4
  %85 = sitofp i32 %84 to float
  %86 = load i32* %j, align 4
  %87 = sext i32 %86 to i64
  %88 = load i32* %i, align 4
  %89 = sext i32 %88 to i64
  %90 = load i32* %k, align 4
  %91 = sext i32 %90 to i64
  %92 = load float**** %img, align 8
  %93 = getelementptr inbounds float*** %92, i64 %91
  %94 = load float*** %93, align 8
  %95 = getelementptr inbounds float** %94, i64 %89
  %96 = load float** %95, align 8
  %97 = getelementptr inbounds float* %96, i64 %87
  store float %85, float* %97, align 4
  br label %98

; <label>:98                                      ; preds = %83
  %99 = load i32* %k, align 4
  %100 = add nsw i32 %99, 1
  store i32 %100, i32* %k, align 4
  br label %74

; <label>:101                                     ; preds = %74
  br label %102

; <label>:102                                     ; preds = %101
  %103 = load i32* %j, align 4
  %104 = add nsw i32 %103, 1
  store i32 %104, i32* %j, align 4
  br label %68

; <label>:105                                     ; preds = %68
  br label %106

; <label>:106                                     ; preds = %105
  %107 = load i32* %i, align 4
  %108 = add nsw i32 %107, 1
  store i32 %108, i32* %i, align 4
  br label %62

; <label>:109                                     ; preds = %62
  %110 = load %struct._IO_FILE** %fp, align 8
  %111 = call i32 @fclose(%struct._IO_FILE* %110)
  %112 = load float**** %img, align 8
  ret float*** %112
}

declare %struct._IO_FILE* @fopen(i8*, i8*) #2

; Function Attrs: nounwind
declare i8* @strcpy(i8*, i8*) #1

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #5

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #5

declare i32 @fclose(%struct._IO_FILE*) #2

; Function Attrs: nounwind uwtable
define float** @read_bw_image(i8* %fname, i32* %m, i32* %n) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i32*, align 8
  %3 = alloca i32*, align 8
  %c = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %Max = alloca i32, align 4
  %img = alloca float**, align 8
  %word = alloca [10 x i8], align 1
  %fp = alloca %struct._IO_FILE*, align 8
  %magic = alloca [4 x i8], align 1
  store i8* %fname, i8** %1, align 8
  store i32* %m, i32** %2, align 8
  store i32* %n, i32** %3, align 8
  %4 = load i8** %1, align 8
  %5 = call %struct._IO_FILE* @fopen(i8* %4, i8* getelementptr inbounds ([2 x i8]* @.str9, i32 0, i32 0))
  store %struct._IO_FILE* %5, %struct._IO_FILE** %fp, align 8
  %6 = icmp eq %struct._IO_FILE* %5, null
  br i1 %6, label %7, label %10

; <label>:7                                       ; preds = %0
  %8 = load i8** %1, align 8
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([47 x i8]* @.str10, i32 0, i32 0), i8* %8)
  call void @exit(i32 0) #7
  unreachable

; <label>:10                                      ; preds = %0
  %11 = load %struct._IO_FILE** %fp, align 8
  %12 = getelementptr inbounds [10 x i8]* %word, i32 0, i32 0
  %13 = call i32 @getword(%struct._IO_FILE* %11, i8* %12)
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %15, label %16

; <label>:15                                      ; preds = %10
  call void @eof_err()
  br label %16

; <label>:16                                      ; preds = %15, %10
  %17 = getelementptr inbounds [4 x i8]* %magic, i32 0, i32 0
  %18 = getelementptr inbounds [10 x i8]* %word, i32 0, i32 0
  %19 = call i8* @strcpy(i8* %17, i8* %18) #6
  %20 = getelementptr inbounds [4 x i8]* %magic, i32 0, i32 0
  %21 = call i32 @strcmp(i8* %20, i8* getelementptr inbounds ([3 x i8]* @.str11, i32 0, i32 0)) #9
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %23, label %30

; <label>:23                                      ; preds = %16
  %24 = getelementptr inbounds [4 x i8]* %magic, i32 0, i32 0
  %25 = call i32 @strcmp(i8* %24, i8* getelementptr inbounds ([3 x i8]* @.str12, i32 0, i32 0)) #9
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %27, label %30

; <label>:27                                      ; preds = %23
  %28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([59 x i8]* @.str13, i32 0, i32 0))
  %29 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str14, i32 0, i32 0))
  call void @exit(i32 0) #7
  unreachable

; <label>:30                                      ; preds = %23, %16
  %31 = load %struct._IO_FILE** %fp, align 8
  %32 = getelementptr inbounds [10 x i8]* %word, i32 0, i32 0
  %33 = call i32 @getword(%struct._IO_FILE* %31, i8* %32)
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %35, label %36

; <label>:35                                      ; preds = %30
  call void @eof_err()
  br label %36

; <label>:36                                      ; preds = %35, %30
  %37 = getelementptr inbounds [10 x i8]* %word, i32 0, i32 0
  %38 = call i32 @atoi(i8* %37) #9
  %39 = load i32** %3, align 8
  store i32 %38, i32* %39, align 4
  %40 = load %struct._IO_FILE** %fp, align 8
  %41 = getelementptr inbounds [10 x i8]* %word, i32 0, i32 0
  %42 = call i32 @getword(%struct._IO_FILE* %40, i8* %41)
  %43 = icmp ne i32 %42, 0
  br i1 %43, label %44, label %45

; <label>:44                                      ; preds = %36
  call void @eof_err()
  br label %45

; <label>:45                                      ; preds = %44, %36
  %46 = getelementptr inbounds [10 x i8]* %word, i32 0, i32 0
  %47 = call i32 @atoi(i8* %46) #9
  %48 = load i32** %2, align 8
  store i32 %47, i32* %48, align 4
  %49 = load %struct._IO_FILE** %fp, align 8
  %50 = getelementptr inbounds [10 x i8]* %word, i32 0, i32 0
  %51 = call i32 @getword(%struct._IO_FILE* %49, i8* %50)
  %52 = icmp ne i32 %51, 0
  br i1 %52, label %53, label %54

; <label>:53                                      ; preds = %45
  call void @eof_err()
  br label %54

; <label>:54                                      ; preds = %53, %45
  %55 = getelementptr inbounds [10 x i8]* %word, i32 0, i32 0
  %56 = call i32 @atoi(i8* %55) #9
  store i32 %56, i32* %Max, align 4
  %57 = load i32** %2, align 8
  %58 = load i32* %57, align 4
  %59 = load i32** %3, align 8
  %60 = load i32* %59, align 4
  %61 = call float** @alloc2df(i32 %58, i32 %60)
  store float** %61, float*** %img, align 8
  store i32 0, i32* %i, align 4
  br label %62

; <label>:62                                      ; preds = %94, %54
  %63 = load i32* %i, align 4
  %64 = load i32** %2, align 8
  %65 = load i32* %64, align 4
  %66 = icmp slt i32 %63, %65
  br i1 %66, label %67, label %97

; <label>:67                                      ; preds = %62
  store i32 0, i32* %j, align 4
  br label %68

; <label>:68                                      ; preds = %90, %67
  %69 = load i32* %j, align 4
  %70 = load i32** %3, align 8
  %71 = load i32* %70, align 4
  %72 = icmp slt i32 %69, %71
  br i1 %72, label %73, label %93

; <label>:73                                      ; preds = %68
  %74 = load %struct._IO_FILE** %fp, align 8
  %75 = call i32 @fgetc(%struct._IO_FILE* %74)
  store i32 %75, i32* %c, align 4
  %76 = load i32* %c, align 4
  %77 = icmp eq i32 %76, -1
  br i1 %77, label %78, label %79

; <label>:78                                      ; preds = %73
  call void @eof_err()
  br label %79

; <label>:79                                      ; preds = %78, %73
  %80 = load i32* %c, align 4
  %81 = sitofp i32 %80 to float
  %82 = load i32* %j, align 4
  %83 = sext i32 %82 to i64
  %84 = load i32* %i, align 4
  %85 = sext i32 %84 to i64
  %86 = load float*** %img, align 8
  %87 = getelementptr inbounds float** %86, i64 %85
  %88 = load float** %87, align 8
  %89 = getelementptr inbounds float* %88, i64 %83
  store float %81, float* %89, align 4
  br label %90

; <label>:90                                      ; preds = %79
  %91 = load i32* %j, align 4
  %92 = add nsw i32 %91, 1
  store i32 %92, i32* %j, align 4
  br label %68

; <label>:93                                      ; preds = %68
  br label %94

; <label>:94                                      ; preds = %93
  %95 = load i32* %i, align 4
  %96 = add nsw i32 %95, 1
  store i32 %96, i32* %i, align 4
  br label %62

; <label>:97                                      ; preds = %62
  %98 = load %struct._IO_FILE** %fp, align 8
  %99 = call i32 @fclose(%struct._IO_FILE* %98)
  %100 = load float*** %img, align 8
  ret float** %100
}

; Function Attrs: nounwind uwtable
define void @write_color_image(i8* %filename, float*** %image, i32 %m, i32 %n, i32 %s) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca float***, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  %v = alloca float, align 4
  %min = alloca float, align 4
  %max = alloca float, align 4
  %Image = alloca float***, align 8
  %w = alloca i8, align 1
  %fp = alloca %struct._IO_FILE*, align 8
  store i8* %filename, i8** %1, align 8
  store float*** %image, float**** %2, align 8
  store i32 %m, i32* %3, align 4
  store i32 %n, i32* %4, align 4
  store i32 %s, i32* %5, align 4
  store float 0x4200C388C0000000, float* %min, align 4
  %6 = load float* %min, align 4
  %7 = fsub float -0.000000e+00, %6
  store float %7, float* %max, align 4
  store i32 0, i32* %k, align 4
  br label %8

; <label>:8                                       ; preds = %55, %0
  %9 = load i32* %k, align 4
  %10 = icmp slt i32 %9, 3
  br i1 %10, label %11, label %58

; <label>:11                                      ; preds = %8
  store i32 0, i32* %i, align 4
  br label %12

; <label>:12                                      ; preds = %51, %11
  %13 = load i32* %i, align 4
  %14 = load i32* %3, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %54

; <label>:16                                      ; preds = %12
  store i32 0, i32* %j, align 4
  br label %17

; <label>:17                                      ; preds = %47, %16
  %18 = load i32* %j, align 4
  %19 = load i32* %4, align 4
  %20 = icmp slt i32 %18, %19
  br i1 %20, label %21, label %50

; <label>:21                                      ; preds = %17
  %22 = load i32* %j, align 4
  %23 = sext i32 %22 to i64
  %24 = load i32* %i, align 4
  %25 = sext i32 %24 to i64
  %26 = load i32* %k, align 4
  %27 = sext i32 %26 to i64
  %28 = load float**** %2, align 8
  %29 = getelementptr inbounds float*** %28, i64 %27
  %30 = load float*** %29, align 8
  %31 = getelementptr inbounds float** %30, i64 %25
  %32 = load float** %31, align 8
  %33 = getelementptr inbounds float* %32, i64 %23
  %34 = load float* %33, align 4
  store float %34, float* %v, align 4
  %35 = load float* %min, align 4
  %36 = load float* %v, align 4
  %37 = fcmp ogt float %35, %36
  br i1 %37, label %38, label %40

; <label>:38                                      ; preds = %21
  %39 = load float* %v, align 4
  store float %39, float* %min, align 4
  br label %40

; <label>:40                                      ; preds = %38, %21
  %41 = load float* %max, align 4
  %42 = load float* %v, align 4
  %43 = fcmp olt float %41, %42
  br i1 %43, label %44, label %46

; <label>:44                                      ; preds = %40
  %45 = load float* %v, align 4
  store float %45, float* %max, align 4
  br label %46

; <label>:46                                      ; preds = %44, %40
  br label %47

; <label>:47                                      ; preds = %46
  %48 = load i32* %j, align 4
  %49 = add nsw i32 %48, 1
  store i32 %49, i32* %j, align 4
  br label %17

; <label>:50                                      ; preds = %17
  br label %51

; <label>:51                                      ; preds = %50
  %52 = load i32* %i, align 4
  %53 = add nsw i32 %52, 1
  store i32 %53, i32* %i, align 4
  br label %12

; <label>:54                                      ; preds = %12
  br label %55

; <label>:55                                      ; preds = %54
  %56 = load i32* %k, align 4
  %57 = add nsw i32 %56, 1
  store i32 %57, i32* %k, align 4
  br label %8

; <label>:58                                      ; preds = %8
  %59 = load float* %max, align 4
  %60 = load float* %min, align 4
  %61 = fsub float %59, %60
  %62 = fpext float %61 to double
  %63 = fdiv double 2.549900e+02, %62
  %64 = fptrunc double %63 to float
  store float %64, float* %v, align 4
  store i32 0, i32* %k, align 4
  br label %65

; <label>:65                                      ; preds = %116, %58
  %66 = load i32* %k, align 4
  %67 = icmp slt i32 %66, 3
  br i1 %67, label %68, label %119

; <label>:68                                      ; preds = %65
  store i32 0, i32* %i, align 4
  br label %69

; <label>:69                                      ; preds = %112, %68
  %70 = load i32* %i, align 4
  %71 = load i32* %3, align 4
  %72 = icmp slt i32 %70, %71
  br i1 %72, label %73, label %115

; <label>:73                                      ; preds = %69
  store i32 0, i32* %j, align 4
  br label %74

; <label>:74                                      ; preds = %108, %73
  %75 = load i32* %j, align 4
  %76 = load i32* %4, align 4
  %77 = icmp slt i32 %75, %76
  br i1 %77, label %78, label %111

; <label>:78                                      ; preds = %74
  %79 = load float* %v, align 4
  %80 = load i32* %j, align 4
  %81 = sext i32 %80 to i64
  %82 = load i32* %i, align 4
  %83 = sext i32 %82 to i64
  %84 = load i32* %k, align 4
  %85 = sext i32 %84 to i64
  %86 = load float**** %2, align 8
  %87 = getelementptr inbounds float*** %86, i64 %85
  %88 = load float*** %87, align 8
  %89 = getelementptr inbounds float** %88, i64 %83
  %90 = load float** %89, align 8
  %91 = getelementptr inbounds float* %90, i64 %81
  %92 = load float* %91, align 4
  %93 = load float* %min, align 4
  %94 = fsub float %92, %93
  %95 = fmul float %79, %94
  %96 = load i32* %j, align 4
  %97 = sext i32 %96 to i64
  %98 = load i32* %i, align 4
  %99 = sext i32 %98 to i64
  %100 = load i32* %k, align 4
  %101 = sext i32 %100 to i64
  %102 = load float**** %2, align 8
  %103 = getelementptr inbounds float*** %102, i64 %101
  %104 = load float*** %103, align 8
  %105 = getelementptr inbounds float** %104, i64 %99
  %106 = load float** %105, align 8
  %107 = getelementptr inbounds float* %106, i64 %97
  store float %95, float* %107, align 4
  br label %108

; <label>:108                                     ; preds = %78
  %109 = load i32* %j, align 4
  %110 = add nsw i32 %109, 1
  store i32 %110, i32* %j, align 4
  br label %74

; <label>:111                                     ; preds = %74
  br label %112

; <label>:112                                     ; preds = %111
  %113 = load i32* %i, align 4
  %114 = add nsw i32 %113, 1
  store i32 %114, i32* %i, align 4
  br label %69

; <label>:115                                     ; preds = %69
  br label %116

; <label>:116                                     ; preds = %115
  %117 = load i32* %k, align 4
  %118 = add nsw i32 %117, 1
  store i32 %118, i32* %k, align 4
  br label %65

; <label>:119                                     ; preds = %65
  %120 = load float* %min, align 4
  %121 = fpext float %120 to double
  %122 = load float* %max, align 4
  %123 = fpext float %122 to double
  %124 = load float* %v, align 4
  %125 = fpext float %124 to double
  %126 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str15, i32 0, i32 0), double %121, double %123, double %125)
  %127 = load i8** %1, align 8
  %128 = call %struct._IO_FILE* @fopen(i8* %127, i8* getelementptr inbounds ([2 x i8]* @.str16, i32 0, i32 0))
  store %struct._IO_FILE* %128, %struct._IO_FILE** %fp, align 8
  %129 = icmp eq %struct._IO_FILE* %128, null
  br i1 %129, label %130, label %134

; <label>:130                                     ; preds = %119
  %131 = load %struct._IO_FILE** @stderr, align 8
  %132 = load i8** %1, align 8
  %133 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %131, i8* getelementptr inbounds ([47 x i8]* @.str17, i32 0, i32 0), i8* %132)
  call void @exit(i32 0) #7
  unreachable

; <label>:134                                     ; preds = %119
  %135 = load %struct._IO_FILE** %fp, align 8
  %136 = load i32* %5, align 4
  %137 = load i32* %4, align 4
  %138 = mul nsw i32 %136, %137
  %139 = load i32* %5, align 4
  %140 = load i32* %3, align 4
  %141 = mul nsw i32 %139, %140
  %142 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %135, i8* getelementptr inbounds ([13 x i8]* @.str18, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str12, i32 0, i32 0), i32 %138, i32 %141, i32 255)
  store i32 0, i32* %i, align 4
  br label %143

; <label>:143                                     ; preds = %220, %134
  %144 = load i32* %i, align 4
  %145 = load i32* %3, align 4
  %146 = icmp slt i32 %144, %145
  br i1 %146, label %147, label %223

; <label>:147                                     ; preds = %143
  store i32 0, i32* %k, align 4
  br label %148

; <label>:148                                     ; preds = %216, %147
  %149 = load i32* %k, align 4
  %150 = load i32* %5, align 4
  %151 = icmp slt i32 %149, %150
  br i1 %151, label %152, label %219

; <label>:152                                     ; preds = %148
  store i32 0, i32* %j, align 4
  br label %153

; <label>:153                                     ; preds = %212, %152
  %154 = load i32* %j, align 4
  %155 = load i32* %4, align 4
  %156 = icmp slt i32 %154, %155
  br i1 %156, label %157, label %215

; <label>:157                                     ; preds = %153
  store i32 0, i32* %l, align 4
  br label %158

; <label>:158                                     ; preds = %208, %157
  %159 = load i32* %l, align 4
  %160 = load i32* %5, align 4
  %161 = icmp slt i32 %159, %160
  br i1 %161, label %162, label %211

; <label>:162                                     ; preds = %158
  %163 = load i32* %j, align 4
  %164 = sext i32 %163 to i64
  %165 = load i32* %i, align 4
  %166 = sext i32 %165 to i64
  %167 = load float**** %2, align 8
  %168 = getelementptr inbounds float*** %167, i64 0
  %169 = load float*** %168, align 8
  %170 = getelementptr inbounds float** %169, i64 %166
  %171 = load float** %170, align 8
  %172 = getelementptr inbounds float* %171, i64 %164
  %173 = load float* %172, align 4
  %174 = fptoui float %173 to i8
  store i8 %174, i8* %w, align 1
  %175 = zext i8 %174 to i32
  %176 = load %struct._IO_FILE** %fp, align 8
  %177 = call i32 @_IO_putc(i32 %175, %struct._IO_FILE* %176)
  %178 = load i32* %j, align 4
  %179 = sext i32 %178 to i64
  %180 = load i32* %i, align 4
  %181 = sext i32 %180 to i64
  %182 = load float**** %2, align 8
  %183 = getelementptr inbounds float*** %182, i64 1
  %184 = load float*** %183, align 8
  %185 = getelementptr inbounds float** %184, i64 %181
  %186 = load float** %185, align 8
  %187 = getelementptr inbounds float* %186, i64 %179
  %188 = load float* %187, align 4
  %189 = fptoui float %188 to i8
  store i8 %189, i8* %w, align 1
  %190 = zext i8 %189 to i32
  %191 = load %struct._IO_FILE** %fp, align 8
  %192 = call i32 @_IO_putc(i32 %190, %struct._IO_FILE* %191)
  %193 = load i32* %j, align 4
  %194 = sext i32 %193 to i64
  %195 = load i32* %i, align 4
  %196 = sext i32 %195 to i64
  %197 = load float**** %2, align 8
  %198 = getelementptr inbounds float*** %197, i64 2
  %199 = load float*** %198, align 8
  %200 = getelementptr inbounds float** %199, i64 %196
  %201 = load float** %200, align 8
  %202 = getelementptr inbounds float* %201, i64 %194
  %203 = load float* %202, align 4
  %204 = fptoui float %203 to i8
  store i8 %204, i8* %w, align 1
  %205 = zext i8 %204 to i32
  %206 = load %struct._IO_FILE** %fp, align 8
  %207 = call i32 @_IO_putc(i32 %205, %struct._IO_FILE* %206)
  br label %208

; <label>:208                                     ; preds = %162
  %209 = load i32* %l, align 4
  %210 = add nsw i32 %209, 1
  store i32 %210, i32* %l, align 4
  br label %158

; <label>:211                                     ; preds = %158
  br label %212

; <label>:212                                     ; preds = %211
  %213 = load i32* %j, align 4
  %214 = add nsw i32 %213, 1
  store i32 %214, i32* %j, align 4
  br label %153

; <label>:215                                     ; preds = %153
  br label %216

; <label>:216                                     ; preds = %215
  %217 = load i32* %k, align 4
  %218 = add nsw i32 %217, 1
  store i32 %218, i32* %k, align 4
  br label %148

; <label>:219                                     ; preds = %148
  br label %220

; <label>:220                                     ; preds = %219
  %221 = load i32* %i, align 4
  %222 = add nsw i32 %221, 1
  store i32 %222, i32* %i, align 4
  br label %143

; <label>:223                                     ; preds = %143
  %224 = load %struct._IO_FILE** %fp, align 8
  %225 = call i32 @fclose(%struct._IO_FILE* %224)
  ret void
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

declare i32 @_IO_putc(i32, %struct._IO_FILE*) #2

; Function Attrs: nounwind uwtable
define void @write_bw_image(i8* %filename, float** %image, i32 %m, i32 %n, i32 %s) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca float**, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  %v = alloca float, align 4
  %min = alloca float, align 4
  %max = alloca float, align 4
  %w = alloca i8, align 1
  %fp = alloca %struct._IO_FILE*, align 8
  store i8* %filename, i8** %1, align 8
  store float** %image, float*** %2, align 8
  store i32 %m, i32* %3, align 4
  store i32 %n, i32* %4, align 4
  store i32 %s, i32* %5, align 4
  %6 = load i8** %1, align 8
  %7 = load i32* %3, align 4
  %8 = load i32* %4, align 4
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([47 x i8]* @.str19, i32 0, i32 0), i8* %6, i32 %7, i32 %8)
  store float 0x4200C388C0000000, float* %min, align 4
  %10 = load float* %min, align 4
  %11 = fsub float -0.000000e+00, %10
  store float %11, float* %max, align 4
  store i32 0, i32* %i, align 4
  br label %12

; <label>:12                                      ; preds = %47, %0
  %13 = load i32* %i, align 4
  %14 = load i32* %3, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %50

; <label>:16                                      ; preds = %12
  store i32 0, i32* %j, align 4
  br label %17

; <label>:17                                      ; preds = %43, %16
  %18 = load i32* %j, align 4
  %19 = load i32* %4, align 4
  %20 = icmp slt i32 %18, %19
  br i1 %20, label %21, label %46

; <label>:21                                      ; preds = %17
  %22 = load i32* %j, align 4
  %23 = sext i32 %22 to i64
  %24 = load i32* %i, align 4
  %25 = sext i32 %24 to i64
  %26 = load float*** %2, align 8
  %27 = getelementptr inbounds float** %26, i64 %25
  %28 = load float** %27, align 8
  %29 = getelementptr inbounds float* %28, i64 %23
  %30 = load float* %29, align 4
  store float %30, float* %v, align 4
  %31 = load float* %min, align 4
  %32 = load float* %v, align 4
  %33 = fcmp ogt float %31, %32
  br i1 %33, label %34, label %36

; <label>:34                                      ; preds = %21
  %35 = load float* %v, align 4
  store float %35, float* %min, align 4
  br label %36

; <label>:36                                      ; preds = %34, %21
  %37 = load float* %max, align 4
  %38 = load float* %v, align 4
  %39 = fcmp olt float %37, %38
  br i1 %39, label %40, label %42

; <label>:40                                      ; preds = %36
  %41 = load float* %v, align 4
  store float %41, float* %max, align 4
  br label %42

; <label>:42                                      ; preds = %40, %36
  br label %43

; <label>:43                                      ; preds = %42
  %44 = load i32* %j, align 4
  %45 = add nsw i32 %44, 1
  store i32 %45, i32* %j, align 4
  br label %17

; <label>:46                                      ; preds = %17
  br label %47

; <label>:47                                      ; preds = %46
  %48 = load i32* %i, align 4
  %49 = add nsw i32 %48, 1
  store i32 %49, i32* %i, align 4
  br label %12

; <label>:50                                      ; preds = %12
  %51 = load float* %max, align 4
  %52 = load float* %min, align 4
  %53 = fsub float %51, %52
  %54 = fpext float %53 to double
  %55 = fdiv double 2.549900e+02, %54
  %56 = fptrunc double %55 to float
  store float %56, float* %v, align 4
  %57 = load float* %min, align 4
  %58 = fpext float %57 to double
  %59 = load float* %max, align 4
  %60 = fpext float %59 to double
  %61 = load float* %v, align 4
  %62 = fpext float %61 to double
  %63 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([35 x i8]* @.str20, i32 0, i32 0), double %58, double %60, double %62)
  %64 = load i8** %1, align 8
  %65 = call %struct._IO_FILE* @fopen(i8* %64, i8* getelementptr inbounds ([2 x i8]* @.str16, i32 0, i32 0))
  store %struct._IO_FILE* %65, %struct._IO_FILE** %fp, align 8
  %66 = icmp eq %struct._IO_FILE* %65, null
  br i1 %66, label %67, label %71

; <label>:67                                      ; preds = %50
  %68 = load %struct._IO_FILE** @stderr, align 8
  %69 = load i8** %1, align 8
  %70 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %68, i8* getelementptr inbounds ([47 x i8]* @.str17, i32 0, i32 0), i8* %69)
  call void @exit(i32 0) #7
  unreachable

; <label>:71                                      ; preds = %50
  %72 = load %struct._IO_FILE** %fp, align 8
  %73 = load i32* %5, align 4
  %74 = load i32* %4, align 4
  %75 = mul nsw i32 %73, %74
  %76 = load i32* %5, align 4
  %77 = load i32* %3, align 4
  %78 = mul nsw i32 %76, %77
  %79 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %72, i8* getelementptr inbounds ([13 x i8]* @.str18, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str11, i32 0, i32 0), i32 %75, i32 %78, i32 255)
  store i32 0, i32* %i, align 4
  br label %80

; <label>:80                                      ; preds = %129, %71
  %81 = load i32* %i, align 4
  %82 = load i32* %3, align 4
  %83 = icmp slt i32 %81, %82
  br i1 %83, label %84, label %132

; <label>:84                                      ; preds = %80
  store i32 0, i32* %l, align 4
  br label %85

; <label>:85                                      ; preds = %125, %84
  %86 = load i32* %l, align 4
  %87 = load i32* %5, align 4
  %88 = icmp slt i32 %86, %87
  br i1 %88, label %89, label %128

; <label>:89                                      ; preds = %85
  store i32 0, i32* %j, align 4
  br label %90

; <label>:90                                      ; preds = %121, %89
  %91 = load i32* %j, align 4
  %92 = load i32* %4, align 4
  %93 = icmp slt i32 %91, %92
  br i1 %93, label %94, label %124

; <label>:94                                      ; preds = %90
  store i32 0, i32* %k, align 4
  br label %95

; <label>:95                                      ; preds = %117, %94
  %96 = load i32* %k, align 4
  %97 = load i32* %5, align 4
  %98 = icmp slt i32 %96, %97
  br i1 %98, label %99, label %120

; <label>:99                                      ; preds = %95
  %100 = load i32* %j, align 4
  %101 = sext i32 %100 to i64
  %102 = load i32* %i, align 4
  %103 = sext i32 %102 to i64
  %104 = load float*** %2, align 8
  %105 = getelementptr inbounds float** %104, i64 %103
  %106 = load float** %105, align 8
  %107 = getelementptr inbounds float* %106, i64 %101
  %108 = load float* %107, align 4
  %109 = load float* %min, align 4
  %110 = fsub float %108, %109
  %111 = load float* %v, align 4
  %112 = fmul float %110, %111
  %113 = fptoui float %112 to i8
  store i8 %113, i8* %w, align 1
  %114 = zext i8 %113 to i32
  %115 = load %struct._IO_FILE** %fp, align 8
  %116 = call i32 @_IO_putc(i32 %114, %struct._IO_FILE* %115)
  br label %117

; <label>:117                                     ; preds = %99
  %118 = load i32* %k, align 4
  %119 = add nsw i32 %118, 1
  store i32 %119, i32* %k, align 4
  br label %95

; <label>:120                                     ; preds = %95
  br label %121

; <label>:121                                     ; preds = %120
  %122 = load i32* %j, align 4
  %123 = add nsw i32 %122, 1
  store i32 %123, i32* %j, align 4
  br label %90

; <label>:124                                     ; preds = %90
  br label %125

; <label>:125                                     ; preds = %124
  %126 = load i32* %l, align 4
  %127 = add nsw i32 %126, 1
  store i32 %127, i32* %l, align 4
  br label %85

; <label>:128                                     ; preds = %85
  br label %129

; <label>:129                                     ; preds = %128
  %130 = load i32* %i, align 4
  %131 = add nsw i32 %130, 1
  store i32 %131, i32* %i, align 4
  br label %80

; <label>:132                                     ; preds = %80
  %133 = load %struct._IO_FILE** %fp, align 8
  %134 = call i32 @fclose(%struct._IO_FILE* %133)
  ret void
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }
attributes #8 = { nounwind readnone }
attributes #9 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4 (tags/RELEASE_34/final)"}
