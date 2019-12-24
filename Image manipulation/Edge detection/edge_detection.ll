; ModuleID = 'edge_detection.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [61 x i8] c"Applying a series of steps to detect edges in this image...\0A\00", align 1
@.str1 = private unnamed_addr constant [33 x i8] c"Performing a low-pass filter...\0A\00", align 1
@.str2 = private unnamed_addr constant [34 x i8] c"Performing a high-pass filter...\0A\00", align 1
@.str3 = private unnamed_addr constant [59 x i8] c"Which histogram stretch would you like to perform? (1) for\00", align 1
@.str4 = private unnamed_addr constant [58 x i8] c" a linear stretch, (2) for a 3%% min-max linear stretch.\0A\00", align 1
@.str5 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str6 = private unnamed_addr constant [43 x i8] c"Performing a 3%% min-max linear stretch...\00", align 1
@.str7 = private unnamed_addr constant [41 x i8] c"Performing a linear histogram stretch...\00", align 1
@.str8 = private unnamed_addr constant [65 x i8] c"What shape would you like to use for the median filter's window?\00", align 1
@.str9 = private unnamed_addr constant [33 x i8] c" (1) for cross, (2) for square.\0A\00", align 1
@.str10 = private unnamed_addr constant [45 x i8] c"Performing a square-shaped median filter...\0A\00", align 1
@.str11 = private unnamed_addr constant [44 x i8] c"Performing a cross-shaped median filter...\0A\00", align 1
@fname = common global [50 x i8] zeroinitializer, align 16
@fp = common global %struct._IO_FILE* null, align 8

; Function Attrs: nounwind uwtable
define float*** @apply_Laplacian_of_Gaussian(float*** %input, i32 %M_in, i32 %N_in, float %threshold, i32 %square_size) #0 {
  %1 = alloca float***, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca float, align 4
  %5 = alloca i32, align 4
  %intermediate = alloca float**, align 8
  %output = alloca float***, align 8
  %kernel = alloca float**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  %m = alloca i32, align 4
  %pixelMatrix = alloca float**, align 8
  %newValue = alloca float, align 4
  %min = alloca float, align 4
  %max = alloca float, align 4
  %w = alloca float, align 4
  store float*** %input, float**** %1, align 8
  store i32 %M_in, i32* %2, align 4
  store i32 %N_in, i32* %3, align 4
  store float %threshold, float* %4, align 4
  store i32 %square_size, i32* %5, align 4
  %6 = load i32* %2, align 4
  %7 = load i32* %3, align 4
  %8 = call float** @alloc2df(i32 %6, i32 %7)
  store float** %8, float*** %intermediate, align 8
  %9 = load i32* %2, align 4
  %10 = load i32* %3, align 4
  %11 = call float*** @alloc3df(i32 3, i32 %9, i32 %10)
  store float*** %11, float**** %output, align 8
  %12 = call float** @alloc2df(i32 5, i32 5)
  store float** %12, float*** %kernel, align 8
  %13 = load float*** %kernel, align 8
  %14 = getelementptr inbounds float** %13, i64 0
  %15 = load float** %14, align 8
  %16 = getelementptr inbounds float* %15, i64 0
  store float 0.000000e+00, float* %16, align 4
  %17 = load float*** %kernel, align 8
  %18 = getelementptr inbounds float** %17, i64 0
  %19 = load float** %18, align 8
  %20 = getelementptr inbounds float* %19, i64 1
  store float 0.000000e+00, float* %20, align 4
  %21 = load float*** %kernel, align 8
  %22 = getelementptr inbounds float** %21, i64 0
  %23 = load float** %22, align 8
  %24 = getelementptr inbounds float* %23, i64 2
  store float 1.000000e+00, float* %24, align 4
  %25 = load float*** %kernel, align 8
  %26 = getelementptr inbounds float** %25, i64 0
  %27 = load float** %26, align 8
  %28 = getelementptr inbounds float* %27, i64 3
  store float 0.000000e+00, float* %28, align 4
  %29 = load float*** %kernel, align 8
  %30 = getelementptr inbounds float** %29, i64 0
  %31 = load float** %30, align 8
  %32 = getelementptr inbounds float* %31, i64 4
  store float 0.000000e+00, float* %32, align 4
  %33 = load float*** %kernel, align 8
  %34 = getelementptr inbounds float** %33, i64 1
  %35 = load float** %34, align 8
  %36 = getelementptr inbounds float* %35, i64 0
  store float 0.000000e+00, float* %36, align 4
  %37 = load float*** %kernel, align 8
  %38 = getelementptr inbounds float** %37, i64 1
  %39 = load float** %38, align 8
  %40 = getelementptr inbounds float* %39, i64 1
  store float 1.000000e+00, float* %40, align 4
  %41 = load float*** %kernel, align 8
  %42 = getelementptr inbounds float** %41, i64 1
  %43 = load float** %42, align 8
  %44 = getelementptr inbounds float* %43, i64 2
  store float 2.000000e+00, float* %44, align 4
  %45 = load float*** %kernel, align 8
  %46 = getelementptr inbounds float** %45, i64 1
  %47 = load float** %46, align 8
  %48 = getelementptr inbounds float* %47, i64 3
  store float 1.000000e+00, float* %48, align 4
  %49 = load float*** %kernel, align 8
  %50 = getelementptr inbounds float** %49, i64 1
  %51 = load float** %50, align 8
  %52 = getelementptr inbounds float* %51, i64 4
  store float 0.000000e+00, float* %52, align 4
  %53 = load float*** %kernel, align 8
  %54 = getelementptr inbounds float** %53, i64 2
  %55 = load float** %54, align 8
  %56 = getelementptr inbounds float* %55, i64 0
  store float 1.000000e+00, float* %56, align 4
  %57 = load float*** %kernel, align 8
  %58 = getelementptr inbounds float** %57, i64 2
  %59 = load float** %58, align 8
  %60 = getelementptr inbounds float* %59, i64 1
  store float 2.000000e+00, float* %60, align 4
  %61 = load float*** %kernel, align 8
  %62 = getelementptr inbounds float** %61, i64 2
  %63 = load float** %62, align 8
  %64 = getelementptr inbounds float* %63, i64 2
  store float -1.600000e+01, float* %64, align 4
  %65 = load float*** %kernel, align 8
  %66 = getelementptr inbounds float** %65, i64 2
  %67 = load float** %66, align 8
  %68 = getelementptr inbounds float* %67, i64 3
  store float 2.000000e+00, float* %68, align 4
  %69 = load float*** %kernel, align 8
  %70 = getelementptr inbounds float** %69, i64 2
  %71 = load float** %70, align 8
  %72 = getelementptr inbounds float* %71, i64 4
  store float 1.000000e+00, float* %72, align 4
  %73 = load float*** %kernel, align 8
  %74 = getelementptr inbounds float** %73, i64 3
  %75 = load float** %74, align 8
  %76 = getelementptr inbounds float* %75, i64 0
  store float 0.000000e+00, float* %76, align 4
  %77 = load float*** %kernel, align 8
  %78 = getelementptr inbounds float** %77, i64 3
  %79 = load float** %78, align 8
  %80 = getelementptr inbounds float* %79, i64 1
  store float 1.000000e+00, float* %80, align 4
  %81 = load float*** %kernel, align 8
  %82 = getelementptr inbounds float** %81, i64 3
  %83 = load float** %82, align 8
  %84 = getelementptr inbounds float* %83, i64 2
  store float 2.000000e+00, float* %84, align 4
  %85 = load float*** %kernel, align 8
  %86 = getelementptr inbounds float** %85, i64 3
  %87 = load float** %86, align 8
  %88 = getelementptr inbounds float* %87, i64 3
  store float 1.000000e+00, float* %88, align 4
  %89 = load float*** %kernel, align 8
  %90 = getelementptr inbounds float** %89, i64 3
  %91 = load float** %90, align 8
  %92 = getelementptr inbounds float* %91, i64 4
  store float 0.000000e+00, float* %92, align 4
  %93 = load float*** %kernel, align 8
  %94 = getelementptr inbounds float** %93, i64 4
  %95 = load float** %94, align 8
  %96 = getelementptr inbounds float* %95, i64 0
  store float 0.000000e+00, float* %96, align 4
  %97 = load float*** %kernel, align 8
  %98 = getelementptr inbounds float** %97, i64 4
  %99 = load float** %98, align 8
  %100 = getelementptr inbounds float* %99, i64 1
  store float 0.000000e+00, float* %100, align 4
  %101 = load float*** %kernel, align 8
  %102 = getelementptr inbounds float** %101, i64 4
  %103 = load float** %102, align 8
  %104 = getelementptr inbounds float* %103, i64 2
  store float 1.000000e+00, float* %104, align 4
  %105 = load float*** %kernel, align 8
  %106 = getelementptr inbounds float** %105, i64 4
  %107 = load float** %106, align 8
  %108 = getelementptr inbounds float* %107, i64 3
  store float 0.000000e+00, float* %108, align 4
  %109 = load float*** %kernel, align 8
  %110 = getelementptr inbounds float** %109, i64 4
  %111 = load float** %110, align 8
  %112 = getelementptr inbounds float* %111, i64 4
  store float 0.000000e+00, float* %112, align 4
  store i32 0, i32* %k, align 4
  br label %113

; <label>:113                                     ; preds = %259, %0
  %114 = load i32* %k, align 4
  %115 = icmp slt i32 %114, 3
  br i1 %115, label %116, label %262

; <label>:116                                     ; preds = %113
  store i32 0, i32* %i, align 4
  br label %117

; <label>:117                                     ; preds = %153, %116
  %118 = load i32* %i, align 4
  %119 = load i32* %2, align 4
  %120 = icmp slt i32 %118, %119
  br i1 %120, label %121, label %156

; <label>:121                                     ; preds = %117
  store i32 0, i32* %j, align 4
  br label %122

; <label>:122                                     ; preds = %149, %121
  %123 = load i32* %j, align 4
  %124 = load i32* %3, align 4
  %125 = icmp slt i32 %123, %124
  br i1 %125, label %126, label %152

; <label>:126                                     ; preds = %122
  %127 = load i32* %k, align 4
  %128 = sext i32 %127 to i64
  %129 = load float**** %1, align 8
  %130 = getelementptr inbounds float*** %129, i64 %128
  %131 = load float*** %130, align 8
  %132 = load i32* %2, align 4
  %133 = load i32* %3, align 4
  %134 = load i32* %i, align 4
  %135 = load i32* %j, align 4
  %136 = call float** @find_pixel_matrix(float** %131, i32 %132, i32 %133, i32 %134, i32 %135, i32 5)
  store float** %136, float*** %pixelMatrix, align 8
  %137 = load float*** %pixelMatrix, align 8
  %138 = load float*** %kernel, align 8
  %139 = call float @convolve_matrices(float** %137, float** %138, i32 5)
  store float %139, float* %newValue, align 4
  %140 = load float* %newValue, align 4
  %141 = load i32* %j, align 4
  %142 = sext i32 %141 to i64
  %143 = load i32* %i, align 4
  %144 = sext i32 %143 to i64
  %145 = load float*** %intermediate, align 8
  %146 = getelementptr inbounds float** %145, i64 %144
  %147 = load float** %146, align 8
  %148 = getelementptr inbounds float* %147, i64 %142
  store float %140, float* %148, align 4
  br label %149

; <label>:149                                     ; preds = %126
  %150 = load i32* %j, align 4
  %151 = add nsw i32 %150, 1
  store i32 %151, i32* %j, align 4
  br label %122

; <label>:152                                     ; preds = %122
  br label %153

; <label>:153                                     ; preds = %152
  %154 = load i32* %i, align 4
  %155 = add nsw i32 %154, 1
  store i32 %155, i32* %i, align 4
  br label %117

; <label>:156                                     ; preds = %117
  store i32 0, i32* %i, align 4
  br label %157

; <label>:157                                     ; preds = %255, %156
  %158 = load i32* %i, align 4
  %159 = load i32* %2, align 4
  %160 = load i32* %5, align 4
  %161 = sub nsw i32 %159, %160
  %162 = icmp slt i32 %158, %161
  br i1 %162, label %163, label %258

; <label>:163                                     ; preds = %157
  store i32 0, i32* %j, align 4
  br label %164

; <label>:164                                     ; preds = %251, %163
  %165 = load i32* %j, align 4
  %166 = load i32* %3, align 4
  %167 = load i32* %5, align 4
  %168 = sub nsw i32 %166, %167
  %169 = icmp slt i32 %165, %168
  br i1 %169, label %170, label %254

; <label>:170                                     ; preds = %164
  store float 0x4200C388C0000000, float* %min, align 4
  %171 = load float* %min, align 4
  %172 = fsub float -0.000000e+00, %171
  store float %172, float* %max, align 4
  store i32 0, i32* %m, align 4
  br label %173

; <label>:173                                     ; preds = %212, %170
  %174 = load i32* %m, align 4
  %175 = load i32* %5, align 4
  %176 = icmp slt i32 %174, %175
  br i1 %176, label %177, label %215

; <label>:177                                     ; preds = %173
  store i32 0, i32* %l, align 4
  br label %178

; <label>:178                                     ; preds = %208, %177
  %179 = load i32* %l, align 4
  %180 = load i32* %5, align 4
  %181 = icmp slt i32 %179, %180
  br i1 %181, label %182, label %211

; <label>:182                                     ; preds = %178
  %183 = load i32* %j, align 4
  %184 = load i32* %l, align 4
  %185 = add nsw i32 %183, %184
  %186 = sext i32 %185 to i64
  %187 = load i32* %i, align 4
  %188 = load i32* %m, align 4
  %189 = add nsw i32 %187, %188
  %190 = sext i32 %189 to i64
  %191 = load float*** %intermediate, align 8
  %192 = getelementptr inbounds float** %191, i64 %190
  %193 = load float** %192, align 8
  %194 = getelementptr inbounds float* %193, i64 %186
  %195 = load float* %194, align 4
  store float %195, float* %w, align 4
  %196 = load float* %w, align 4
  %197 = load float* %min, align 4
  %198 = fcmp olt float %196, %197
  br i1 %198, label %199, label %201

