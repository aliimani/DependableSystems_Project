; ModuleID = 'process.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str1 = private unnamed_addr constant [5 x i8] c".png\00", align 1
@stdout = external global %struct._IO_FILE*
@.str2 = private unnamed_addr constant [35 x i8] c"Loading the file into memory...\0A\0A\0A\00", align 1
@.str3 = private unnamed_addr constant [29 x i8] c"Error (%u) loading file: %s\0A\00", align 1
@.str4 = private unnamed_addr constant [20 x i8] c"_detected_edges.png\00", align 1
@.str5 = private unnamed_addr constant [30 x i8] c"Error (%u) saving file: %s\0A\0A\0A\00", align 1
@.str6 = private unnamed_addr constant [42 x i8] c"The file was successfully saved as %s.\0A\0A\0A\00", align 1
@fname = common global [50 x i8] zeroinitializer, align 16
@fp = common global %struct._IO_FILE* null, align 8

; Function Attrs: nounwind uwtable
define float*** @png_to_ppm(i8* %image, i32 %width, i32 %height) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %img = alloca float***, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i8* %image, i8** %1, align 8
  store i32 %width, i32* %2, align 4
  store i32 %height, i32* %3, align 4
  %4 = load i32* %3, align 4
  %5 = load i32* %2, align 4
  %6 = call float*** @alloc3df(i32 3, i32 %4, i32 %5)
  store float*** %6, float**** %img, align 8
  store i32 0, i32* %i, align 4
  br label %7

; <label>:7                                       ; preds = %90, %0
  %8 = load i32* %i, align 4
  %9 = load i32* %3, align 4
  %10 = icmp ult i32 %8, %9
  br i1 %10, label %11, label %93

; <label>:11                                      ; preds = %7
  store i32 0, i32* %j, align 4
  br label %12

; <label>:12                                      ; preds = %86, %11
  %13 = load i32* %j, align 4
  %14 = load i32* %2, align 4
  %15 = icmp ult i32 %13, %14
  br i1 %15, label %16, label %89

; <label>:16                                      ; preds = %12
  %17 = load i32* %i, align 4
  %18 = mul nsw i32 3, %17
  %19 = load i32* %2, align 4
  %20 = mul i32 %18, %19
  %21 = load i32* %j, align 4
  %22 = mul nsw i32 3, %21
  %23 = add i32 %20, %22
  %24 = add i32 %23, 0
  %25 = zext i32 %24 to i64
  %26 = load i8** %1, align 8
  %27 = getelementptr inbounds i8* %26, i64 %25
  %28 = load i8* %27, align 1
  %29 = uitofp i8 %28 to float
  %30 = load i32* %j, align 4
  %31 = sext i32 %30 to i64
  %32 = load i32* %i, align 4
  %33 = sext i32 %32 to i64
  %34 = load float**** %img, align 8
  %35 = getelementptr inbounds float*** %34, i64 0
  %36 = load float*** %35, align 8
  %37 = getelementptr inbounds float** %36, i64 %33
  %38 = load float** %37, align 8
  %39 = getelementptr inbounds float* %38, i64 %31
  store float %29, float* %39, align 4
  %40 = load i32* %i, align 4
  %41 = mul nsw i32 3, %40
  %42 = load i32* %2, align 4
  %43 = mul i32 %41, %42
  %44 = load i32* %j, align 4
  %45 = mul nsw i32 3, %44
  %46 = add i32 %43, %45
  %47 = add i32 %46, 1
  %48 = zext i32 %47 to i64
  %49 = load i8** %1, align 8
  %50 = getelementptr inbounds i8* %49, i64 %48
  %51 = load i8* %50, align 1
  %52 = uitofp i8 %51 to float
  %53 = load i32* %j, align 4
  %54 = sext i32 %53 to i64
  %55 = load i32* %i, align 4
  %56 = sext i32 %55 to i64
  %57 = load float**** %img, align 8
  %58 = getelementptr inbounds float*** %57, i64 1
  %59 = load float*** %58, align 8
  %60 = getelementptr inbounds float** %59, i64 %56
  %61 = load float** %60, align 8
  %62 = getelementptr inbounds float* %61, i64 %54
  store float %52, float* %62, align 4
  %63 = load i32* %i, align 4
  %64 = mul nsw i32 3, %63
  %65 = load i32* %2, align 4
  %66 = mul i32 %64, %65
  %67 = load i32* %j, align 4
  %68 = mul nsw i32 3, %67
  %69 = add i32 %66, %68
  %70 = add i32 %69, 2
  %71 = zext i32 %70 to i64
  %72 = load i8** %1, align 8
  %73 = getelementptr inbounds i8* %72, i64 %71
  %74 = load i8* %73, align 1
  %75 = uitofp i8 %74 to float
  %76 = load i32* %j, align 4
  %77 = sext i32 %76 to i64
  %78 = load i32* %i, align 4
  %79 = sext i32 %78 to i64
  %80 = load float**** %img, align 8
  %81 = getelementptr inbounds float*** %80, i64 2
  %82 = load float*** %81, align 8
  %83 = getelementptr inbounds float** %82, i64 %79
  %84 = load float** %83, align 8
  %85 = getelementptr inbounds float* %84, i64 %77
  store float %75, float* %85, align 4
  br label %86