; <label>:199                                     ; preds = %182
  %200 = load float* %w, align 4
  store float %200, float* %min, align 4
  br label %201

; <label>:201                                     ; preds = %199, %182
  %202 = load float* %w, align 4
  %203 = load float* %max, align 4
  %204 = fcmp ogt float %202, %203
  br i1 %204, label %205, label %207

; <label>:205                                     ; preds = %201
  %206 = load float* %w, align 4
  store float %206, float* %max, align 4
  br label %207

; <label>:207                                     ; preds = %205, %201
  br label %208

; <label>:208                                     ; preds = %207
  %209 = load i32* %l, align 4
  %210 = add nsw i32 %209, 1
  store i32 %210, i32* %l, align 4
  br label %178

; <label>:211                                     ; preds = %178
  br label %212

; <label>:212                                     ; preds = %211
  %213 = load i32* %m, align 4
  %214 = add nsw i32 %213, 1
  store i32 %214, i32* %m, align 4
  br label %173

; <label>:215                                     ; preds = %173
  %216 = load float* %min, align 4
  %217 = load float* %4, align 4
  %218 = fsub float -0.000000e+00, %217
  %219 = fcmp olt float %216, %218
  br i1 %219, label %220, label %237

; <label>:220                                     ; preds = %215
  %221 = load float* %max, align 4
  %222 = load float* %4, align 4
  %223 = fcmp ogt float %221, %222
  br i1 %223, label %224, label %237

; <label>:224                                     ; preds = %220
  %225 = load i32* %j, align 4
  %226 = sext i32 %225 to i64
  %227 = load i32* %i, align 4
  %228 = sext i32 %227 to i64
  %229 = load i32* %k, align 4
  %230 = sext i32 %229 to i64
  %231 = load float**** %output, align 8
  %232 = getelementptr inbounds float*** %231, i64 %230
  %233 = load float*** %232, align 8
  %234 = getelementptr inbounds float** %233, i64 %228
  %235 = load float** %234, align 8
  %236 = getelementptr inbounds float* %235, i64 %226
  store float 2.540000e+02, float* %236, align 4
  br label %250

; <label>:237                                     ; preds = %220, %215
  %238 = load i32* %j, align 4
  %239 = sext i32 %238 to i64
  %240 = load i32* %i, align 4
  %241 = sext i32 %240 to i64
  %242 = load i32* %k, align 4
  %243 = sext i32 %242 to i64
  %244 = load float**** %output, align 8
  %245 = getelementptr inbounds float*** %244, i64 %243
  %246 = load float*** %245, align 8
  %247 = getelementptr inbounds float** %246, i64 %241
  %248 = load float** %247, align 8
  %249 = getelementptr inbounds float* %248, i64 %239
  store float 0.000000e+00, float* %249, align 4
  br label %250

; <label>:250                                     ; preds = %237, %224
  br label %251

; <label>:251                                     ; preds = %250
  %252 = load i32* %j, align 4
  %253 = add nsw i32 %252, 1
  store i32 %253, i32* %j, align 4
  br label %164

; <label>:254                                     ; preds = %164
  br label %255

; <label>:255                                     ; preds = %254
  %256 = load i32* %i, align 4
  %257 = add nsw i32 %256, 1
  store i32 %257, i32* %i, align 4
  br label %157

; <label>:258                                     ; preds = %157
  br label %259

; <label>:259                                     ; preds = %258
  %260 = load i32* %k, align 4
  %261 = add nsw i32 %260, 1
  store i32 %261, i32* %k, align 4
  br label %113

; <label>:262                                     ; preds = %113
  %263 = load float**** %output, align 8
  ret float*** %263
}

declare float** @alloc2df(i32, i32) #1

declare float*** @alloc3df(i32, i32, i32) #1

; Function Attrs: nounwind uwtable
define float** @find_pixel_matrix(float** %input, i32 %M_in, i32 %N_in, i32 %row, i32 %col, i32 %size) #0 {
  %1 = alloca float**, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %pixelMatrix = alloca float**, align 8
  %center = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %pixelRow = alloca i32, align 4
  %pixelCol = alloca i32, align 4
  store float** %input, float*** %1, align 8
  store i32 %M_in, i32* %2, align 4
  store i32 %N_in, i32* %3, align 4
  store i32 %row, i32* %4, align 4
  store i32 %col, i32* %5, align 4
  store i32 %size, i32* %6, align 4
  %7 = load i32* %6, align 4
  %8 = load i32* %6, align 4
  %9 = call float** @alloc2df(i32 %7, i32 %8)
  store float** %9, float*** %pixelMatrix, align 8
  %10 = load i32* %6, align 4
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 2.000000e+00
  %13 = call double @floor(double %12) #4
  %14 = fptosi double %13 to i32
  store i32 %14, i32* %center, align 4
  store i32 0, i32* %i, align 4
  br label %15

; <label>:15                                      ; preds = %80, %0
  %16 = load i32* %i, align 4
  %17 = load i32* %6, align 4
  %18 = icmp slt i32 %16, %17
  br i1 %18, label %19, label %83

; <label>:19                                      ; preds = %15
  store i32 0, i32* %j, align 4
  br label %20

; <label>:20                                      ; preds = %76, %19
  %21 = load i32* %j, align 4
  %22 = load i32* %6, align 4
  %23 = icmp slt i32 %21, %22
  br i1 %23, label %24, label %79

; <label>:24                                      ; preds = %20
  %25 = load i32* %4, align 4
  %26 = load i32* %i, align 4
  %27 = load i32* %center, align 4
  %28 = sub nsw i32 %26, %27
  %29 = add nsw i32 %25, %28
  store i32 %29, i32* %pixelRow, align 4
  %30 = load i32* %5, align 4
  %31 = load i32* %j, align 4
  %32 = load i32* %center, align 4
  %33 = sub nsw i32 %31, %32
  %34 = add nsw i32 %30, %33
  store i32 %34, i32* %pixelCol, align 4
  %35 = load i32* %pixelRow, align 4
  %36 = icmp slt i32 %35, 0
  br i1 %36, label %37, label %38

; <label>:37                                      ; preds = %24
  store i32 0, i32* %pixelRow, align 4
  br label %38

; <label>:38                                      ; preds = %37, %24
  %39 = load i32* %pixelRow, align 4
  %40 = load i32* %2, align 4
  %41 = sub nsw i32 %40, 1
  %42 = icmp sgt i32 %39, %41
  br i1 %42, label %43, label %46

; <label>:43                                      ; preds = %38
  %44 = load i32* %2, align 4
  %45 = sub nsw i32 %44, 1
  store i32 %45, i32* %pixelRow, align 4
  br label %46

; <label>:46                                      ; preds = %43, %38
  %47 = load i32* %pixelCol, align 4
  %48 = icmp slt i32 %47, 0
  br i1 %48, label %49, label %50

; <label>:49                                      ; preds = %46
  store i32 0, i32* %pixelCol, align 4
  br label %50

; <label>:50                                      ; preds = %49, %46
  %51 = load i32* %pixelCol, align 4
  %52 = load i32* %3, align 4
  %53 = sub nsw i32 %52, 1
  %54 = icmp sgt i32 %51, %53
  br i1 %54, label %55, label %58

; <label>:55                                      ; preds = %50
  %56 = load i32* %3, align 4
  %57 = sub nsw i32 %56, 1
  store i32 %57, i32* %pixelCol, align 4
  br label %58

; <label>:58                                      ; preds = %55, %50
  %59 = load i32* %pixelCol, align 4
  %60 = sext i32 %59 to i64
  %61 = load i32* %pixelRow, align 4
  %62 = sext i32 %61 to i64
  %63 = load float*** %1, align 8
  %64 = getelementptr inbounds float** %63, i64 %62
  %65 = load float** %64, align 8
  %66 = getelementptr inbounds float* %65, i64 %60
  %67 = load float* %66, align 4
  %68 = load i32* %j, align 4
  %69 = sext i32 %68 to i64
  %70 = load i32* %i, align 4
  %71 = sext i32 %70 to i64
  %72 = load float*** %pixelMatrix, align 8
  %73 = getelementptr inbounds float** %72, i64 %71
  %74 = load float** %73, align 8
  %75 = getelementptr inbounds float* %74, i64 %69
  store float %67, float* %75, align 4
  br label %76

; <label>:76                                      ; preds = %58
  %77 = load i32* %j, align 4
  %78 = add nsw i32 %77, 1
  store i32 %78, i32* %j, align 4
  br label %20

; <label>:79                                      ; preds = %20
  br label %80

; <label>:80                                      ; preds = %79
  %81 = load i32* %i, align 4
  %82 = add nsw i32 %81, 1
  store i32 %82, i32* %i, align 4
  br label %15

; <label>:83                                      ; preds = %15
  %84 = load float*** %pixelMatrix, align 8
  ret float** %84
}

; Function Attrs: nounwind uwtable
define float @convolve_matrices(float** %array_one, float** %array_two, i32 %size) #0 {
  %1 = alloca float**, align 8
  %2 = alloca float**, align 8
  %3 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %sum = alloca float, align 4
  store float** %array_one, float*** %1, align 8
  store float** %array_two, float*** %2, align 8
  store i32 %size, i32* %3, align 4
  store float 0.000000e+00, float* %sum, align 4
  store i32 0, i32* %i, align 4
  br label %4

; <label>:4                                       ; preds = %39, %0
  %5 = load i32* %i, align 4
  %6 = load i32* %3, align 4
  %7 = icmp slt i32 %5, %6
  br i1 %7, label %8, label %42

; <label>:8                                       ; preds = %4
  store i32 0, i32* %j, align 4
  br label %9

; <label>:9                                       ; preds = %35, %8
  %10 = load i32* %j, align 4
  %11 = load i32* %3, align 4
  %12 = icmp slt i32 %10, %11
  br i1 %12, label %13, label %38

; <label>:13                                      ; preds = %9
  %14 = load i32* %j, align 4
  %15 = sext i32 %14 to i64
  %16 = load i32* %i, align 4
  %17 = sext i32 %16 to i64
  %18 = load float*** %1, align 8
  %19 = getelementptr inbounds float** %18, i64 %17
  %20 = load float** %19, align 8
  %21 = getelementptr inbounds float* %20, i64 %15
  %22 = load float* %21, align 4
  %23 = load i32* %j, align 4
  %24 = sext i32 %23 to i64
  %25 = load i32* %i, align 4
  %26 = sext i32 %25 to i64
  %27 = load float*** %2, align 8
  %28 = getelementptr inbounds float** %27, i64 %26
  %29 = load float** %28, align 8
  %30 = getelementptr inbounds float* %29, i64 %24
  %31 = load float* %30, align 4
  %32 = fmul float %22, %31
  %33 = load float* %sum, align 4
  %34 = fadd float %33, %32
  store float %34, float* %sum, align 4
  br label %35

; <label>:35                                      ; preds = %13
  %36 = load i32* %j, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, i32* %j, align 4
  br label %9

; <label>:38                                      ; preds = %9
  br label %39

; <label>:39                                      ; preds = %38
  %40 = load i32* %i, align 4
  %41 = add nsw i32 %40, 1
  store i32 %41, i32* %i, align 4
  br label %4

; <label>:42                                      ; preds = %4
  %43 = load float* %sum, align 4
  ret float %43
}

; Function Attrs: nounwind uwtable
define float*** @detect_edges(float*** %input, i32 %M_in, i32 %N_in) #0 {
  %1 = alloca float***, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %lowpass_filtered = alloca float***, align 8
  %linearly_stretched = alloca float***, align 8
  %square_median_filtered = alloca float***, align 8
  %laplacian_of_gaussian = alloca float***, align 8
  store float*** %input, float**** %1, align 8
  store i32 %M_in, i32* %2, align 4
  store i32 %N_in, i32* %3, align 4
  %4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([61 x i8]* @.str, i32 0, i32 0))
  %5 = load float**** %1, align 8
  %6 = load i32* %2, align 4
  %7 = load i32* %3, align 4
  %8 = call float*** @lowpass_filter(float*** %5, i32 %6, i32 %7)
  store float*** %8, float**** %lowpass_filtered, align 8
  %9 = load float**** %lowpass_filtered, align 8
  %10 = load i32* %2, align 4
  %11 = load i32* %3, align 4
  %12 = call float*** @min_max_stretch(float*** %9, i32 %10, i32 %11, double 5.000000e-01)
  store float*** %12, float**** %linearly_stretched, align 8
  %13 = load float**** %linearly_stretched, align 8
  %14 = load i32* %2, align 4
  %15 = load i32* %3, align 4
  %16 = call float*** @square_median_filter(float*** %13, i32 %14, i32 %15)
  store float*** %16, float**** %square_median_filtered, align 8
  %17 = load float**** %square_median_filtered, align 8
  %18 = load i32* %2, align 4
  %19 = load i32* %3, align 4
  %20 = call float*** @apply_Laplacian_of_Gaussian(float*** %17, i32 %18, i32 %19, float 1.000000e+00, i32 3)
  store float*** %20, float**** %laplacian_of_gaussian, align 8
  %21 = load float**** %lowpass_filtered, align 8
  %22 = load i32* %2, align 4
  %23 = load i32* %3, align 4
  call void @dealloc3df(float*** %21, i32 3, i32 %22, i32 %23)
  %24 = load float**** %linearly_stretched, align 8
  %25 = load i32* %2, align 4
  %26 = load i32* %3, align 4
  call void @dealloc3df(float*** %24, i32 3, i32 %25, i32 %26)
  %27 = load float**** %square_median_filtered, align 8
  %28 = load i32* %2, align 4
  %29 = load i32* %3, align 4
  call void @dealloc3df(float*** %27, i32 3, i32 %28, i32 %29)
  %30 = load float**** %laplacian_of_gaussian, align 8
  ret float*** %30
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define float*** @lowpass_filter(float*** %input, i32 %M_in, i32 %N_in) #0 {
  %1 = alloca float***, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store float*** %input, float**** %1, align 8
  store i32 %M_in, i32* %2, align 4
  store i32 %N_in, i32* %3, align 4
  %4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str1, i32 0, i32 0))
  %5 = load float**** %1, align 8
  %6 = load i32* %2, align 4
  %7 = load i32* %3, align 4
  %8 = call float** @lowpass_filter_3by3kernel()
  %9 = call float*** @convolve(float*** %5, i32 %6, i32 %7, float** %8, i32 3)
  ret float*** %9
}

; Function Attrs: nounwind uwtable
define float*** @min_max_stretch(float*** %input, i32 %M_in, i32 %N_in, double %cutoff) #0 {
  %1 = alloca float***, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca double, align 8
  %output = alloca float***, align 8
  %density = alloca float*, align 8
  %cumulative = alloca float*, align 8
  %minColor = alloca i32, align 4
  %maxColor = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %weight = alloca float, align 4
  %w = alloca float, align 4
  store float*** %input, float**** %1, align 8
  store i32 %M_in, i32* %2, align 4
  store i32 %N_in, i32* %3, align 4
  store double %cutoff, double* %4, align 8
  %5 = load i32* %2, align 4
  %6 = load i32* %3, align 4
  %7 = call float*** @alloc3df(i32 3, i32 %5, i32 %6)
  store float*** %7, float**** %output, align 8
  store i32 0, i32* %k, align 4
  br label %8

; <label>:8                                       ; preds = %237, %0
  %9 = load i32* %k, align 4
  %10 = icmp slt i32 %9, 3
  br i1 %10, label %11, label %240

; <label>:11                                      ; preds = %8
  store i32 0, i32* %minColor, align 4
  store i32 255, i32* %maxColor, align 4
  %12 = call float* @alloc1df(i32 256)
  store float* %12, float** %density, align 8
  %13 = call float* @alloc1df(i32 256)
  store float* %13, float** %cumulative, align 8
  %14 = load i32* %2, align 4
  %15 = sitofp i32 %14 to float
  %16 = fdiv float 1.000000e+00, %15
  %17 = load i32* %3, align 4
  %18 = sitofp i32 %17 to float
  %19 = fdiv float %16, %18
  store float %19, float* %weight, align 4
  store i32 0, i32* %i, align 4
  br label %20

; <label>:20                                      ; preds = %54, %11
  %21 = load i32* %i, align 4
  %22 = load i32* %2, align 4
  %23 = icmp slt i32 %21, %22
  br i1 %23, label %24, label %57

; <label>:24                                      ; preds = %20
  store i32 0, i32* %j, align 4
  br label %25

; <label>:25                                      ; preds = %50, %24
  %26 = load i32* %j, align 4
  %27 = load i32* %3, align 4
  %28 = icmp slt i32 %26, %27
  br i1 %28, label %29, label %53

; <label>:29                                      ; preds = %25
  %30 = load float* %weight, align 4
  %31 = load i32* %j, align 4
  %32 = sext i32 %31 to i64
  %33 = load i32* %i, align 4
  %34 = sext i32 %33 to i64
  %35 = load i32* %k, align 4
  %36 = sext i32 %35 to i64
  %37 = load float**** %1, align 8
  %38 = getelementptr inbounds float*** %37, i64 %36
  %39 = load float*** %38, align 8
  %40 = getelementptr inbounds float** %39, i64 %34
  %41 = load float** %40, align 8
  %42 = getelementptr inbounds float* %41, i64 %32
  %43 = load float* %42, align 4
  %44 = fptosi float %43 to i32
  %45 = sext i32 %44 to i64
  %46 = load float** %density, align 8
  %47 = getelementptr inbounds float* %46, i64 %45
  %48 = load float* %47, align 4
  %49 = fadd float %48, %30
  store float %49, float* %47, align 4
  br label %50

; <label>:50                                      ; preds = %29
  %51 = load i32* %j, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, i32* %j, align 4
  br label %25

; <label>:53                                      ; preds = %25
  br label %54

; <label>:54                                      ; preds = %53
  %55 = load i32* %i, align 4
  %56 = add nsw i32 %55, 1
  store i32 %56, i32* %i, align 4
  br label %20

; <label>:57                                      ; preds = %20
  %58 = load float** %density, align 8
  %59 = getelementptr inbounds float* %58, i64 0
  %60 = load float* %59, align 4
  %61 = load float** %cumulative, align 8
  %62 = getelementptr inbounds float* %61, i64 0
  store float %60, float* %62, align 4
  store i32 1, i32* %i, align 4
  br label %63

; <label>:63                                      ; preds = %85, %57
  %64 = load i32* %i, align 4
  %65 = icmp slt i32 %64, 256
  br i1 %65, label %66, label %88

; <label>:66                                      ; preds = %63
  %67 = load i32* %i, align 4
  %68 = sub nsw i32 %67, 1
  %69 = sext i32 %68 to i64
  %70 = load float** %cumulative, align 8
  %71 = getelementptr inbounds float* %70, i64 %69
  %72 = load float* %71, align 4
  %73 = load i32* %i, align 4
  %74 = sext i32 %73 to i64
  %75 = load float** %density, align 8
  %76 = getelementptr inbounds float* %75, i64 %74
  %77 = load float* %76, align 4
  %78 = fadd float %72, %77
  %79 = load i32* %i, align 4
  %80 = sext i32 %79 to i64
  %81 = load float** %cumulative, align 8
  %82 = getelementptr inbounds float* %81, i64 %80
  %83 = load float* %82, align 4
  %84 = fadd float %83, %78
  store float %84, float* %82, align 4
  br label %85

; <label>:85                                      ; preds = %66
  %86 = load i32* %i, align 4
  %87 = add nsw i32 %86, 1
  store i32 %87, i32* %i, align 4
  br label %63

; <label>:88                                      ; preds = %63
  store float 0.000000e+00, float* %w, align 4
  br label %89

; <label>:89                                      ; preds = %94, %88
  %90 = load float* %w, align 4
  %91 = fpext float %90 to double
  %92 = load double* %4, align 8
  %93 = fcmp olt double %91, %92
  br i1 %93, label %94, label %103

; <label>:94                                      ; preds = %89
  %95 = load i32* %minColor, align 4
  %96 = add nsw i32 %95, 1
  store i32 %96, i32* %minColor, align 4
  %97 = sext i32 %95 to i64
  %98 = load float** %density, align 8
  %99 = getelementptr inbounds float* %98, i64 %97
  %100 = load float* %99, align 4
  %101 = load float* %w, align 4
  %102 = fadd float %101, %100
  store float %102, float* %w, align 4
  br label %89

; <label>:103                                     ; preds = %89
  store float 0.000000e+00, float* %w, align 4
  br label %104

; <label>:104                                     ; preds = %109, %103
  %105 = load float* %w, align 4
  %106 = fpext float %105 to double
  %107 = load double* %4, align 8
  %108 = fcmp olt double %106, %107
  br i1 %108, label %109, label %118

; <label>:109                                     ; preds = %104
  %110 = load i32* %maxColor, align 4
  %111 = add nsw i32 %110, -1
  store i32 %111, i32* %maxColor, align 4
  %112 = sext i32 %110 to i64
  %113 = load float** %density, align 8
  %114 = getelementptr inbounds float* %113, i64 %112
  %115 = load float* %114, align 4
  %116 = load float* %w, align 4
  %117 = fadd float %116, %115
  store float %117, float* %w, align 4
  br label %104

; <label>:118                                     ; preds = %104
  store i32 0, i32* %i, align 4
  br label %119

; <label>:119                                     ; preds = %229, %118
  %120 = load i32* %i, align 4
  %121 = load i32* %2, align 4
  %122 = icmp slt i32 %120, %121
  br i1 %122, label %123, label %232

; <label>:123                                     ; preds = %119
  store i32 0, i32* %j, align 4
  br label %124

; <label>:124                                     ; preds = %225, %123
  %125 = load i32* %j, align 4
  %126 = load i32* %3, align 4
  %127 = icmp slt i32 %125, %126
  br i1 %127, label %128, label %228

; <label>:128                                     ; preds = %124
  %129 = load i32* %j, align 4
  %130 = sext i32 %129 to i64
  %131 = load i32* %i, align 4
  %132 = sext i32 %131 to i64
  %133 = load i32* %k, align 4
  %134 = sext i32 %133 to i64
  %135 = load float**** %1, align 8
  %136 = getelementptr inbounds float*** %135, i64 %134
  %137 = load float*** %136, align 8
  %138 = getelementptr inbounds float** %137, i64 %132
  %139 = load float** %138, align 8
  %140 = getelementptr inbounds float* %139, i64 %130
  %141 = load float* %140, align 4
  %142 = load i32* %minColor, align 4
  %143 = sitofp i32 %142 to float
  %144 = fcmp olt float %141, %143
  br i1 %144, label %145, label %158

; <label>:145                                     ; preds = %128
  %146 = load i32* %j, align 4
  %147 = sext i32 %146 to i64
  %148 = load i32* %i, align 4
  %149 = sext i32 %148 to i64
  %150 = load i32* %k, align 4
  %151 = sext i32 %150 to i64
  %152 = load float**** %output, align 8
  %153 = getelementptr inbounds float*** %152, i64 %151
  %154 = load float*** %153, align 8
  %155 = getelementptr inbounds float** %154, i64 %149
  %156 = load float** %155, align 8
  %157 = getelementptr inbounds float* %156, i64 %147
  store float 0.000000e+00, float* %157, align 4
  br label %224

; <label>:158                                     ; preds = %128
  %159 = load i32* %j, align 4
  %160 = sext i32 %159 to i64
  %161 = load i32* %i, align 4
  %162 = sext i32 %161 to i64
  %163 = load i32* %k, align 4
  %164 = sext i32 %163 to i64
  %165 = load float**** %1, align 8
  %166 = getelementptr inbounds float*** %165, i64 %164
  %167 = load float*** %166, align 8
  %168 = getelementptr inbounds float** %167, i64 %162
  %169 = load float** %168, align 8
  %170 = getelementptr inbounds float* %169, i64 %160
  %171 = load float* %170, align 4
  %172 = load i32* %maxColor, align 4
  %173 = sitofp i32 %172 to float
  %174 = fcmp ogt float %171, %173
  br i1 %174, label %175, label %188

; <label>:175                                     ; preds = %158
  %176 = load i32* %j, align 4
  %177 = sext i32 %176 to i64
  %178 = load i32* %i, align 4
  %179 = sext i32 %178 to i64
  %180 = load i32* %k, align 4
  %181 = sext i32 %180 to i64
  %182 = load float**** %output, align 8
  %183 = getelementptr inbounds float*** %182, i64 %181
  %184 = load float*** %183, align 8
  %185 = getelementptr inbounds float** %184, i64 %179
  %186 = load float** %185, align 8
  %187 = getelementptr inbounds float* %186, i64 %177
  store float 2.550000e+02, float* %187, align 4
  br label %223

; <label>:188                                     ; preds = %158
  %189 = load i32* %j, align 4
  %190 = sext i32 %189 to i64
  %191 = load i32* %i, align 4
  %192 = sext i32 %191 to i64
  %193 = load i32* %k, align 4
  %194 = sext i32 %193 to i64
  %195 = load float**** %1, align 8
  %196 = getelementptr inbounds float*** %195, i64 %194
  %197 = load float*** %196, align 8
  %198 = getelementptr inbounds float** %197, i64 %192
  %199 = load float** %198, align 8
  %200 = getelementptr inbounds float* %199, i64 %190
  %201 = load float* %200, align 4
  %202 = load i32* %minColor, align 4
  %203 = sitofp i32 %202 to float
  %204 = fsub float %201, %203
  %205 = load i32* %maxColor, align 4
  %206 = load i32* %minColor, align 4
  %207 = sub nsw i32 %205, %206
  %208 = sitofp i32 %207 to float
  %209 = fdiv float %204, %208
  %210 = fmul float %209, 2.550000e+02
  %211 = load i32* %j, align 4
  %212 = sext i32 %211 to i64
  %213 = load i32* %i, align 4
  %214 = sext i32 %213 to i64
  %215 = load i32* %k, align 4
  %216 = sext i32 %215 to i64
  %217 = load float**** %output, align 8
  %218 = getelementptr inbounds float*** %217, i64 %216
  %219 = load float*** %218, align 8
  %220 = getelementptr inbounds float** %219, i64 %214
  %221 = load float** %220, align 8
  %222 = getelementptr inbounds float* %221, i64 %212
  store float %210, float* %222, align 4
  br label %223

; <label>:223                                     ; preds = %188, %175
  br label %224

; <label>:224                                     ; preds = %223, %145
  br label %225

; <label>:225                                     ; preds = %224
  %226 = load i32* %j, align 4
  %227 = add nsw i32 %226, 1
  store i32 %227, i32* %j, align 4
  br label %124

; <label>:228                                     ; preds = %124
  br label %229

; <label>:229                                     ; preds = %228
  %230 = load i32* %i, align 4
  %231 = add nsw i32 %230, 1
  store i32 %231, i32* %i, align 4
  br label %119

; <label>:232                                     ; preds = %119
  %233 = load float** %density, align 8
  %234 = bitcast float* %233 to i8*
  call void @free(i8* %234) #5
  %235 = load float** %cumulative, align 8
  %236 = bitcast float* %235 to i8*
  call void @free(i8* %236) #5
  br label %237

; <label>:237                                     ; preds = %232
  %238 = load i32* %k, align 4
  %239 = add nsw i32 %238, 1
  store i32 %239, i32* %k, align 4
  br label %8

; <label>:240                                     ; preds = %8
  %241 = load float**** %output, align 8
  ret float*** %241
}

; Function Attrs: nounwind uwtable
define float*** @square_median_filter(float*** %input, i32 %M_in, i32 %N_in) #0 {
  %1 = alloca float***, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %output = alloca float***, align 8
  %size = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  %m = alloca i32, align 4
  %array_size = alloca i32, align 4
  %square = alloca float*, align 8
  %swap = alloca float, align 4
  %center = alloca i32, align 4
  store float*** %input, float**** %1, align 8
  store i32 %M_in, i32* %2, align 4
  store i32 %N_in, i32* %3, align 4
  %4 = load i32* %2, align 4
  %5 = load i32* %3, align 4
  %6 = call float*** @alloc3df(i32 3, i32 %4, i32 %5)
  store float*** %6, float**** %output, align 8
  store i32 3, i32* %size, align 4
  store i32 0, i32* %k, align 4
  br label %7