; <label>:86                                      ; preds = %16
  %87 = load i32* %j, align 4
  %88 = add nsw i32 %87, 1
  store i32 %88, i32* %j, align 4
  br label %12

; <label>:89                                      ; preds = %12
  br label %90

; <label>:90                                      ; preds = %89
  %91 = load i32* %i, align 4
  %92 = add nsw i32 %91, 1
  store i32 %92, i32* %i, align 4
  br label %7

; <label>:93                                      ; preds = %7
  %94 = load float**** %img, align 8
  ret float*** %94
}

declare float*** @alloc3df(i32, i32, i32) #1

; Function Attrs: nounwind uwtable
define i8* @ppm_to_png(float*** %image, i32 %width, i32 %height) #0 {
  %1 = alloca float***, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %img = alloca i8*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %min = alloca float, align 4
  %max = alloca float, align 4
  %v = alloca float, align 4
  %v1 = alloca float, align 4
  store float*** %image, float**** %1, align 8
  store i32 %width, i32* %2, align 4
  store i32 %height, i32* %3, align 4
  %4 = load i32* %2, align 4
  %5 = mul i32 3, %4
  %6 = load i32* %3, align 4
  %7 = mul i32 %5, %6
  %8 = zext i32 %7 to i64
  %9 = mul i64 %8, 1
  %10 = call noalias i8* @malloc(i64 %9) #5
  store i8* %10, i8** %img, align 8
  store i32 0, i32* %k, align 4
  br label %11

; <label>:11                                      ; preds = %114, %0
  %12 = load i32* %k, align 4
  %13 = icmp slt i32 %12, 3
  br i1 %13, label %14, label %117

; <label>:14                                      ; preds = %11
  store float 0x4200C388C0000000, float* %min, align 4
  %15 = load float* %min, align 4
  %16 = fsub float -0.000000e+00, %15
  store float %16, float* %max, align 4
  store i32 0, i32* %i, align 4
  br label %17

; <label>:17                                      ; preds = %56, %14
  %18 = load i32* %i, align 4
  %19 = load i32* %3, align 4
  %20 = icmp ult i32 %18, %19
  br i1 %20, label %21, label %59

; <label>:21                                      ; preds = %17
  store i32 0, i32* %j, align 4
  br label %22

; <label>:22                                      ; preds = %52, %21
  %23 = load i32* %j, align 4
  %24 = load i32* %2, align 4
  %25 = icmp ult i32 %23, %24
  br i1 %25, label %26, label %55

; <label>:26                                      ; preds = %22
  %27 = load i32* %j, align 4
  %28 = sext i32 %27 to i64
  %29 = load i32* %i, align 4
  %30 = sext i32 %29 to i64
  %31 = load i32* %k, align 4
  %32 = sext i32 %31 to i64
  %33 = load float**** %1, align 8
  %34 = getelementptr inbounds float*** %33, i64 %32
  %35 = load float*** %34, align 8
  %36 = getelementptr inbounds float** %35, i64 %30
  %37 = load float** %36, align 8
  %38 = getelementptr inbounds float* %37, i64 %28
  %39 = load float* %38, align 4
  store float %39, float* %v, align 4
  %40 = load float* %min, align 4
  %41 = load float* %v, align 4
  %42 = fcmp ogt float %40, %41
  br i1 %42, label %43, label %45

; <label>:43                                      ; preds = %26
  %44 = load float* %v, align 4
  store float %44, float* %min, align 4
  br label %45

; <label>:45                                      ; preds = %43, %26
  %46 = load float* %max, align 4
  %47 = load float* %v, align 4
  %48 = fcmp olt float %46, %47
  br i1 %48, label %49, label %51

; <label>:49                                      ; preds = %45
  %50 = load float* %v, align 4
  store float %50, float* %max, align 4
  br label %51

; <label>:51                                      ; preds = %49, %45
  br label %52

; <label>:52                                      ; preds = %51
  %53 = load i32* %j, align 4
  %54 = add nsw i32 %53, 1
  store i32 %54, i32* %j, align 4
  br label %22

; <label>:55                                      ; preds = %22
  br label %56

; <label>:56                                      ; preds = %55
  %57 = load i32* %i, align 4
  %58 = add nsw i32 %57, 1
  store i32 %58, i32* %i, align 4
  br label %17

; <label>:59                                      ; preds = %17
  %60 = load float* %max, align 4
  %61 = load float* %min, align 4
  %62 = fsub float %60, %61
  %63 = fpext float %62 to double
  %64 = fdiv double 2.549900e+02, %63
  %65 = fptrunc double %64 to float
  store float %65, float* %v1, align 4
  store i32 0, i32* %i, align 4
  br label %66

; <label>:66                                      ; preds = %110, %59
  %67 = load i32* %i, align 4
  %68 = load i32* %3, align 4
  %69 = icmp ult i32 %67, %68
  br i1 %69, label %70, label %113

; <label>:70                                      ; preds = %66
  store i32 0, i32* %j, align 4
  br label %71

; <label>:71                                      ; preds = %106, %70
  %72 = load i32* %j, align 4
  %73 = load i32* %2, align 4
  %74 = icmp ult i32 %72, %73
  br i1 %74, label %75, label %109

; <label>:75                                      ; preds = %71
  %76 = load i32* %j, align 4
  %77 = sext i32 %76 to i64
  %78 = load i32* %i, align 4
  %79 = sext i32 %78 to i64
  %80 = load i32* %k, align 4
  %81 = sext i32 %80 to i64
  %82 = load float**** %1, align 8
  %83 = getelementptr inbounds float*** %82, i64 %81
  %84 = load float*** %83, align 8
  %85 = getelementptr inbounds float** %84, i64 %79
  %86 = load float** %85, align 8
  %87 = getelementptr inbounds float* %86, i64 %77
  %88 = load float* %87, align 4
  %89 = load float* %min, align 4
  %90 = fsub float %88, %89
  %91 = load float* %v1, align 4
  %92 = fmul float %90, %91
  %93 = fptoui float %92 to i8
  %94 = load i32* %i, align 4
  %95 = mul nsw i32 3, %94
  %96 = load i32* %2, align 4
  %97 = mul i32 %95, %96
  %98 = load i32* %j, align 4
  %99 = mul nsw i32 3, %98
  %100 = add i32 %97, %99
  %101 = load i32* %k, align 4
  %102 = add i32 %100, %101
  %103 = zext i32 %102 to i64
  %104 = load i8** %img, align 8
  %105 = getelementptr inbounds i8* %104, i64 %103
  store i8 %93, i8* %105, align 1
  br label %106