; <label>:7                                       ; preds = %115, %0
  %8 = load i32* %k, align 4
  %9 = icmp slt i32 %8, 3
  br i1 %9, label %10, label %118

; <label>:10                                      ; preds = %7
  store i32 0, i32* %i, align 4
  br label %11

; <label>:11                                      ; preds = %111, %10
  %12 = load i32* %i, align 4
  %13 = load i32* %2, align 4
  %14 = icmp slt i32 %12, %13
  br i1 %14, label %15, label %114

; <label>:15                                      ; preds = %11
  store i32 0, i32* %j, align 4
  br label %16

; <label>:16                                      ; preds = %107, %15
  %17 = load i32* %j, align 4
  %18 = load i32* %3, align 4
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %20, label %110

; <label>:20                                      ; preds = %16
  %21 = load i32* %k, align 4
  %22 = sext i32 %21 to i64
  %23 = load float**** %1, align 8
  %24 = getelementptr inbounds float*** %23, i64 %22
  %25 = load float*** %24, align 8
  %26 = load i32* %2, align 4
  %27 = load i32* %3, align 4
  %28 = load i32* %i, align 4
  %29 = load i32* %j, align 4
  %30 = load i32* %size, align 4
  %31 = call float* @find_pixel_array(float** %25, i32 %26, i32 %27, i32 %28, i32 %29, i32 %30, i32* %array_size)
  store float* %31, float** %square, align 8
  store i32 0, i32* %m, align 4
  br label %32

; <label>:32                                      ; preds = %81, %20
  %33 = load i32* %m, align 4
  %34 = load i32* %array_size, align 4
  %35 = sub nsw i32 %34, 1
  %36 = icmp slt i32 %33, %35
  br i1 %36, label %37, label %84

; <label>:37                                      ; preds = %32
  %38 = load i32* %m, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, i32* %l, align 4
  br label %40

; <label>:40                                      ; preds = %77, %37
  %41 = load i32* %l, align 4
  %42 = load i32* %array_size, align 4
  %43 = icmp slt i32 %41, %42
  br i1 %43, label %44, label %80

; <label>:44                                      ; preds = %40
  %45 = load i32* %m, align 4
  %46 = sext i32 %45 to i64
  %47 = load float** %square, align 8
  %48 = getelementptr inbounds float* %47, i64 %46
  %49 = load float* %48, align 4
  %50 = load i32* %l, align 4
  %51 = sext i32 %50 to i64
  %52 = load float** %square, align 8
  %53 = getelementptr inbounds float* %52, i64 %51
  %54 = load float* %53, align 4
  %55 = fcmp ogt float %49, %54
  br i1 %55, label %56, label %76

; <label>:56                                      ; preds = %44
  %57 = load i32* %m, align 4
  %58 = sext i32 %57 to i64
  %59 = load float** %square, align 8
  %60 = getelementptr inbounds float* %59, i64 %58
  %61 = load float* %60, align 4
  store float %61, float* %swap, align 4
  %62 = load i32* %l, align 4
  %63 = sext i32 %62 to i64
  %64 = load float** %square, align 8
  %65 = getelementptr inbounds float* %64, i64 %63
  %66 = load float* %65, align 4
  %67 = load i32* %m, align 4
  %68 = sext i32 %67 to i64
  %69 = load float** %square, align 8
  %70 = getelementptr inbounds float* %69, i64 %68
  store float %66, float* %70, align 4
  %71 = load float* %swap, align 4
  %72 = load i32* %l, align 4
  %73 = sext i32 %72 to i64
  %74 = load float** %square, align 8
  %75 = getelementptr inbounds float* %74, i64 %73
  store float %71, float* %75, align 4
  br label %76

; <label>:76                                      ; preds = %56, %44
  br label %77

; <label>:77                                      ; preds = %76
  %78 = load i32* %l, align 4
  %79 = add nsw i32 %78, 1
  store i32 %79, i32* %l, align 4
  br label %40

; <label>:80                                      ; preds = %40
  br label %81

; <label>:81                                      ; preds = %80
  %82 = load i32* %m, align 4
  %83 = add nsw i32 %82, 1
  store i32 %83, i32* %m, align 4
  br label %32

; <label>:84                                      ; preds = %32
  %85 = load i32* %array_size, align 4
  %86 = sitofp i32 %85 to double
  %87 = fdiv double %86, 2.000000e+00
  %88 = call double @floor(double %87) #4
  %89 = fptosi double %88 to i32
  store i32 %89, i32* %center, align 4
  %90 = load i32* %center, align 4
  %91 = sext i32 %90 to i64
  %92 = load float** %square, align 8
  %93 = getelementptr inbounds float* %92, i64 %91
  %94 = load float* %93, align 4
  %95 = load i32* %j, align 4
  %96 = sext i32 %95 to i64
  %97 = load i32* %i, align 4
  %98 = sext i32 %97 to i64
  %99 = load i32* %k, align 4
  %100 = sext i32 %99 to i64
  %101 = load float**** %output, align 8
  %102 = getelementptr inbounds float*** %101, i64 %100
  %103 = load float*** %102, align 8
  %104 = getelementptr inbounds float** %103, i64 %98
  %105 = load float** %104, align 8
  %106 = getelementptr inbounds float* %105, i64 %96
  store float %94, float* %106, align 4
  br label %107

; <label>:107                                     ; preds = %84
  %108 = load i32* %j, align 4
  %109 = add nsw i32 %108, 1
  store i32 %109, i32* %j, align 4
  br label %16

; <label>:110                                     ; preds = %16
  br label %111

; <label>:111                                     ; preds = %110
  %112 = load i32* %i, align 4
  %113 = add nsw i32 %112, 1
  store i32 %113, i32* %i, align 4
  br label %11

; <label>:114                                     ; preds = %11
  br label %115

; <label>:115                                     ; preds = %114
  %116 = load i32* %k, align 4
  %117 = add nsw i32 %116, 1
  store i32 %117, i32* %k, align 4
  br label %7

; <label>:118                                     ; preds = %7
  %119 = load float**** %output, align 8
  ret float*** %119
}

declare void @dealloc3df(float***, i32, i32, i32) #1

; Function Attrs: nounwind uwtable
define float** @add(float** %arrayOne, float** %arrayTwo, i32 %row, i32 %col) #0 {
  %1 = alloca float**, align 8
  %2 = alloca float**, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %final = alloca float**, align 8
  store float** %arrayOne, float*** %1, align 8
  store float** %arrayTwo, float*** %2, align 8
  store i32 %row, i32* %3, align 4
  store i32 %col, i32* %4, align 4
  %5 = load i32* %3, align 4
  %6 = load i32* %4, align 4
  %7 = call float** @alloc2df(i32 %5, i32 %6)
  store float** %7, float*** %final, align 8
  store i32 0, i32* %i, align 4
  br label %8

; <label>:8                                       ; preds = %49, %0
  %9 = load i32* %i, align 4
  %10 = load i32* %3, align 4
  %11 = icmp slt i32 %9, %10
  br i1 %11, label %12, label %52

; <label>:12                                      ; preds = %8
  store i32 0, i32* %j, align 4
  br label %13

; <label>:13                                      ; preds = %45, %12
  %14 = load i32* %j, align 4
  %15 = load i32* %4, align 4
  %16 = icmp slt i32 %14, %15
  br i1 %16, label %17, label %48

; <label>:17                                      ; preds = %13
  %18 = load i32* %j, align 4
  %19 = sext i32 %18 to i64
  %20 = load i32* %i, align 4
  %21 = sext i32 %20 to i64
  %22 = load float*** %1, align 8
  %23 = getelementptr inbounds float** %22, i64 %21
  %24 = load float** %23, align 8
  %25 = getelementptr inbounds float* %24, i64 %19
  %26 = load float* %25, align 4
  %27 = load i32* %j, align 4
  %28 = sext i32 %27 to i64
  %29 = load i32* %i, align 4
  %30 = sext i32 %29 to i64
  %31 = load float*** %2, align 8
  %32 = getelementptr inbounds float** %31, i64 %30
  %33 = load float** %32, align 8
  %34 = getelementptr inbounds float* %33, i64 %28
  %35 = load float* %34, align 4
  %36 = fadd float %26, %35
  %37 = load i32* %j, align 4
  %38 = sext i32 %37 to i64
  %39 = load i32* %i, align 4
  %40 = sext i32 %39 to i64
  %41 = load float*** %final, align 8
  %42 = getelementptr inbounds float** %41, i64 %40
  %43 = load float** %42, align 8
  %44 = getelementptr inbounds float* %43, i64 %38
  store float %36, float* %44, align 4
  br label %45

; <label>:45                                      ; preds = %17
  %46 = load i32* %j, align 4
  %47 = add nsw i32 %46, 1
  store i32 %47, i32* %j, align 4
  br label %13

; <label>:48                                      ; preds = %13
  br label %49

; <label>:49                                      ; preds = %48
  %50 = load i32* %i, align 4
  %51 = add nsw i32 %50, 1
  store i32 %51, i32* %i, align 4
  br label %8

; <label>:52                                      ; preds = %8
  %53 = load float*** %final, align 8
  ret float** %53
}

; Function Attrs: nounwind uwtable
define float** @subtract(float** %arrayOne, float** %arrayTwo, i32 %row, i32 %col) #0 {
  %1 = alloca float**, align 8
  %2 = alloca float**, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %final = alloca float**, align 8
  store float** %arrayOne, float*** %1, align 8
  store float** %arrayTwo, float*** %2, align 8
  store i32 %row, i32* %3, align 4
  store i32 %col, i32* %4, align 4
  %5 = load i32* %3, align 4
  %6 = load i32* %4, align 4
  %7 = call float** @alloc2df(i32 %5, i32 %6)
  store float** %7, float*** %final, align 8
  store i32 0, i32* %i, align 4
  br label %8

; <label>:8                                       ; preds = %49, %0
  %9 = load i32* %i, align 4
  %10 = load i32* %3, align 4
  %11 = icmp slt i32 %9, %10
  br i1 %11, label %12, label %52

; <label>:12                                      ; preds = %8
  store i32 0, i32* %j, align 4
  br label %13

; <label>:13                                      ; preds = %45, %12
  %14 = load i32* %j, align 4
  %15 = load i32* %4, align 4
  %16 = icmp slt i32 %14, %15
  br i1 %16, label %17, label %48

; <label>:17                                      ; preds = %13
  %18 = load i32* %j, align 4
  %19 = sext i32 %18 to i64
  %20 = load i32* %i, align 4
  %21 = sext i32 %20 to i64
  %22 = load float*** %1, align 8
  %23 = getelementptr inbounds float** %22, i64 %21
  %24 = load float** %23, align 8
  %25 = getelementptr inbounds float* %24, i64 %19
  %26 = load float* %25, align 4
  %27 = load i32* %j, align 4
  %28 = sext i32 %27 to i64
  %29 = load i32* %i, align 4
  %30 = sext i32 %29 to i64
  %31 = load float*** %2, align 8
  %32 = getelementptr inbounds float** %31, i64 %30
  %33 = load float** %32, align 8
  %34 = getelementptr inbounds float* %33, i64 %28
  %35 = load float* %34, align 4
  %36 = fsub float %26, %35
  %37 = load i32* %j, align 4
  %38 = sext i32 %37 to i64
  %39 = load i32* %i, align 4
  %40 = sext i32 %39 to i64
  %41 = load float*** %final, align 8
  %42 = getelementptr inbounds float** %41, i64 %40
  %43 = load float** %42, align 8
  %44 = getelementptr inbounds float* %43, i64 %38
  store float %36, float* %44, align 4
  br label %45

; <label>:45                                      ; preds = %17
  %46 = load i32* %j, align 4
  %47 = add nsw i32 %46, 1
  store i32 %47, i32* %j, align 4
  br label %13

; <label>:48                                      ; preds = %13
  br label %49

; <label>:49                                      ; preds = %48
  %50 = load i32* %i, align 4
  %51 = add nsw i32 %50, 1
  store i32 %51, i32* %i, align 4
  br label %8

; <label>:52                                      ; preds = %8
  %53 = load float*** %final, align 8
  ret float** %53
}

; Function Attrs: nounwind readnone
declare double @floor(double) #2

; Function Attrs: nounwind uwtable
define float*** @convolve(float*** %input, i32 %M_in, i32 %N_in, float** %kernel, i32 %dim) #0 {
  %1 = alloca float***, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca float**, align 8
  %5 = alloca i32, align 4
  %output = alloca float***, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %pixel_matrix = alloca float**, align 8
  %new_value = alloca float, align 4
  store float*** %input, float**** %1, align 8
  store i32 %M_in, i32* %2, align 4
  store i32 %N_in, i32* %3, align 4
  store float** %kernel, float*** %4, align 8
  store i32 %dim, i32* %5, align 4
  %6 = load i32* %2, align 4
  %7 = load i32* %3, align 4
  %8 = call float*** @alloc3df(i32 3, i32 %6, i32 %7)
  store float*** %8, float**** %output, align 8
  store i32 0, i32* %k, align 4
  br label %9

; <label>:9                                       ; preds = %59, %0
  %10 = load i32* %k, align 4
  %11 = icmp slt i32 %10, 3
  br i1 %11, label %12, label %62

; <label>:12                                      ; preds = %9
  store i32 0, i32* %i, align 4
  br label %13

; <label>:13                                      ; preds = %55, %12
  %14 = load i32* %i, align 4
  %15 = load i32* %2, align 4
  %16 = icmp slt i32 %14, %15
  br i1 %16, label %17, label %58

; <label>:17                                      ; preds = %13
  store i32 0, i32* %j, align 4
  br label %18

; <label>:18                                      ; preds = %51, %17
  %19 = load i32* %j, align 4
  %20 = load i32* %3, align 4
  %21 = icmp slt i32 %19, %20
  br i1 %21, label %22, label %54

; <label>:22                                      ; preds = %18
  %23 = load i32* %k, align 4
  %24 = sext i32 %23 to i64
  %25 = load float**** %1, align 8
  %26 = getelementptr inbounds float*** %25, i64 %24
  %27 = load float*** %26, align 8
  %28 = load i32* %2, align 4
  %29 = load i32* %3, align 4
  %30 = load i32* %i, align 4
  %31 = load i32* %j, align 4
  %32 = load i32* %5, align 4
  %33 = call float** @find_pixel_matrix(float** %27, i32 %28, i32 %29, i32 %30, i32 %31, i32 %32)
  store float** %33, float*** %pixel_matrix, align 8
  %34 = load float*** %pixel_matrix, align 8
  %35 = load float*** %4, align 8
  %36 = load i32* %5, align 4
  %37 = call float @convolve_matrices(float** %34, float** %35, i32 %36)
  store float %37, float* %new_value, align 4
  %38 = load float* %new_value, align 4
  %39 = load i32* %j, align 4
  %40 = sext i32 %39 to i64
  %41 = load i32* %i, align 4
  %42 = sext i32 %41 to i64
  %43 = load i32* %k, align 4
  %44 = sext i32 %43 to i64
  %45 = load float**** %output, align 8
  %46 = getelementptr inbounds float*** %45, i64 %44
  %47 = load float*** %46, align 8
  %48 = getelementptr inbounds float** %47, i64 %42
  %49 = load float** %48, align 8
  %50 = getelementptr inbounds float* %49, i64 %40
  store float %38, float* %50, align 4
  br label %51

; <label>:51                                      ; preds = %22
  %52 = load i32* %j, align 4
  %53 = add nsw i32 %52, 1
  store i32 %53, i32* %j, align 4
  br label %18

; <label>:54                                      ; preds = %18
  br label %55

; <label>:55                                      ; preds = %54
  %56 = load i32* %i, align 4
  %57 = add nsw i32 %56, 1
  store i32 %57, i32* %i, align 4
  br label %13

; <label>:58                                      ; preds = %13
  br label %59

; <label>:59                                      ; preds = %58
  %60 = load i32* %k, align 4
  %61 = add nsw i32 %60, 1
  store i32 %61, i32* %k, align 4
  br label %9

; <label>:62                                      ; preds = %9
  %63 = load float**** %output, align 8
  ret float*** %63
}

; Function Attrs: nounwind uwtable
define float*** @highpass_filter(float*** %input, i32 %M_in, i32 %N_in) #0 {
  %1 = alloca float***, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store float*** %input, float**** %1, align 8
  store i32 %M_in, i32* %2, align 4
  store i32 %N_in, i32* %3, align 4
  %4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([34 x i8]* @.str2, i32 0, i32 0))
  %5 = load float**** %1, align 8
  %6 = load i32* %2, align 4
  %7 = load i32* %3, align 4
  %8 = call float** @highpass_filter_3by3kernel()
  %9 = call float*** @convolve(float*** %5, i32 %6, i32 %7, float** %8, i32 3)
  ret float*** %9
}

; Function Attrs: nounwind uwtable
define float** @lowpass_filter_3by3kernel() #0 {
  %kernel = alloca float**, align 8
  %1 = call float** @alloc2df(i32 3, i32 3)
  store float** %1, float*** %kernel, align 8
  %2 = load float*** %kernel, align 8
  %3 = getelementptr inbounds float** %2, i64 0
  %4 = load float** %3, align 8
  %5 = getelementptr inbounds float* %4, i64 0
  store float 6.250000e-02, float* %5, align 4
  %6 = load float*** %kernel, align 8
  %7 = getelementptr inbounds float** %6, i64 0
  %8 = load float** %7, align 8
  %9 = getelementptr inbounds float* %8, i64 1
  store float 1.250000e-01, float* %9, align 4
  %10 = load float*** %kernel, align 8
  %11 = getelementptr inbounds float** %10, i64 0
  %12 = load float** %11, align 8
  %13 = getelementptr inbounds float* %12, i64 2
  store float 6.250000e-02, float* %13, align 4
  %14 = load float*** %kernel, align 8
  %15 = getelementptr inbounds float** %14, i64 1
  %16 = load float** %15, align 8
  %17 = getelementptr inbounds float* %16, i64 0
  store float 1.250000e-01, float* %17, align 4
  %18 = load float*** %kernel, align 8
  %19 = getelementptr inbounds float** %18, i64 1
  %20 = load float** %19, align 8
  %21 = getelementptr inbounds float* %20, i64 1
  store float 2.500000e-01, float* %21, align 4
  %22 = load float*** %kernel, align 8
  %23 = getelementptr inbounds float** %22, i64 1
  %24 = load float** %23, align 8
  %25 = getelementptr inbounds float* %24, i64 2
  store float 1.250000e-01, float* %25, align 4
  %26 = load float*** %kernel, align 8
  %27 = getelementptr inbounds float** %26, i64 2
  %28 = load float** %27, align 8
  %29 = getelementptr inbounds float* %28, i64 0
  store float 6.250000e-02, float* %29, align 4
  %30 = load float*** %kernel, align 8
  %31 = getelementptr inbounds float** %30, i64 2
  %32 = load float** %31, align 8
  %33 = getelementptr inbounds float* %32, i64 1
  store float 1.250000e-01, float* %33, align 4
  %34 = load float*** %kernel, align 8
  %35 = getelementptr inbounds float** %34, i64 2
  %36 = load float** %35, align 8
  %37 = getelementptr inbounds float* %36, i64 2
  store float 6.250000e-02, float* %37, align 4
  %38 = load float*** %kernel, align 8
  ret float** %38
}

; Function Attrs: nounwind uwtable
define float** @highpass_filter_3by3kernel() #0 {
  %lpKernel = alloca float**, align 8
  %deltaKernel = alloca float**, align 8
  %1 = call float** @alloc2df(i32 3, i32 3)
  store float** %1, float*** %lpKernel, align 8
  %2 = load float*** %lpKernel, align 8
  %3 = getelementptr inbounds float** %2, i64 0
  %4 = load float** %3, align 8
  %5 = getelementptr inbounds float* %4, i64 0
  store float 6.250000e-02, float* %5, align 4
  %6 = load float*** %lpKernel, align 8
  %7 = getelementptr inbounds float** %6, i64 0
  %8 = load float** %7, align 8
  %9 = getelementptr inbounds float* %8, i64 1
  store float 1.250000e-01, float* %9, align 4
  %10 = load float*** %lpKernel, align 8
  %11 = getelementptr inbounds float** %10, i64 0
  %12 = load float** %11, align 8
  %13 = getelementptr inbounds float* %12, i64 2
  store float 6.250000e-02, float* %13, align 4
  %14 = load float*** %lpKernel, align 8
  %15 = getelementptr inbounds float** %14, i64 1
  %16 = load float** %15, align 8
  %17 = getelementptr inbounds float* %16, i64 0
  store float 1.250000e-01, float* %17, align 4
  %18 = load float*** %lpKernel, align 8
  %19 = getelementptr inbounds float** %18, i64 1
  %20 = load float** %19, align 8
  %21 = getelementptr inbounds float* %20, i64 1
  store float 2.500000e-01, float* %21, align 4
  %22 = load float*** %lpKernel, align 8
  %23 = getelementptr inbounds float** %22, i64 1
  %24 = load float** %23, align 8
  %25 = getelementptr inbounds float* %24, i64 2
  store float 1.250000e-01, float* %25, align 4
  %26 = load float*** %lpKernel, align 8
  %27 = getelementptr inbounds float** %26, i64 2
  %28 = load float** %27, align 8
  %29 = getelementptr inbounds float* %28, i64 0
  store float 6.250000e-02, float* %29, align 4
  %30 = load float*** %lpKernel, align 8
  %31 = getelementptr inbounds float** %30, i64 2
  %32 = load float** %31, align 8
  %33 = getelementptr inbounds float* %32, i64 1
  store float 1.250000e-01, float* %33, align 4
  %34 = load float*** %lpKernel, align 8
  %35 = getelementptr inbounds float** %34, i64 2
  %36 = load float** %35, align 8
  %37 = getelementptr inbounds float* %36, i64 2
  store float 6.250000e-02, float* %37, align 4
  %38 = call float** @alloc2df(i32 3, i32 3)
  store float** %38, float*** %deltaKernel, align 8
  %39 = load float*** %deltaKernel, align 8
  %40 = getelementptr inbounds float** %39, i64 0
  %41 = load float** %40, align 8
  %42 = getelementptr inbounds float* %41, i64 0
  store float 0.000000e+00, float* %42, align 4
  %43 = load float*** %deltaKernel, align 8
  %44 = getelementptr inbounds float** %43, i64 0
  %45 = load float** %44, align 8
  %46 = getelementptr inbounds float* %45, i64 1
  store float 0.000000e+00, float* %46, align 4
  %47 = load float*** %deltaKernel, align 8
  %48 = getelementptr inbounds float** %47, i64 0
  %49 = load float** %48, align 8
  %50 = getelementptr inbounds float* %49, i64 2
  store float 0.000000e+00, float* %50, align 4
  %51 = load float*** %deltaKernel, align 8
  %52 = getelementptr inbounds float** %51, i64 1
  %53 = load float** %52, align 8
  %54 = getelementptr inbounds float* %53, i64 0
  store float 0.000000e+00, float* %54, align 4
  %55 = load float*** %deltaKernel, align 8
  %56 = getelementptr inbounds float** %55, i64 1
  %57 = load float** %56, align 8
  %58 = getelementptr inbounds float* %57, i64 1
  store float 1.000000e+00, float* %58, align 4
  %59 = load float*** %deltaKernel, align 8
  %60 = getelementptr inbounds float** %59, i64 1
  %61 = load float** %60, align 8
  %62 = getelementptr inbounds float* %61, i64 2
  store float 0.000000e+00, float* %62, align 4
  %63 = load float*** %deltaKernel, align 8
  %64 = getelementptr inbounds float** %63, i64 2
  %65 = load float** %64, align 8
  %66 = getelementptr inbounds float* %65, i64 0
  store float 0.000000e+00, float* %66, align 4
  %67 = load float*** %deltaKernel, align 8
  %68 = getelementptr inbounds float** %67, i64 2
  %69 = load float** %68, align 8
  %70 = getelementptr inbounds float* %69, i64 1
  store float 0.000000e+00, float* %70, align 4
  %71 = load float*** %deltaKernel, align 8
  %72 = getelementptr inbounds float** %71, i64 2
  %73 = load float** %72, align 8
  %74 = getelementptr inbounds float* %73, i64 2
  store float 0.000000e+00, float* %74, align 4
  %75 = load float*** %deltaKernel, align 8
  %76 = load float*** %lpKernel, align 8
  %77 = call float** @subtract(float** %75, float** %76, i32 3, i32 3)
  ret float** %77
}

; Function Attrs: nounwind uwtable
define float*** @enhance_contrast(float*** %input, i32 %M_in, i32 %N_in) #0 {
  %1 = alloca float***, align 8
  %2 = alloca float***, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %option = alloca i32, align 4
  store float*** %input, float**** %2, align 8
  store i32 %M_in, i32* %3, align 4
  store i32 %N_in, i32* %4, align 4
  %5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([59 x i8]* @.str3, i32 0, i32 0))
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([58 x i8]* @.str4, i32 0, i32 0))
  %7 = call i32 (i8*, ...)* @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8]* @.str5, i32 0, i32 0), i32* %option)
  %8 = load i32* %option, align 4
  switch i32 %8, label %15 [
    i32 2, label %9
  ]

; <label>:9                                       ; preds = %0
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([43 x i8]* @.str6, i32 0, i32 0))
  %11 = load float**** %2, align 8
  %12 = load i32* %3, align 4
  %13 = load i32* %4, align 4
  %14 = call float*** @min_max_stretch(float*** %11, i32 %12, i32 %13, double 3.000000e-02)
  store float*** %14, float**** %1
  br label %21

; <label>:15                                      ; preds = %0
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str7, i32 0, i32 0))
  %17 = load float**** %2, align 8
  %18 = load i32* %3, align 4
  %19 = load i32* %4, align 4
  %20 = call float*** @linear_stretch(float*** %17, i32 %18, i32 %19)
  store float*** %20, float**** %1
  br label %21

; <label>:21                                      ; preds = %15, %9
  %22 = load float**** %1
  ret float*** %22
}

declare i32 @__isoc99_scanf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define float*** @linear_stretch(float*** %input, i32 %M_in, i32 %N_in) #0 {
  %1 = alloca float***, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %output = alloca float***, align 8
  %densityHistogram = alloca float**, align 8
  %minColor = alloca i32, align 4
  %maxColor = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store float*** %input, float**** %1, align 8
  store i32 %M_in, i32* %2, align 4
  store i32 %N_in, i32* %3, align 4
  %4 = load i32* %2, align 4
  %5 = load i32* %3, align 4
  %6 = call float*** @alloc3df(i32 3, i32 %4, i32 %5)
  store float*** %6, float**** %output, align 8
  store i32 0, i32* %k, align 4
  br label %7

; <label>:7                                       ; preds = %177, %0
  %8 = load i32* %k, align 4
  %9 = icmp slt i32 %8, 3
  br i1 %9, label %10, label %180

; <label>:10                                      ; preds = %7
  store i32 0, i32* %minColor, align 4
  store i32 255, i32* %maxColor, align 4
  %11 = load i32* %k, align 4
  %12 = sext i32 %11 to i64
  %13 = load float**** %1, align 8
  %14 = getelementptr inbounds float*** %13, i64 %12
  %15 = load float*** %14, align 8
  %16 = load i32* %2, align 4
  %17 = load i32* %3, align 4
  %18 = call float** @generate_density_histogram(float** %15, i32 256, i32 %16, i32 %17)
  store float** %18, float*** %densityHistogram, align 8
  store i32 0, i32* %i, align 4
  br label %19

; <label>:19                                      ; preds = %36, %10
  %20 = load i32* %i, align 4
  %21 = icmp slt i32 %20, 256
  br i1 %21, label %22, label %39

; <label>:22                                      ; preds = %19
  %23 = load i32* %i, align 4
  %24 = sext i32 %23 to i64
  %25 = load float*** %densityHistogram, align 8
  %26 = getelementptr inbounds float** %25, i64 255
  %27 = load float** %26, align 8
  %28 = getelementptr inbounds float* %27, i64 %24
  %29 = load float* %28, align 4
  %30 = fpext float %29 to double
  %31 = fcmp ogt double %30, 0.000000e+00
  br i1 %31, label %32, label %35