; <label>:106                                     ; preds = %75
  %107 = load i32* %j, align 4
  %108 = add nsw i32 %107, 1
  store i32 %108, i32* %j, align 4
  br label %71

; <label>:109                                     ; preds = %71
  br label %110

; <label>:110                                     ; preds = %109
  %111 = load i32* %i, align 4
  %112 = add nsw i32 %111, 1
  store i32 %112, i32* %i, align 4
  br label %66

; <label>:113                                     ; preds = %66
  br label %114

; <label>:114                                     ; preds = %113
  %115 = load i32* %k, align 4
  %116 = add nsw i32 %115, 1
  store i32 %116, i32* %k, align 4
  br label %11

; <label>:117                                     ; preds = %11
  %118 = load i8** %img, align 8
  ret i8* %118
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %t = alloca i32, align 4
  %action = alloca i32, align 4
  %filename = alloca [256 x i8], align 16
  %saved_filename = alloca [256 x i8], align 16
  %error = alloca i32, align 4
  %image = alloca i8*, align 8
  %width = alloca i32, align 4
  %height = alloca i32, align 4
  %input = alloca float***, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %output_height = alloca i32, align 4
  %output_width = alloca i32, align 4
  %output = alloca float***, align 8
  %output_png = alloca i8*, align 8
  store i32 0, i32* %1
  store i32 15, i32* %action, align 4
  store i32 1000, i32* %t, align 4
  br label %2

; <label>:2                                       ; preds = %71, %0
  %3 = load i32* %t, align 4
  %4 = icmp slt i32 %3, 1100
  br i1 %4, label %5, label %74

; <label>:5                                       ; preds = %2
  %6 = getelementptr inbounds [256 x i8]* %filename, i32 0, i32 0
  %7 = load i32* %t, align 4
  %8 = call i32 (i8*, i8*, ...)* @sprintf(i8* %6, i8* getelementptr inbounds ([3 x i8]* @.str, i32 0, i32 0), i32 %7) #5
  %9 = getelementptr inbounds [256 x i8]* %filename, i32 0, i32 0
  %10 = call i8* @strcat(i8* %9, i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0)) #5
  %11 = load %struct._IO_FILE** @stdout, align 8
  call void @setbuf(%struct._IO_FILE* %11, i8* null) #5
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([35 x i8]* @.str2, i32 0, i32 0))
  %13 = getelementptr inbounds [256 x i8]* %filename, i32 0, i32 0
  %14 = call i32 @lodepng_decode24_file(i8** %image, i32* %width, i32* %height, i8* %13)
  store i32 %14, i32* %error, align 4
  %15 = load i32* %error, align 4
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %17, label %22

; <label>:17                                      ; preds = %5
  %18 = load i32* %error, align 4
  %19 = load i32* %error, align 4
  %20 = call i8* @lodepng_error_text(i32 %19)
  %21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str3, i32 0, i32 0), i32 %18, i8* %20)
  call void @exit(i32 1) #6
  unreachable