; <label>:32                                      ; preds = %22
  %33 = load i32* %i, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, i32* %minColor, align 4
  br label %39

; <label>:35                                      ; preds = %22
  br label %36

; <label>:36                                      ; preds = %35
  %37 = load i32* %i, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, i32* %i, align 4
  br label %19

; <label>:39                                      ; preds = %32, %19
  store i32 255, i32* %i, align 4
  br label %40

; <label>:40                                      ; preds = %57, %39
  %41 = load i32* %i, align 4
  %42 = icmp sgt i32 %41, 0
  br i1 %42, label %43, label %60

; <label>:43                                      ; preds = %40
  %44 = load i32* %i, align 4
  %45 = sext i32 %44 to i64
  %46 = load float*** %densityHistogram, align 8
  %47 = getelementptr inbounds float** %46, i64 255
  %48 = load float** %47, align 8
  %49 = getelementptr inbounds float* %48, i64 %45
  %50 = load float* %49, align 4
  %51 = fpext float %50 to double
  %52 = fcmp ogt double %51, 0.000000e+00
  br i1 %52, label %53, label %56

; <label>:53                                      ; preds = %43
  %54 = load i32* %i, align 4
  %55 = add nsw i32 %54, 1
  store i32 %55, i32* %maxColor, align 4
  br label %60

; <label>:56                                      ; preds = %43
  br label %57

; <label>:57                                      ; preds = %56
  %58 = load i32* %i, align 4
  %59 = add nsw i32 %58, -1
  store i32 %59, i32* %i, align 4
  br label %40

; <label>:60                                      ; preds = %53, %40
  store i32 0, i32* %i, align 4
  br label %61

; <label>:61                                      ; preds = %171, %60
  %62 = load i32* %i, align 4
  %63 = load i32* %2, align 4
  %64 = icmp slt i32 %62, %63
  br i1 %64, label %65, label %174

; <label>:65                                      ; preds = %61
  store i32 0, i32* %j, align 4
  br label %66

; <label>:66                                      ; preds = %167, %65
  %67 = load i32* %j, align 4
  %68 = load i32* %3, align 4
  %69 = icmp slt i32 %67, %68
  br i1 %69, label %70, label %170

; <label>:70                                      ; preds = %66
  %71 = load i32* %j, align 4
  %72 = sext i32 %71 to i64
  %73 = load i32* %i, align 4
  %74 = sext i32 %73 to i64
  %75 = load i32* %k, align 4
  %76 = sext i32 %75 to i64
  %77 = load float**** %1, align 8
  %78 = getelementptr inbounds float*** %77, i64 %76
  %79 = load float*** %78, align 8
  %80 = getelementptr inbounds float** %79, i64 %74
  %81 = load float** %80, align 8
  %82 = getelementptr inbounds float* %81, i64 %72
  %83 = load float* %82, align 4
  %84 = load i32* %minColor, align 4
  %85 = sitofp i32 %84 to float
  %86 = fcmp olt float %83, %85
  br i1 %86, label %87, label %100

; <label>:87                                      ; preds = %70
  %88 = load i32* %j, align 4
  %89 = sext i32 %88 to i64
  %90 = load i32* %i, align 4
  %91 = sext i32 %90 to i64
  %92 = load i32* %k, align 4
  %93 = sext i32 %92 to i64
  %94 = load float**** %output, align 8
  %95 = getelementptr inbounds float*** %94, i64 %93
  %96 = load float*** %95, align 8
  %97 = getelementptr inbounds float** %96, i64 %91
  %98 = load float** %97, align 8
  %99 = getelementptr inbounds float* %98, i64 %89
  store float 0.000000e+00, float* %99, align 4
  br label %166

; <label>:100                                     ; preds = %70
  %101 = load i32* %j, align 4
  %102 = sext i32 %101 to i64
  %103 = load i32* %i, align 4
  %104 = sext i32 %103 to i64
  %105 = load i32* %k, align 4
  %106 = sext i32 %105 to i64
  %107 = load float**** %1, align 8
  %108 = getelementptr inbounds float*** %107, i64 %106
  %109 = load float*** %108, align 8
  %110 = getelementptr inbounds float** %109, i64 %104
  %111 = load float** %110, align 8
  %112 = getelementptr inbounds float* %111, i64 %102
  %113 = load float* %112, align 4
  %114 = load i32* %maxColor, align 4
  %115 = sitofp i32 %114 to float
  %116 = fcmp ogt float %113, %115
  br i1 %116, label %117, label %130

; <label>:117                                     ; preds = %100
  %118 = load i32* %j, align 4
  %119 = sext i32 %118 to i64
  %120 = load i32* %i, align 4
  %121 = sext i32 %120 to i64
  %122 = load i32* %k, align 4
  %123 = sext i32 %122 to i64
  %124 = load float**** %output, align 8
  %125 = getelementptr inbounds float*** %124, i64 %123
  %126 = load float*** %125, align 8
  %127 = getelementptr inbounds float** %126, i64 %121
  %128 = load float** %127, align 8
  %129 = getelementptr inbounds float* %128, i64 %119
  store float 2.550000e+02, float* %129, align 4
  br label %165

; <label>:130                                     ; preds = %100
  %131 = load i32* %j, align 4
  %132 = sext i32 %131 to i64
  %133 = load i32* %i, align 4
  %134 = sext i32 %133 to i64
  %135 = load i32* %k, align 4
  %136 = sext i32 %135 to i64
  %137 = load float**** %1, align 8
  %138 = getelementptr inbounds float*** %137, i64 %136
  %139 = load float*** %138, align 8
  %140 = getelementptr inbounds float** %139, i64 %134
  %141 = load float** %140, align 8
  %142 = getelementptr inbounds float* %141, i64 %132
  %143 = load float* %142, align 4
  %144 = load i32* %minColor, align 4
  %145 = sitofp i32 %144 to float
  %146 = fsub float %143, %145
  %147 = load i32* %maxColor, align 4
  %148 = load i32* %minColor, align 4
  %149 = sub nsw i32 %147, %148
  %150 = sitofp i32 %149 to float
  %151 = fdiv float %146, %150
  %152 = fmul float %151, 2.550000e+02
  %153 = load i32* %j, align 4
  %154 = sext i32 %153 to i64
  %155 = load i32* %i, align 4
  %156 = sext i32 %155 to i64
  %157 = load i32* %k, align 4
  %158 = sext i32 %157 to i64
  %159 = load float**** %output, align 8
  %160 = getelementptr inbounds float*** %159, i64 %158
  %161 = load float*** %160, align 8
  %162 = getelementptr inbounds float** %161, i64 %156
  %163 = load float** %162, align 8
  %164 = getelementptr inbounds float* %163, i64 %154
  store float %152, float* %164, align 4
  br label %165

; <label>:165                                     ; preds = %130, %117
  br label %166

; <label>:166                                     ; preds = %165, %87
  br label %167

; <label>:167                                     ; preds = %166
  %168 = load i32* %j, align 4
  %169 = add nsw i32 %168, 1
  store i32 %169, i32* %j, align 4
  br label %66

; <label>:170                                     ; preds = %66
  br label %171

; <label>:171                                     ; preds = %170
  %172 = load i32* %i, align 4
  %173 = add nsw i32 %172, 1
  store i32 %173, i32* %i, align 4
  br label %61

; <label>:174                                     ; preds = %61
  %175 = load float*** %densityHistogram, align 8
  %176 = bitcast float** %175 to i8*
  call void @free(i8* %176) #5
  br label %177

; <label>:177                                     ; preds = %174
  %178 = load i32* %k, align 4
  %179 = add nsw i32 %178, 1
  store i32 %179, i32* %k, align 4
  br label %7

; <label>:180                                     ; preds = %7
  %181 = load float**** %output, align 8
  ret float*** %181
}

; Function Attrs: nounwind uwtable
define float** @generate_density_histogram(float** %input, i32 %size, i32 %M_in, i32 %N_in) #0 {
  %1 = alloca float**, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %output = alloca float**, align 8
  %count = alloca i32*, align 8
  %max = alloca double, align 8
  %value = alloca float, align 4
  store float** %input, float*** %1, align 8
  store i32 %size, i32* %2, align 4
  store i32 %M_in, i32* %3, align 4
  store i32 %N_in, i32* %4, align 4
  %5 = load i32* %2, align 4
  %6 = load i32* %2, align 4
  %7 = call float** @alloc2df(i32 %5, i32 %6)
  store float** %7, float*** %output, align 8
  %8 = load i32* %2, align 4
  %9 = call i32* @alloc1di(i32 %8)
  store i32* %9, i32** %count, align 8
  store i32 0, i32* %i, align 4
  br label %10

; <label>:10                                      ; preds = %39, %0
  %11 = load i32* %i, align 4
  %12 = load i32* %3, align 4
  %13 = icmp slt i32 %11, %12
  br i1 %13, label %14, label %42

; <label>:14                                      ; preds = %10
  store i32 0, i32* %j, align 4
  br label %15

; <label>:15                                      ; preds = %35, %14
  %16 = load i32* %j, align 4
  %17 = load i32* %4, align 4
  %18 = icmp slt i32 %16, %17
  br i1 %18, label %19, label %38

; <label>:19                                      ; preds = %15
  %20 = load i32* %j, align 4
  %21 = sext i32 %20 to i64
  %22 = load i32* %i, align 4
  %23 = sext i32 %22 to i64
  %24 = load float*** %1, align 8
  %25 = getelementptr inbounds float** %24, i64 %23
  %26 = load float** %25, align 8
  %27 = getelementptr inbounds float* %26, i64 %21
  %28 = load float* %27, align 4
  %29 = fptosi float %28 to i32
  %30 = sext i32 %29 to i64
  %31 = load i32** %count, align 8
  %32 = getelementptr inbounds i32* %31, i64 %30
  %33 = load i32* %32, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, i32* %32, align 4
  br label %35

; <label>:35                                      ; preds = %19
  %36 = load i32* %j, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, i32* %j, align 4
  br label %15

; <label>:38                                      ; preds = %15
  br label %39

; <label>:39                                      ; preds = %38
  %40 = load i32* %i, align 4
  %41 = add nsw i32 %40, 1
  store i32 %41, i32* %i, align 4
  br label %10

; <label>:42                                      ; preds = %10
  %43 = load i32** %count, align 8
  %44 = load i32* %2, align 4
  %45 = call i32 @max_value(i32* %43, i32 %44)
  %46 = sitofp i32 %45 to double
  store double %46, double* %max, align 8
  store i32 0, i32* %i, align 4
  br label %47

; <label>:47                                      ; preds = %68, %42
  %48 = load i32* %i, align 4
  %49 = load i32* %2, align 4
  %50 = icmp slt i32 %48, %49
  br i1 %50, label %51, label %71

; <label>:51                                      ; preds = %47
  %52 = load i32* %i, align 4
  %53 = sext i32 %52 to i64
  %54 = load i32** %count, align 8
  %55 = getelementptr inbounds i32* %54, i64 %53
  %56 = load i32* %55, align 4
  %57 = sitofp i32 %56 to double
  %58 = load double* %max, align 8
  %59 = fdiv double %57, %58
  %60 = load i32* %2, align 4
  %61 = sitofp i32 %60 to double
  %62 = fmul double %59, %61
  %63 = fptosi double %62 to i32
  %64 = load i32* %i, align 4
  %65 = sext i32 %64 to i64
  %66 = load i32** %count, align 8
  %67 = getelementptr inbounds i32* %66, i64 %65
  store i32 %63, i32* %67, align 4
  br label %68

; <label>:68                                      ; preds = %51
  %69 = load i32* %i, align 4
  %70 = add nsw i32 %69, 1
  store i32 %70, i32* %i, align 4
  br label %47

; <label>:71                                      ; preds = %47
  store i32 0, i32* %i, align 4
  br label %72

; <label>:72                                      ; preds = %106, %71
  %73 = load i32* %i, align 4
  %74 = load i32* %2, align 4
  %75 = icmp slt i32 %73, %74
  br i1 %75, label %76, label %109

; <label>:76                                      ; preds = %72
  store i32 0, i32* %j, align 4
  br label %77

; <label>:77                                      ; preds = %102, %76
  %78 = load i32* %j, align 4
  %79 = load i32* %2, align 4
  %80 = icmp slt i32 %78, %79
  br i1 %80, label %81, label %105

; <label>:81                                      ; preds = %77
  %82 = load i32* %i, align 4
  %83 = sub nsw i32 255, %82
  %84 = load i32* %j, align 4
  %85 = sext i32 %84 to i64
  %86 = load i32** %count, align 8
  %87 = getelementptr inbounds i32* %86, i64 %85
  %88 = load i32* %87, align 4
  %89 = icmp slt i32 %83, %88
  br i1 %89, label %90, label %91

; <label>:90                                      ; preds = %81
  store float 2.550000e+02, float* %value, align 4
  br label %92

; <label>:91                                      ; preds = %81
  store float 0.000000e+00, float* %value, align 4
  br label %92

; <label>:92                                      ; preds = %91, %90
  %93 = load float* %value, align 4
  %94 = load i32* %j, align 4
  %95 = sext i32 %94 to i64
  %96 = load i32* %i, align 4
  %97 = sext i32 %96 to i64
  %98 = load float*** %output, align 8
  %99 = getelementptr inbounds float** %98, i64 %97
  %100 = load float** %99, align 8
  %101 = getelementptr inbounds float* %100, i64 %95
  store float %93, float* %101, align 4
  br label %102

; <label>:102                                     ; preds = %92
  %103 = load i32* %j, align 4
  %104 = add nsw i32 %103, 1
  store i32 %104, i32* %j, align 4
  br label %77

; <label>:105                                     ; preds = %77
  br label %106

; <label>:106                                     ; preds = %105
  %107 = load i32* %i, align 4
  %108 = add nsw i32 %107, 1
  store i32 %108, i32* %i, align 4
  br label %72

; <label>:109                                     ; preds = %72
  %110 = load i32** %count, align 8
  %111 = bitcast i32* %110 to i8*
  call void @free(i8* %111) #5
  %112 = load float*** %output, align 8
  ret float** %112
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare float* @alloc1df(i32) #1

; Function Attrs: nounwind uwtable
define float* @find_pixel_array(float** %input, i32 %M_in, i32 %N_in, i32 %row, i32 %col, i32 %size, i32* %array_size) #0 {
  %1 = alloca float**, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32*, align 8
  %array = alloca float*, align 8
  %index = alloca i32, align 4
  %center = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %pixel_row = alloca i32, align 4
  %pixel_col = alloca i32, align 4
  store float** %input, float*** %1, align 8
  store i32 %M_in, i32* %2, align 4
  store i32 %N_in, i32* %3, align 4
  store i32 %row, i32* %4, align 4
  store i32 %col, i32* %5, align 4
  store i32 %size, i32* %6, align 4
  store i32* %array_size, i32** %7, align 8
  %8 = load i32* %6, align 4
  %9 = load i32* %6, align 4
  %10 = mul nsw i32 %8, %9
  %11 = load i32** %7, align 8
  store i32 %10, i32* %11, align 4
  %12 = load i32** %7, align 8
  %13 = load i32* %12, align 4
  %14 = call float* @alloc1df(i32 %13)
  store float* %14, float** %array, align 8
  store i32 0, i32* %index, align 4
  %15 = load i32* %6, align 4
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, 2.000000e+00
  %18 = call double @floor(double %17) #4
  %19 = fptosi double %18 to i32
  store i32 %19, i32* %center, align 4
  store i32 0, i32* %i, align 4
  br label %20

; <label>:20                                      ; preds = %82, %0
  %21 = load i32* %i, align 4
  %22 = load i32* %6, align 4
  %23 = icmp slt i32 %21, %22
  br i1 %23, label %24, label %85

; <label>:24                                      ; preds = %20
  store i32 0, i32* %j, align 4
  br label %25

; <label>:25                                      ; preds = %78, %24
  %26 = load i32* %j, align 4
  %27 = load i32* %6, align 4
  %28 = icmp slt i32 %26, %27
  br i1 %28, label %29, label %81

; <label>:29                                      ; preds = %25
  %30 = load i32* %4, align 4
  %31 = load i32* %i, align 4
  %32 = load i32* %center, align 4
  %33 = sub nsw i32 %31, %32
  %34 = add nsw i32 %30, %33
  store i32 %34, i32* %pixel_row, align 4
  %35 = load i32* %5, align 4
  %36 = load i32* %j, align 4
  %37 = load i32* %center, align 4
  %38 = sub nsw i32 %36, %37
  %39 = add nsw i32 %35, %38
  store i32 %39, i32* %pixel_col, align 4
  %40 = load i32* %pixel_row, align 4
  %41 = icmp slt i32 %40, 0
  br i1 %41, label %42, label %43

; <label>:42                                      ; preds = %29
  store i32 0, i32* %pixel_row, align 4
  br label %43

; <label>:43                                      ; preds = %42, %29
  %44 = load i32* %pixel_row, align 4
  %45 = load i32* %2, align 4
  %46 = sub nsw i32 %45, 1
  %47 = icmp sgt i32 %44, %46
  br i1 %47, label %48, label %51

; <label>:48                                      ; preds = %43
  %49 = load i32* %2, align 4
  %50 = sub nsw i32 %49, 1
  store i32 %50, i32* %pixel_row, align 4
  br label %51

; <label>:51                                      ; preds = %48, %43
  %52 = load i32* %pixel_col, align 4
  %53 = icmp slt i32 %52, 0
  br i1 %53, label %54, label %55

; <label>:54                                      ; preds = %51
  store i32 0, i32* %pixel_col, align 4
  br label %55

; <label>:55                                      ; preds = %54, %51
  %56 = load i32* %pixel_col, align 4
  %57 = load i32* %3, align 4
  %58 = sub nsw i32 %57, 1
  %59 = icmp sgt i32 %56, %58
  br i1 %59, label %60, label %63

; <label>:60                                      ; preds = %55
  %61 = load i32* %3, align 4
  %62 = sub nsw i32 %61, 1
  store i32 %62, i32* %pixel_col, align 4
  br label %63

; <label>:63                                      ; preds = %60, %55
  %64 = load i32* %pixel_col, align 4
  %65 = sext i32 %64 to i64
  %66 = load i32* %pixel_row, align 4
  %67 = sext i32 %66 to i64
  %68 = load float*** %1, align 8
  %69 = getelementptr inbounds float** %68, i64 %67
  %70 = load float** %69, align 8
  %71 = getelementptr inbounds float* %70, i64 %65
  %72 = load float* %71, align 4
  %73 = load i32* %index, align 4
  %74 = add nsw i32 %73, 1
  store i32 %74, i32* %index, align 4
  %75 = sext i32 %73 to i64
  %76 = load float** %array, align 8
  %77 = getelementptr inbounds float* %76, i64 %75
  store float %72, float* %77, align 4
  br label %78

; <label>:78                                      ; preds = %63
  %79 = load i32* %j, align 4
  %80 = add nsw i32 %79, 1
  store i32 %80, i32* %j, align 4
  br label %25

; <label>:81                                      ; preds = %25
  br label %82

; <label>:82                                      ; preds = %81
  %83 = load i32* %i, align 4
  %84 = add nsw i32 %83, 1
  store i32 %84, i32* %i, align 4
  br label %20

; <label>:85                                      ; preds = %20
  %86 = load float** %array, align 8
  ret float* %86
}

; Function Attrs: nounwind uwtable
define float* @find_cross_array(float** %input, i32 %M_in, i32 %N_in, i32 %row, i32 %col, i32 %width, i32 %height, i32* %array_size) #0 {
  %1 = alloca float**, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32*, align 8
  %cross_array = alloca float*, align 8
  %current_index = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %pixel_row = alloca i32, align 4
  %pixel_col = alloca i32, align 4
  %pixel_row1 = alloca i32, align 4
  %pixel_col2 = alloca i32, align 4
  store float** %input, float*** %1, align 8
  store i32 %M_in, i32* %2, align 4
  store i32 %N_in, i32* %3, align 4
  store i32 %row, i32* %4, align 4
  store i32 %col, i32* %5, align 4
  store i32 %width, i32* %6, align 4
  store i32 %height, i32* %7, align 4
  store i32* %array_size, i32** %8, align 8
  %9 = load i32* %6, align 4
  %10 = mul nsw i32 %9, 2
  %11 = load i32* %7, align 4
  %12 = mul nsw i32 %11, 2
  %13 = add nsw i32 %10, %12
  %14 = load i32** %8, align 8
  store i32 %13, i32* %14, align 4
  %15 = load i32** %8, align 8
  %16 = load i32* %15, align 4
  %17 = call float* @alloc1df(i32 %16)
  store float* %17, float** %cross_array, align 8
  store i32 0, i32* %current_index, align 4
  store i32 0, i32* %i, align 4
  br label %18

; <label>:18                                      ; preds = %56, %0
  %19 = load i32* %i, align 4
  %20 = load i32* %6, align 4
  %21 = mul nsw i32 %20, 2
  %22 = icmp slt i32 %19, %21
  br i1 %22, label %23, label %59

; <label>:23                                      ; preds = %18
  %24 = load i32* %4, align 4
  %25 = load i32* %i, align 4
  %26 = load i32* %6, align 4
  %27 = sub nsw i32 %25, %26
  %28 = add nsw i32 %24, %27
  store i32 %28, i32* %pixel_row, align 4
  %29 = load i32* %5, align 4
  store i32 %29, i32* %pixel_col, align 4
  %30 = load i32* %pixel_row, align 4
  %31 = icmp slt i32 %30, 0
  br i1 %31, label %32, label %33

; <label>:32                                      ; preds = %23
  store i32 0, i32* %pixel_row, align 4
  br label %33

; <label>:33                                      ; preds = %32, %23
  %34 = load i32* %pixel_row, align 4
  %35 = load i32* %2, align 4
  %36 = sub nsw i32 %35, 1
  %37 = icmp sgt i32 %34, %36
  br i1 %37, label %38, label %41

; <label>:38                                      ; preds = %33
  %39 = load i32* %2, align 4
  %40 = sub nsw i32 %39, 1
  store i32 %40, i32* %pixel_row, align 4
  br label %41

; <label>:41                                      ; preds = %38, %33
  %42 = load i32* %pixel_col, align 4
  %43 = sext i32 %42 to i64
  %44 = load i32* %pixel_row, align 4
  %45 = sext i32 %44 to i64
  %46 = load float*** %1, align 8
  %47 = getelementptr inbounds float** %46, i64 %45
  %48 = load float** %47, align 8
  %49 = getelementptr inbounds float* %48, i64 %43
  %50 = load float* %49, align 4
  %51 = load i32* %current_index, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, i32* %current_index, align 4
  %53 = sext i32 %51 to i64
  %54 = load float** %cross_array, align 8
  %55 = getelementptr inbounds float* %54, i64 %53
  store float %50, float* %55, align 4
  br label %56

; <label>:56                                      ; preds = %41
  %57 = load i32* %i, align 4
  %58 = add nsw i32 %57, 1
  store i32 %58, i32* %i, align 4
  br label %18

; <label>:59                                      ; preds = %18
  store i32 0, i32* %j, align 4
  br label %60

; <label>:60                                      ; preds = %98, %59
  %61 = load i32* %j, align 4
  %62 = load i32* %7, align 4
  %63 = mul nsw i32 %62, 2
  %64 = icmp slt i32 %61, %63
  br i1 %64, label %65, label %101

; <label>:65                                      ; preds = %60
  %66 = load i32* %4, align 4
  store i32 %66, i32* %pixel_row1, align 4
  %67 = load i32* %5, align 4
  %68 = load i32* %j, align 4
  %69 = load i32* %7, align 4
  %70 = sub nsw i32 %68, %69
  %71 = add nsw i32 %67, %70
  store i32 %71, i32* %pixel_col2, align 4
  %72 = load i32* %pixel_col2, align 4
  %73 = icmp slt i32 %72, 0
  br i1 %73, label %74, label %75

; <label>:74                                      ; preds = %65
  store i32 0, i32* %pixel_col2, align 4
  br label %75

; <label>:75                                      ; preds = %74, %65
  %76 = load i32* %pixel_col2, align 4
  %77 = load i32* %3, align 4
  %78 = sub nsw i32 %77, 1
  %79 = icmp sgt i32 %76, %78
  br i1 %79, label %80, label %83

; <label>:80                                      ; preds = %75
  %81 = load i32* %3, align 4
  %82 = sub nsw i32 %81, 1
  store i32 %82, i32* %pixel_col2, align 4
  br label %83

; <label>:83                                      ; preds = %80, %75
  %84 = load i32* %pixel_col2, align 4
  %85 = sext i32 %84 to i64
  %86 = load i32* %pixel_row1, align 4
  %87 = sext i32 %86 to i64
  %88 = load float*** %1, align 8
  %89 = getelementptr inbounds float** %88, i64 %87
  %90 = load float** %89, align 8
  %91 = getelementptr inbounds float* %90, i64 %85
  %92 = load float* %91, align 4
  %93 = load i32* %current_index, align 4
  %94 = add nsw i32 %93, 1
  store i32 %94, i32* %current_index, align 4
  %95 = sext i32 %93 to i64
  %96 = load float** %cross_array, align 8
  %97 = getelementptr inbounds float* %96, i64 %95
  store float %92, float* %97, align 4
  br label %98

; <label>:98                                      ; preds = %83
  %99 = load i32* %j, align 4
  %100 = add nsw i32 %99, 1
  store i32 %100, i32* %j, align 4
  br label %60

; <label>:101                                     ; preds = %60
  %102 = load float** %cross_array, align 8
  ret float* %102
}

; Function Attrs: nounwind uwtable
define float*** @median_filter(float*** %input, i32 %M_in, i32 %N_in) #0 {
  %1 = alloca float***, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %option = alloca i32, align 4
  %output = alloca float***, align 8
  store float*** %input, float**** %1, align 8
  store i32 %M_in, i32* %2, align 4
  store i32 %N_in, i32* %3, align 4
  %4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([65 x i8]* @.str8, i32 0, i32 0))
  %5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str9, i32 0, i32 0))
  %6 = call i32 (i8*, ...)* @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8]* @.str5, i32 0, i32 0), i32* %option)
  %7 = load i32* %option, align 4
  switch i32 %7, label %14 [
    i32 2, label %8
  ]

; <label>:8                                       ; preds = %0
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([45 x i8]* @.str10, i32 0, i32 0))
  %10 = load float**** %1, align 8
  %11 = load i32* %2, align 4
  %12 = load i32* %3, align 4
  %13 = call float*** @square_median_filter(float*** %10, i32 %11, i32 %12)
  store float*** %13, float**** %output, align 8
  br label %20

; <label>:14                                      ; preds = %0
  %15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str11, i32 0, i32 0))
  %16 = load float**** %1, align 8
  %17 = load i32* %2, align 4
  %18 = load i32* %3, align 4
  %19 = call float*** @cross_median_filter(float*** %16, i32 %17, i32 %18)
  store float*** %19, float**** %output, align 8
  br label %20

; <label>:20                                      ; preds = %14, %8
  %21 = load float**** %output, align 8
  ret float*** %21
}

; Function Attrs: nounwind uwtable
define float*** @cross_median_filter(float*** %input, i32 %M_in, i32 %N_in) #0 {
  %1 = alloca float***, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %output = alloca float***, align 8
  %width = alloca i32, align 4
  %height = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  %m = alloca i32, align 4
  %array_size = alloca i32, align 4
  %cross = alloca float*, align 8
  %swap = alloca float, align 4
  %center = alloca i32, align 4
  store float*** %input, float**** %1, align 8
  store i32 %M_in, i32* %2, align 4
  store i32 %N_in, i32* %3, align 4
  %4 = load i32* %2, align 4
  %5 = load i32* %3, align 4
  %6 = call float*** @alloc3df(i32 3, i32 %4, i32 %5)
  store float*** %6, float**** %output, align 8
  store i32 4, i32* %width, align 4
  store i32 4, i32* %height, align 4
  store i32 0, i32* %k, align 4
  br label %7

; <label>:7                                       ; preds = %116, %0
  %8 = load i32* %k, align 4
  %9 = icmp slt i32 %8, 3
  br i1 %9, label %10, label %119