; <label>:22                                      ; preds = %5
  %23 = load i8** %image, align 8
  %24 = load i32* %width, align 4
  %25 = load i32* %height, align 4
  %26 = call float*** @png_to_ppm(i8* %23, i32 %24, i32 %25)
  store float*** %26, float**** %input, align 8
  %27 = load i8** %image, align 8
  call void @free(i8* %27) #5
  %28 = call noalias i8* @malloc(i64 24) #5
  %29 = bitcast i8* %28 to float***
  store float*** %29, float**** %output, align 8
  %30 = load i32* %height, align 4
  store i32 %30, i32* %output_height, align 4
  %31 = load i32* %width, align 4
  store i32 %31, i32* %output_width, align 4
  %32 = load float**** %input, align 8
  %33 = load i32* %height, align 4
  %34 = load i32* %width, align 4
  %35 = call float*** @detect_edges(float*** %32, i32 %33, i32 %34)
  store float*** %35, float**** %output, align 8
  %36 = getelementptr inbounds [256 x i8]* %saved_filename, i32 0, i32 0
  %37 = getelementptr inbounds [256 x i8]* %filename, i32 0, i32 0
  %38 = call i8* @strncpy(i8* %36, i8* %37, i64 256) #5
  %39 = getelementptr inbounds [256 x i8]* %saved_filename, i32 0, i32 0
  %40 = call i64 @strlen(i8* %39) #7
  %41 = sub i64 %40, 4
  %42 = getelementptr inbounds [256 x i8]* %saved_filename, i32 0, i64 %41
  store i8 0, i8* %42, align 1
  %43 = getelementptr inbounds [256 x i8]* %saved_filename, i32 0, i32 0
  %44 = call i8* @strcat(i8* %43, i8* getelementptr inbounds ([20 x i8]* @.str4, i32 0, i32 0)) #5
  %45 = load float**** %output, align 8
  %46 = load i32* %output_width, align 4
  %47 = load i32* %output_height, align 4
  %48 = call i8* @ppm_to_png(float*** %45, i32 %46, i32 %47)
  store i8* %48, i8** %output_png, align 8
  %49 = load float**** %output, align 8
  %50 = load i32* %output_height, align 4
  %51 = load i32* %output_width, align 4
  call void @dealloc3df(float*** %49, i32 3, i32 %50, i32 %51)
  %52 = getelementptr inbounds [256 x i8]* %saved_filename, i32 0, i32 0
  %53 = load i8** %output_png, align 8
  %54 = load i32* %output_width, align 4
  %55 = load i32* %output_height, align 4
  %56 = call i32 @lodepng_encode24_file(i8* %52, i8* %53, i32 %54, i32 %55)
  store i32 %56, i32* %error, align 4
  %57 = load i32* %error, align 4
  %58 = icmp ne i32 %57, 0
  br i1 %58, label %59, label %64

; <label>:59                                      ; preds = %22
  %60 = load i32* %error, align 4
  %61 = load i32* %error, align 4
  %62 = call i8* @lodepng_error_text(i32 %61)
  %63 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str5, i32 0, i32 0), i32 %60, i8* %62)
  br label %67

; <label>:64                                      ; preds = %22
  %65 = getelementptr inbounds [256 x i8]* %saved_filename, i32 0, i32 0
  %66 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([42 x i8]* @.str6, i32 0, i32 0), i8* %65)
  br label %67

; <label>:67                                      ; preds = %64, %59
  %68 = load float**** %input, align 8
  %69 = load i32* %height, align 4
  %70 = load i32* %width, align 4
  call void @dealloc3df(float*** %68, i32 3, i32 %69, i32 %70)
  br label %71

; <label>:71                                      ; preds = %67
  %72 = load i32* %t, align 4
  %73 = add nsw i32 %72, 1
  store i32 %73, i32* %t, align 4
  br label %2

; <label>:74                                      ; preds = %2
  %75 = load i32* %1
  ret i32 %75
}

; Function Attrs: nounwind
declare i32 @sprintf(i8*, i8*, ...) #2

; Function Attrs: nounwind
declare i8* @strcat(i8*, i8*) #2

; Function Attrs: nounwind
declare void @setbuf(%struct._IO_FILE*, i8*) #2

declare i32 @printf(i8*, ...) #1

declare i32 @lodepng_decode24_file(i8**, i32*, i32*, i8*) #1

declare i8* @lodepng_error_text(i32) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

; Function Attrs: nounwind
declare void @free(i8*) #2

declare float*** @detect_edges(float***, i32, i32) #1

; Function Attrs: nounwind
declare i8* @strncpy(i8*, i8*, i64) #2

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #4

declare void @dealloc3df(float***, i32, i32, i32) #1

declare i32 @lodepng_encode24_file(i8*, i8*, i32, i32) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }
attributes #7 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4 (tags/RELEASE_34/final)"}