; <label>:10                                      ; preds = %7
  store i32 0, i32* %i, align 4
  br label %11

; <label>:11                                      ; preds = %112, %10
  %12 = load i32* %i, align 4
  %13 = load i32* %2, align 4
  %14 = icmp slt i32 %12, %13
  br i1 %14, label %15, label %115

; <label>:15                                      ; preds = %11
  store i32 0, i32* %j, align 4
  br label %16

; <label>:16                                      ; preds = %108, %15
  %17 = load i32* %j, align 4
  %18 = load i32* %3, align 4
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %20, label %111

; <label>:20                                      ; preds = %16
  %21 = load i32* %k, align 4
  %22 = sext i32 %21 to i64
  %23 = load float**** %1, align 8
  %24 = getelementptr inbounds float*** %23, i64 %22
  %25 = load float*** %24, align 8
  %26 = load i32* %2, align 4
  %27 = load i32* %3, align 4
  %28 = load i32* %i, align 4
  %29 = load i32* %j, align 4
  %30 = load i32* %width, align 4
  %31 = load i32* %height, align 4
  %32 = call float* @find_cross_array(float** %25, i32 %26, i32 %27, i32 %28, i32 %29, i32 %30, i32 %31, i32* %array_size)
  store float* %32, float** %cross, align 8
  store i32 0, i32* %m, align 4
  br label %33

; <label>:33                                      ; preds = %82, %20
  %34 = load i32* %m, align 4
  %35 = load i32* %array_size, align 4
  %36 = sub nsw i32 %35, 1
  %37 = icmp slt i32 %34, %36
  br i1 %37, label %38, label %85

; <label>:38                                      ; preds = %33
  %39 = load i32* %m, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, i32* %l, align 4
  br label %41

; <label>:41                                      ; preds = %78, %38
  %42 = load i32* %l, align 4
  %43 = load i32* %array_size, align 4
  %44 = icmp slt i32 %42, %43
  br i1 %44, label %45, label %81

; <label>:45                                      ; preds = %41
  %46 = load i32* %m, align 4
  %47 = sext i32 %46 to i64
  %48 = load float** %cross, align 8
  %49 = getelementptr inbounds float* %48, i64 %47
  %50 = load float* %49, align 4
  %51 = load i32* %l, align 4
  %52 = sext i32 %51 to i64
  %53 = load float** %cross, align 8
  %54 = getelementptr inbounds float* %53, i64 %52
  %55 = load float* %54, align 4
  %56 = fcmp ogt float %50, %55
  br i1 %56, label %57, label %77

; <label>:57                                      ; preds = %45
  %58 = load i32* %m, align 4
  %59 = sext i32 %58 to i64
  %60 = load float** %cross, align 8
  %61 = getelementptr inbounds float* %60, i64 %59
  %62 = load float* %61, align 4
  store float %62, float* %swap, align 4
  %63 = load i32* %l, align 4
  %64 = sext i32 %63 to i64
  %65 = load float** %cross, align 8
  %66 = getelementptr inbounds float* %65, i64 %64
  %67 = load float* %66, align 4
  %68 = load i32* %m, align 4
  %69 = sext i32 %68 to i64
  %70 = load float** %cross, align 8
  %71 = getelementptr inbounds float* %70, i64 %69
  store float %67, float* %71, align 4
  %72 = load float* %swap, align 4
  %73 = load i32* %l, align 4
  %74 = sext i32 %73 to i64
  %75 = load float** %cross, align 8
  %76 = getelementptr inbounds float* %75, i64 %74
  store float %72, float* %76, align 4
  br label %77

; <label>:77                                      ; preds = %57, %45
  br label %78

; <label>:78                                      ; preds = %77
  %79 = load i32* %l, align 4
  %80 = add nsw i32 %79, 1
  store i32 %80, i32* %l, align 4
  br label %41

; <label>:81                                      ; preds = %41
  br label %82

; <label>:82                                      ; preds = %81
  %83 = load i32* %m, align 4
  %84 = add nsw i32 %83, 1
  store i32 %84, i32* %m, align 4
  br label %33

; <label>:85                                      ; preds = %33
  %86 = load i32* %array_size, align 4
  %87 = sitofp i32 %86 to double
  %88 = fdiv double %87, 2.000000e+00
  %89 = call double @floor(double %88) #4
  %90 = fptosi double %89 to i32
  store i32 %90, i32* %center, align 4
  %91 = load i32* %center, align 4
  %92 = sext i32 %91 to i64
  %93 = load float** %cross, align 8
  %94 = getelementptr inbounds float* %93, i64 %92
  %95 = load float* %94, align 4
  %96 = load i32* %j, align 4
  %97 = sext i32 %96 to i64
  %98 = load i32* %i, align 4
  %99 = sext i32 %98 to i64
  %100 = load i32* %k, align 4
  %101 = sext i32 %100 to i64
  %102 = load float**** %output, align 8
  %103 = getelementptr inbounds float*** %102, i64 %101
  %104 = load float*** %103, align 8
  %105 = getelementptr inbounds float** %104, i64 %99
  %106 = load float** %105, align 8
  %107 = getelementptr inbounds float* %106, i64 %97
  store float %95, float* %107, align 4
  br label %108

; <label>:108                                     ; preds = %85
  %109 = load i32* %j, align 4
  %110 = add nsw i32 %109, 1
  store i32 %110, i32* %j, align 4
  br label %16

; <label>:111                                     ; preds = %16
  br label %112

; <label>:112                                     ; preds = %111
  %113 = load i32* %i, align 4
  %114 = add nsw i32 %113, 1
  store i32 %114, i32* %i, align 4
  br label %11

; <label>:115                                     ; preds = %11
  br label %116

; <label>:116                                     ; preds = %115
  %117 = load i32* %k, align 4
  %118 = add nsw i32 %117, 1
  store i32 %118, i32* %k, align 4
  br label %7

; <label>:119                                     ; preds = %7
  %120 = load float**** %output, align 8
  ret float*** %120
}

; Function Attrs: nounwind uwtable
define i32 @max_value(i32* %array, i32 %num_elements) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca i32, align 4
  %i = alloca i32, align 4
  %max = alloca i32, align 4
  store i32* %array, i32** %1, align 8
  store i32 %num_elements, i32* %2, align 4
  store i32 -32000, i32* %max, align 4
  store i32 0, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %22, %0
  %4 = load i32* %i, align 4
  %5 = load i32* %2, align 4
  %6 = icmp slt i32 %4, %5
  br i1 %6, label %7, label %25

; <label>:7                                       ; preds = %3
  %8 = load i32* %i, align 4
  %9 = sext i32 %8 to i64
  %10 = load i32** %1, align 8
  %11 = getelementptr inbounds i32* %10, i64 %9
  %12 = load i32* %11, align 4
  %13 = load i32* %max, align 4
  %14 = icmp sgt i32 %12, %13
  br i1 %14, label %15, label %21

; <label>:15                                      ; preds = %7
  %16 = load i32* %i, align 4
  %17 = sext i32 %16 to i64
  %18 = load i32** %1, align 8
  %19 = getelementptr inbounds i32* %18, i64 %17
  %20 = load i32* %19, align 4
  store i32 %20, i32* %max, align 4
  br label %21

; <label>:21                                      ; preds = %15, %7
  br label %22

; <label>:22                                      ; preds = %21
  %23 = load i32* %i, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, i32* %i, align 4
  br label %3

; <label>:25                                      ; preds = %3
  %26 = load i32* %max, align 4
  ret i32 %26
}

declare i32* @alloc1di(i32) #1

; Function Attrs: nounwind uwtable
define float** @generate_cumulative_histogram(float** %img, i32 %size, i32 %M_in, i32 %N_in) #0 {
  %1 = alloca float**, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %output = alloca float**, align 8
  %count = alloca double*, align 8
  %density = alloca float, align 4
  %total = alloca double, align 8
  %value = alloca float, align 4
  store float** %img, float*** %1, align 8
  store i32 %size, i32* %2, align 4
  store i32 %M_in, i32* %3, align 4
  store i32 %N_in, i32* %4, align 4
  %5 = load i32* %2, align 4
  %6 = load i32* %2, align 4
  %7 = call float** @alloc2df(i32 %5, i32 %6)
  store float** %7, float*** %output, align 8
  %8 = load i32* %2, align 4
  %9 = call double* @alloc1dd(i32 %8)
  store double* %9, double** %count, align 8
  %10 = load i32* %3, align 4
  %11 = load i32* %4, align 4
  %12 = mul nsw i32 %10, %11
  %13 = sitofp i32 %12 to float
  %14 = fdiv float 1.000000e+00, %13
  store float %14, float* %density, align 4
  store i32 0, i32* %i, align 4
  br label %15

; <label>:15                                      ; preds = %46, %0
  %16 = load i32* %i, align 4
  %17 = load i32* %3, align 4
  %18 = icmp slt i32 %16, %17
  br i1 %18, label %19, label %49

; <label>:19                                      ; preds = %15
  store i32 0, i32* %j, align 4
  br label %20

; <label>:20                                      ; preds = %42, %19
  %21 = load i32* %j, align 4
  %22 = load i32* %4, align 4
  %23 = icmp slt i32 %21, %22
  br i1 %23, label %24, label %45

; <label>:24                                      ; preds = %20
  %25 = load float* %density, align 4
  %26 = fpext float %25 to double
  %27 = load i32* %j, align 4
  %28 = sext i32 %27 to i64
  %29 = load i32* %i, align 4
  %30 = sext i32 %29 to i64
  %31 = load float*** %1, align 8
  %32 = getelementptr inbounds float** %31, i64 %30
  %33 = load float** %32, align 8
  %34 = getelementptr inbounds float* %33, i64 %28
  %35 = load float* %34, align 4
  %36 = fptosi float %35 to i32
  %37 = sext i32 %36 to i64
  %38 = load double** %count, align 8
  %39 = getelementptr inbounds double* %38, i64 %37
  %40 = load double* %39, align 8
  %41 = fadd double %40, %26
  store double %41, double* %39, align 8
  br label %42

; <label>:42                                      ; preds = %24
  %43 = load i32* %j, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, i32* %j, align 4
  br label %20

; <label>:45                                      ; preds = %20
  br label %46

; <label>:46                                      ; preds = %45
  %47 = load i32* %i, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, i32* %i, align 4
  br label %15

; <label>:49                                      ; preds = %15
  store double 0.000000e+00, double* %total, align 8
  store i32 0, i32* %i, align 4
  br label %50

; <label>:50                                      ; preds = %70, %49
  %51 = load i32* %i, align 4
  %52 = load i32* %2, align 4
  %53 = icmp slt i32 %51, %52
  br i1 %53, label %54, label %73

; <label>:54                                      ; preds = %50
  %55 = load i32* %i, align 4
  %56 = sext i32 %55 to i64
  %57 = load double** %count, align 8
  %58 = getelementptr inbounds double* %57, i64 %56
  %59 = load double* %58, align 8
  %60 = load double* %total, align 8
  %61 = fadd double %60, %59
  store double %61, double* %total, align 8
  %62 = load double* %total, align 8
  %63 = load i32* %2, align 4
  %64 = sitofp i32 %63 to double
  %65 = fmul double %62, %64
  %66 = load i32* %i, align 4
  %67 = sext i32 %66 to i64
  %68 = load double** %count, align 8
  %69 = getelementptr inbounds double* %68, i64 %67
  store double %65, double* %69, align 8
  br label %70

; <label>:70                                      ; preds = %54
  %71 = load i32* %i, align 4
  %72 = add nsw i32 %71, 1
  store i32 %72, i32* %i, align 4
  br label %50

; <label>:73                                      ; preds = %50
  store i32 0, i32* %i, align 4
  br label %74

; <label>:74                                      ; preds = %109, %73
  %75 = load i32* %i, align 4
  %76 = load i32* %2, align 4
  %77 = icmp slt i32 %75, %76
  br i1 %77, label %78, label %112

; <label>:78                                      ; preds = %74
  store i32 0, i32* %j, align 4
  br label %79

; <label>:79                                      ; preds = %105, %78
  %80 = load i32* %j, align 4
  %81 = load i32* %2, align 4
  %82 = icmp slt i32 %80, %81
  br i1 %82, label %83, label %108

; <label>:83                                      ; preds = %79
  %84 = load i32* %i, align 4
  %85 = sub nsw i32 255, %84
  %86 = sitofp i32 %85 to double
  %87 = load i32* %j, align 4
  %88 = sext i32 %87 to i64
  %89 = load double** %count, align 8
  %90 = getelementptr inbounds double* %89, i64 %88
  %91 = load double* %90, align 8
  %92 = fcmp olt double %86, %91
  br i1 %92, label %93, label %94

; <label>:93                                      ; preds = %83
  store float 2.550000e+02, float* %value, align 4
  br label %95

; <label>:94                                      ; preds = %83
  store float 0.000000e+00, float* %value, align 4
  br label %95

; <label>:95                                      ; preds = %94, %93
  %96 = load float* %value, align 4
  %97 = load i32* %j, align 4
  %98 = sext i32 %97 to i64
  %99 = load i32* %i, align 4
  %100 = sext i32 %99 to i64
  %101 = load float*** %output, align 8
  %102 = getelementptr inbounds float** %101, i64 %100
  %103 = load float** %102, align 8
  %104 = getelementptr inbounds float* %103, i64 %98
  store float %96, float* %104, align 4
  br label %105

; <label>:105                                     ; preds = %95
  %106 = load i32* %j, align 4
  %107 = add nsw i32 %106, 1
  store i32 %107, i32* %j, align 4
  br label %79

; <label>:108                                     ; preds = %79
  br label %109

; <label>:109                                     ; preds = %108
  %110 = load i32* %i, align 4
  %111 = add nsw i32 %110, 1
  store i32 %111, i32* %i, align 4
  br label %74

; <label>:112                                     ; preds = %74
  %113 = load double** %count, align 8
  %114 = bitcast double* %113 to i8*
  call void @free(i8* %114) #5
  %115 = load float*** %output, align 8
  ret float** %115
}

declare double* @alloc1dd(i32) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4 (tags/RELEASE_34/final)"}
