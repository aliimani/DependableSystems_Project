; ModuleID = 'lodepng.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.LodePNGCompressSettings = type { i32, i32, i32, i32, i32, i32, {}*, {}*, i8* }
%struct.LodePNGDecompressSettings = type { i32, {}*, {}*, i8* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.Coin = type { %struct.uivector, float }
%struct.uivector = type { i32*, i64, i64 }
%struct.ucvector = type { i8*, i64, i64 }
%struct.Hash = type { i32*, i32*, i16*, i16* }
%struct.LodePNGColorMode = type { i32, i32, i8*, i64, i32, i32, i32, i32 }
%struct.LodePNGInfo = type { i32, i32, i32, %struct.LodePNGColorMode, i32, i32, i32, i32, i64, i8**, i8**, i64, i8**, i8**, i8**, i8**, i32, %struct.LodePNGTime, i32, i32, i32, i32, [3 x i8*], [3 x i64] }
%struct.LodePNGTime = type { i32, i32, i32, i32, i32, i32 }
%struct.ColorTree = type { [16 x %struct.ColorTree*], i32 }
%struct.ColorProfile = type { i8, i8, i8, i8, i8, i16, i16, i16, i8, i8, i32, %struct.ColorTree, i8*, i32, i8, i32, i8 }
%struct.LodePNGState = type { %struct.LodePNGDecoderSettings, %struct.LodePNGEncoderSettings, %struct.LodePNGColorMode, %struct.LodePNGInfo, i32 }
%struct.LodePNGDecoderSettings = type { %struct.LodePNGDecompressSettings, i32, i32, i32, i32, i32 }
%struct.LodePNGEncoderSettings = type { %struct.LodePNGCompressSettings, i32, i32, i32, i8*, i32, i32, i32 }
%struct.HuffmanTree = type { i32*, i32*, i32*, i32, i32 }

@.str = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str1 = private unnamed_addr constant [3 x i8] c"wb\00", align 1
@lodepng_default_compress_settings = constant { i32, i32, i32, i32, i32, i32, i32 (i8**, i64*, i8*, i64, %struct.LodePNGCompressSettings*)*, i32 (i8**, i64*, i8*, i64, %struct.LodePNGCompressSettings*)*, i8* } { i32 2, i32 1, i32 2048, i32 3, i32 128, i32 1, i32 (i8**, i64*, i8*, i64, %struct.LodePNGCompressSettings*)* null, i32 (i8**, i64*, i8*, i64, %struct.LodePNGCompressSettings*)* null, i8* null }, align 8
@lodepng_default_decompress_settings = constant { i32, i32 (i8**, i64*, i8*, i64, %struct.LodePNGDecompressSettings*)*, i32 (i8**, i64*, i8*, i64, %struct.LodePNGDecompressSettings*)*, i8* } zeroinitializer, align 8
@lodepng_crc32_table = internal global [256 x i32] [i32 0, i32 1996959894, i32 -301047508, i32 -1727442502, i32 124634137, i32 1886057615, i32 -379345611, i32 -1637575261, i32 249268274, i32 2044508324, i32 -522852066, i32 -1747789432, i32 162941995, i32 2125561021, i32 -407360249, i32 -1866523247, i32 498536548, i32 1789927666, i32 -205950648, i32 -2067906082, i32 450548861, i32 1843258603, i32 -187386543, i32 -2083289657, i32 325883990, i32 1684777152, i32 -43845254, i32 -1973040660, i32 335633487, i32 1661365465, i32 -99664541, i32 -1928851979, i32 997073096, i32 1281953886, i32 -715111964, i32 -1570279054, i32 1006888145, i32 1258607687, i32 -770865667, i32 -1526024853, i32 901097722, i32 1119000684, i32 -608450090, i32 -1396901568, i32 853044451, i32 1172266101, i32 -589951537, i32 -1412350631, i32 651767980, i32 1373503546, i32 -925412992, i32 -1076862698, i32 565507253, i32 1454621731, i32 -809855591, i32 -1195530993, i32 671266974, i32 1594198024, i32 -972236366, i32 -1324619484, i32 795835527, i32 1483230225, i32 -1050600021, i32 -1234817731, i32 1994146192, i32 31158534, i32 -1731059524, i32 -271249366, i32 1907459465, i32 112637215, i32 -1614814043, i32 -390540237, i32 2013776290, i32 251722036, i32 -1777751922, i32 -519137256, i32 2137656763, i32 141376813, i32 -1855689577, i32 -429695999, i32 1802195444, i32 476864866, i32 -2056965928, i32 -228458418, i32 1812370925, i32 453092731, i32 -2113342271, i32 -183516073, i32 1706088902, i32 314042704, i32 -1950435094, i32 -54949764, i32 1658658271, i32 366619977, i32 -1932296973, i32 -69972891, i32 1303535960, i32 984961486, i32 -1547960204, i32 -725929758, i32 1256170817, i32 1037604311, i32 -1529756563, i32 -740887301, i32 1131014506, i32 879679996, i32 -1385723834, i32 -631195440, i32 1141124467, i32 855842277, i32 -1442165665, i32 -586318647, i32 1342533948, i32 654459306, i32 -1106571248, i32 -921952122, i32 1466479909, i32 544179635, i32 -1184443383, i32 -832445281, i32 1591671054, i32 702138776, i32 -1328506846, i32 -942167884, i32 1504918807, i32 783551873, i32 -1212326853, i32 -1061524307, i32 -306674912, i32 -1698712650, i32 62317068, i32 1957810842, i32 -355121351, i32 -1647151185, i32 81470997, i32 1943803523, i32 -480048366, i32 -1805370492, i32 225274430, i32 2053790376, i32 -468791541, i32 -1828061283, i32 167816743, i32 2097651377, i32 -267414716, i32 -2029476910, i32 503444072, i32 1762050814, i32 -144550051, i32 -2140837941, i32 426522225, i32 1852507879, i32 -19653770, i32 -1982649376, i32 282753626, i32 1742555852, i32 -105259153, i32 -1900089351, i32 397917763, i32 1622183637, i32 -690576408, i32 -1580100738, i32 953729732, i32 1340076626, i32 -776247311, i32 -1497606297, i32 1068828381, i32 1219638859, i32 -670225446, i32 -1358292148, i32 906185462, i32 1090812512, i32 -547295293, i32 -1469587627, i32 829329135, i32 1181335161, i32 -882789492, i32 -1134132454, i32 628085408, i32 1382605366, i32 -871598187, i32 -1156888829, i32 570562233, i32 1426400815, i32 -977650754, i32 -1296233688, i32 733239954, i32 1555261956, i32 -1026031705, i32 -1244606671, i32 752459403, i32 1541320221, i32 -1687895376, i32 -328994266, i32 1969922972, i32 40735498, i32 -1677130071, i32 -351390145, i32 1913087877, i32 83908371, i32 -1782625662, i32 -491226604, i32 2075208622, i32 213261112, i32 -1831694693, i32 -438977011, i32 2094854071, i32 198958881, i32 -2032938284, i32 -237706686, i32 1759359992, i32 534414190, i32 -2118248755, i32 -155638181, i32 1873836001, i32 414664567, i32 -2012718362, i32 -15766928, i32 1711684554, i32 285281116, i32 -1889165569, i32 -127750551, i32 1634467795, i32 376229701, i32 -1609899400, i32 -686959890, i32 1308918612, i32 956543938, i32 -1486412191, i32 -799009033, i32 1231636301, i32 1047427035, i32 -1362007478, i32 -640263460, i32 1088359270, i32 936918000, i32 -1447252397, i32 -558129467, i32 1202900863, i32 817233897, i32 -1111625188, i32 -893730166, i32 1404277552, i32 615818150, i32 -1160759803, i32 -841546093, i32 1423857449, i32 601450431, i32 -1285129682, i32 -1000256840, i32 1567103746, i32 711928724, i32 -1274298825, i32 -1022587231, i32 1510334235, i32 755167117], align 16
@.str2 = private unnamed_addr constant [8 x i8] c"LodePNG\00", align 1
@.str3 = private unnamed_addr constant [9 x i8] c"20131222\00", align 1
@.str4 = private unnamed_addr constant [29 x i8] c"no error, everything went ok\00", align 1
@.str5 = private unnamed_addr constant [17 x i8] c"nothing done yet\00", align 1
@.str6 = private unnamed_addr constant [53 x i8] c"end of input memory reached without huffman end code\00", align 1
@.str7 = private unnamed_addr constant [56 x i8] c"error in code tree made it jump outside of huffman tree\00", align 1
@.str8 = private unnamed_addr constant [47 x i8] c"problem while processing dynamic deflate block\00", align 1
@.str9 = private unnamed_addr constant [55 x i8] c"unexisting code while processing dynamic deflate block\00", align 1
@.str10 = private unnamed_addr constant [49 x i8] c"end of out buffer memory reached while inflating\00", align 1
@.str11 = private unnamed_addr constant [38 x i8] c"invalid distance code while inflating\00", align 1
@.str12 = private unnamed_addr constant [55 x i8] c"invalid deflate block BTYPE encountered while decoding\00", align 1
@.str13 = private unnamed_addr constant [54 x i8] c"NLEN is not ones complement of LEN in a deflate block\00", align 1
@.str14 = private unnamed_addr constant [48 x i8] c"end of in buffer memory reached while inflating\00", align 1
@.str15 = private unnamed_addr constant [30 x i8] c"invalid FCHECK in zlib header\00", align 1
@.str16 = private unnamed_addr constant [42 x i8] c"invalid compression method in zlib header\00", align 1
@.str17 = private unnamed_addr constant [61 x i8] c"FDICT encountered in zlib header while it's not used for PNG\00", align 1
@.str18 = private unnamed_addr constant [38 x i8] c"PNG file is smaller than a PNG header\00", align 1
@.str19 = private unnamed_addr constant [50 x i8] c"incorrect PNG signature, it's no PNG or corrupted\00", align 1
@.str20 = private unnamed_addr constant [36 x i8] c"first chunk is not the header chunk\00", align 1
@.str21 = private unnamed_addr constant [56 x i8] c"chunk length too large, chunk broken off at end of file\00", align 1
@.str22 = private unnamed_addr constant [30 x i8] c"illegal PNG color type or bpp\00", align 1
@.str23 = private unnamed_addr constant [31 x i8] c"illegal PNG compression method\00", align 1
@.str24 = private unnamed_addr constant [26 x i8] c"illegal PNG filter method\00", align 1
@.str25 = private unnamed_addr constant [29 x i8] c"illegal PNG interlace method\00", align 1
@.str26 = private unnamed_addr constant [60 x i8] c"chunk length of a chunk is too large or the chunk too small\00", align 1
@.str27 = private unnamed_addr constant [36 x i8] c"illegal PNG filter type encountered\00", align 1
@.str28 = private unnamed_addr constant [44 x i8] c"illegal bit depth for this color type given\00", align 1
@.str29 = private unnamed_addr constant [23 x i8] c"the palette is too big\00", align 1
@.str30 = private unnamed_addr constant [83 x i8] c"more palette alpha values given in tRNS chunk than there are colors in the palette\00", align 1
@.str31 = private unnamed_addr constant [46 x i8] c"tRNS chunk has wrong size for greyscale image\00", align 1
@.str32 = private unnamed_addr constant [40 x i8] c"tRNS chunk has wrong size for RGB image\00", align 1
@.str33 = private unnamed_addr constant [65 x i8] c"tRNS chunk appeared while it was not allowed for this color type\00", align 1
@.str34 = private unnamed_addr constant [44 x i8] c"bKGD chunk has wrong size for palette image\00", align 1
@.str35 = private unnamed_addr constant [46 x i8] c"bKGD chunk has wrong size for greyscale image\00", align 1
@.str36 = private unnamed_addr constant [40 x i8] c"bKGD chunk has wrong size for RGB image\00", align 1
@.str37 = private unnamed_addr constant [72 x i8] c"a value in indexed image is larger than the palette size (bitdepth = 8)\00", align 1
@.str38 = private unnamed_addr constant [72 x i8] c"a value in indexed image is larger than the palette size (bitdepth < 8)\00", align 1
@.str39 = private unnamed_addr constant [34 x i8] c"empty input or file doesn't exist\00", align 1
@.str40 = private unnamed_addr constant [57 x i8] c"jumped past memory while generating dynamic huffman tree\00", align 1
@.str41 = private unnamed_addr constant [49 x i8] c"jumped past memory while inflating huffman block\00", align 1
@.str42 = private unnamed_addr constant [35 x i8] c"jumped past memory while inflating\00", align 1
@.str43 = private unnamed_addr constant [28 x i8] c"size of zlib data too small\00", align 1
@.str44 = private unnamed_addr constant [58 x i8] c"repeat symbol in tree while there was no value symbol yet\00", align 1
@.str45 = private unnamed_addr constant [47 x i8] c"jumped past tree while generating huffman tree\00", align 1
@.str46 = private unnamed_addr constant [76 x i8] c"given output image colortype or bitdepth not supported for color conversion\00", align 1
@.str47 = private unnamed_addr constant [55 x i8] c"invalid CRC encountered (checking CRC can be disabled)\00", align 1
@.str48 = private unnamed_addr constant [63 x i8] c"invalid ADLER32 encountered (checking ADLER32 can be disabled)\00", align 1
@.str49 = private unnamed_addr constant [41 x i8] c"requested color conversion not supported\00", align 1
@.str50 = private unnamed_addr constant [75 x i8] c"invalid window size given in the settings of the encoder (must be 0-32768)\00", align 1
@.str51 = private unnamed_addr constant [81 x i8] c"invalid BTYPE given in the settings of the encoder (only 0, 1 and 2 are allowed)\00", align 1
@.str52 = private unnamed_addr constant [49 x i8] c"conversion from color to greyscale not supported\00", align 1
@.str53 = private unnamed_addr constant [78 x i8] c"length of a chunk too long, max allowed for PNG is 2147483647 bytes per chunk\00", align 1
@.str54 = private unnamed_addr constant [58 x i8] c"the length of the END symbol 256 in the Huffman tree is 0\00", align 1
@.str55 = private unnamed_addr constant [95 x i8] c"the length of a text chunk keyword given to the encoder is longer than the maximum of 79 bytes\00", align 1
@.str56 = private unnamed_addr constant [94 x i8] c"the length of a text chunk keyword given to the encoder is smaller than the minimum of 1 byte\00", align 1
@.str57 = private unnamed_addr constant [89 x i8] c"tried to encode a PLTE chunk with a palette that has less than 1 or more than 256 colors\00", align 1
@.str58 = private unnamed_addr constant [67 x i8] c"unknown chunk type with 'critical' flag encountered by the decoder\00", align 1
@.str59 = private unnamed_addr constant [60 x i8] c"unexisting interlace mode given to encoder (must be 0 or 1)\00", align 1
@.str60 = private unnamed_addr constant [96 x i8] c"while decoding, unexisting compression method encountering in zTXt or iTXt chunk (it must be 0)\00", align 1
@.str61 = private unnamed_addr constant [24 x i8] c"invalid tIME chunk size\00", align 1
@.str62 = private unnamed_addr constant [24 x i8] c"invalid pHYs chunk size\00", align 1
@.str63 = private unnamed_addr constant [57 x i8] c"no null termination char found while decoding text chunk\00", align 1
@.str64 = private unnamed_addr constant [47 x i8] c"iTXt chunk too short to contain required bytes\00", align 1
@.str65 = private unnamed_addr constant [32 x i8] c"integer overflow in buffer size\00", align 1
@.str66 = private unnamed_addr constant [32 x i8] c"failed to open file for reading\00", align 1
@.str67 = private unnamed_addr constant [32 x i8] c"failed to open file for writing\00", align 1
@.str68 = private unnamed_addr constant [35 x i8] c"tried creating a tree of 0 symbols\00", align 1
@.str69 = private unnamed_addr constant [37 x i8] c"lazy matching at pos 0 is impossible\00", align 1
@.str70 = private unnamed_addr constant [69 x i8] c"color conversion to palette requested while a color isn't in palette\00", align 1
@.str71 = private unnamed_addr constant [25 x i8] c"memory allocation failed\00", align 1
@.str72 = private unnamed_addr constant [58 x i8] c"given image too small to contain all pixels to be encoded\00", align 1
@.str73 = private unnamed_addr constant [30 x i8] c"internal color conversion bug\00", align 1
@.str74 = private unnamed_addr constant [50 x i8] c"impossible offset in lz77 encoding (internal bug)\00", align 1
@.str75 = private unnamed_addr constant [81 x i8] c"must provide custom zlib function pointer if LODEPNG_COMPILE_ZLIB is not defined\00", align 1
@.str76 = private unnamed_addr constant [73 x i8] c"invalid filter strategy given for LodePNGEncoderSettings.filter_strategy\00", align 1
@.str77 = private unnamed_addr constant [58 x i8] c"text chunk keyword too short or long: must have size 1-79\00", align 1
@.str78 = private unnamed_addr constant [34 x i8] c"windowsize must be a power of two\00", align 1
@.str79 = private unnamed_addr constant [19 x i8] c"unknown error code\00", align 1
@.str80 = private unnamed_addr constant [5 x i8] c"IEND\00", align 1
@.str81 = private unnamed_addr constant [5 x i8] c"iTXt\00", align 1
@.str82 = private unnamed_addr constant [5 x i8] c"tEXt\00", align 1
@.str83 = private unnamed_addr constant [5 x i8] c"zTXt\00", align 1
@.str84 = private unnamed_addr constant [5 x i8] c"tIME\00", align 1
@.str85 = private unnamed_addr constant [5 x i8] c"IDAT\00", align 1
@.str86 = private unnamed_addr constant [5 x i8] c"pHYs\00", align 1
@.str87 = private unnamed_addr constant [5 x i8] c"bKGD\00", align 1
@.str88 = private unnamed_addr constant [5 x i8] c"tRNS\00", align 1
@.str89 = private unnamed_addr constant [5 x i8] c"PLTE\00", align 1
@.str90 = private unnamed_addr constant [5 x i8] c"IHDR\00", align 1
@ADAM7_IY = internal constant [7 x i32] [i32 0, i32 0, i32 4, i32 0, i32 2, i32 0, i32 1], align 16
@ADAM7_DY = internal constant [7 x i32] [i32 8, i32 8, i32 8, i32 4, i32 4, i32 2, i32 2], align 16
@ADAM7_IX = internal constant [7 x i32] [i32 0, i32 4, i32 0, i32 2, i32 0, i32 1, i32 0], align 16
@ADAM7_DX = internal constant [7 x i32] [i32 8, i32 8, i32 4, i32 4, i32 2, i32 2, i32 1], align 16
@CLCL_ORDER = internal constant [19 x i32] [i32 16, i32 17, i32 18, i32 0, i32 8, i32 7, i32 9, i32 6, i32 10, i32 5, i32 11, i32 4, i32 12, i32 3, i32 13, i32 2, i32 14, i32 1, i32 15], align 16
@LENGTHEXTRA = internal constant [29 x i32] [i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1, i32 1, i32 1, i32 1, i32 2, i32 2, i32 2, i32 2, i32 3, i32 3, i32 3, i32 3, i32 4, i32 4, i32 4, i32 4, i32 5, i32 5, i32 5, i32 5, i32 0], align 16
@DISTANCEEXTRA = internal constant [30 x i32] [i32 0, i32 0, i32 0, i32 0, i32 1, i32 1, i32 2, i32 2, i32 3, i32 3, i32 4, i32 4, i32 5, i32 5, i32 6, i32 6, i32 7, i32 7, i32 8, i32 8, i32 9, i32 9, i32 10, i32 10, i32 11, i32 11, i32 12, i32 12, i32 13, i32 13], align 16
@LENGTHBASE = internal constant [29 x i32] [i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 13, i32 15, i32 17, i32 19, i32 23, i32 27, i32 31, i32 35, i32 43, i32 51, i32 59, i32 67, i32 83, i32 99, i32 115, i32 131, i32 163, i32 195, i32 227, i32 258], align 16
@DISTANCEBASE = internal constant [30 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5, i32 7, i32 9, i32 13, i32 17, i32 25, i32 33, i32 49, i32 65, i32 97, i32 129, i32 193, i32 257, i32 385, i32 513, i32 769, i32 1025, i32 1537, i32 2049, i32 3073, i32 4097, i32 6145, i32 8193, i32 12289, i32 16385, i32 24577], align 16

; Function Attrs: nounwind uwtable
define i32 @lodepng_read32bitInt(i8* %buffer) #0 {
  %1 = alloca i8*, align 8
  store i8* %buffer, i8** %1, align 8
  %2 = load i8** %1, align 8
  %3 = getelementptr inbounds i8* %2, i64 0
  %4 = load i8* %3, align 1
  %5 = zext i8 %4 to i32
  %6 = shl i32 %5, 24
  %7 = load i8** %1, align 8
  %8 = getelementptr inbounds i8* %7, i64 1
  %9 = load i8* %8, align 1
  %10 = zext i8 %9 to i32
  %11 = shl i32 %10, 16
  %12 = or i32 %6, %11
  %13 = load i8** %1, align 8
  %14 = getelementptr inbounds i8* %13, i64 2
  %15 = load i8* %14, align 1
  %16 = zext i8 %15 to i32
  %17 = shl i32 %16, 8
  %18 = or i32 %12, %17
  %19 = load i8** %1, align 8
  %20 = getelementptr inbounds i8* %19, i64 3
  %21 = load i8* %20, align 1
  %22 = zext i8 %21 to i32
  %23 = or i32 %18, %22
  ret i32 %23
}

; Function Attrs: nounwind uwtable
define i32 @lodepng_load_file(i8** %out, i64* %outsize, i8* %filename) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8**, align 8
  %3 = alloca i64*, align 8
  %4 = alloca i8*, align 8
  %file = alloca %struct._IO_FILE*, align 8
  %size = alloca i64, align 8
  store i8** %out, i8*** %2, align 8
  store i64* %outsize, i64** %3, align 8
  store i8* %filename, i8** %4, align 8
  %5 = load i8*** %2, align 8
  store i8* null, i8** %5, align 8
  %6 = load i64** %3, align 8
  store i64 0, i64* %6, align 8
  %7 = load i8** %4, align 8
  %8 = call %struct._IO_FILE* @fopen(i8* %7, i8* getelementptr inbounds ([3 x i8]* @.str, i32 0, i32 0))
  store %struct._IO_FILE* %8, %struct._IO_FILE** %file, align 8
  %9 = load %struct._IO_FILE** %file, align 8
  %10 = icmp ne %struct._IO_FILE* %9, null
  br i1 %10, label %12, label %11

; <label>:11                                      ; preds = %0
  store i32 78, i32* %1
  br label %46

; <label>:12                                      ; preds = %0
  %13 = load %struct._IO_FILE** %file, align 8
  %14 = call i32 @fseek(%struct._IO_FILE* %13, i64 0, i32 2)
  %15 = load %struct._IO_FILE** %file, align 8
  %16 = call i64 @ftell(%struct._IO_FILE* %15)
  store i64 %16, i64* %size, align 8
  %17 = load %struct._IO_FILE** %file, align 8
  call void @rewind(%struct._IO_FILE* %17)
  %18 = load i64** %3, align 8
  store i64 0, i64* %18, align 8
  %19 = load i64* %size, align 8
  %20 = call i8* @lodepng_malloc(i64 %19)
  %21 = load i8*** %2, align 8
  store i8* %20, i8** %21, align 8
  %22 = load i64* %size, align 8
  %23 = icmp ne i64 %22, 0
  br i1 %23, label %24, label %35

; <label>:24                                      ; preds = %12
  %25 = load i8*** %2, align 8
  %26 = load i8** %25, align 8
  %27 = icmp ne i8* %26, null
  br i1 %27, label %28, label %35

; <label>:28                                      ; preds = %24
  %29 = load i8*** %2, align 8
  %30 = load i8** %29, align 8
  %31 = load i64* %size, align 8
  %32 = load %struct._IO_FILE** %file, align 8
  %33 = call i64 @fread(i8* %30, i64 1, i64 %31, %struct._IO_FILE* %32)
  %34 = load i64** %3, align 8
  store i64 %33, i64* %34, align 8
  br label %35

; <label>:35                                      ; preds = %28, %24, %12
  %36 = load %struct._IO_FILE** %file, align 8
  %37 = call i32 @fclose(%struct._IO_FILE* %36)
  %38 = load i8*** %2, align 8
  %39 = load i8** %38, align 8
  %40 = icmp ne i8* %39, null
  br i1 %40, label %45, label %41

; <label>:41                                      ; preds = %35
  %42 = load i64* %size, align 8
  %43 = icmp ne i64 %42, 0
  br i1 %43, label %44, label %45

; <label>:44                                      ; preds = %41
  store i32 83, i32* %1
  br label %46

; <label>:45                                      ; preds = %41, %35
  store i32 0, i32* %1
  br label %46

; <label>:46                                      ; preds = %45, %44, %11
  %47 = load i32* %1
  ret i32 %47
}

declare %struct._IO_FILE* @fopen(i8*, i8*) #1

declare i32 @fseek(%struct._IO_FILE*, i64, i32) #1

declare i64 @ftell(%struct._IO_FILE*) #1

declare void @rewind(%struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define internal i8* @lodepng_malloc(i64 %size) #0 {
  %1 = alloca i64, align 8
  store i64 %size, i64* %1, align 8
  %2 = load i64* %1, align 8
  %3 = call noalias i8* @malloc(i64 %2) #3
  ret i8* %3
}

declare i64 @fread(i8*, i64, i64, %struct._IO_FILE*) #1

declare i32 @fclose(%struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define i32 @lodepng_save_file(i8* %buffer, i64 %buffersize, i8* %filename) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8*, align 8
  %3 = alloca i64, align 8
  %4 = alloca i8*, align 8
  %file = alloca %struct._IO_FILE*, align 8
  store i8* %buffer, i8** %2, align 8
  store i64 %buffersize, i64* %3, align 8
  store i8* %filename, i8** %4, align 8
  %5 = load i8** %4, align 8
  %6 = call %struct._IO_FILE* @fopen(i8* %5, i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0))
  store %struct._IO_FILE* %6, %struct._IO_FILE** %file, align 8
  %7 = load %struct._IO_FILE** %file, align 8
  %8 = icmp ne %struct._IO_FILE* %7, null
  br i1 %8, label %10, label %9

; <label>:9                                       ; preds = %0
  store i32 79, i32* %1
  br label %17

; <label>:10                                      ; preds = %0
  %11 = load i8** %2, align 8
  %12 = load i64* %3, align 8
  %13 = load %struct._IO_FILE** %file, align 8
  %14 = call i64 @fwrite(i8* %11, i64 1, i64 %12, %struct._IO_FILE* %13)
  %15 = load %struct._IO_FILE** %file, align 8
  %16 = call i32 @fclose(%struct._IO_FILE* %15)
  store i32 0, i32* %1
  br label %17

; <label>:17                                      ; preds = %10, %9
  %18 = load i32* %1
  ret i32 %18
}

declare i64 @fwrite(i8*, i64, i64, %struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define i32 @lodepng_huffman_code_lengths(i32* %lengths, i32* %frequencies, i64 %numcodes, i32 %maxbitlen) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32*, align 8
  %3 = alloca i32*, align 8
  %4 = alloca i64, align 8
  %5 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %sum = alloca i64, align 8
  %numpresent = alloca i64, align 8
  %error = alloca i32, align 4
  %coins = alloca %struct.Coin*, align 8
  %prev_row = alloca %struct.Coin*, align 8
  %numcoins = alloca i32, align 4
  %coinmem = alloca i32, align 4
  %numprev = alloca i32, align 4
  %tempnum = alloca i32, align 4
  %tempcoins = alloca %struct.Coin*, align 8
  %coin = alloca %struct.Coin*, align 8
  %coin1 = alloca %struct.Coin*, align 8
  store i32* %lengths, i32** %2, align 8
  store i32* %frequencies, i32** %3, align 8
  store i64 %numcodes, i64* %4, align 8
  store i32 %maxbitlen, i32* %5, align 4
  store i64 0, i64* %sum, align 8
  store i64 0, i64* %numpresent, align 8
  store i32 0, i32* %error, align 4
  %6 = load i64* %4, align 8
  %7 = icmp eq i64 %6, 0
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %0
  store i32 80, i32* %1
  br label %269

; <label>:9                                       ; preds = %0
  store i32 0, i32* %i, align 4
  br label %10

; <label>:10                                      ; preds = %34, %9
  %11 = load i32* %i, align 4
  %12 = zext i32 %11 to i64
  %13 = load i64* %4, align 8
  %14 = icmp ult i64 %12, %13
  br i1 %14, label %15, label %37

; <label>:15                                      ; preds = %10
  %16 = load i32* %i, align 4
  %17 = zext i32 %16 to i64
  %18 = load i32** %3, align 8
  %19 = getelementptr inbounds i32* %18, i64 %17
  %20 = load i32* %19, align 4
  %21 = icmp ugt i32 %20, 0
  br i1 %21, label %22, label %33

; <label>:22                                      ; preds = %15
  %23 = load i64* %numpresent, align 8
  %24 = add i64 %23, 1
  store i64 %24, i64* %numpresent, align 8
  %25 = load i32* %i, align 4
  %26 = zext i32 %25 to i64
  %27 = load i32** %3, align 8
  %28 = getelementptr inbounds i32* %27, i64 %26
  %29 = load i32* %28, align 4
  %30 = zext i32 %29 to i64
  %31 = load i64* %sum, align 8
  %32 = add i64 %31, %30
  store i64 %32, i64* %sum, align 8
  br label %33

; <label>:33                                      ; preds = %22, %15
  br label %34

; <label>:34                                      ; preds = %33
  %35 = load i32* %i, align 4
  %36 = add i32 %35, 1
  store i32 %36, i32* %i, align 4
  br label %10

; <label>:37                                      ; preds = %10
  store i32 0, i32* %i, align 4
  br label %38

; <label>:38                                      ; preds = %48, %37
  %39 = load i32* %i, align 4
  %40 = zext i32 %39 to i64
  %41 = load i64* %4, align 8
  %42 = icmp ult i64 %40, %41
  br i1 %42, label %43, label %51

; <label>:43                                      ; preds = %38
  %44 = load i32* %i, align 4
  %45 = zext i32 %44 to i64
  %46 = load i32** %2, align 8
  %47 = getelementptr inbounds i32* %46, i64 %45
  store i32 0, i32* %47, align 4
  br label %48

; <label>:48                                      ; preds = %43
  %49 = load i32* %i, align 4
  %50 = add i32 %49, 1
  store i32 %50, i32* %i, align 4
  br label %38

; <label>:51                                      ; preds = %38
  %52 = load i64* %numpresent, align 8
  %53 = icmp eq i64 %52, 0
  br i1 %53, label %54, label %59

; <label>:54                                      ; preds = %51
  %55 = load i32** %2, align 8
  %56 = getelementptr inbounds i32* %55, i64 1
  store i32 1, i32* %56, align 4
  %57 = load i32** %2, align 8
  %58 = getelementptr inbounds i32* %57, i64 0
  store i32 1, i32* %58, align 4
  br label %267

; <label>:59                                      ; preds = %51
  %60 = load i64* %numpresent, align 8
  %61 = icmp eq i64 %60, 1
  br i1 %61, label %62, label %91

; <label>:62                                      ; preds = %59
  store i32 0, i32* %i, align 4
  br label %63

; <label>:63                                      ; preds = %87, %62
  %64 = load i32* %i, align 4
  %65 = zext i32 %64 to i64
  %66 = load i64* %4, align 8
  %67 = icmp ult i64 %65, %66
  br i1 %67, label %68, label %90

; <label>:68                                      ; preds = %63
  %69 = load i32* %i, align 4
  %70 = zext i32 %69 to i64
  %71 = load i32** %3, align 8
  %72 = getelementptr inbounds i32* %71, i64 %70
  %73 = load i32* %72, align 4
  %74 = icmp ne i32 %73, 0
  br i1 %74, label %75, label %86

; <label>:75                                      ; preds = %68
  %76 = load i32* %i, align 4
  %77 = zext i32 %76 to i64
  %78 = load i32** %2, align 8
  %79 = getelementptr inbounds i32* %78, i64 %77
  store i32 1, i32* %79, align 4
  %80 = load i32* %i, align 4
  %81 = icmp eq i32 %80, 0
  %82 = select i1 %81, i32 1, i32 0
  %83 = sext i32 %82 to i64
  %84 = load i32** %2, align 8
  %85 = getelementptr inbounds i32* %84, i64 %83
  store i32 1, i32* %85, align 4
  br label %90

; <label>:86                                      ; preds = %68
  br label %87

; <label>:87                                      ; preds = %86
  %88 = load i32* %i, align 4
  %89 = add i32 %88, 1
  store i32 %89, i32* %i, align 4
  br label %63

; <label>:90                                      ; preds = %75, %63
  br label %266

; <label>:91                                      ; preds = %59
  %92 = load i64* %numpresent, align 8
  %93 = mul i64 %92, 2
  %94 = trunc i64 %93 to i32
  store i32 %94, i32* %coinmem, align 4
  %95 = load i32* %coinmem, align 4
  %96 = zext i32 %95 to i64
  %97 = mul i64 32, %96
  %98 = call i8* @lodepng_malloc(i64 %97)
  %99 = bitcast i8* %98 to %struct.Coin*
  store %struct.Coin* %99, %struct.Coin** %coins, align 8
  %100 = load i32* %coinmem, align 4
  %101 = zext i32 %100 to i64
  %102 = mul i64 32, %101
  %103 = call i8* @lodepng_malloc(i64 %102)
  %104 = bitcast i8* %103 to %struct.Coin*
  store %struct.Coin* %104, %struct.Coin** %prev_row, align 8
  %105 = load %struct.Coin** %coins, align 8
  %106 = icmp ne %struct.Coin* %105, null
  br i1 %106, label %107, label %110

; <label>:107                                     ; preds = %91
  %108 = load %struct.Coin** %prev_row, align 8
  %109 = icmp ne %struct.Coin* %108, null
  br i1 %109, label %115, label %110

; <label>:110                                     ; preds = %107, %91
  %111 = load %struct.Coin** %coins, align 8
  %112 = bitcast %struct.Coin* %111 to i8*
  call void @lodepng_free(i8* %112)
  %113 = load %struct.Coin** %prev_row, align 8
  %114 = bitcast %struct.Coin* %113 to i8*
  call void @lodepng_free(i8* %114)
  store i32 83, i32* %1
  br label %269

; <label>:115                                     ; preds = %107
  %116 = load %struct.Coin** %coins, align 8
  %117 = load i32* %coinmem, align 4
  %118 = zext i32 %117 to i64
  call void @init_coins(%struct.Coin* %116, i64 %118)
  %119 = load %struct.Coin** %prev_row, align 8
  %120 = load i32* %coinmem, align 4
  %121 = zext i32 %120 to i64
  call void @init_coins(%struct.Coin* %119, i64 %121)
  %122 = load %struct.Coin** %coins, align 8
  %123 = load i32** %3, align 8
  %124 = load i64* %4, align 8
  %125 = trunc i64 %124 to i32
  %126 = load i64* %sum, align 8
  %127 = call i32 @append_symbol_coins(%struct.Coin* %122, i32* %123, i32 %125, i64 %126)
  store i32 %127, i32* %error, align 4
  %128 = load i64* %numpresent, align 8
  %129 = trunc i64 %128 to i32
  store i32 %129, i32* %numcoins, align 4
  %130 = load %struct.Coin** %coins, align 8
  %131 = bitcast %struct.Coin* %130 to i8*
  %132 = load i32* %numcoins, align 4
  %133 = zext i32 %132 to i64
  call void @qsort(i8* %131, i64 %133, i64 32, i32 (i8*, i8*)* @coin_compare)
  %134 = load i32* %error, align 4
  %135 = icmp ne i32 %134, 0
  br i1 %135, label %210, label %136

; <label>:136                                     ; preds = %115
  store i32 0, i32* %numprev, align 4
  store i32 1, i32* %j, align 4
  br label %137

; <label>:137                                     ; preds = %206, %136
  %138 = load i32* %j, align 4
  %139 = load i32* %5, align 4
  %140 = icmp ule i32 %138, %139
  br i1 %140, label %141, label %209

; <label>:141                                     ; preds = %137
  %142 = load i32* %error, align 4
  %143 = icmp ne i32 %142, 0
  br i1 %143, label %209, label %144

; <label>:144                                     ; preds = %141
  %145 = load %struct.Coin** %prev_row, align 8
  store %struct.Coin* %145, %struct.Coin** %tempcoins, align 8
  %146 = load %struct.Coin** %coins, align 8
  store %struct.Coin* %146, %struct.Coin** %prev_row, align 8
  %147 = load %struct.Coin** %tempcoins, align 8
  store %struct.Coin* %147, %struct.Coin** %coins, align 8
  %148 = load i32* %numprev, align 4
  store i32 %148, i32* %tempnum, align 4
  %149 = load i32* %numcoins, align 4
  store i32 %149, i32* %numprev, align 4
  %150 = load i32* %tempnum, align 4
  store i32 %150, i32* %numcoins, align 4
  %151 = load %struct.Coin** %coins, align 8
  %152 = load i32* %numcoins, align 4
  %153 = zext i32 %152 to i64
  call void @cleanup_coins(%struct.Coin* %151, i64 %153)
  %154 = load %struct.Coin** %coins, align 8
  %155 = load i32* %numcoins, align 4
  %156 = zext i32 %155 to i64
  call void @init_coins(%struct.Coin* %154, i64 %156)
  store i32 0, i32* %numcoins, align 4
  store i32 0, i32* %i, align 4
  br label %157

; <label>:157                                     ; preds = %179, %144
  %158 = load i32* %i, align 4
  %159 = add i32 %158, 1
  %160 = load i32* %numprev, align 4
  %161 = icmp ult i32 %159, %160
  br i1 %161, label %162, label %182

; <label>:162                                     ; preds = %157
  %163 = load i32* %numcoins, align 4
  %164 = add i32 %163, 1
  store i32 %164, i32* %numcoins, align 4
  %165 = zext i32 %163 to i64
  %166 = load %struct.Coin** %coins, align 8
  %167 = getelementptr inbounds %struct.Coin* %166, i64 %165
  store %struct.Coin* %167, %struct.Coin** %coin, align 8
  %168 = load %struct.Coin** %coin, align 8
  %169 = load i32* %i, align 4
  %170 = zext i32 %169 to i64
  %171 = load %struct.Coin** %prev_row, align 8
  %172 = getelementptr inbounds %struct.Coin* %171, i64 %170
  call void @coin_copy(%struct.Coin* %168, %struct.Coin* %172)
  %173 = load %struct.Coin** %coin, align 8
  %174 = load i32* %i, align 4
  %175 = add i32 %174, 1
  %176 = zext i32 %175 to i64
  %177 = load %struct.Coin** %prev_row, align 8
  %178 = getelementptr inbounds %struct.Coin* %177, i64 %176
  call void @add_coins(%struct.Coin* %173, %struct.Coin* %178)
  br label %179

; <label>:179                                     ; preds = %162
  %180 = load i32* %i, align 4
  %181 = add i32 %180, 2
  store i32 %181, i32* %i, align 4
  br label %157

; <label>:182                                     ; preds = %157
  %183 = load i32* %j, align 4
  %184 = load i32* %5, align 4
  %185 = icmp ult i32 %183, %184
  br i1 %185, label %186, label %201

; <label>:186                                     ; preds = %182
  %187 = load %struct.Coin** %coins, align 8
  %188 = load i32* %numcoins, align 4
  %189 = zext i32 %188 to i64
  %190 = getelementptr inbounds %struct.Coin* %187, i64 %189
  %191 = load i32** %3, align 8
  %192 = load i64* %4, align 8
  %193 = trunc i64 %192 to i32
  %194 = load i64* %sum, align 8
  %195 = call i32 @append_symbol_coins(%struct.Coin* %190, i32* %191, i32 %193, i64 %194)
  store i32 %195, i32* %error, align 4
  %196 = load i64* %numpresent, align 8
  %197 = load i32* %numcoins, align 4
  %198 = zext i32 %197 to i64
  %199 = add i64 %198, %196
  %200 = trunc i64 %199 to i32
  store i32 %200, i32* %numcoins, align 4
  br label %201

; <label>:201                                     ; preds = %186, %182
  %202 = load %struct.Coin** %coins, align 8
  %203 = bitcast %struct.Coin* %202 to i8*
  %204 = load i32* %numcoins, align 4
  %205 = zext i32 %204 to i64
  call void @qsort(i8* %203, i64 %205, i64 32, i32 (i8*, i8*)* @coin_compare)
  br label %206

; <label>:206                                     ; preds = %201
  %207 = load i32* %j, align 4
  %208 = add i32 %207, 1
  store i32 %208, i32* %j, align 4
  br label %137

; <label>:209                                     ; preds = %141, %137
  br label %210

; <label>:210                                     ; preds = %209, %115
  %211 = load i32* %error, align 4
  %212 = icmp ne i32 %211, 0
  br i1 %212, label %255, label %213

; <label>:213                                     ; preds = %210
  store i32 0, i32* %i, align 4
  br label %214

; <label>:214                                     ; preds = %251, %213
  %215 = load i32* %i, align 4
  %216 = zext i32 %215 to i64
  %217 = load i64* %numpresent, align 8
  %218 = sub i64 %217, 1
  %219 = icmp ult i64 %216, %218
  br i1 %219, label %220, label %254

; <label>:220                                     ; preds = %214
  %221 = load i32* %i, align 4
  %222 = zext i32 %221 to i64
  %223 = load %struct.Coin** %coins, align 8
  %224 = getelementptr inbounds %struct.Coin* %223, i64 %222
  store %struct.Coin* %224, %struct.Coin** %coin1, align 8
  store i32 0, i32* %j, align 4
  br label %225

; <label>:225                                     ; preds = %247, %220
  %226 = load i32* %j, align 4
  %227 = zext i32 %226 to i64
  %228 = load %struct.Coin** %coin1, align 8
  %229 = getelementptr inbounds %struct.Coin* %228, i32 0, i32 0
  %230 = getelementptr inbounds %struct.uivector* %229, i32 0, i32 1
  %231 = load i64* %230, align 8
  %232 = icmp ult i64 %227, %231
  br i1 %232, label %233, label %250

; <label>:233                                     ; preds = %225
  %234 = load i32* %j, align 4
  %235 = zext i32 %234 to i64
  %236 = load %struct.Coin** %coin1, align 8
  %237 = getelementptr inbounds %struct.Coin* %236, i32 0, i32 0
  %238 = getelementptr inbounds %struct.uivector* %237, i32 0, i32 0
  %239 = load i32** %238, align 8
  %240 = getelementptr inbounds i32* %239, i64 %235
  %241 = load i32* %240, align 4
  %242 = zext i32 %241 to i64
  %243 = load i32** %2, align 8
  %244 = getelementptr inbounds i32* %243, i64 %242
  %245 = load i32* %244, align 4
  %246 = add i32 %245, 1
  store i32 %246, i32* %244, align 4
  br label %247

; <label>:247                                     ; preds = %233
  %248 = load i32* %j, align 4
  %249 = add i32 %248, 1
  store i32 %249, i32* %j, align 4
  br label %225

; <label>:250                                     ; preds = %225
  br label %251

; <label>:251                                     ; preds = %250
  %252 = load i32* %i, align 4
  %253 = add i32 %252, 1
  store i32 %253, i32* %i, align 4
  br label %214

; <label>:254                                     ; preds = %214
  br label %255

; <label>:255                                     ; preds = %254, %210
  %256 = load %struct.Coin** %coins, align 8
  %257 = load i32* %coinmem, align 4
  %258 = zext i32 %257 to i64
  call void @cleanup_coins(%struct.Coin* %256, i64 %258)
  %259 = load %struct.Coin** %coins, align 8
  %260 = bitcast %struct.Coin* %259 to i8*
  call void @lodepng_free(i8* %260)
  %261 = load %struct.Coin** %prev_row, align 8
  %262 = load i32* %coinmem, align 4
  %263 = zext i32 %262 to i64
  call void @cleanup_coins(%struct.Coin* %261, i64 %263)
  %264 = load %struct.Coin** %prev_row, align 8
  %265 = bitcast %struct.Coin* %264 to i8*
  call void @lodepng_free(i8* %265)
  br label %266

; <label>:266                                     ; preds = %255, %90
  br label %267

; <label>:267                                     ; preds = %266, %54
  %268 = load i32* %error, align 4
  store i32 %268, i32* %1
  br label %269

; <label>:269                                     ; preds = %267, %110, %8
  %270 = load i32* %1
  ret i32 %270
}

; Function Attrs: nounwind uwtable
define internal void @lodepng_free(i8* %ptr) #0 {
  %1 = alloca i8*, align 8
  store i8* %ptr, i8** %1, align 8
  %2 = load i8** %1, align 8
  call void @free(i8* %2) #3
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @init_coins(%struct.Coin* %coins, i64 %num) #0 {
  %1 = alloca %struct.Coin*, align 8
  %2 = alloca i64, align 8
  %i = alloca i64, align 8
  store %struct.Coin* %coins, %struct.Coin** %1, align 8
  store i64 %num, i64* %2, align 8
  store i64 0, i64* %i, align 8
  br label %3

; <label>:3                                       ; preds = %11, %0
  %4 = load i64* %i, align 8
  %5 = load i64* %2, align 8
  %6 = icmp ult i64 %4, %5
  br i1 %6, label %7, label %14

; <label>:7                                       ; preds = %3
  %8 = load i64* %i, align 8
  %9 = load %struct.Coin** %1, align 8
  %10 = getelementptr inbounds %struct.Coin* %9, i64 %8
  call void @coin_init(%struct.Coin* %10)
  br label %11

; <label>:11                                      ; preds = %7
  %12 = load i64* %i, align 8
  %13 = add i64 %12, 1
  store i64 %13, i64* %i, align 8
  br label %3

; <label>:14                                      ; preds = %3
  ret void
}

; Function Attrs: nounwind uwtable
define internal i32 @append_symbol_coins(%struct.Coin* %coins, i32* %frequencies, i32 %numcodes, i64 %sum) #0 {
  %1 = alloca %struct.Coin*, align 8
  %2 = alloca i32*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i64, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store %struct.Coin* %coins, %struct.Coin** %1, align 8
  store i32* %frequencies, i32** %2, align 8
  store i32 %numcodes, i32* %3, align 4
  store i64 %sum, i64* %4, align 8
  store i32 0, i32* %j, align 4
  store i32 0, i32* %i, align 4
  br label %5

; <label>:5                                       ; preds = %41, %0
  %6 = load i32* %i, align 4
  %7 = load i32* %3, align 4
  %8 = icmp ult i32 %6, %7
  br i1 %8, label %9, label %44

; <label>:9                                       ; preds = %5
  %10 = load i32* %i, align 4
  %11 = zext i32 %10 to i64
  %12 = load i32** %2, align 8
  %13 = getelementptr inbounds i32* %12, i64 %11
  %14 = load i32* %13, align 4
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %40

; <label>:16                                      ; preds = %9
  %17 = load i32* %i, align 4
  %18 = zext i32 %17 to i64
  %19 = load i32** %2, align 8
  %20 = getelementptr inbounds i32* %19, i64 %18
  %21 = load i32* %20, align 4
  %22 = uitofp i32 %21 to float
  %23 = load i64* %4, align 8
  %24 = uitofp i64 %23 to float
  %25 = fdiv float %22, %24
  %26 = load i32* %j, align 4
  %27 = zext i32 %26 to i64
  %28 = load %struct.Coin** %1, align 8
  %29 = getelementptr inbounds %struct.Coin* %28, i64 %27
  %30 = getelementptr inbounds %struct.Coin* %29, i32 0, i32 1
  store float %25, float* %30, align 4
  %31 = load i32* %j, align 4
  %32 = zext i32 %31 to i64
  %33 = load %struct.Coin** %1, align 8
  %34 = getelementptr inbounds %struct.Coin* %33, i64 %32
  %35 = getelementptr inbounds %struct.Coin* %34, i32 0, i32 0
  %36 = load i32* %i, align 4
  %37 = call i32 @uivector_push_back(%struct.uivector* %35, i32 %36)
  %38 = load i32* %j, align 4
  %39 = add i32 %38, 1
  store i32 %39, i32* %j, align 4
  br label %40

; <label>:40                                      ; preds = %16, %9
  br label %41

; <label>:41                                      ; preds = %40
  %42 = load i32* %i, align 4
  %43 = add i32 %42, 1
  store i32 %43, i32* %i, align 4
  br label %5

; <label>:44                                      ; preds = %5
  ret i32 0
}

declare void @qsort(i8*, i64, i64, i32 (i8*, i8*)*) #1

; Function Attrs: nounwind uwtable
define internal i32 @coin_compare(i8* %a, i8* %b) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %wa = alloca float, align 4
  %wb = alloca float, align 4
  store i8* %a, i8** %1, align 8
  store i8* %b, i8** %2, align 8
  %3 = load i8** %1, align 8
  %4 = bitcast i8* %3 to %struct.Coin*
  %5 = getelementptr inbounds %struct.Coin* %4, i32 0, i32 1
  %6 = load float* %5, align 4
  store float %6, float* %wa, align 4
  %7 = load i8** %2, align 8
  %8 = bitcast i8* %7 to %struct.Coin*
  %9 = getelementptr inbounds %struct.Coin* %8, i32 0, i32 1
  %10 = load float* %9, align 4
  store float %10, float* %wb, align 4
  %11 = load float* %wa, align 4
  %12 = load float* %wb, align 4
  %13 = fcmp ogt float %11, %12
  br i1 %13, label %14, label %15

; <label>:14                                      ; preds = %0
  br label %20

; <label>:15                                      ; preds = %0
  %16 = load float* %wa, align 4
  %17 = load float* %wb, align 4
  %18 = fcmp olt float %16, %17
  %19 = select i1 %18, i32 -1, i32 0
  br label %20

; <label>:20                                      ; preds = %15, %14
  %21 = phi i32 [ 1, %14 ], [ %19, %15 ]
  ret i32 %21
}

; Function Attrs: nounwind uwtable
define internal void @cleanup_coins(%struct.Coin* %coins, i64 %num) #0 {
  %1 = alloca %struct.Coin*, align 8
  %2 = alloca i64, align 8
  %i = alloca i64, align 8
  store %struct.Coin* %coins, %struct.Coin** %1, align 8
  store i64 %num, i64* %2, align 8
  store i64 0, i64* %i, align 8
  br label %3

; <label>:3                                       ; preds = %12, %0
  %4 = load i64* %i, align 8
  %5 = load i64* %2, align 8
  %6 = icmp ult i64 %4, %5
  br i1 %6, label %7, label %15

; <label>:7                                       ; preds = %3
  %8 = load i64* %i, align 8
  %9 = load %struct.Coin** %1, align 8
  %10 = getelementptr inbounds %struct.Coin* %9, i64 %8
  %11 = bitcast %struct.Coin* %10 to i8*
  call void @coin_cleanup(i8* %11)
  br label %12

; <label>:12                                      ; preds = %7
  %13 = load i64* %i, align 8
  %14 = add i64 %13, 1
  store i64 %14, i64* %i, align 8
  br label %3

; <label>:15                                      ; preds = %3
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @coin_copy(%struct.Coin* %c1, %struct.Coin* %c2) #0 {
  %1 = alloca %struct.Coin*, align 8
  %2 = alloca %struct.Coin*, align 8
  store %struct.Coin* %c1, %struct.Coin** %1, align 8
  store %struct.Coin* %c2, %struct.Coin** %2, align 8
  %3 = load %struct.Coin** %2, align 8
  %4 = getelementptr inbounds %struct.Coin* %3, i32 0, i32 1
  %5 = load float* %4, align 4
  %6 = load %struct.Coin** %1, align 8
  %7 = getelementptr inbounds %struct.Coin* %6, i32 0, i32 1
  store float %5, float* %7, align 4
  %8 = load %struct.Coin** %1, align 8
  %9 = getelementptr inbounds %struct.Coin* %8, i32 0, i32 0
  %10 = load %struct.Coin** %2, align 8
  %11 = getelementptr inbounds %struct.Coin* %10, i32 0, i32 0
  %12 = call i32 @uivector_copy(%struct.uivector* %9, %struct.uivector* %11)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @add_coins(%struct.Coin* %c1, %struct.Coin* %c2) #0 {
  %1 = alloca %struct.Coin*, align 8
  %2 = alloca %struct.Coin*, align 8
  %i = alloca i64, align 8
  store %struct.Coin* %c1, %struct.Coin** %1, align 8
  store %struct.Coin* %c2, %struct.Coin** %2, align 8
  store i64 0, i64* %i, align 8
  br label %3

; <label>:3                                       ; preds = %21, %0
  %4 = load i64* %i, align 8
  %5 = load %struct.Coin** %2, align 8
  %6 = getelementptr inbounds %struct.Coin* %5, i32 0, i32 0
  %7 = getelementptr inbounds %struct.uivector* %6, i32 0, i32 1
  %8 = load i64* %7, align 8
  %9 = icmp ult i64 %4, %8
  br i1 %9, label %10, label %24

; <label>:10                                      ; preds = %3
  %11 = load %struct.Coin** %1, align 8
  %12 = getelementptr inbounds %struct.Coin* %11, i32 0, i32 0
  %13 = load i64* %i, align 8
  %14 = load %struct.Coin** %2, align 8
  %15 = getelementptr inbounds %struct.Coin* %14, i32 0, i32 0
  %16 = getelementptr inbounds %struct.uivector* %15, i32 0, i32 0
  %17 = load i32** %16, align 8
  %18 = getelementptr inbounds i32* %17, i64 %13
  %19 = load i32* %18, align 4
  %20 = call i32 @uivector_push_back(%struct.uivector* %12, i32 %19)
  br label %21

; <label>:21                                      ; preds = %10
  %22 = load i64* %i, align 8
  %23 = add i64 %22, 1
  store i64 %23, i64* %i, align 8
  br label %3

; <label>:24                                      ; preds = %3
  %25 = load %struct.Coin** %2, align 8
  %26 = getelementptr inbounds %struct.Coin* %25, i32 0, i32 1
  %27 = load float* %26, align 4
  %28 = load %struct.Coin** %1, align 8
  %29 = getelementptr inbounds %struct.Coin* %28, i32 0, i32 1
  %30 = load float* %29, align 4
  %31 = fadd float %30, %27
  store float %31, float* %29, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @lodepng_inflate(i8** %out, i64* %outsize, i8* %in, i64 %insize, %struct.LodePNGDecompressSettings* %settings) #0 {
  %1 = alloca i8**, align 8
  %2 = alloca i64*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i64, align 8
  %5 = alloca %struct.LodePNGDecompressSettings*, align 8
  %error = alloca i32, align 4
  %v = alloca %struct.ucvector, align 8
  store i8** %out, i8*** %1, align 8
  store i64* %outsize, i64** %2, align 8
  store i8* %in, i8** %3, align 8
  store i64 %insize, i64* %4, align 8
  store %struct.LodePNGDecompressSettings* %settings, %struct.LodePNGDecompressSettings** %5, align 8
  %6 = load i8*** %1, align 8
  %7 = load i8** %6, align 8
  %8 = load i64** %2, align 8
  %9 = load i64* %8, align 8
  call void @ucvector_init_buffer(%struct.ucvector* %v, i8* %7, i64 %9)
  %10 = load i8** %3, align 8
  %11 = load i64* %4, align 8
  %12 = load %struct.LodePNGDecompressSettings** %5, align 8
  %13 = call i32 @lodepng_inflatev(%struct.ucvector* %v, i8* %10, i64 %11, %struct.LodePNGDecompressSettings* %12)
  store i32 %13, i32* %error, align 4
  %14 = getelementptr inbounds %struct.ucvector* %v, i32 0, i32 0
  %15 = load i8** %14, align 8
  %16 = load i8*** %1, align 8
  store i8* %15, i8** %16, align 8
  %17 = getelementptr inbounds %struct.ucvector* %v, i32 0, i32 1
  %18 = load i64* %17, align 8
  %19 = load i64** %2, align 8
  store i64 %18, i64* %19, align 8
  %20 = load i32* %error, align 4
  ret i32 %20
}

; Function Attrs: nounwind uwtable
define internal void @ucvector_init_buffer(%struct.ucvector* %p, i8* %buffer, i64 %size) #0 {
  %1 = alloca %struct.ucvector*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i64, align 8
  store %struct.ucvector* %p, %struct.ucvector** %1, align 8
  store i8* %buffer, i8** %2, align 8
  store i64 %size, i64* %3, align 8
  %4 = load i8** %2, align 8
  %5 = load %struct.ucvector** %1, align 8
  %6 = getelementptr inbounds %struct.ucvector* %5, i32 0, i32 0
  store i8* %4, i8** %6, align 8
  %7 = load i64* %3, align 8
  %8 = load %struct.ucvector** %1, align 8
  %9 = getelementptr inbounds %struct.ucvector* %8, i32 0, i32 1
  store i64 %7, i64* %9, align 8
  %10 = load %struct.ucvector** %1, align 8
  %11 = getelementptr inbounds %struct.ucvector* %10, i32 0, i32 2
  store i64 %7, i64* %11, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define internal i32 @lodepng_inflatev(%struct.ucvector* %out, i8* %in, i64 %insize, %struct.LodePNGDecompressSettings* %settings) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.ucvector*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i64, align 8
  %5 = alloca %struct.LodePNGDecompressSettings*, align 8
  %bp = alloca i64, align 8
  %BFINAL = alloca i32, align 4
  %pos = alloca i64, align 8
  %error = alloca i32, align 4
  %BTYPE = alloca i32, align 4
  store %struct.ucvector* %out, %struct.ucvector** %2, align 8
  store i8* %in, i8** %3, align 8
  store i64 %insize, i64* %4, align 8
  store %struct.LodePNGDecompressSettings* %settings, %struct.LodePNGDecompressSettings** %5, align 8
  store i64 0, i64* %bp, align 8
  store i32 0, i32* %BFINAL, align 4
  store i64 0, i64* %pos, align 8
  store i32 0, i32* %error, align 4
  %6 = load %struct.LodePNGDecompressSettings** %5, align 8
  br label %7

; <label>:7                                       ; preds = %55, %0
  %8 = load i32* %BFINAL, align 4
  %9 = icmp ne i32 %8, 0
  %10 = xor i1 %9, true
  br i1 %10, label %11, label %56

; <label>:11                                      ; preds = %7
  %12 = load i64* %bp, align 8
  %13 = add i64 %12, 2
  %14 = load i64* %4, align 8
  %15 = mul i64 %14, 8
  %16 = icmp uge i64 %13, %15
  br i1 %16, label %17, label %18

; <label>:17                                      ; preds = %11
  store i32 52, i32* %1
  br label %64

; <label>:18                                      ; preds = %11
  %19 = load i8** %3, align 8
  %20 = call zeroext i8 @readBitFromStream(i64* %bp, i8* %19)
  %21 = zext i8 %20 to i32
  store i32 %21, i32* %BFINAL, align 4
  %22 = load i8** %3, align 8
  %23 = call zeroext i8 @readBitFromStream(i64* %bp, i8* %22)
  %24 = zext i8 %23 to i32
  %25 = mul nsw i32 1, %24
  store i32 %25, i32* %BTYPE, align 4
  %26 = load i8** %3, align 8
  %27 = call zeroext i8 @readBitFromStream(i64* %bp, i8* %26)
  %28 = zext i8 %27 to i32
  %29 = mul nsw i32 2, %28
  %30 = load i32* %BTYPE, align 4
  %31 = add i32 %30, %29
  store i32 %31, i32* %BTYPE, align 4
  %32 = load i32* %BTYPE, align 4
  %33 = icmp eq i32 %32, 3
  br i1 %33, label %34, label %35

; <label>:34                                      ; preds = %18
  store i32 20, i32* %1
  br label %64

; <label>:35                                      ; preds = %18
  %36 = load i32* %BTYPE, align 4
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %38, label %43

; <label>:38                                      ; preds = %35
  %39 = load %struct.ucvector** %2, align 8
  %40 = load i8** %3, align 8
  %41 = load i64* %4, align 8
  %42 = call i32 @inflateNoCompression(%struct.ucvector* %39, i8* %40, i64* %bp, i64* %pos, i64 %41)
  store i32 %42, i32* %error, align 4
  br label %49

; <label>:43                                      ; preds = %35
  %44 = load %struct.ucvector** %2, align 8
  %45 = load i8** %3, align 8
  %46 = load i64* %4, align 8
  %47 = load i32* %BTYPE, align 4
  %48 = call i32 @inflateHuffmanBlock(%struct.ucvector* %44, i8* %45, i64* %bp, i64* %pos, i64 %46, i32 %47)
  store i32 %48, i32* %error, align 4
  br label %49

; <label>:49                                      ; preds = %43, %38
  br label %50

; <label>:50                                      ; preds = %49
  %51 = load i32* %error, align 4
  %52 = icmp ne i32 %51, 0
  br i1 %52, label %53, label %55

; <label>:53                                      ; preds = %50
  %54 = load i32* %error, align 4
  store i32 %54, i32* %1
  br label %64

; <label>:55                                      ; preds = %50
  br label %7

; <label>:56                                      ; preds = %7
  %57 = load %struct.ucvector** %2, align 8
  %58 = load i64* %pos, align 8
  %59 = call i32 @ucvector_resize(%struct.ucvector* %57, i64 %58)
  %60 = icmp ne i32 %59, 0
  br i1 %60, label %62, label %61

; <label>:61                                      ; preds = %56
  store i32 83, i32* %error, align 4
  br label %62

; <label>:62                                      ; preds = %61, %56
  %63 = load i32* %error, align 4
  store i32 %63, i32* %1
  br label %64

; <label>:64                                      ; preds = %62, %53, %34, %17
  %65 = load i32* %1
  ret i32 %65
}

; Function Attrs: nounwind uwtable
define i32 @lodepng_deflate(i8** %out, i64* %outsize, i8* %in, i64 %insize, %struct.LodePNGCompressSettings* %settings) #0 {
  %1 = alloca i8**, align 8
  %2 = alloca i64*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i64, align 8
  %5 = alloca %struct.LodePNGCompressSettings*, align 8
  %error = alloca i32, align 4
  %v = alloca %struct.ucvector, align 8
  store i8** %out, i8*** %1, align 8
  store i64* %outsize, i64** %2, align 8
  store i8* %in, i8** %3, align 8
  store i64 %insize, i64* %4, align 8
  store %struct.LodePNGCompressSettings* %settings, %struct.LodePNGCompressSettings** %5, align 8
  %6 = load i8*** %1, align 8
  %7 = load i8** %6, align 8
  %8 = load i64** %2, align 8
  %9 = load i64* %8, align 8
  call void @ucvector_init_buffer(%struct.ucvector* %v, i8* %7, i64 %9)
  %10 = load i8** %3, align 8
  %11 = load i64* %4, align 8
  %12 = load %struct.LodePNGCompressSettings** %5, align 8
  %13 = call i32 @lodepng_deflatev(%struct.ucvector* %v, i8* %10, i64 %11, %struct.LodePNGCompressSettings* %12)
  store i32 %13, i32* %error, align 4
  %14 = getelementptr inbounds %struct.ucvector* %v, i32 0, i32 0
  %15 = load i8** %14, align 8
  %16 = load i8*** %1, align 8
  store i8* %15, i8** %16, align 8
  %17 = getelementptr inbounds %struct.ucvector* %v, i32 0, i32 1
  %18 = load i64* %17, align 8
  %19 = load i64** %2, align 8
  store i64 %18, i64* %19, align 8
  %20 = load i32* %error, align 4
  ret i32 %20
}

; Function Attrs: nounwind uwtable
define internal i32 @lodepng_deflatev(%struct.ucvector* %out, i8* %in, i64 %insize, %struct.LodePNGCompressSettings* %settings) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.ucvector*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i64, align 8
  %5 = alloca %struct.LodePNGCompressSettings*, align 8
  %error = alloca i32, align 4
  %i = alloca i64, align 8
  %blocksize = alloca i64, align 8
  %numdeflateblocks = alloca i64, align 8
  %bp = alloca i64, align 8
  %hash = alloca %struct.Hash, align 8
  %final = alloca i32, align 4
  %start = alloca i64, align 8
  %end = alloca i64, align 8
  store %struct.ucvector* %out, %struct.ucvector** %2, align 8
  store i8* %in, i8** %3, align 8
  store i64 %insize, i64* %4, align 8
  store %struct.LodePNGCompressSettings* %settings, %struct.LodePNGCompressSettings** %5, align 8
  store i32 0, i32* %error, align 4
  store i64 0, i64* %bp, align 8
  %6 = load %struct.LodePNGCompressSettings** %5, align 8
  %7 = getelementptr inbounds %struct.LodePNGCompressSettings* %6, i32 0, i32 0
  %8 = load i32* %7, align 4
  %9 = icmp ugt i32 %8, 2
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %0
  store i32 61, i32* %1
  br label %115

; <label>:11                                      ; preds = %0
  %12 = load %struct.LodePNGCompressSettings** %5, align 8
  %13 = getelementptr inbounds %struct.LodePNGCompressSettings* %12, i32 0, i32 0
  %14 = load i32* %13, align 4
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %21

; <label>:16                                      ; preds = %11
  %17 = load %struct.ucvector** %2, align 8
  %18 = load i8** %3, align 8
  %19 = load i64* %4, align 8
  %20 = call i32 @deflateNoCompression(%struct.ucvector* %17, i8* %18, i64 %19)
  store i32 %20, i32* %1
  br label %115

; <label>:21                                      ; preds = %11
  %22 = load %struct.LodePNGCompressSettings** %5, align 8
  %23 = getelementptr inbounds %struct.LodePNGCompressSettings* %22, i32 0, i32 0
  %24 = load i32* %23, align 4
  %25 = icmp eq i32 %24, 1
  br i1 %25, label %26, label %28

; <label>:26                                      ; preds = %21
  %27 = load i64* %4, align 8
  store i64 %27, i64* %blocksize, align 8
  br label %36

; <label>:28                                      ; preds = %21
  %29 = load i64* %4, align 8
  %30 = udiv i64 %29, 8
  %31 = add i64 %30, 8
  store i64 %31, i64* %blocksize, align 8
  %32 = load i64* %blocksize, align 8
  %33 = icmp ult i64 %32, 65535
  br i1 %33, label %34, label %35

; <label>:34                                      ; preds = %28
  store i64 65535, i64* %blocksize, align 8
  br label %35

; <label>:35                                      ; preds = %34, %28
  br label %36

; <label>:36                                      ; preds = %35, %26
  br label %37

; <label>:37                                      ; preds = %36
  br label %38

; <label>:38                                      ; preds = %37
  %39 = load i64* %4, align 8
  %40 = load i64* %blocksize, align 8
  %41 = add i64 %39, %40
  %42 = sub i64 %41, 1
  %43 = load i64* %blocksize, align 8
  %44 = udiv i64 %42, %43
  store i64 %44, i64* %numdeflateblocks, align 8
  %45 = load i64* %numdeflateblocks, align 8
  %46 = icmp eq i64 %45, 0
  br i1 %46, label %47, label %48

; <label>:47                                      ; preds = %38
  store i64 1, i64* %numdeflateblocks, align 8
  br label %48

; <label>:48                                      ; preds = %47, %38
  %49 = load %struct.LodePNGCompressSettings** %5, align 8
  %50 = getelementptr inbounds %struct.LodePNGCompressSettings* %49, i32 0, i32 2
  %51 = load i32* %50, align 4
  %52 = call i32 @hash_init(%struct.Hash* %hash, i32 %51)
  store i32 %52, i32* %error, align 4
  %53 = load i32* %error, align 4
  %54 = icmp ne i32 %53, 0
  br i1 %54, label %55, label %57

; <label>:55                                      ; preds = %48
  %56 = load i32* %error, align 4
  store i32 %56, i32* %1
  br label %115

; <label>:57                                      ; preds = %48
  store i64 0, i64* %i, align 8
  br label %58

; <label>:58                                      ; preds = %110, %57
  %59 = load i64* %i, align 8
  %60 = load i64* %numdeflateblocks, align 8
  %61 = icmp ult i64 %59, %60
  br i1 %61, label %62, label %113

; <label>:62                                      ; preds = %58
  %63 = load i32* %error, align 4
  %64 = icmp ne i32 %63, 0
  br i1 %64, label %113, label %65

; <label>:65                                      ; preds = %62
  %66 = load i64* %i, align 8
  %67 = load i64* %numdeflateblocks, align 8
  %68 = sub i64 %67, 1
  %69 = icmp eq i64 %66, %68
  %70 = zext i1 %69 to i32
  store i32 %70, i32* %final, align 4
  %71 = load i64* %i, align 8
  %72 = load i64* %blocksize, align 8
  %73 = mul i64 %71, %72
  store i64 %73, i64* %start, align 8
  %74 = load i64* %start, align 8
  %75 = load i64* %blocksize, align 8
  %76 = add i64 %74, %75
  store i64 %76, i64* %end, align 8
  %77 = load i64* %end, align 8
  %78 = load i64* %4, align 8
  %79 = icmp ugt i64 %77, %78
  br i1 %79, label %80, label %82

; <label>:80                                      ; preds = %65
  %81 = load i64* %4, align 8
  store i64 %81, i64* %end, align 8
  br label %82

; <label>:82                                      ; preds = %80, %65
  %83 = load %struct.LodePNGCompressSettings** %5, align 8
  %84 = getelementptr inbounds %struct.LodePNGCompressSettings* %83, i32 0, i32 0
  %85 = load i32* %84, align 4
  %86 = icmp eq i32 %85, 1
  br i1 %86, label %87, label %95

; <label>:87                                      ; preds = %82
  %88 = load %struct.ucvector** %2, align 8
  %89 = load i8** %3, align 8
  %90 = load i64* %start, align 8
  %91 = load i64* %end, align 8
  %92 = load %struct.LodePNGCompressSettings** %5, align 8
  %93 = load i32* %final, align 4
  %94 = call i32 @deflateFixed(%struct.ucvector* %88, i64* %bp, %struct.Hash* %hash, i8* %89, i64 %90, i64 %91, %struct.LodePNGCompressSettings* %92, i32 %93)
  store i32 %94, i32* %error, align 4
  br label %109

; <label>:95                                      ; preds = %82
  %96 = load %struct.LodePNGCompressSettings** %5, align 8
  %97 = getelementptr inbounds %struct.LodePNGCompressSettings* %96, i32 0, i32 0
  %98 = load i32* %97, align 4
  %99 = icmp eq i32 %98, 2
  br i1 %99, label %100, label %108

; <label>:100                                     ; preds = %95
  %101 = load %struct.ucvector** %2, align 8
  %102 = load i8** %3, align 8
  %103 = load i64* %start, align 8
  %104 = load i64* %end, align 8
  %105 = load %struct.LodePNGCompressSettings** %5, align 8
  %106 = load i32* %final, align 4
  %107 = call i32 @deflateDynamic(%struct.ucvector* %101, i64* %bp, %struct.Hash* %hash, i8* %102, i64 %103, i64 %104, %struct.LodePNGCompressSettings* %105, i32 %106)
  store i32 %107, i32* %error, align 4
  br label %108

; <label>:108                                     ; preds = %100, %95
  br label %109

; <label>:109                                     ; preds = %108, %87
  br label %110

; <label>:110                                     ; preds = %109
  %111 = load i64* %i, align 8
  %112 = add i64 %111, 1
  store i64 %112, i64* %i, align 8
  br label %58

; <label>:113                                     ; preds = %62, %58
  call void @hash_cleanup(%struct.Hash* %hash)
  %114 = load i32* %error, align 4
  store i32 %114, i32* %1
  br label %115

; <label>:115                                     ; preds = %113, %55, %16, %10
  %116 = load i32* %1
  ret i32 %116
}

; Function Attrs: nounwind uwtable
define i32 @lodepng_zlib_decompress(i8** %out, i64* %outsize, i8* %in, i64 %insize, %struct.LodePNGDecompressSettings* %settings) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8**, align 8
  %3 = alloca i64*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i64, align 8
  %6 = alloca %struct.LodePNGDecompressSettings*, align 8
  %error = alloca i32, align 4
  %CM = alloca i32, align 4
  %CINFO = alloca i32, align 4
  %FDICT = alloca i32, align 4
  %ADLER32 = alloca i32, align 4
  %checksum = alloca i32, align 4
  store i8** %out, i8*** %2, align 8
  store i64* %outsize, i64** %3, align 8
  store i8* %in, i8** %4, align 8
  store i64 %insize, i64* %5, align 8
  store %struct.LodePNGDecompressSettings* %settings, %struct.LodePNGDecompressSettings** %6, align 8
  store i32 0, i32* %error, align 4
  %7 = load i64* %5, align 8
  %8 = icmp ult i64 %7, 2
  br i1 %8, label %9, label %10

; <label>:9                                       ; preds = %0
  store i32 53, i32* %1
  br label %88

; <label>:10                                      ; preds = %0
  %11 = load i8** %4, align 8
  %12 = getelementptr inbounds i8* %11, i64 0
  %13 = load i8* %12, align 1
  %14 = zext i8 %13 to i32
  %15 = mul nsw i32 %14, 256
  %16 = load i8** %4, align 8
  %17 = getelementptr inbounds i8* %16, i64 1
  %18 = load i8* %17, align 1
  %19 = zext i8 %18 to i32
  %20 = add nsw i32 %15, %19
  %21 = srem i32 %20, 31
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %23, label %24

; <label>:23                                      ; preds = %10
  store i32 24, i32* %1
  br label %88

; <label>:24                                      ; preds = %10
  %25 = load i8** %4, align 8
  %26 = getelementptr inbounds i8* %25, i64 0
  %27 = load i8* %26, align 1
  %28 = zext i8 %27 to i32
  %29 = and i32 %28, 15
  store i32 %29, i32* %CM, align 4
  %30 = load i8** %4, align 8
  %31 = getelementptr inbounds i8* %30, i64 0
  %32 = load i8* %31, align 1
  %33 = zext i8 %32 to i32
  %34 = ashr i32 %33, 4
  %35 = and i32 %34, 15
  store i32 %35, i32* %CINFO, align 4
  %36 = load i8** %4, align 8
  %37 = getelementptr inbounds i8* %36, i64 1
  %38 = load i8* %37, align 1
  %39 = zext i8 %38 to i32
  %40 = ashr i32 %39, 5
  %41 = and i32 %40, 1
  store i32 %41, i32* %FDICT, align 4
  %42 = load i32* %CM, align 4
  %43 = icmp ne i32 %42, 8
  br i1 %43, label %47, label %44

; <label>:44                                      ; preds = %24
  %45 = load i32* %CINFO, align 4
  %46 = icmp ugt i32 %45, 7
  br i1 %46, label %47, label %48

; <label>:47                                      ; preds = %44, %24
  store i32 25, i32* %1
  br label %88

; <label>:48                                      ; preds = %44
  %49 = load i32* %FDICT, align 4
  %50 = icmp ne i32 %49, 0
  br i1 %50, label %51, label %52

; <label>:51                                      ; preds = %48
  store i32 26, i32* %1
  br label %88

; <label>:52                                      ; preds = %48
  %53 = load i8*** %2, align 8
  %54 = load i64** %3, align 8
  %55 = load i8** %4, align 8
  %56 = getelementptr inbounds i8* %55, i64 2
  %57 = load i64* %5, align 8
  %58 = sub i64 %57, 2
  %59 = load %struct.LodePNGDecompressSettings** %6, align 8
  %60 = call i32 @inflate(i8** %53, i64* %54, i8* %56, i64 %58, %struct.LodePNGDecompressSettings* %59)
  store i32 %60, i32* %error, align 4
  %61 = load i32* %error, align 4
  %62 = icmp ne i32 %61, 0
  br i1 %62, label %63, label %65

; <label>:63                                      ; preds = %52
  %64 = load i32* %error, align 4
  store i32 %64, i32* %1
  br label %88

; <label>:65                                      ; preds = %52
  %66 = load %struct.LodePNGDecompressSettings** %6, align 8
  %67 = getelementptr inbounds %struct.LodePNGDecompressSettings* %66, i32 0, i32 0
  %68 = load i32* %67, align 4
  %69 = icmp ne i32 %68, 0
  br i1 %69, label %87, label %70

; <label>:70                                      ; preds = %65
  %71 = load i64* %5, align 8
  %72 = sub i64 %71, 4
  %73 = load i8** %4, align 8
  %74 = getelementptr inbounds i8* %73, i64 %72
  %75 = call i32 @lodepng_read32bitInt(i8* %74)
  store i32 %75, i32* %ADLER32, align 4
  %76 = load i8*** %2, align 8
  %77 = load i8** %76, align 8
  %78 = load i64** %3, align 8
  %79 = load i64* %78, align 8
  %80 = trunc i64 %79 to i32
  %81 = call i32 @adler32(i8* %77, i32 %80)
  store i32 %81, i32* %checksum, align 4
  %82 = load i32* %checksum, align 4
  %83 = load i32* %ADLER32, align 4
  %84 = icmp ne i32 %82, %83
  br i1 %84, label %85, label %86

; <label>:85                                      ; preds = %70
  store i32 58, i32* %1
  br label %88

; <label>:86                                      ; preds = %70
  br label %87

; <label>:87                                      ; preds = %86, %65
  store i32 0, i32* %1
  br label %88

; <label>:88                                      ; preds = %87, %85, %63, %51, %47, %23, %9
  %89 = load i32* %1
  ret i32 %89
}

; Function Attrs: nounwind uwtable
define internal i32 @inflate(i8** %out, i64* %outsize, i8* %in, i64 %insize, %struct.LodePNGDecompressSettings* %settings) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8**, align 8
  %3 = alloca i64*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i64, align 8
  %6 = alloca %struct.LodePNGDecompressSettings*, align 8
  store i8** %out, i8*** %2, align 8
  store i64* %outsize, i64** %3, align 8
  store i8* %in, i8** %4, align 8
  store i64 %insize, i64* %5, align 8
  store %struct.LodePNGDecompressSettings* %settings, %struct.LodePNGDecompressSettings** %6, align 8
  %7 = load %struct.LodePNGDecompressSettings** %6, align 8
  %8 = getelementptr inbounds %struct.LodePNGDecompressSettings* %7, i32 0, i32 2
  %9 = bitcast {}** %8 to i32 (i8**, i64*, i8*, i64, %struct.LodePNGDecompressSettings*)**
  %10 = load i32 (i8**, i64*, i8*, i64, %struct.LodePNGDecompressSettings*)** %9, align 8
  %11 = icmp ne i32 (i8**, i64*, i8*, i64, %struct.LodePNGDecompressSettings*)* %10, null
  br i1 %11, label %12, label %23

; <label>:12                                      ; preds = %0
  %13 = load %struct.LodePNGDecompressSettings** %6, align 8
  %14 = getelementptr inbounds %struct.LodePNGDecompressSettings* %13, i32 0, i32 2
  %15 = bitcast {}** %14 to i32 (i8**, i64*, i8*, i64, %struct.LodePNGDecompressSettings*)**
  %16 = load i32 (i8**, i64*, i8*, i64, %struct.LodePNGDecompressSettings*)** %15, align 8
  %17 = load i8*** %2, align 8
  %18 = load i64** %3, align 8
  %19 = load i8** %4, align 8
  %20 = load i64* %5, align 8
  %21 = load %struct.LodePNGDecompressSettings** %6, align 8
  %22 = call i32 %16(i8** %17, i64* %18, i8* %19, i64 %20, %struct.LodePNGDecompressSettings* %21)
  store i32 %22, i32* %1
  br label %30

; <label>:23                                      ; preds = %0
  %24 = load i8*** %2, align 8
  %25 = load i64** %3, align 8
  %26 = load i8** %4, align 8
  %27 = load i64* %5, align 8
  %28 = load %struct.LodePNGDecompressSettings** %6, align 8
  %29 = call i32 @lodepng_inflate(i8** %24, i64* %25, i8* %26, i64 %27, %struct.LodePNGDecompressSettings* %28)
  store i32 %29, i32* %1
  br label %30

; <label>:30                                      ; preds = %23, %12
  %31 = load i32* %1
  ret i32 %31
}

; Function Attrs: nounwind uwtable
define internal i32 @adler32(i8* %data, i32 %len) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i32, align 4
  store i8* %data, i8** %1, align 8
  store i32 %len, i32* %2, align 4
  %3 = load i8** %1, align 8
  %4 = load i32* %2, align 4
  %5 = call i32 @update_adler32(i32 1, i8* %3, i32 %4)
  ret i32 %5
}

; Function Attrs: nounwind uwtable
define i32 @lodepng_zlib_compress(i8** %out, i64* %outsize, i8* %in, i64 %insize, %struct.LodePNGCompressSettings* %settings) #0 {
  %1 = alloca i8**, align 8
  %2 = alloca i64*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i64, align 8
  %5 = alloca %struct.LodePNGCompressSettings*, align 8
  %outv = alloca %struct.ucvector, align 8
  %i = alloca i64, align 8
  %error = alloca i32, align 4
  %deflatedata = alloca i8*, align 8
  %deflatesize = alloca i64, align 8
  %ADLER32 = alloca i32, align 4
  %CMF = alloca i32, align 4
  %FLEVEL = alloca i32, align 4
  %FDICT = alloca i32, align 4
  %CMFFLG = alloca i32, align 4
  %FCHECK = alloca i32, align 4
  store i8** %out, i8*** %1, align 8
  store i64* %outsize, i64** %2, align 8
  store i8* %in, i8** %3, align 8
  store i64 %insize, i64* %4, align 8
  store %struct.LodePNGCompressSettings* %settings, %struct.LodePNGCompressSettings** %5, align 8
  store i8* null, i8** %deflatedata, align 8
  store i64 0, i64* %deflatesize, align 8
  store i32 120, i32* %CMF, align 4
  store i32 0, i32* %FLEVEL, align 4
  store i32 0, i32* %FDICT, align 4
  %6 = load i32* %CMF, align 4
  %7 = mul i32 256, %6
  %8 = load i32* %FDICT, align 4
  %9 = mul i32 %8, 32
  %10 = add i32 %7, %9
  %11 = load i32* %FLEVEL, align 4
  %12 = mul i32 %11, 64
  %13 = add i32 %10, %12
  store i32 %13, i32* %CMFFLG, align 4
  %14 = load i32* %CMFFLG, align 4
  %15 = urem i32 %14, 31
  %16 = sub i32 31, %15
  store i32 %16, i32* %FCHECK, align 4
  %17 = load i32* %FCHECK, align 4
  %18 = load i32* %CMFFLG, align 4
  %19 = add i32 %18, %17
  store i32 %19, i32* %CMFFLG, align 4
  %20 = load i8*** %1, align 8
  %21 = load i8** %20, align 8
  %22 = load i64** %2, align 8
  %23 = load i64* %22, align 8
  call void @ucvector_init_buffer(%struct.ucvector* %outv, i8* %21, i64 %23)
  %24 = load i32* %CMFFLG, align 4
  %25 = udiv i32 %24, 256
  %26 = trunc i32 %25 to i8
  %27 = call i32 @ucvector_push_back(%struct.ucvector* %outv, i8 zeroext %26)
  %28 = load i32* %CMFFLG, align 4
  %29 = urem i32 %28, 256
  %30 = trunc i32 %29 to i8
  %31 = call i32 @ucvector_push_back(%struct.ucvector* %outv, i8 zeroext %30)
  %32 = load i8** %3, align 8
  %33 = load i64* %4, align 8
  %34 = load %struct.LodePNGCompressSettings** %5, align 8
  %35 = call i32 @deflate(i8** %deflatedata, i64* %deflatesize, i8* %32, i64 %33, %struct.LodePNGCompressSettings* %34)
  store i32 %35, i32* %error, align 4
  %36 = load i32* %error, align 4
  %37 = icmp ne i32 %36, 0
  br i1 %37, label %59, label %38

; <label>:38                                      ; preds = %0
  %39 = load i8** %3, align 8
  %40 = load i64* %4, align 8
  %41 = trunc i64 %40 to i32
  %42 = call i32 @adler32(i8* %39, i32 %41)
  store i32 %42, i32* %ADLER32, align 4
  store i64 0, i64* %i, align 8
  br label %43

; <label>:43                                      ; preds = %53, %38
  %44 = load i64* %i, align 8
  %45 = load i64* %deflatesize, align 8
  %46 = icmp ult i64 %44, %45
  br i1 %46, label %47, label %56

; <label>:47                                      ; preds = %43
  %48 = load i64* %i, align 8
  %49 = load i8** %deflatedata, align 8
  %50 = getelementptr inbounds i8* %49, i64 %48
  %51 = load i8* %50, align 1
  %52 = call i32 @ucvector_push_back(%struct.ucvector* %outv, i8 zeroext %51)
  br label %53

; <label>:53                                      ; preds = %47
  %54 = load i64* %i, align 8
  %55 = add i64 %54, 1
  store i64 %55, i64* %i, align 8
  br label %43

; <label>:56                                      ; preds = %43
  %57 = load i8** %deflatedata, align 8
  call void @lodepng_free(i8* %57)
  %58 = load i32* %ADLER32, align 4
  call void @lodepng_add32bitInt(%struct.ucvector* %outv, i32 %58)
  br label %59

; <label>:59                                      ; preds = %56, %0
  %60 = getelementptr inbounds %struct.ucvector* %outv, i32 0, i32 0
  %61 = load i8** %60, align 8
  %62 = load i8*** %1, align 8
  store i8* %61, i8** %62, align 8
  %63 = getelementptr inbounds %struct.ucvector* %outv, i32 0, i32 1
  %64 = load i64* %63, align 8
  %65 = load i64** %2, align 8
  store i64 %64, i64* %65, align 8
  %66 = load i32* %error, align 4
  ret i32 %66
}

; Function Attrs: nounwind uwtable
define internal i32 @ucvector_push_back(%struct.ucvector* %p, i8 zeroext %c) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.ucvector*, align 8
  %3 = alloca i8, align 1
  store %struct.ucvector* %p, %struct.ucvector** %2, align 8
  store i8 %c, i8* %3, align 1
  %4 = load %struct.ucvector** %2, align 8
  %5 = load %struct.ucvector** %2, align 8
  %6 = getelementptr inbounds %struct.ucvector* %5, i32 0, i32 1
  %7 = load i64* %6, align 8
  %8 = add i64 %7, 1
  %9 = call i32 @ucvector_resize(%struct.ucvector* %4, i64 %8)
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %12, label %11

; <label>:11                                      ; preds = %0
  store i32 0, i32* %1
  br label %22

; <label>:12                                      ; preds = %0
  %13 = load i8* %3, align 1
  %14 = load %struct.ucvector** %2, align 8
  %15 = getelementptr inbounds %struct.ucvector* %14, i32 0, i32 1
  %16 = load i64* %15, align 8
  %17 = sub i64 %16, 1
  %18 = load %struct.ucvector** %2, align 8
  %19 = getelementptr inbounds %struct.ucvector* %18, i32 0, i32 0
  %20 = load i8** %19, align 8
  %21 = getelementptr inbounds i8* %20, i64 %17
  store i8 %13, i8* %21, align 1
  store i32 1, i32* %1
  br label %22

; <label>:22                                      ; preds = %12, %11
  %23 = load i32* %1
  ret i32 %23
}

; Function Attrs: nounwind uwtable
define internal i32 @deflate(i8** %out, i64* %outsize, i8* %in, i64 %insize, %struct.LodePNGCompressSettings* %settings) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8**, align 8
  %3 = alloca i64*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i64, align 8
  %6 = alloca %struct.LodePNGCompressSettings*, align 8
  store i8** %out, i8*** %2, align 8
  store i64* %outsize, i64** %3, align 8
  store i8* %in, i8** %4, align 8
  store i64 %insize, i64* %5, align 8
  store %struct.LodePNGCompressSettings* %settings, %struct.LodePNGCompressSettings** %6, align 8
  %7 = load %struct.LodePNGCompressSettings** %6, align 8
  %8 = getelementptr inbounds %struct.LodePNGCompressSettings* %7, i32 0, i32 7
  %9 = bitcast {}** %8 to i32 (i8**, i64*, i8*, i64, %struct.LodePNGCompressSettings*)**
  %10 = load i32 (i8**, i64*, i8*, i64, %struct.LodePNGCompressSettings*)** %9, align 8
  %11 = icmp ne i32 (i8**, i64*, i8*, i64, %struct.LodePNGCompressSettings*)* %10, null
  br i1 %11, label %12, label %23

; <label>:12                                      ; preds = %0
  %13 = load %struct.LodePNGCompressSettings** %6, align 8
  %14 = getelementptr inbounds %struct.LodePNGCompressSettings* %13, i32 0, i32 7
  %15 = bitcast {}** %14 to i32 (i8**, i64*, i8*, i64, %struct.LodePNGCompressSettings*)**
  %16 = load i32 (i8**, i64*, i8*, i64, %struct.LodePNGCompressSettings*)** %15, align 8
  %17 = load i8*** %2, align 8
  %18 = load i64** %3, align 8
  %19 = load i8** %4, align 8
  %20 = load i64* %5, align 8
  %21 = load %struct.LodePNGCompressSettings** %6, align 8
  %22 = call i32 %16(i8** %17, i64* %18, i8* %19, i64 %20, %struct.LodePNGCompressSettings* %21)
  store i32 %22, i32* %1
  br label %30

; <label>:23                                      ; preds = %0
  %24 = load i8*** %2, align 8
  %25 = load i64** %3, align 8
  %26 = load i8** %4, align 8
  %27 = load i64* %5, align 8
  %28 = load %struct.LodePNGCompressSettings** %6, align 8
  %29 = call i32 @lodepng_deflate(i8** %24, i64* %25, i8* %26, i64 %27, %struct.LodePNGCompressSettings* %28)
  store i32 %29, i32* %1
  br label %30

; <label>:30                                      ; preds = %23, %12
  %31 = load i32* %1
  ret i32 %31
}

; Function Attrs: nounwind uwtable
define internal void @lodepng_add32bitInt(%struct.ucvector* %buffer, i32 %value) #0 {
  %1 = alloca %struct.ucvector*, align 8
  %2 = alloca i32, align 4
  store %struct.ucvector* %buffer, %struct.ucvector** %1, align 8
  store i32 %value, i32* %2, align 4
  %3 = load %struct.ucvector** %1, align 8
  %4 = load %struct.ucvector** %1, align 8
  %5 = getelementptr inbounds %struct.ucvector* %4, i32 0, i32 1
  %6 = load i64* %5, align 8
  %7 = add i64 %6, 4
  %8 = call i32 @ucvector_resize(%struct.ucvector* %3, i64 %7)
  %9 = load %struct.ucvector** %1, align 8
  %10 = getelementptr inbounds %struct.ucvector* %9, i32 0, i32 1
  %11 = load i64* %10, align 8
  %12 = sub i64 %11, 4
  %13 = load %struct.ucvector** %1, align 8
  %14 = getelementptr inbounds %struct.ucvector* %13, i32 0, i32 0
  %15 = load i8** %14, align 8
  %16 = getelementptr inbounds i8* %15, i64 %12
  %17 = load i32* %2, align 4
  call void @lodepng_set32bitInt(i8* %16, i32 %17)
  ret void
}

; Function Attrs: nounwind uwtable
define void @lodepng_compress_settings_init(%struct.LodePNGCompressSettings* %settings) #0 {
  %1 = alloca %struct.LodePNGCompressSettings*, align 8
  store %struct.LodePNGCompressSettings* %settings, %struct.LodePNGCompressSettings** %1, align 8
  %2 = load %struct.LodePNGCompressSettings** %1, align 8
  %3 = getelementptr inbounds %struct.LodePNGCompressSettings* %2, i32 0, i32 0
  store i32 2, i32* %3, align 4
  %4 = load %struct.LodePNGCompressSettings** %1, align 8
  %5 = getelementptr inbounds %struct.LodePNGCompressSettings* %4, i32 0, i32 1
  store i32 1, i32* %5, align 4
  %6 = load %struct.LodePNGCompressSettings** %1, align 8
  %7 = getelementptr inbounds %struct.LodePNGCompressSettings* %6, i32 0, i32 2
  store i32 2048, i32* %7, align 4
  %8 = load %struct.LodePNGCompressSettings** %1, align 8
  %9 = getelementptr inbounds %struct.LodePNGCompressSettings* %8, i32 0, i32 3
  store i32 3, i32* %9, align 4
  %10 = load %struct.LodePNGCompressSettings** %1, align 8
  %11 = getelementptr inbounds %struct.LodePNGCompressSettings* %10, i32 0, i32 4
  store i32 128, i32* %11, align 4
  %12 = load %struct.LodePNGCompressSettings** %1, align 8
  %13 = getelementptr inbounds %struct.LodePNGCompressSettings* %12, i32 0, i32 5
  store i32 1, i32* %13, align 4
  %14 = load %struct.LodePNGCompressSettings** %1, align 8
  %15 = getelementptr inbounds %struct.LodePNGCompressSettings* %14, i32 0, i32 6
  %16 = bitcast {}** %15 to i32 (i8**, i64*, i8*, i64, %struct.LodePNGCompressSettings*)**
  store i32 (i8**, i64*, i8*, i64, %struct.LodePNGCompressSettings*)* null, i32 (i8**, i64*, i8*, i64, %struct.LodePNGCompressSettings*)** %16, align 8
  %17 = load %struct.LodePNGCompressSettings** %1, align 8
  %18 = getelementptr inbounds %struct.LodePNGCompressSettings* %17, i32 0, i32 7
  %19 = bitcast {}** %18 to i32 (i8**, i64*, i8*, i64, %struct.LodePNGCompressSettings*)**
  store i32 (i8**, i64*, i8*, i64, %struct.LodePNGCompressSettings*)* null, i32 (i8**, i64*, i8*, i64, %struct.LodePNGCompressSettings*)** %19, align 8
  %20 = load %struct.LodePNGCompressSettings** %1, align 8
  %21 = getelementptr inbounds %struct.LodePNGCompressSettings* %20, i32 0, i32 8
  store i8* null, i8** %21, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define void @lodepng_decompress_settings_init(%struct.LodePNGDecompressSettings* %settings) #0 {
  %1 = alloca %struct.LodePNGDecompressSettings*, align 8
  store %struct.LodePNGDecompressSettings* %settings, %struct.LodePNGDecompressSettings** %1, align 8
  %2 = load %struct.LodePNGDecompressSettings** %1, align 8
  %3 = getelementptr inbounds %struct.LodePNGDecompressSettings* %2, i32 0, i32 0
  store i32 0, i32* %3, align 4
  %4 = load %struct.LodePNGDecompressSettings** %1, align 8
  %5 = getelementptr inbounds %struct.LodePNGDecompressSettings* %4, i32 0, i32 1
  %6 = bitcast {}** %5 to i32 (i8**, i64*, i8*, i64, %struct.LodePNGDecompressSettings*)**
  store i32 (i8**, i64*, i8*, i64, %struct.LodePNGDecompressSettings*)* null, i32 (i8**, i64*, i8*, i64, %struct.LodePNGDecompressSettings*)** %6, align 8
  %7 = load %struct.LodePNGDecompressSettings** %1, align 8
  %8 = getelementptr inbounds %struct.LodePNGDecompressSettings* %7, i32 0, i32 2
  %9 = bitcast {}** %8 to i32 (i8**, i64*, i8*, i64, %struct.LodePNGDecompressSettings*)**
  store i32 (i8**, i64*, i8*, i64, %struct.LodePNGDecompressSettings*)* null, i32 (i8**, i64*, i8*, i64, %struct.LodePNGDecompressSettings*)** %9, align 8
  %10 = load %struct.LodePNGDecompressSettings** %1, align 8
  %11 = getelementptr inbounds %struct.LodePNGDecompressSettings* %10, i32 0, i32 3
  store i8* null, i8** %11, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @lodepng_crc32(i8* %buf, i64 %len) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i64, align 8
  %c = alloca i32, align 4
  %n = alloca i64, align 8
  store i8* %buf, i8** %1, align 8
  store i64 %len, i64* %2, align 8
  store i32 -1, i32* %c, align 4
  store i64 0, i64* %n, align 8
  br label %3

; <label>:3                                       ; preds = %22, %0
  %4 = load i64* %n, align 8
  %5 = load i64* %2, align 8
  %6 = icmp ult i64 %4, %5
  br i1 %6, label %7, label %25

; <label>:7                                       ; preds = %3
  %8 = load i32* %c, align 4
  %9 = load i64* %n, align 8
  %10 = load i8** %1, align 8
  %11 = getelementptr inbounds i8* %10, i64 %9
  %12 = load i8* %11, align 1
  %13 = zext i8 %12 to i32
  %14 = xor i32 %8, %13
  %15 = and i32 %14, 255
  %16 = zext i32 %15 to i64
  %17 = getelementptr inbounds [256 x i32]* @lodepng_crc32_table, i32 0, i64 %16
  %18 = load i32* %17, align 4
  %19 = load i32* %c, align 4
  %20 = lshr i32 %19, 8
  %21 = xor i32 %18, %20
  store i32 %21, i32* %c, align 4
  br label %22

; <label>:22                                      ; preds = %7
  %23 = load i64* %n, align 8
  %24 = add i64 %23, 1
  store i64 %24, i64* %n, align 8
  br label %3

; <label>:25                                      ; preds = %3
  %26 = load i32* %c, align 4
  %27 = zext i32 %26 to i64
  %28 = xor i64 %27, 4294967295
  %29 = trunc i64 %28 to i32
  ret i32 %29
}

; Function Attrs: nounwind uwtable
define i32 @lodepng_chunk_length(i8* %chunk) #0 {
  %1 = alloca i8*, align 8
  store i8* %chunk, i8** %1, align 8
  %2 = load i8** %1, align 8
  %3 = getelementptr inbounds i8* %2, i64 0
  %4 = call i32 @lodepng_read32bitInt(i8* %3)
  ret i32 %4
}

; Function Attrs: nounwind uwtable
define void @lodepng_chunk_type(i8* %type, i8* %chunk) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %i = alloca i32, align 4
  store i8* %type, i8** %1, align 8
  store i8* %chunk, i8** %2, align 8
  store i32 0, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %17, %0
  %4 = load i32* %i, align 4
  %5 = icmp ult i32 %4, 4
  br i1 %5, label %6, label %20

; <label>:6                                       ; preds = %3
  %7 = load i32* %i, align 4
  %8 = add i32 4, %7
  %9 = zext i32 %8 to i64
  %10 = load i8** %2, align 8
  %11 = getelementptr inbounds i8* %10, i64 %9
  %12 = load i8* %11, align 1
  %13 = load i32* %i, align 4
  %14 = zext i32 %13 to i64
  %15 = load i8** %1, align 8
  %16 = getelementptr inbounds i8* %15, i64 %14
  store i8 %12, i8* %16, align 1
  br label %17

; <label>:17                                      ; preds = %6
  %18 = load i32* %i, align 4
  %19 = add i32 %18, 1
  store i32 %19, i32* %i, align 4
  br label %3

; <label>:20                                      ; preds = %3
  %21 = load i8** %1, align 8
  %22 = getelementptr inbounds i8* %21, i64 4
  store i8 0, i8* %22, align 1
  ret void
}

; Function Attrs: nounwind uwtable
define zeroext i8 @lodepng_chunk_type_equals(i8* %chunk, i8* %type) #0 {
  %1 = alloca i8, align 1
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  store i8* %chunk, i8** %2, align 8
  store i8* %type, i8** %3, align 8
  %4 = load i8** %3, align 8
  %5 = call i64 @strlen(i8* %4) #6
  %6 = icmp ne i64 %5, 4
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  store i8 0, i8* %1
  br label %52

; <label>:8                                       ; preds = %0
  %9 = load i8** %2, align 8
  %10 = getelementptr inbounds i8* %9, i64 4
  %11 = load i8* %10, align 1
  %12 = zext i8 %11 to i32
  %13 = load i8** %3, align 8
  %14 = getelementptr inbounds i8* %13, i64 0
  %15 = load i8* %14, align 1
  %16 = sext i8 %15 to i32
  %17 = icmp eq i32 %12, %16
  br i1 %17, label %18, label %48

; <label>:18                                      ; preds = %8
  %19 = load i8** %2, align 8
  %20 = getelementptr inbounds i8* %19, i64 5
  %21 = load i8* %20, align 1
  %22 = zext i8 %21 to i32
  %23 = load i8** %3, align 8
  %24 = getelementptr inbounds i8* %23, i64 1
  %25 = load i8* %24, align 1
  %26 = sext i8 %25 to i32
  %27 = icmp eq i32 %22, %26
  br i1 %27, label %28, label %48

; <label>:28                                      ; preds = %18
  %29 = load i8** %2, align 8
  %30 = getelementptr inbounds i8* %29, i64 6
  %31 = load i8* %30, align 1
  %32 = zext i8 %31 to i32
  %33 = load i8** %3, align 8
  %34 = getelementptr inbounds i8* %33, i64 2
  %35 = load i8* %34, align 1
  %36 = sext i8 %35 to i32
  %37 = icmp eq i32 %32, %36
  br i1 %37, label %38, label %48

; <label>:38                                      ; preds = %28
  %39 = load i8** %2, align 8
  %40 = getelementptr inbounds i8* %39, i64 7
  %41 = load i8* %40, align 1
  %42 = zext i8 %41 to i32
  %43 = load i8** %3, align 8
  %44 = getelementptr inbounds i8* %43, i64 3
  %45 = load i8* %44, align 1
  %46 = sext i8 %45 to i32
  %47 = icmp eq i32 %42, %46
  br label %48

; <label>:48                                      ; preds = %38, %28, %18, %8
  %49 = phi i1 [ false, %28 ], [ false, %18 ], [ false, %8 ], [ %47, %38 ]
  %50 = zext i1 %49 to i32
  %51 = trunc i32 %50 to i8
  store i8 %51, i8* %1
  br label %52

; <label>:52                                      ; preds = %48, %7
  %53 = load i8* %1
  ret i8 %53
}

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #2

; Function Attrs: nounwind uwtable
define zeroext i8 @lodepng_chunk_ancillary(i8* %chunk) #0 {
  %1 = alloca i8*, align 8
  store i8* %chunk, i8** %1, align 8
  %2 = load i8** %1, align 8
  %3 = getelementptr inbounds i8* %2, i64 4
  %4 = load i8* %3, align 1
  %5 = zext i8 %4 to i32
  %6 = and i32 %5, 32
  %7 = icmp ne i32 %6, 0
  %8 = zext i1 %7 to i32
  %9 = trunc i32 %8 to i8
  ret i8 %9
}

; Function Attrs: nounwind uwtable
define zeroext i8 @lodepng_chunk_private(i8* %chunk) #0 {
  %1 = alloca i8*, align 8
  store i8* %chunk, i8** %1, align 8
  %2 = load i8** %1, align 8
  %3 = getelementptr inbounds i8* %2, i64 6
  %4 = load i8* %3, align 1
  %5 = zext i8 %4 to i32
  %6 = and i32 %5, 32
  %7 = icmp ne i32 %6, 0
  %8 = zext i1 %7 to i32
  %9 = trunc i32 %8 to i8
  ret i8 %9
}

; Function Attrs: nounwind uwtable
define zeroext i8 @lodepng_chunk_safetocopy(i8* %chunk) #0 {
  %1 = alloca i8*, align 8
  store i8* %chunk, i8** %1, align 8
  %2 = load i8** %1, align 8
  %3 = getelementptr inbounds i8* %2, i64 7
  %4 = load i8* %3, align 1
  %5 = zext i8 %4 to i32
  %6 = and i32 %5, 32
  %7 = icmp ne i32 %6, 0
  %8 = zext i1 %7 to i32
  %9 = trunc i32 %8 to i8
  ret i8 %9
}

; Function Attrs: nounwind uwtable
define i8* @lodepng_chunk_data(i8* %chunk) #0 {
  %1 = alloca i8*, align 8
  store i8* %chunk, i8** %1, align 8
  %2 = load i8** %1, align 8
  %3 = getelementptr inbounds i8* %2, i64 8
  ret i8* %3
}

; Function Attrs: nounwind uwtable
define i8* @lodepng_chunk_data_const(i8* %chunk) #0 {
  %1 = alloca i8*, align 8
  store i8* %chunk, i8** %1, align 8
  %2 = load i8** %1, align 8
  %3 = getelementptr inbounds i8* %2, i64 8
  ret i8* %3
}

; Function Attrs: nounwind uwtable
define i32 @lodepng_chunk_check_crc(i8* %chunk) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8*, align 8
  %length = alloca i32, align 4
  %CRC = alloca i32, align 4
  %checksum = alloca i32, align 4
  store i8* %chunk, i8** %2, align 8
  %3 = load i8** %2, align 8
  %4 = call i32 @lodepng_chunk_length(i8* %3)
  store i32 %4, i32* %length, align 4
  %5 = load i32* %length, align 4
  %6 = add i32 %5, 8
  %7 = zext i32 %6 to i64
  %8 = load i8** %2, align 8
  %9 = getelementptr inbounds i8* %8, i64 %7
  %10 = call i32 @lodepng_read32bitInt(i8* %9)
  store i32 %10, i32* %CRC, align 4
  %11 = load i8** %2, align 8
  %12 = getelementptr inbounds i8* %11, i64 4
  %13 = load i32* %length, align 4
  %14 = add i32 %13, 4
  %15 = zext i32 %14 to i64
  %16 = call i32 @lodepng_crc32(i8* %12, i64 %15)
  store i32 %16, i32* %checksum, align 4
  %17 = load i32* %CRC, align 4
  %18 = load i32* %checksum, align 4
  %19 = icmp ne i32 %17, %18
  br i1 %19, label %20, label %21

; <label>:20                                      ; preds = %0
  store i32 1, i32* %1
  br label %22

; <label>:21                                      ; preds = %0
  store i32 0, i32* %1
  br label %22

; <label>:22                                      ; preds = %21, %20
  %23 = load i32* %1
  ret i32 %23
}

; Function Attrs: nounwind uwtable
define void @lodepng_chunk_generate_crc(i8* %chunk) #0 {
  %1 = alloca i8*, align 8
  %length = alloca i32, align 4
  %CRC = alloca i32, align 4
  store i8* %chunk, i8** %1, align 8
  %2 = load i8** %1, align 8
  %3 = call i32 @lodepng_chunk_length(i8* %2)
  store i32 %3, i32* %length, align 4
  %4 = load i8** %1, align 8
  %5 = getelementptr inbounds i8* %4, i64 4
  %6 = load i32* %length, align 4
  %7 = add i32 %6, 4
  %8 = zext i32 %7 to i64
  %9 = call i32 @lodepng_crc32(i8* %5, i64 %8)
  store i32 %9, i32* %CRC, align 4
  %10 = load i8** %1, align 8
  %11 = getelementptr inbounds i8* %10, i64 8
  %12 = load i32* %length, align 4
  %13 = zext i32 %12 to i64
  %14 = getelementptr inbounds i8* %11, i64 %13
  %15 = load i32* %CRC, align 4
  call void @lodepng_set32bitInt(i8* %14, i32 %15)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @lodepng_set32bitInt(i8* %buffer, i32 %value) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i32, align 4
  store i8* %buffer, i8** %1, align 8
  store i32 %value, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = lshr i32 %3, 24
  %5 = and i32 %4, 255
  %6 = trunc i32 %5 to i8
  %7 = load i8** %1, align 8
  %8 = getelementptr inbounds i8* %7, i64 0
  store i8 %6, i8* %8, align 1
  %9 = load i32* %2, align 4
  %10 = lshr i32 %9, 16
  %11 = and i32 %10, 255
  %12 = trunc i32 %11 to i8
  %13 = load i8** %1, align 8
  %14 = getelementptr inbounds i8* %13, i64 1
  store i8 %12, i8* %14, align 1
  %15 = load i32* %2, align 4
  %16 = lshr i32 %15, 8
  %17 = and i32 %16, 255
  %18 = trunc i32 %17 to i8
  %19 = load i8** %1, align 8
  %20 = getelementptr inbounds i8* %19, i64 2
  store i8 %18, i8* %20, align 1
  %21 = load i32* %2, align 4
  %22 = and i32 %21, 255
  %23 = trunc i32 %22 to i8
  %24 = load i8** %1, align 8
  %25 = getelementptr inbounds i8* %24, i64 3
  store i8 %23, i8* %25, align 1
  ret void
}

; Function Attrs: nounwind uwtable
define i8* @lodepng_chunk_next(i8* %chunk) #0 {
  %1 = alloca i8*, align 8
  %total_chunk_length = alloca i32, align 4
  store i8* %chunk, i8** %1, align 8
  %2 = load i8** %1, align 8
  %3 = call i32 @lodepng_chunk_length(i8* %2)
  %4 = add i32 %3, 12
  store i32 %4, i32* %total_chunk_length, align 4
  %5 = load i32* %total_chunk_length, align 4
  %6 = zext i32 %5 to i64
  %7 = load i8** %1, align 8
  %8 = getelementptr inbounds i8* %7, i64 %6
  ret i8* %8
}

; Function Attrs: nounwind uwtable
define i8* @lodepng_chunk_next_const(i8* %chunk) #0 {
  %1 = alloca i8*, align 8
  %total_chunk_length = alloca i32, align 4
  store i8* %chunk, i8** %1, align 8
  %2 = load i8** %1, align 8
  %3 = call i32 @lodepng_chunk_length(i8* %2)
  %4 = add i32 %3, 12
  store i32 %4, i32* %total_chunk_length, align 4
  %5 = load i32* %total_chunk_length, align 4
  %6 = zext i32 %5 to i64
  %7 = load i8** %1, align 8
  %8 = getelementptr inbounds i8* %7, i64 %6
  ret i8* %8
}

; Function Attrs: nounwind uwtable
define i32 @lodepng_chunk_append(i8** %out, i64* %outlength, i8* %chunk) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8**, align 8
  %3 = alloca i64*, align 8
  %4 = alloca i8*, align 8
  %i = alloca i32, align 4
  %total_chunk_length = alloca i32, align 4
  %chunk_start = alloca i8*, align 8
  %new_buffer = alloca i8*, align 8
  %new_length = alloca i64, align 8
  store i8** %out, i8*** %2, align 8
  store i64* %outlength, i64** %3, align 8
  store i8* %chunk, i8** %4, align 8
  %5 = load i8** %4, align 8
  %6 = call i32 @lodepng_chunk_length(i8* %5)
  %7 = add i32 %6, 12
  store i32 %7, i32* %total_chunk_length, align 4
  %8 = load i64** %3, align 8
  %9 = load i64* %8, align 8
  %10 = load i32* %total_chunk_length, align 4
  %11 = zext i32 %10 to i64
  %12 = add i64 %9, %11
  store i64 %12, i64* %new_length, align 8
  %13 = load i64* %new_length, align 8
  %14 = load i32* %total_chunk_length, align 4
  %15 = zext i32 %14 to i64
  %16 = icmp ult i64 %13, %15
  br i1 %16, label %22, label %17

; <label>:17                                      ; preds = %0
  %18 = load i64* %new_length, align 8
  %19 = load i64** %3, align 8
  %20 = load i64* %19, align 8
  %21 = icmp ult i64 %18, %20
  br i1 %21, label %22, label %23

; <label>:22                                      ; preds = %17, %0
  store i32 77, i32* %1
  br label %61

; <label>:23                                      ; preds = %17
  %24 = load i8*** %2, align 8
  %25 = load i8** %24, align 8
  %26 = load i64* %new_length, align 8
  %27 = call i8* @lodepng_realloc(i8* %25, i64 %26)
  store i8* %27, i8** %new_buffer, align 8
  %28 = load i8** %new_buffer, align 8
  %29 = icmp ne i8* %28, null
  br i1 %29, label %31, label %30

; <label>:30                                      ; preds = %23
  store i32 83, i32* %1
  br label %61

; <label>:31                                      ; preds = %23
  %32 = load i8** %new_buffer, align 8
  %33 = load i8*** %2, align 8
  store i8* %32, i8** %33, align 8
  %34 = load i64* %new_length, align 8
  %35 = load i64** %3, align 8
  store i64 %34, i64* %35, align 8
  %36 = load i64* %new_length, align 8
  %37 = load i32* %total_chunk_length, align 4
  %38 = zext i32 %37 to i64
  %39 = sub i64 %36, %38
  %40 = load i8*** %2, align 8
  %41 = load i8** %40, align 8
  %42 = getelementptr inbounds i8* %41, i64 %39
  store i8* %42, i8** %chunk_start, align 8
  store i32 0, i32* %i, align 4
  br label %43

; <label>:43                                      ; preds = %57, %31
  %44 = load i32* %i, align 4
  %45 = load i32* %total_chunk_length, align 4
  %46 = icmp ult i32 %44, %45
  br i1 %46, label %47, label %60

; <label>:47                                      ; preds = %43
  %48 = load i32* %i, align 4
  %49 = zext i32 %48 to i64
  %50 = load i8** %4, align 8
  %51 = getelementptr inbounds i8* %50, i64 %49
  %52 = load i8* %51, align 1
  %53 = load i32* %i, align 4
  %54 = zext i32 %53 to i64
  %55 = load i8** %chunk_start, align 8
  %56 = getelementptr inbounds i8* %55, i64 %54
  store i8 %52, i8* %56, align 1
  br label %57

; <label>:57                                      ; preds = %47
  %58 = load i32* %i, align 4
  %59 = add i32 %58, 1
  store i32 %59, i32* %i, align 4
  br label %43

; <label>:60                                      ; preds = %43
  store i32 0, i32* %1
  br label %61

; <label>:61                                      ; preds = %60, %30, %22
  %62 = load i32* %1
  ret i32 %62
}

; Function Attrs: nounwind uwtable
define internal i8* @lodepng_realloc(i8* %ptr, i64 %new_size) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i64, align 8
  store i8* %ptr, i8** %1, align 8
  store i64 %new_size, i64* %2, align 8
  %3 = load i8** %1, align 8
  %4 = load i64* %2, align 8
  %5 = call i8* @realloc(i8* %3, i64 %4) #3
  ret i8* %5
}

; Function Attrs: nounwind uwtable
define i32 @lodepng_chunk_create(i8** %out, i64* %outlength, i32 %length, i8* %type, i8* %data) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8**, align 8
  %3 = alloca i64*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %i = alloca i32, align 4
  %chunk = alloca i8*, align 8
  %new_buffer = alloca i8*, align 8
  %new_length = alloca i64, align 8
  store i8** %out, i8*** %2, align 8
  store i64* %outlength, i64** %3, align 8
  store i32 %length, i32* %4, align 4
  store i8* %type, i8** %5, align 8
  store i8* %data, i8** %6, align 8
  %7 = load i64** %3, align 8
  %8 = load i64* %7, align 8
  %9 = load i32* %4, align 4
  %10 = zext i32 %9 to i64
  %11 = add i64 %8, %10
  %12 = add i64 %11, 12
  store i64 %12, i64* %new_length, align 8
  %13 = load i64* %new_length, align 8
  %14 = load i32* %4, align 4
  %15 = add i32 %14, 12
  %16 = zext i32 %15 to i64
  %17 = icmp ult i64 %13, %16
  br i1 %17, label %23, label %18

; <label>:18                                      ; preds = %0
  %19 = load i64* %new_length, align 8
  %20 = load i64** %3, align 8
  %21 = load i64* %20, align 8
  %22 = icmp ult i64 %19, %21
  br i1 %22, label %23, label %24

; <label>:23                                      ; preds = %18, %0
  store i32 77, i32* %1
  br label %88

; <label>:24                                      ; preds = %18
  %25 = load i8*** %2, align 8
  %26 = load i8** %25, align 8
  %27 = load i64* %new_length, align 8
  %28 = call i8* @lodepng_realloc(i8* %26, i64 %27)
  store i8* %28, i8** %new_buffer, align 8
  %29 = load i8** %new_buffer, align 8
  %30 = icmp ne i8* %29, null
  br i1 %30, label %32, label %31

; <label>:31                                      ; preds = %24
  store i32 83, i32* %1
  br label %88

; <label>:32                                      ; preds = %24
  %33 = load i8** %new_buffer, align 8
  %34 = load i8*** %2, align 8
  store i8* %33, i8** %34, align 8
  %35 = load i64* %new_length, align 8
  %36 = load i64** %3, align 8
  store i64 %35, i64* %36, align 8
  %37 = load i64** %3, align 8
  %38 = load i64* %37, align 8
  %39 = load i32* %4, align 4
  %40 = zext i32 %39 to i64
  %41 = sub i64 %38, %40
  %42 = sub i64 %41, 12
  %43 = load i8*** %2, align 8
  %44 = load i8** %43, align 8
  %45 = getelementptr inbounds i8* %44, i64 %42
  store i8* %45, i8** %chunk, align 8
  %46 = load i8** %chunk, align 8
  %47 = load i32* %4, align 4
  call void @lodepng_set32bitInt(i8* %46, i32 %47)
  %48 = load i8** %5, align 8
  %49 = getelementptr inbounds i8* %48, i64 0
  %50 = load i8* %49, align 1
  %51 = load i8** %chunk, align 8
  %52 = getelementptr inbounds i8* %51, i64 4
  store i8 %50, i8* %52, align 1
  %53 = load i8** %5, align 8
  %54 = getelementptr inbounds i8* %53, i64 1
  %55 = load i8* %54, align 1
  %56 = load i8** %chunk, align 8
  %57 = getelementptr inbounds i8* %56, i64 5
  store i8 %55, i8* %57, align 1
  %58 = load i8** %5, align 8
  %59 = getelementptr inbounds i8* %58, i64 2
  %60 = load i8* %59, align 1
  %61 = load i8** %chunk, align 8
  %62 = getelementptr inbounds i8* %61, i64 6
  store i8 %60, i8* %62, align 1
  %63 = load i8** %5, align 8
  %64 = getelementptr inbounds i8* %63, i64 3
  %65 = load i8* %64, align 1
  %66 = load i8** %chunk, align 8
  %67 = getelementptr inbounds i8* %66, i64 7
  store i8 %65, i8* %67, align 1
  store i32 0, i32* %i, align 4
  br label %68

; <label>:68                                      ; preds = %83, %32
  %69 = load i32* %i, align 4
  %70 = load i32* %4, align 4
  %71 = icmp ult i32 %69, %70
  br i1 %71, label %72, label %86

; <label>:72                                      ; preds = %68
  %73 = load i32* %i, align 4
  %74 = zext i32 %73 to i64
  %75 = load i8** %6, align 8
  %76 = getelementptr inbounds i8* %75, i64 %74
  %77 = load i8* %76, align 1
  %78 = load i32* %i, align 4
  %79 = add i32 8, %78
  %80 = zext i32 %79 to i64
  %81 = load i8** %chunk, align 8
  %82 = getelementptr inbounds i8* %81, i64 %80
  store i8 %77, i8* %82, align 1
  br label %83

; <label>:83                                      ; preds = %72
  %84 = load i32* %i, align 4
  %85 = add i32 %84, 1
  store i32 %85, i32* %i, align 4
  br label %68

; <label>:86                                      ; preds = %68
  %87 = load i8** %chunk, align 8
  call void @lodepng_chunk_generate_crc(i8* %87)
  store i32 0, i32* %1
  br label %88

; <label>:88                                      ; preds = %86, %31, %23
  %89 = load i32* %1
  ret i32 %89
}

; Function Attrs: nounwind uwtable
define void @lodepng_color_mode_init(%struct.LodePNGColorMode* %info) #0 {
  %1 = alloca %struct.LodePNGColorMode*, align 8
  store %struct.LodePNGColorMode* %info, %struct.LodePNGColorMode** %1, align 8
  %2 = load %struct.LodePNGColorMode** %1, align 8
  %3 = getelementptr inbounds %struct.LodePNGColorMode* %2, i32 0, i32 4
  store i32 0, i32* %3, align 4
  %4 = load %struct.LodePNGColorMode** %1, align 8
  %5 = getelementptr inbounds %struct.LodePNGColorMode* %4, i32 0, i32 7
  store i32 0, i32* %5, align 4
  %6 = load %struct.LodePNGColorMode** %1, align 8
  %7 = getelementptr inbounds %struct.LodePNGColorMode* %6, i32 0, i32 6
  store i32 0, i32* %7, align 4
  %8 = load %struct.LodePNGColorMode** %1, align 8
  %9 = getelementptr inbounds %struct.LodePNGColorMode* %8, i32 0, i32 5
  store i32 0, i32* %9, align 4
  %10 = load %struct.LodePNGColorMode** %1, align 8
  %11 = getelementptr inbounds %struct.LodePNGColorMode* %10, i32 0, i32 0
  store i32 6, i32* %11, align 4
  %12 = load %struct.LodePNGColorMode** %1, align 8
  %13 = getelementptr inbounds %struct.LodePNGColorMode* %12, i32 0, i32 1
  store i32 8, i32* %13, align 4
  %14 = load %struct.LodePNGColorMode** %1, align 8
  %15 = getelementptr inbounds %struct.LodePNGColorMode* %14, i32 0, i32 2
  store i8* null, i8** %15, align 8
  %16 = load %struct.LodePNGColorMode** %1, align 8
  %17 = getelementptr inbounds %struct.LodePNGColorMode* %16, i32 0, i32 3
  store i64 0, i64* %17, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define void @lodepng_color_mode_cleanup(%struct.LodePNGColorMode* %info) #0 {
  %1 = alloca %struct.LodePNGColorMode*, align 8
  store %struct.LodePNGColorMode* %info, %struct.LodePNGColorMode** %1, align 8
  %2 = load %struct.LodePNGColorMode** %1, align 8
  call void @lodepng_palette_clear(%struct.LodePNGColorMode* %2)
  ret void
}

; Function Attrs: nounwind uwtable
define void @lodepng_palette_clear(%struct.LodePNGColorMode* %info) #0 {
  %1 = alloca %struct.LodePNGColorMode*, align 8
  store %struct.LodePNGColorMode* %info, %struct.LodePNGColorMode** %1, align 8
  %2 = load %struct.LodePNGColorMode** %1, align 8
  %3 = getelementptr inbounds %struct.LodePNGColorMode* %2, i32 0, i32 2
  %4 = load i8** %3, align 8
  %5 = icmp ne i8* %4, null
  br i1 %5, label %6, label %10

; <label>:6                                       ; preds = %0
  %7 = load %struct.LodePNGColorMode** %1, align 8
  %8 = getelementptr inbounds %struct.LodePNGColorMode* %7, i32 0, i32 2
  %9 = load i8** %8, align 8
  call void @lodepng_free(i8* %9)
  br label %10

; <label>:10                                      ; preds = %6, %0
  %11 = load %struct.LodePNGColorMode** %1, align 8
  %12 = getelementptr inbounds %struct.LodePNGColorMode* %11, i32 0, i32 2
  store i8* null, i8** %12, align 8
  %13 = load %struct.LodePNGColorMode** %1, align 8
  %14 = getelementptr inbounds %struct.LodePNGColorMode* %13, i32 0, i32 3
  store i64 0, i64* %14, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @lodepng_color_mode_copy(%struct.LodePNGColorMode* %dest, %struct.LodePNGColorMode* %source) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.LodePNGColorMode*, align 8
  %3 = alloca %struct.LodePNGColorMode*, align 8
  %i = alloca i64, align 8
  store %struct.LodePNGColorMode* %dest, %struct.LodePNGColorMode** %2, align 8
  store %struct.LodePNGColorMode* %source, %struct.LodePNGColorMode** %3, align 8
  %4 = load %struct.LodePNGColorMode** %2, align 8
  call void @lodepng_color_mode_cleanup(%struct.LodePNGColorMode* %4)
  %5 = load %struct.LodePNGColorMode** %2, align 8
  %6 = load %struct.LodePNGColorMode** %3, align 8
  %7 = bitcast %struct.LodePNGColorMode* %5 to i8*
  %8 = bitcast %struct.LodePNGColorMode* %6 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %7, i8* %8, i64 40, i32 8, i1 false)
  %9 = load %struct.LodePNGColorMode** %3, align 8
  %10 = getelementptr inbounds %struct.LodePNGColorMode* %9, i32 0, i32 2
  %11 = load i8** %10, align 8
  %12 = icmp ne i8* %11, null
  br i1 %12, label %13, label %51

; <label>:13                                      ; preds = %0
  %14 = call i8* @lodepng_malloc(i64 1024)
  %15 = load %struct.LodePNGColorMode** %2, align 8
  %16 = getelementptr inbounds %struct.LodePNGColorMode* %15, i32 0, i32 2
  store i8* %14, i8** %16, align 8
  %17 = load %struct.LodePNGColorMode** %2, align 8
  %18 = getelementptr inbounds %struct.LodePNGColorMode* %17, i32 0, i32 2
  %19 = load i8** %18, align 8
  %20 = icmp ne i8* %19, null
  br i1 %20, label %27, label %21

; <label>:21                                      ; preds = %13
  %22 = load %struct.LodePNGColorMode** %3, align 8
  %23 = getelementptr inbounds %struct.LodePNGColorMode* %22, i32 0, i32 3
  %24 = load i64* %23, align 8
  %25 = icmp ne i64 %24, 0
  br i1 %25, label %26, label %27

; <label>:26                                      ; preds = %21
  store i32 83, i32* %1
  br label %52

; <label>:27                                      ; preds = %21, %13
  store i64 0, i64* %i, align 8
  br label %28

; <label>:28                                      ; preds = %47, %27
  %29 = load i64* %i, align 8
  %30 = load %struct.LodePNGColorMode** %3, align 8
  %31 = getelementptr inbounds %struct.LodePNGColorMode* %30, i32 0, i32 3
  %32 = load i64* %31, align 8
  %33 = mul i64 %32, 4
  %34 = icmp ult i64 %29, %33
  br i1 %34, label %35, label %50

; <label>:35                                      ; preds = %28
  %36 = load i64* %i, align 8
  %37 = load %struct.LodePNGColorMode** %3, align 8
  %38 = getelementptr inbounds %struct.LodePNGColorMode* %37, i32 0, i32 2
  %39 = load i8** %38, align 8
  %40 = getelementptr inbounds i8* %39, i64 %36
  %41 = load i8* %40, align 1
  %42 = load i64* %i, align 8
  %43 = load %struct.LodePNGColorMode** %2, align 8
  %44 = getelementptr inbounds %struct.LodePNGColorMode* %43, i32 0, i32 2
  %45 = load i8** %44, align 8
  %46 = getelementptr inbounds i8* %45, i64 %42
  store i8 %41, i8* %46, align 1
  br label %47

; <label>:47                                      ; preds = %35
  %48 = load i64* %i, align 8
  %49 = add i64 %48, 1
  store i64 %49, i64* %i, align 8
  br label %28

; <label>:50                                      ; preds = %28
  br label %51

; <label>:51                                      ; preds = %50, %0
  store i32 0, i32* %1
  br label %52

; <label>:52                                      ; preds = %51, %26
  %53 = load i32* %1
  ret i32 %53
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #3

; Function Attrs: nounwind uwtable
define i32 @lodepng_palette_add(%struct.LodePNGColorMode* %info, i8 zeroext %r, i8 zeroext %g, i8 zeroext %b, i8 zeroext %a) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.LodePNGColorMode*, align 8
  %3 = alloca i8, align 1
  %4 = alloca i8, align 1
  %5 = alloca i8, align 1
  %6 = alloca i8, align 1
  %data = alloca i8*, align 8
  store %struct.LodePNGColorMode* %info, %struct.LodePNGColorMode** %2, align 8
  store i8 %r, i8* %3, align 1
  store i8 %g, i8* %4, align 1
  store i8 %b, i8* %5, align 1
  store i8 %a, i8* %6, align 1
  %7 = load %struct.LodePNGColorMode** %2, align 8
  %8 = getelementptr inbounds %struct.LodePNGColorMode* %7, i32 0, i32 2
  %9 = load i8** %8, align 8
  %10 = icmp ne i8* %9, null
  br i1 %10, label %24, label %11

; <label>:11                                      ; preds = %0
  %12 = load %struct.LodePNGColorMode** %2, align 8
  %13 = getelementptr inbounds %struct.LodePNGColorMode* %12, i32 0, i32 2
  %14 = load i8** %13, align 8
  %15 = call i8* @lodepng_realloc(i8* %14, i64 1024)
  store i8* %15, i8** %data, align 8
  %16 = load i8** %data, align 8
  %17 = icmp ne i8* %16, null
  br i1 %17, label %19, label %18

; <label>:18                                      ; preds = %11
  store i32 83, i32* %1
  br label %69

; <label>:19                                      ; preds = %11
  %20 = load i8** %data, align 8
  %21 = load %struct.LodePNGColorMode** %2, align 8
  %22 = getelementptr inbounds %struct.LodePNGColorMode* %21, i32 0, i32 2
  store i8* %20, i8** %22, align 8
  br label %23

; <label>:23                                      ; preds = %19
  br label %24

; <label>:24                                      ; preds = %23, %0
  %25 = load i8* %3, align 1
  %26 = load %struct.LodePNGColorMode** %2, align 8
  %27 = getelementptr inbounds %struct.LodePNGColorMode* %26, i32 0, i32 3
  %28 = load i64* %27, align 8
  %29 = mul i64 4, %28
  %30 = add i64 %29, 0
  %31 = load %struct.LodePNGColorMode** %2, align 8
  %32 = getelementptr inbounds %struct.LodePNGColorMode* %31, i32 0, i32 2
  %33 = load i8** %32, align 8
  %34 = getelementptr inbounds i8* %33, i64 %30
  store i8 %25, i8* %34, align 1
  %35 = load i8* %4, align 1
  %36 = load %struct.LodePNGColorMode** %2, align 8
  %37 = getelementptr inbounds %struct.LodePNGColorMode* %36, i32 0, i32 3
  %38 = load i64* %37, align 8
  %39 = mul i64 4, %38
  %40 = add i64 %39, 1
  %41 = load %struct.LodePNGColorMode** %2, align 8
  %42 = getelementptr inbounds %struct.LodePNGColorMode* %41, i32 0, i32 2
  %43 = load i8** %42, align 8
  %44 = getelementptr inbounds i8* %43, i64 %40
  store i8 %35, i8* %44, align 1
  %45 = load i8* %5, align 1
  %46 = load %struct.LodePNGColorMode** %2, align 8
  %47 = getelementptr inbounds %struct.LodePNGColorMode* %46, i32 0, i32 3
  %48 = load i64* %47, align 8
  %49 = mul i64 4, %48
  %50 = add i64 %49, 2
  %51 = load %struct.LodePNGColorMode** %2, align 8
  %52 = getelementptr inbounds %struct.LodePNGColorMode* %51, i32 0, i32 2
  %53 = load i8** %52, align 8
  %54 = getelementptr inbounds i8* %53, i64 %50
  store i8 %45, i8* %54, align 1
  %55 = load i8* %6, align 1
  %56 = load %struct.LodePNGColorMode** %2, align 8
  %57 = getelementptr inbounds %struct.LodePNGColorMode* %56, i32 0, i32 3
  %58 = load i64* %57, align 8
  %59 = mul i64 4, %58
  %60 = add i64 %59, 3
  %61 = load %struct.LodePNGColorMode** %2, align 8
  %62 = getelementptr inbounds %struct.LodePNGColorMode* %61, i32 0, i32 2
  %63 = load i8** %62, align 8
  %64 = getelementptr inbounds i8* %63, i64 %60
  store i8 %55, i8* %64, align 1
  %65 = load %struct.LodePNGColorMode** %2, align 8
  %66 = getelementptr inbounds %struct.LodePNGColorMode* %65, i32 0, i32 3
  %67 = load i64* %66, align 8
  %68 = add i64 %67, 1
  store i64 %68, i64* %66, align 8
  store i32 0, i32* %1
  br label %69

; <label>:69                                      ; preds = %24, %18
  %70 = load i32* %1
  ret i32 %70
}

; Function Attrs: nounwind uwtable
define i32 @lodepng_get_bpp(%struct.LodePNGColorMode* %info) #0 {
  %1 = alloca %struct.LodePNGColorMode*, align 8
  store %struct.LodePNGColorMode* %info, %struct.LodePNGColorMode** %1, align 8
  %2 = load %struct.LodePNGColorMode** %1, align 8
  %3 = getelementptr inbounds %struct.LodePNGColorMode* %2, i32 0, i32 0
  %4 = load i32* %3, align 4
  %5 = load %struct.LodePNGColorMode** %1, align 8
  %6 = getelementptr inbounds %struct.LodePNGColorMode* %5, i32 0, i32 1
  %7 = load i32* %6, align 4
  %8 = call i32 @lodepng_get_bpp_lct(i32 %4, i32 %7)
  ret i32 %8
}

; Function Attrs: nounwind uwtable
define internal i32 @lodepng_get_bpp_lct(i32 %colortype, i32 %bitdepth) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %colortype, i32* %1, align 4
  store i32 %bitdepth, i32* %2, align 4
  %3 = load i32* %1, align 4
  %4 = call i32 @getNumColorChannels(i32 %3)
  %5 = load i32* %2, align 4
  %6 = mul i32 %4, %5
  ret i32 %6
}

; Function Attrs: nounwind uwtable
define i32 @lodepng_get_channels(%struct.LodePNGColorMode* %info) #0 {
  %1 = alloca %struct.LodePNGColorMode*, align 8
  store %struct.LodePNGColorMode* %info, %struct.LodePNGColorMode** %1, align 8
  %2 = load %struct.LodePNGColorMode** %1, align 8
  %3 = getelementptr inbounds %struct.LodePNGColorMode* %2, i32 0, i32 0
  %4 = load i32* %3, align 4
  %5 = call i32 @getNumColorChannels(i32 %4)
  ret i32 %5
}

; Function Attrs: nounwind uwtable
define internal i32 @getNumColorChannels(i32 %colortype) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %colortype, i32* %2, align 4
  %3 = load i32* %2, align 4
  switch i32 %3, label %9 [
    i32 0, label %4
    i32 2, label %5
    i32 3, label %6
    i32 4, label %7
    i32 6, label %8
  ]

; <label>:4                                       ; preds = %0
  store i32 1, i32* %1
  br label %10

; <label>:5                                       ; preds = %0
  store i32 3, i32* %1
  br label %10

; <label>:6                                       ; preds = %0
  store i32 1, i32* %1
  br label %10

; <label>:7                                       ; preds = %0
  store i32 2, i32* %1
  br label %10

; <label>:8                                       ; preds = %0
  store i32 4, i32* %1
  br label %10

; <label>:9                                       ; preds = %0
  store i32 0, i32* %1
  br label %10

; <label>:10                                      ; preds = %9, %8, %7, %6, %5, %4
  %11 = load i32* %1
  ret i32 %11
}

; Function Attrs: nounwind uwtable
define i32 @lodepng_is_greyscale_type(%struct.LodePNGColorMode* %info) #0 {
  %1 = alloca %struct.LodePNGColorMode*, align 8
  store %struct.LodePNGColorMode* %info, %struct.LodePNGColorMode** %1, align 8
  %2 = load %struct.LodePNGColorMode** %1, align 8
  %3 = getelementptr inbounds %struct.LodePNGColorMode* %2, i32 0, i32 0
  %4 = load i32* %3, align 4
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %11, label %6

; <label>:6                                       ; preds = %0
  %7 = load %struct.LodePNGColorMode** %1, align 8
  %8 = getelementptr inbounds %struct.LodePNGColorMode* %7, i32 0, i32 0
  %9 = load i32* %8, align 4
  %10 = icmp eq i32 %9, 4
  br label %11

; <label>:11                                      ; preds = %6, %0
  %12 = phi i1 [ true, %0 ], [ %10, %6 ]
  %13 = zext i1 %12 to i32
  ret i32 %13
}

; Function Attrs: nounwind uwtable
define i32 @lodepng_is_alpha_type(%struct.LodePNGColorMode* %info) #0 {
  %1 = alloca %struct.LodePNGColorMode*, align 8
  store %struct.LodePNGColorMode* %info, %struct.LodePNGColorMode** %1, align 8
  %2 = load %struct.LodePNGColorMode** %1, align 8
  %3 = getelementptr inbounds %struct.LodePNGColorMode* %2, i32 0, i32 0
  %4 = load i32* %3, align 4
  %5 = and i32 %4, 4
  %6 = icmp ne i32 %5, 0
  %7 = zext i1 %6 to i32
  ret i32 %7
}

; Function Attrs: nounwind uwtable
define i32 @lodepng_is_palette_type(%struct.LodePNGColorMode* %info) #0 {
  %1 = alloca %struct.LodePNGColorMode*, align 8
  store %struct.LodePNGColorMode* %info, %struct.LodePNGColorMode** %1, align 8
  %2 = load %struct.LodePNGColorMode** %1, align 8
  %3 = getelementptr inbounds %struct.LodePNGColorMode* %2, i32 0, i32 0
  %4 = load i32* %3, align 4
  %5 = icmp eq i32 %4, 3
  %6 = zext i1 %5 to i32
  ret i32 %6
}

; Function Attrs: nounwind uwtable
define i32 @lodepng_has_palette_alpha(%struct.LodePNGColorMode* %info) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.LodePNGColorMode*, align 8
  %i = alloca i64, align 8
  store %struct.LodePNGColorMode* %info, %struct.LodePNGColorMode** %2, align 8
  store i64 0, i64* %i, align 8
  br label %3

; <label>:3                                       ; preds = %22, %0
  %4 = load i64* %i, align 8
  %5 = load %struct.LodePNGColorMode** %2, align 8
  %6 = getelementptr inbounds %struct.LodePNGColorMode* %5, i32 0, i32 3
  %7 = load i64* %6, align 8
  %8 = icmp ult i64 %4, %7
  br i1 %8, label %9, label %25

; <label>:9                                       ; preds = %3
  %10 = load i64* %i, align 8
  %11 = mul i64 %10, 4
  %12 = add i64 %11, 3
  %13 = load %struct.LodePNGColorMode** %2, align 8
  %14 = getelementptr inbounds %struct.LodePNGColorMode* %13, i32 0, i32 2
  %15 = load i8** %14, align 8
  %16 = getelementptr inbounds i8* %15, i64 %12
  %17 = load i8* %16, align 1
  %18 = zext i8 %17 to i32
  %19 = icmp slt i32 %18, 255
  br i1 %19, label %20, label %21

; <label>:20                                      ; preds = %9
  store i32 1, i32* %1
  br label %26

; <label>:21                                      ; preds = %9
  br label %22

; <label>:22                                      ; preds = %21
  %23 = load i64* %i, align 8
  %24 = add i64 %23, 1
  store i64 %24, i64* %i, align 8
  br label %3

; <label>:25                                      ; preds = %3
  store i32 0, i32* %1
  br label %26

; <label>:26                                      ; preds = %25, %20
  %27 = load i32* %1
  ret i32 %27
}

; Function Attrs: nounwind uwtable
define i32 @lodepng_can_have_alpha(%struct.LodePNGColorMode* %info) #0 {
  %1 = alloca %struct.LodePNGColorMode*, align 8
  store %struct.LodePNGColorMode* %info, %struct.LodePNGColorMode** %1, align 8
  %2 = load %struct.LodePNGColorMode** %1, align 8
  %3 = getelementptr inbounds %struct.LodePNGColorMode* %2, i32 0, i32 4
  %4 = load i32* %3, align 4
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %14, label %6

; <label>:6                                       ; preds = %0
  %7 = load %struct.LodePNGColorMode** %1, align 8
  %8 = call i32 @lodepng_is_alpha_type(%struct.LodePNGColorMode* %7)
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %14, label %10

; <label>:10                                      ; preds = %6
  %11 = load %struct.LodePNGColorMode** %1, align 8
  %12 = call i32 @lodepng_has_palette_alpha(%struct.LodePNGColorMode* %11)
  %13 = icmp ne i32 %12, 0
  br label %14

; <label>:14                                      ; preds = %10, %6, %0
  %15 = phi i1 [ true, %6 ], [ true, %0 ], [ %13, %10 ]
  %16 = zext i1 %15 to i32
  ret i32 %16
}

; Function Attrs: nounwind uwtable
define i64 @lodepng_get_raw_size(i32 %w, i32 %h, %struct.LodePNGColorMode* %color) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca %struct.LodePNGColorMode*, align 8
  store i32 %w, i32* %1, align 4
  store i32 %h, i32* %2, align 4
  store %struct.LodePNGColorMode* %color, %struct.LodePNGColorMode** %3, align 8
  %4 = load i32* %1, align 4
  %5 = load i32* %2, align 4
  %6 = mul i32 %4, %5
  %7 = load %struct.LodePNGColorMode** %3, align 8
  %8 = call i32 @lodepng_get_bpp(%struct.LodePNGColorMode* %7)
  %9 = mul i32 %6, %8
  %10 = add i32 %9, 7
  %11 = udiv i32 %10, 8
  %12 = zext i32 %11 to i64
  ret i64 %12
}

; Function Attrs: nounwind uwtable
define i64 @lodepng_get_raw_size_lct(i32 %w, i32 %h, i32 %colortype, i32 %bitdepth) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %w, i32* %1, align 4
  store i32 %h, i32* %2, align 4
  store i32 %colortype, i32* %3, align 4
  store i32 %bitdepth, i32* %4, align 4
  %5 = load i32* %1, align 4
  %6 = load i32* %2, align 4
  %7 = mul i32 %5, %6
  %8 = load i32* %3, align 4
  %9 = load i32* %4, align 4
  %10 = call i32 @lodepng_get_bpp_lct(i32 %8, i32 %9)
  %11 = mul i32 %7, %10
  %12 = add i32 %11, 7
  %13 = udiv i32 %12, 8
  %14 = zext i32 %13 to i64
  ret i64 %14
}

; Function Attrs: nounwind uwtable
define void @lodepng_clear_text(%struct.LodePNGInfo* %info) #0 {
  %1 = alloca %struct.LodePNGInfo*, align 8
  store %struct.LodePNGInfo* %info, %struct.LodePNGInfo** %1, align 8
  %2 = load %struct.LodePNGInfo** %1, align 8
  call void @LodePNGText_cleanup(%struct.LodePNGInfo* %2)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @LodePNGText_cleanup(%struct.LodePNGInfo* %info) #0 {
  %1 = alloca %struct.LodePNGInfo*, align 8
  %i = alloca i64, align 8
  store %struct.LodePNGInfo* %info, %struct.LodePNGInfo** %1, align 8
  store i64 0, i64* %i, align 8
  br label %2

; <label>:2                                       ; preds = %19, %0
  %3 = load i64* %i, align 8
  %4 = load %struct.LodePNGInfo** %1, align 8
  %5 = getelementptr inbounds %struct.LodePNGInfo* %4, i32 0, i32 8
  %6 = load i64* %5, align 8
  %7 = icmp ult i64 %3, %6
  br i1 %7, label %8, label %22

; <label>:8                                       ; preds = %2
  %9 = load i64* %i, align 8
  %10 = load %struct.LodePNGInfo** %1, align 8
  %11 = getelementptr inbounds %struct.LodePNGInfo* %10, i32 0, i32 9
  %12 = load i8*** %11, align 8
  %13 = getelementptr inbounds i8** %12, i64 %9
  call void @string_cleanup(i8** %13)
  %14 = load i64* %i, align 8
  %15 = load %struct.LodePNGInfo** %1, align 8
  %16 = getelementptr inbounds %struct.LodePNGInfo* %15, i32 0, i32 10
  %17 = load i8*** %16, align 8
  %18 = getelementptr inbounds i8** %17, i64 %14
  call void @string_cleanup(i8** %18)
  br label %19

; <label>:19                                      ; preds = %8
  %20 = load i64* %i, align 8
  %21 = add i64 %20, 1
  store i64 %21, i64* %i, align 8
  br label %2

; <label>:22                                      ; preds = %2
  %23 = load %struct.LodePNGInfo** %1, align 8
  %24 = getelementptr inbounds %struct.LodePNGInfo* %23, i32 0, i32 9
  %25 = load i8*** %24, align 8
  %26 = bitcast i8** %25 to i8*
  call void @lodepng_free(i8* %26)
  %27 = load %struct.LodePNGInfo** %1, align 8
  %28 = getelementptr inbounds %struct.LodePNGInfo* %27, i32 0, i32 10
  %29 = load i8*** %28, align 8
  %30 = bitcast i8** %29 to i8*
  call void @lodepng_free(i8* %30)
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @lodepng_add_text(%struct.LodePNGInfo* %info, i8* %key, i8* %str) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.LodePNGInfo*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %new_keys = alloca i8**, align 8
  %new_strings = alloca i8**, align 8
  store %struct.LodePNGInfo* %info, %struct.LodePNGInfo** %2, align 8
  store i8* %key, i8** %3, align 8
  store i8* %str, i8** %4, align 8
  %5 = load %struct.LodePNGInfo** %2, align 8
  %6 = getelementptr inbounds %struct.LodePNGInfo* %5, i32 0, i32 9
  %7 = load i8*** %6, align 8
  %8 = bitcast i8** %7 to i8*
  %9 = load %struct.LodePNGInfo** %2, align 8
  %10 = getelementptr inbounds %struct.LodePNGInfo* %9, i32 0, i32 8
  %11 = load i64* %10, align 8
  %12 = add i64 %11, 1
  %13 = mul i64 8, %12
  %14 = call i8* @lodepng_realloc(i8* %8, i64 %13)
  %15 = bitcast i8* %14 to i8**
  store i8** %15, i8*** %new_keys, align 8
  %16 = load %struct.LodePNGInfo** %2, align 8
  %17 = getelementptr inbounds %struct.LodePNGInfo* %16, i32 0, i32 10
  %18 = load i8*** %17, align 8
  %19 = bitcast i8** %18 to i8*
  %20 = load %struct.LodePNGInfo** %2, align 8
  %21 = getelementptr inbounds %struct.LodePNGInfo* %20, i32 0, i32 8
  %22 = load i64* %21, align 8
  %23 = add i64 %22, 1
  %24 = mul i64 8, %23
  %25 = call i8* @lodepng_realloc(i8* %19, i64 %24)
  %26 = bitcast i8* %25 to i8**
  store i8** %26, i8*** %new_strings, align 8
  %27 = load i8*** %new_keys, align 8
  %28 = icmp ne i8** %27, null
  br i1 %28, label %29, label %32

; <label>:29                                      ; preds = %0
  %30 = load i8*** %new_strings, align 8
  %31 = icmp ne i8** %30, null
  br i1 %31, label %37, label %32

; <label>:32                                      ; preds = %29, %0
  %33 = load i8*** %new_keys, align 8
  %34 = bitcast i8** %33 to i8*
  call void @lodepng_free(i8* %34)
  %35 = load i8*** %new_strings, align 8
  %36 = bitcast i8** %35 to i8*
  call void @lodepng_free(i8* %36)
  store i32 83, i32* %1
  br label %82

; <label>:37                                      ; preds = %29
  %38 = load %struct.LodePNGInfo** %2, align 8
  %39 = getelementptr inbounds %struct.LodePNGInfo* %38, i32 0, i32 8
  %40 = load i64* %39, align 8
  %41 = add i64 %40, 1
  store i64 %41, i64* %39, align 8
  %42 = load i8*** %new_keys, align 8
  %43 = load %struct.LodePNGInfo** %2, align 8
  %44 = getelementptr inbounds %struct.LodePNGInfo* %43, i32 0, i32 9
  store i8** %42, i8*** %44, align 8
  %45 = load i8*** %new_strings, align 8
  %46 = load %struct.LodePNGInfo** %2, align 8
  %47 = getelementptr inbounds %struct.LodePNGInfo* %46, i32 0, i32 10
  store i8** %45, i8*** %47, align 8
  %48 = load %struct.LodePNGInfo** %2, align 8
  %49 = getelementptr inbounds %struct.LodePNGInfo* %48, i32 0, i32 8
  %50 = load i64* %49, align 8
  %51 = sub i64 %50, 1
  %52 = load %struct.LodePNGInfo** %2, align 8
  %53 = getelementptr inbounds %struct.LodePNGInfo* %52, i32 0, i32 9
  %54 = load i8*** %53, align 8
  %55 = getelementptr inbounds i8** %54, i64 %51
  call void @string_init(i8** %55)
  %56 = load %struct.LodePNGInfo** %2, align 8
  %57 = getelementptr inbounds %struct.LodePNGInfo* %56, i32 0, i32 8
  %58 = load i64* %57, align 8
  %59 = sub i64 %58, 1
  %60 = load %struct.LodePNGInfo** %2, align 8
  %61 = getelementptr inbounds %struct.LodePNGInfo* %60, i32 0, i32 9
  %62 = load i8*** %61, align 8
  %63 = getelementptr inbounds i8** %62, i64 %59
  %64 = load i8** %3, align 8
  call void @string_set(i8** %63, i8* %64)
  %65 = load %struct.LodePNGInfo** %2, align 8
  %66 = getelementptr inbounds %struct.LodePNGInfo* %65, i32 0, i32 8
  %67 = load i64* %66, align 8
  %68 = sub i64 %67, 1
  %69 = load %struct.LodePNGInfo** %2, align 8
  %70 = getelementptr inbounds %struct.LodePNGInfo* %69, i32 0, i32 10
  %71 = load i8*** %70, align 8
  %72 = getelementptr inbounds i8** %71, i64 %68
  call void @string_init(i8** %72)
  %73 = load %struct.LodePNGInfo** %2, align 8
  %74 = getelementptr inbounds %struct.LodePNGInfo* %73, i32 0, i32 8
  %75 = load i64* %74, align 8
  %76 = sub i64 %75, 1
  %77 = load %struct.LodePNGInfo** %2, align 8
  %78 = getelementptr inbounds %struct.LodePNGInfo* %77, i32 0, i32 10
  %79 = load i8*** %78, align 8
  %80 = getelementptr inbounds i8** %79, i64 %76
  %81 = load i8** %4, align 8
  call void @string_set(i8** %80, i8* %81)
  store i32 0, i32* %1
  br label %82

; <label>:82                                      ; preds = %37, %32
  %83 = load i32* %1
  ret i32 %83
}

; Function Attrs: nounwind uwtable
define internal void @string_init(i8** %out) #0 {
  %1 = alloca i8**, align 8
  store i8** %out, i8*** %1, align 8
  %2 = load i8*** %1, align 8
  store i8* null, i8** %2, align 8
  %3 = load i8*** %1, align 8
  %4 = call i32 @string_resize(i8** %3, i64 0)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @string_set(i8** %out, i8* %in) #0 {
  %1 = alloca i8**, align 8
  %2 = alloca i8*, align 8
  %insize = alloca i64, align 8
  %i = alloca i64, align 8
  store i8** %out, i8*** %1, align 8
  store i8* %in, i8** %2, align 8
  %3 = load i8** %2, align 8
  %4 = call i64 @strlen(i8* %3) #6
  store i64 %4, i64* %insize, align 8
  store i64 0, i64* %i, align 8
  %5 = load i8*** %1, align 8
  %6 = load i64* %insize, align 8
  %7 = call i32 @string_resize(i8** %5, i64 %6)
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %27

; <label>:9                                       ; preds = %0
  store i64 0, i64* %i, align 8
  br label %10

; <label>:10                                      ; preds = %23, %9
  %11 = load i64* %i, align 8
  %12 = load i64* %insize, align 8
  %13 = icmp ult i64 %11, %12
  br i1 %13, label %14, label %26

; <label>:14                                      ; preds = %10
  %15 = load i64* %i, align 8
  %16 = load i8** %2, align 8
  %17 = getelementptr inbounds i8* %16, i64 %15
  %18 = load i8* %17, align 1
  %19 = load i64* %i, align 8
  %20 = load i8*** %1, align 8
  %21 = load i8** %20, align 8
  %22 = getelementptr inbounds i8* %21, i64 %19
  store i8 %18, i8* %22, align 1
  br label %23

; <label>:23                                      ; preds = %14
  %24 = load i64* %i, align 8
  %25 = add i64 %24, 1
  store i64 %25, i64* %i, align 8
  br label %10

; <label>:26                                      ; preds = %10
  br label %27

; <label>:27                                      ; preds = %26, %0
  ret void
}

; Function Attrs: nounwind uwtable
define void @lodepng_clear_itext(%struct.LodePNGInfo* %info) #0 {
  %1 = alloca %struct.LodePNGInfo*, align 8
  store %struct.LodePNGInfo* %info, %struct.LodePNGInfo** %1, align 8
  %2 = load %struct.LodePNGInfo** %1, align 8
  call void @LodePNGIText_cleanup(%struct.LodePNGInfo* %2)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @LodePNGIText_cleanup(%struct.LodePNGInfo* %info) #0 {
  %1 = alloca %struct.LodePNGInfo*, align 8
  %i = alloca i64, align 8
  store %struct.LodePNGInfo* %info, %struct.LodePNGInfo** %1, align 8
  store i64 0, i64* %i, align 8
  br label %2

; <label>:2                                       ; preds = %29, %0
  %3 = load i64* %i, align 8
  %4 = load %struct.LodePNGInfo** %1, align 8
  %5 = getelementptr inbounds %struct.LodePNGInfo* %4, i32 0, i32 11
  %6 = load i64* %5, align 8
  %7 = icmp ult i64 %3, %6
  br i1 %7, label %8, label %32

; <label>:8                                       ; preds = %2
  %9 = load i64* %i, align 8
  %10 = load %struct.LodePNGInfo** %1, align 8
  %11 = getelementptr inbounds %struct.LodePNGInfo* %10, i32 0, i32 12
  %12 = load i8*** %11, align 8
  %13 = getelementptr inbounds i8** %12, i64 %9
  call void @string_cleanup(i8** %13)
  %14 = load i64* %i, align 8
  %15 = load %struct.LodePNGInfo** %1, align 8
  %16 = getelementptr inbounds %struct.LodePNGInfo* %15, i32 0, i32 13
  %17 = load i8*** %16, align 8
  %18 = getelementptr inbounds i8** %17, i64 %14
  call void @string_cleanup(i8** %18)
  %19 = load i64* %i, align 8
  %20 = load %struct.LodePNGInfo** %1, align 8
  %21 = getelementptr inbounds %struct.LodePNGInfo* %20, i32 0, i32 14
  %22 = load i8*** %21, align 8
  %23 = getelementptr inbounds i8** %22, i64 %19
  call void @string_cleanup(i8** %23)
  %24 = load i64* %i, align 8
  %25 = load %struct.LodePNGInfo** %1, align 8
  %26 = getelementptr inbounds %struct.LodePNGInfo* %25, i32 0, i32 15
  %27 = load i8*** %26, align 8
  %28 = getelementptr inbounds i8** %27, i64 %24
  call void @string_cleanup(i8** %28)
  br label %29

; <label>:29                                      ; preds = %8
  %30 = load i64* %i, align 8
  %31 = add i64 %30, 1
  store i64 %31, i64* %i, align 8
  br label %2

; <label>:32                                      ; preds = %2
  %33 = load %struct.LodePNGInfo** %1, align 8
  %34 = getelementptr inbounds %struct.LodePNGInfo* %33, i32 0, i32 12
  %35 = load i8*** %34, align 8
  %36 = bitcast i8** %35 to i8*
  call void @lodepng_free(i8* %36)
  %37 = load %struct.LodePNGInfo** %1, align 8
  %38 = getelementptr inbounds %struct.LodePNGInfo* %37, i32 0, i32 13
  %39 = load i8*** %38, align 8
  %40 = bitcast i8** %39 to i8*
  call void @lodepng_free(i8* %40)
  %41 = load %struct.LodePNGInfo** %1, align 8
  %42 = getelementptr inbounds %struct.LodePNGInfo* %41, i32 0, i32 14
  %43 = load i8*** %42, align 8
  %44 = bitcast i8** %43 to i8*
  call void @lodepng_free(i8* %44)
  %45 = load %struct.LodePNGInfo** %1, align 8
  %46 = getelementptr inbounds %struct.LodePNGInfo* %45, i32 0, i32 15
  %47 = load i8*** %46, align 8
  %48 = bitcast i8** %47 to i8*
  call void @lodepng_free(i8* %48)
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @lodepng_add_itext(%struct.LodePNGInfo* %info, i8* %key, i8* %langtag, i8* %transkey, i8* %str) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.LodePNGInfo*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %new_keys = alloca i8**, align 8
  %new_langtags = alloca i8**, align 8
  %new_transkeys = alloca i8**, align 8
  %new_strings = alloca i8**, align 8
  store %struct.LodePNGInfo* %info, %struct.LodePNGInfo** %2, align 8
  store i8* %key, i8** %3, align 8
  store i8* %langtag, i8** %4, align 8
  store i8* %transkey, i8** %5, align 8
  store i8* %str, i8** %6, align 8
  %7 = load %struct.LodePNGInfo** %2, align 8
  %8 = getelementptr inbounds %struct.LodePNGInfo* %7, i32 0, i32 12
  %9 = load i8*** %8, align 8
  %10 = bitcast i8** %9 to i8*
  %11 = load %struct.LodePNGInfo** %2, align 8
  %12 = getelementptr inbounds %struct.LodePNGInfo* %11, i32 0, i32 11
  %13 = load i64* %12, align 8
  %14 = add i64 %13, 1
  %15 = mul i64 8, %14
  %16 = call i8* @lodepng_realloc(i8* %10, i64 %15)
  %17 = bitcast i8* %16 to i8**
  store i8** %17, i8*** %new_keys, align 8
  %18 = load %struct.LodePNGInfo** %2, align 8
  %19 = getelementptr inbounds %struct.LodePNGInfo* %18, i32 0, i32 13
  %20 = load i8*** %19, align 8
  %21 = bitcast i8** %20 to i8*
  %22 = load %struct.LodePNGInfo** %2, align 8
  %23 = getelementptr inbounds %struct.LodePNGInfo* %22, i32 0, i32 11
  %24 = load i64* %23, align 8
  %25 = add i64 %24, 1
  %26 = mul i64 8, %25
  %27 = call i8* @lodepng_realloc(i8* %21, i64 %26)
  %28 = bitcast i8* %27 to i8**
  store i8** %28, i8*** %new_langtags, align 8
  %29 = load %struct.LodePNGInfo** %2, align 8
  %30 = getelementptr inbounds %struct.LodePNGInfo* %29, i32 0, i32 14
  %31 = load i8*** %30, align 8
  %32 = bitcast i8** %31 to i8*
  %33 = load %struct.LodePNGInfo** %2, align 8
  %34 = getelementptr inbounds %struct.LodePNGInfo* %33, i32 0, i32 11
  %35 = load i64* %34, align 8
  %36 = add i64 %35, 1
  %37 = mul i64 8, %36
  %38 = call i8* @lodepng_realloc(i8* %32, i64 %37)
  %39 = bitcast i8* %38 to i8**
  store i8** %39, i8*** %new_transkeys, align 8
  %40 = load %struct.LodePNGInfo** %2, align 8
  %41 = getelementptr inbounds %struct.LodePNGInfo* %40, i32 0, i32 15
  %42 = load i8*** %41, align 8
  %43 = bitcast i8** %42 to i8*
  %44 = load %struct.LodePNGInfo** %2, align 8
  %45 = getelementptr inbounds %struct.LodePNGInfo* %44, i32 0, i32 11
  %46 = load i64* %45, align 8
  %47 = add i64 %46, 1
  %48 = mul i64 8, %47
  %49 = call i8* @lodepng_realloc(i8* %43, i64 %48)
  %50 = bitcast i8* %49 to i8**
  store i8** %50, i8*** %new_strings, align 8
  %51 = load i8*** %new_keys, align 8
  %52 = icmp ne i8** %51, null
  br i1 %52, label %53, label %62

; <label>:53                                      ; preds = %0
  %54 = load i8*** %new_langtags, align 8
  %55 = icmp ne i8** %54, null
  br i1 %55, label %56, label %62

; <label>:56                                      ; preds = %53
  %57 = load i8*** %new_transkeys, align 8
  %58 = icmp ne i8** %57, null
  br i1 %58, label %59, label %62

; <label>:59                                      ; preds = %56
  %60 = load i8*** %new_strings, align 8
  %61 = icmp ne i8** %60, null
  br i1 %61, label %71, label %62

; <label>:62                                      ; preds = %59, %56, %53, %0
  %63 = load i8*** %new_keys, align 8
  %64 = bitcast i8** %63 to i8*
  call void @lodepng_free(i8* %64)
  %65 = load i8*** %new_langtags, align 8
  %66 = bitcast i8** %65 to i8*
  call void @lodepng_free(i8* %66)
  %67 = load i8*** %new_transkeys, align 8
  %68 = bitcast i8** %67 to i8*
  call void @lodepng_free(i8* %68)
  %69 = load i8*** %new_strings, align 8
  %70 = bitcast i8** %69 to i8*
  call void @lodepng_free(i8* %70)
  store i32 83, i32* %1
  br label %156

; <label>:71                                      ; preds = %59
  %72 = load %struct.LodePNGInfo** %2, align 8
  %73 = getelementptr inbounds %struct.LodePNGInfo* %72, i32 0, i32 11
  %74 = load i64* %73, align 8
  %75 = add i64 %74, 1
  store i64 %75, i64* %73, align 8
  %76 = load i8*** %new_keys, align 8
  %77 = load %struct.LodePNGInfo** %2, align 8
  %78 = getelementptr inbounds %struct.LodePNGInfo* %77, i32 0, i32 12
  store i8** %76, i8*** %78, align 8
  %79 = load i8*** %new_langtags, align 8
  %80 = load %struct.LodePNGInfo** %2, align 8
  %81 = getelementptr inbounds %struct.LodePNGInfo* %80, i32 0, i32 13
  store i8** %79, i8*** %81, align 8
  %82 = load i8*** %new_transkeys, align 8
  %83 = load %struct.LodePNGInfo** %2, align 8
  %84 = getelementptr inbounds %struct.LodePNGInfo* %83, i32 0, i32 14
  store i8** %82, i8*** %84, align 8
  %85 = load i8*** %new_strings, align 8
  %86 = load %struct.LodePNGInfo** %2, align 8
  %87 = getelementptr inbounds %struct.LodePNGInfo* %86, i32 0, i32 15
  store i8** %85, i8*** %87, align 8
  %88 = load %struct.LodePNGInfo** %2, align 8
  %89 = getelementptr inbounds %struct.LodePNGInfo* %88, i32 0, i32 11
  %90 = load i64* %89, align 8
  %91 = sub i64 %90, 1
  %92 = load %struct.LodePNGInfo** %2, align 8
  %93 = getelementptr inbounds %struct.LodePNGInfo* %92, i32 0, i32 12
  %94 = load i8*** %93, align 8
  %95 = getelementptr inbounds i8** %94, i64 %91
  call void @string_init(i8** %95)
  %96 = load %struct.LodePNGInfo** %2, align 8
  %97 = getelementptr inbounds %struct.LodePNGInfo* %96, i32 0, i32 11
  %98 = load i64* %97, align 8
  %99 = sub i64 %98, 1
  %100 = load %struct.LodePNGInfo** %2, align 8
  %101 = getelementptr inbounds %struct.LodePNGInfo* %100, i32 0, i32 12
  %102 = load i8*** %101, align 8
  %103 = getelementptr inbounds i8** %102, i64 %99
  %104 = load i8** %3, align 8
  call void @string_set(i8** %103, i8* %104)
  %105 = load %struct.LodePNGInfo** %2, align 8
  %106 = getelementptr inbounds %struct.LodePNGInfo* %105, i32 0, i32 11
  %107 = load i64* %106, align 8
  %108 = sub i64 %107, 1
  %109 = load %struct.LodePNGInfo** %2, align 8
  %110 = getelementptr inbounds %struct.LodePNGInfo* %109, i32 0, i32 13
  %111 = load i8*** %110, align 8
  %112 = getelementptr inbounds i8** %111, i64 %108
  call void @string_init(i8** %112)
  %113 = load %struct.LodePNGInfo** %2, align 8
  %114 = getelementptr inbounds %struct.LodePNGInfo* %113, i32 0, i32 11
  %115 = load i64* %114, align 8
  %116 = sub i64 %115, 1
  %117 = load %struct.LodePNGInfo** %2, align 8
  %118 = getelementptr inbounds %struct.LodePNGInfo* %117, i32 0, i32 13
  %119 = load i8*** %118, align 8
  %120 = getelementptr inbounds i8** %119, i64 %116
  %121 = load i8** %4, align 8
  call void @string_set(i8** %120, i8* %121)
  %122 = load %struct.LodePNGInfo** %2, align 8
  %123 = getelementptr inbounds %struct.LodePNGInfo* %122, i32 0, i32 11
  %124 = load i64* %123, align 8
  %125 = sub i64 %124, 1
  %126 = load %struct.LodePNGInfo** %2, align 8
  %127 = getelementptr inbounds %struct.LodePNGInfo* %126, i32 0, i32 14
  %128 = load i8*** %127, align 8
  %129 = getelementptr inbounds i8** %128, i64 %125
  call void @string_init(i8** %129)
  %130 = load %struct.LodePNGInfo** %2, align 8
  %131 = getelementptr inbounds %struct.LodePNGInfo* %130, i32 0, i32 11
  %132 = load i64* %131, align 8
  %133 = sub i64 %132, 1
  %134 = load %struct.LodePNGInfo** %2, align 8
  %135 = getelementptr inbounds %struct.LodePNGInfo* %134, i32 0, i32 14
  %136 = load i8*** %135, align 8
  %137 = getelementptr inbounds i8** %136, i64 %133
  %138 = load i8** %5, align 8
  call void @string_set(i8** %137, i8* %138)
  %139 = load %struct.LodePNGInfo** %2, align 8
  %140 = getelementptr inbounds %struct.LodePNGInfo* %139, i32 0, i32 11
  %141 = load i64* %140, align 8
  %142 = sub i64 %141, 1
  %143 = load %struct.LodePNGInfo** %2, align 8
  %144 = getelementptr inbounds %struct.LodePNGInfo* %143, i32 0, i32 15
  %145 = load i8*** %144, align 8
  %146 = getelementptr inbounds i8** %145, i64 %142
  call void @string_init(i8** %146)
  %147 = load %struct.LodePNGInfo** %2, align 8
  %148 = getelementptr inbounds %struct.LodePNGInfo* %147, i32 0, i32 11
  %149 = load i64* %148, align 8
  %150 = sub i64 %149, 1
  %151 = load %struct.LodePNGInfo** %2, align 8
  %152 = getelementptr inbounds %struct.LodePNGInfo* %151, i32 0, i32 15
  %153 = load i8*** %152, align 8
  %154 = getelementptr inbounds i8** %153, i64 %150
  %155 = load i8** %6, align 8
  call void @string_set(i8** %154, i8* %155)
  store i32 0, i32* %1
  br label %156

; <label>:156                                     ; preds = %71, %62
  %157 = load i32* %1
  ret i32 %157
}

; Function Attrs: nounwind uwtable
define void @lodepng_info_init(%struct.LodePNGInfo* %info) #0 {
  %1 = alloca %struct.LodePNGInfo*, align 8
  store %struct.LodePNGInfo* %info, %struct.LodePNGInfo** %1, align 8
  %2 = load %struct.LodePNGInfo** %1, align 8
  %3 = getelementptr inbounds %struct.LodePNGInfo* %2, i32 0, i32 3
  call void @lodepng_color_mode_init(%struct.LodePNGColorMode* %3)
  %4 = load %struct.LodePNGInfo** %1, align 8
  %5 = getelementptr inbounds %struct.LodePNGInfo* %4, i32 0, i32 2
  store i32 0, i32* %5, align 4
  %6 = load %struct.LodePNGInfo** %1, align 8
  %7 = getelementptr inbounds %struct.LodePNGInfo* %6, i32 0, i32 0
  store i32 0, i32* %7, align 4
  %8 = load %struct.LodePNGInfo** %1, align 8
  %9 = getelementptr inbounds %struct.LodePNGInfo* %8, i32 0, i32 1
  store i32 0, i32* %9, align 4
  %10 = load %struct.LodePNGInfo** %1, align 8
  %11 = getelementptr inbounds %struct.LodePNGInfo* %10, i32 0, i32 4
  store i32 0, i32* %11, align 4
  %12 = load %struct.LodePNGInfo** %1, align 8
  %13 = getelementptr inbounds %struct.LodePNGInfo* %12, i32 0, i32 7
  store i32 0, i32* %13, align 4
  %14 = load %struct.LodePNGInfo** %1, align 8
  %15 = getelementptr inbounds %struct.LodePNGInfo* %14, i32 0, i32 6
  store i32 0, i32* %15, align 4
  %16 = load %struct.LodePNGInfo** %1, align 8
  %17 = getelementptr inbounds %struct.LodePNGInfo* %16, i32 0, i32 5
  store i32 0, i32* %17, align 4
  %18 = load %struct.LodePNGInfo** %1, align 8
  call void @LodePNGText_init(%struct.LodePNGInfo* %18)
  %19 = load %struct.LodePNGInfo** %1, align 8
  call void @LodePNGIText_init(%struct.LodePNGInfo* %19)
  %20 = load %struct.LodePNGInfo** %1, align 8
  %21 = getelementptr inbounds %struct.LodePNGInfo* %20, i32 0, i32 16
  store i32 0, i32* %21, align 4
  %22 = load %struct.LodePNGInfo** %1, align 8
  %23 = getelementptr inbounds %struct.LodePNGInfo* %22, i32 0, i32 18
  store i32 0, i32* %23, align 4
  %24 = load %struct.LodePNGInfo** %1, align 8
  call void @LodePNGUnknownChunks_init(%struct.LodePNGInfo* %24)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @LodePNGText_init(%struct.LodePNGInfo* %info) #0 {
  %1 = alloca %struct.LodePNGInfo*, align 8
  store %struct.LodePNGInfo* %info, %struct.LodePNGInfo** %1, align 8
  %2 = load %struct.LodePNGInfo** %1, align 8
  %3 = getelementptr inbounds %struct.LodePNGInfo* %2, i32 0, i32 8
  store i64 0, i64* %3, align 8
  %4 = load %struct.LodePNGInfo** %1, align 8
  %5 = getelementptr inbounds %struct.LodePNGInfo* %4, i32 0, i32 9
  store i8** null, i8*** %5, align 8
  %6 = load %struct.LodePNGInfo** %1, align 8
  %7 = getelementptr inbounds %struct.LodePNGInfo* %6, i32 0, i32 10
  store i8** null, i8*** %7, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @LodePNGIText_init(%struct.LodePNGInfo* %info) #0 {
  %1 = alloca %struct.LodePNGInfo*, align 8
  store %struct.LodePNGInfo* %info, %struct.LodePNGInfo** %1, align 8
  %2 = load %struct.LodePNGInfo** %1, align 8
  %3 = getelementptr inbounds %struct.LodePNGInfo* %2, i32 0, i32 11
  store i64 0, i64* %3, align 8
  %4 = load %struct.LodePNGInfo** %1, align 8
  %5 = getelementptr inbounds %struct.LodePNGInfo* %4, i32 0, i32 12
  store i8** null, i8*** %5, align 8
  %6 = load %struct.LodePNGInfo** %1, align 8
  %7 = getelementptr inbounds %struct.LodePNGInfo* %6, i32 0, i32 13
  store i8** null, i8*** %7, align 8
  %8 = load %struct.LodePNGInfo** %1, align 8
  %9 = getelementptr inbounds %struct.LodePNGInfo* %8, i32 0, i32 14
  store i8** null, i8*** %9, align 8
  %10 = load %struct.LodePNGInfo** %1, align 8
  %11 = getelementptr inbounds %struct.LodePNGInfo* %10, i32 0, i32 15
  store i8** null, i8*** %11, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @LodePNGUnknownChunks_init(%struct.LodePNGInfo* %info) #0 {
  %1 = alloca %struct.LodePNGInfo*, align 8
  %i = alloca i32, align 4
  store %struct.LodePNGInfo* %info, %struct.LodePNGInfo** %1, align 8
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %11, %0
  %3 = load i32* %i, align 4
  %4 = icmp ult i32 %3, 3
  br i1 %4, label %5, label %14

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4
  %7 = zext i32 %6 to i64
  %8 = load %struct.LodePNGInfo** %1, align 8
  %9 = getelementptr inbounds %struct.LodePNGInfo* %8, i32 0, i32 22
  %10 = getelementptr inbounds [3 x i8*]* %9, i32 0, i64 %7
  store i8* null, i8** %10, align 8
  br label %11

; <label>:11                                      ; preds = %5
  %12 = load i32* %i, align 4
  %13 = add i32 %12, 1
  store i32 %13, i32* %i, align 4
  br label %2

; <label>:14                                      ; preds = %2
  store i32 0, i32* %i, align 4
  br label %15

; <label>:15                                      ; preds = %24, %14
  %16 = load i32* %i, align 4
  %17 = icmp ult i32 %16, 3
  br i1 %17, label %18, label %27

; <label>:18                                      ; preds = %15
  %19 = load i32* %i, align 4
  %20 = zext i32 %19 to i64
  %21 = load %struct.LodePNGInfo** %1, align 8
  %22 = getelementptr inbounds %struct.LodePNGInfo* %21, i32 0, i32 23
  %23 = getelementptr inbounds [3 x i64]* %22, i32 0, i64 %20
  store i64 0, i64* %23, align 8
  br label %24

; <label>:24                                      ; preds = %18
  %25 = load i32* %i, align 4
  %26 = add i32 %25, 1
  store i32 %26, i32* %i, align 4
  br label %15

; <label>:27                                      ; preds = %15
  ret void
}

; Function Attrs: nounwind uwtable
define void @lodepng_info_cleanup(%struct.LodePNGInfo* %info) #0 {
  %1 = alloca %struct.LodePNGInfo*, align 8
  store %struct.LodePNGInfo* %info, %struct.LodePNGInfo** %1, align 8
  %2 = load %struct.LodePNGInfo** %1, align 8
  %3 = getelementptr inbounds %struct.LodePNGInfo* %2, i32 0, i32 3
  call void @lodepng_color_mode_cleanup(%struct.LodePNGColorMode* %3)
  %4 = load %struct.LodePNGInfo** %1, align 8
  call void @LodePNGText_cleanup(%struct.LodePNGInfo* %4)
  %5 = load %struct.LodePNGInfo** %1, align 8
  call void @LodePNGIText_cleanup(%struct.LodePNGInfo* %5)
  %6 = load %struct.LodePNGInfo** %1, align 8
  call void @LodePNGUnknownChunks_cleanup(%struct.LodePNGInfo* %6)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @LodePNGUnknownChunks_cleanup(%struct.LodePNGInfo* %info) #0 {
  %1 = alloca %struct.LodePNGInfo*, align 8
  %i = alloca i32, align 4
  store %struct.LodePNGInfo* %info, %struct.LodePNGInfo** %1, align 8
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %12, %0
  %3 = load i32* %i, align 4
  %4 = icmp ult i32 %3, 3
  br i1 %4, label %5, label %15

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4
  %7 = zext i32 %6 to i64
  %8 = load %struct.LodePNGInfo** %1, align 8
  %9 = getelementptr inbounds %struct.LodePNGInfo* %8, i32 0, i32 22
  %10 = getelementptr inbounds [3 x i8*]* %9, i32 0, i64 %7
  %11 = load i8** %10, align 8
  call void @lodepng_free(i8* %11)
  br label %12

; <label>:12                                      ; preds = %5
  %13 = load i32* %i, align 4
  %14 = add i32 %13, 1
  store i32 %14, i32* %i, align 4
  br label %2

; <label>:15                                      ; preds = %2
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @lodepng_info_copy(%struct.LodePNGInfo* %dest, %struct.LodePNGInfo* %source) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.LodePNGInfo*, align 8
  %3 = alloca %struct.LodePNGInfo*, align 8
  %error = alloca i32, align 4
  %error1 = alloca i32, align 4
  %error2 = alloca i32, align 4
  %error3 = alloca i32, align 4
  store %struct.LodePNGInfo* %dest, %struct.LodePNGInfo** %2, align 8
  store %struct.LodePNGInfo* %source, %struct.LodePNGInfo** %3, align 8
  %4 = load %struct.LodePNGInfo** %2, align 8
  call void @lodepng_info_cleanup(%struct.LodePNGInfo* %4)
  %5 = load %struct.LodePNGInfo** %2, align 8
  %6 = load %struct.LodePNGInfo** %3, align 8
  %7 = bitcast %struct.LodePNGInfo* %5 to i8*
  %8 = bitcast %struct.LodePNGInfo* %6 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %7, i8* %8, i64 232, i32 8, i1 false)
  %9 = load %struct.LodePNGInfo** %2, align 8
  %10 = getelementptr inbounds %struct.LodePNGInfo* %9, i32 0, i32 3
  call void @lodepng_color_mode_init(%struct.LodePNGColorMode* %10)
  %11 = load %struct.LodePNGInfo** %2, align 8
  %12 = getelementptr inbounds %struct.LodePNGInfo* %11, i32 0, i32 3
  %13 = load %struct.LodePNGInfo** %3, align 8
  %14 = getelementptr inbounds %struct.LodePNGInfo* %13, i32 0, i32 3
  %15 = call i32 @lodepng_color_mode_copy(%struct.LodePNGColorMode* %12, %struct.LodePNGColorMode* %14)
  store i32 %15, i32* %error, align 4
  %16 = load i32* %error, align 4
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %18, label %20

; <label>:18                                      ; preds = %0
  %19 = load i32* %error, align 4
  store i32 %19, i32* %1
  br label %46

; <label>:20                                      ; preds = %0
  %21 = load %struct.LodePNGInfo** %2, align 8
  %22 = load %struct.LodePNGInfo** %3, align 8
  %23 = call i32 @LodePNGText_copy(%struct.LodePNGInfo* %21, %struct.LodePNGInfo* %22)
  store i32 %23, i32* %error1, align 4
  %24 = load i32* %error1, align 4
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %26, label %28

; <label>:26                                      ; preds = %20
  %27 = load i32* %error1, align 4
  store i32 %27, i32* %1
  br label %46

; <label>:28                                      ; preds = %20
  %29 = load %struct.LodePNGInfo** %2, align 8
  %30 = load %struct.LodePNGInfo** %3, align 8
  %31 = call i32 @LodePNGIText_copy(%struct.LodePNGInfo* %29, %struct.LodePNGInfo* %30)
  store i32 %31, i32* %error2, align 4
  %32 = load i32* %error2, align 4
  %33 = icmp ne i32 %32, 0
  br i1 %33, label %34, label %36

; <label>:34                                      ; preds = %28
  %35 = load i32* %error2, align 4
  store i32 %35, i32* %1
  br label %46

; <label>:36                                      ; preds = %28
  %37 = load %struct.LodePNGInfo** %2, align 8
  call void @LodePNGUnknownChunks_init(%struct.LodePNGInfo* %37)
  %38 = load %struct.LodePNGInfo** %2, align 8
  %39 = load %struct.LodePNGInfo** %3, align 8
  %40 = call i32 @LodePNGUnknownChunks_copy(%struct.LodePNGInfo* %38, %struct.LodePNGInfo* %39)
  store i32 %40, i32* %error3, align 4
  %41 = load i32* %error3, align 4
  %42 = icmp ne i32 %41, 0
  br i1 %42, label %43, label %45

; <label>:43                                      ; preds = %36
  %44 = load i32* %error3, align 4
  store i32 %44, i32* %1
  br label %46

; <label>:45                                      ; preds = %36
  store i32 0, i32* %1
  br label %46

; <label>:46                                      ; preds = %45, %43, %34, %26, %18
  %47 = load i32* %1
  ret i32 %47
}

; Function Attrs: nounwind uwtable
define internal i32 @LodePNGText_copy(%struct.LodePNGInfo* %dest, %struct.LodePNGInfo* %source) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.LodePNGInfo*, align 8
  %3 = alloca %struct.LodePNGInfo*, align 8
  %i = alloca i64, align 8
  %error = alloca i32, align 4
  store %struct.LodePNGInfo* %dest, %struct.LodePNGInfo** %2, align 8
  store %struct.LodePNGInfo* %source, %struct.LodePNGInfo** %3, align 8
  store i64 0, i64* %i, align 8
  %4 = load %struct.LodePNGInfo** %2, align 8
  %5 = getelementptr inbounds %struct.LodePNGInfo* %4, i32 0, i32 9
  store i8** null, i8*** %5, align 8
  %6 = load %struct.LodePNGInfo** %2, align 8
  %7 = getelementptr inbounds %struct.LodePNGInfo* %6, i32 0, i32 10
  store i8** null, i8*** %7, align 8
  %8 = load %struct.LodePNGInfo** %2, align 8
  %9 = getelementptr inbounds %struct.LodePNGInfo* %8, i32 0, i32 8
  store i64 0, i64* %9, align 8
  store i64 0, i64* %i, align 8
  br label %10

; <label>:10                                      ; preds = %36, %0
  %11 = load i64* %i, align 8
  %12 = load %struct.LodePNGInfo** %3, align 8
  %13 = getelementptr inbounds %struct.LodePNGInfo* %12, i32 0, i32 8
  %14 = load i64* %13, align 8
  %15 = icmp ult i64 %11, %14
  br i1 %15, label %16, label %39

; <label>:16                                      ; preds = %10
  %17 = load %struct.LodePNGInfo** %2, align 8
  %18 = load i64* %i, align 8
  %19 = load %struct.LodePNGInfo** %3, align 8
  %20 = getelementptr inbounds %struct.LodePNGInfo* %19, i32 0, i32 9
  %21 = load i8*** %20, align 8
  %22 = getelementptr inbounds i8** %21, i64 %18
  %23 = load i8** %22, align 8
  %24 = load i64* %i, align 8
  %25 = load %struct.LodePNGInfo** %3, align 8
  %26 = getelementptr inbounds %struct.LodePNGInfo* %25, i32 0, i32 10
  %27 = load i8*** %26, align 8
  %28 = getelementptr inbounds i8** %27, i64 %24
  %29 = load i8** %28, align 8
  %30 = call i32 @lodepng_add_text(%struct.LodePNGInfo* %17, i8* %23, i8* %29)
  store i32 %30, i32* %error, align 4
  %31 = load i32* %error, align 4
  %32 = icmp ne i32 %31, 0
  br i1 %32, label %33, label %35

; <label>:33                                      ; preds = %16
  %34 = load i32* %error, align 4
  store i32 %34, i32* %1
  br label %40

; <label>:35                                      ; preds = %16
  br label %36

; <label>:36                                      ; preds = %35
  %37 = load i64* %i, align 8
  %38 = add i64 %37, 1
  store i64 %38, i64* %i, align 8
  br label %10

; <label>:39                                      ; preds = %10
  store i32 0, i32* %1
  br label %40

; <label>:40                                      ; preds = %39, %33
  %41 = load i32* %1
  ret i32 %41
}

; Function Attrs: nounwind uwtable
define internal i32 @LodePNGIText_copy(%struct.LodePNGInfo* %dest, %struct.LodePNGInfo* %source) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.LodePNGInfo*, align 8
  %3 = alloca %struct.LodePNGInfo*, align 8
  %i = alloca i64, align 8
  %error = alloca i32, align 4
  store %struct.LodePNGInfo* %dest, %struct.LodePNGInfo** %2, align 8
  store %struct.LodePNGInfo* %source, %struct.LodePNGInfo** %3, align 8
  store i64 0, i64* %i, align 8
  %4 = load %struct.LodePNGInfo** %2, align 8
  %5 = getelementptr inbounds %struct.LodePNGInfo* %4, i32 0, i32 12
  store i8** null, i8*** %5, align 8
  %6 = load %struct.LodePNGInfo** %2, align 8
  %7 = getelementptr inbounds %struct.LodePNGInfo* %6, i32 0, i32 13
  store i8** null, i8*** %7, align 8
  %8 = load %struct.LodePNGInfo** %2, align 8
  %9 = getelementptr inbounds %struct.LodePNGInfo* %8, i32 0, i32 14
  store i8** null, i8*** %9, align 8
  %10 = load %struct.LodePNGInfo** %2, align 8
  %11 = getelementptr inbounds %struct.LodePNGInfo* %10, i32 0, i32 15
  store i8** null, i8*** %11, align 8
  %12 = load %struct.LodePNGInfo** %2, align 8
  %13 = getelementptr inbounds %struct.LodePNGInfo* %12, i32 0, i32 11
  store i64 0, i64* %13, align 8
  store i64 0, i64* %i, align 8
  br label %14

; <label>:14                                      ; preds = %52, %0
  %15 = load i64* %i, align 8
  %16 = load %struct.LodePNGInfo** %3, align 8
  %17 = getelementptr inbounds %struct.LodePNGInfo* %16, i32 0, i32 11
  %18 = load i64* %17, align 8
  %19 = icmp ult i64 %15, %18
  br i1 %19, label %20, label %55

; <label>:20                                      ; preds = %14
  %21 = load %struct.LodePNGInfo** %2, align 8
  %22 = load i64* %i, align 8
  %23 = load %struct.LodePNGInfo** %3, align 8
  %24 = getelementptr inbounds %struct.LodePNGInfo* %23, i32 0, i32 12
  %25 = load i8*** %24, align 8
  %26 = getelementptr inbounds i8** %25, i64 %22
  %27 = load i8** %26, align 8
  %28 = load i64* %i, align 8
  %29 = load %struct.LodePNGInfo** %3, align 8
  %30 = getelementptr inbounds %struct.LodePNGInfo* %29, i32 0, i32 13
  %31 = load i8*** %30, align 8
  %32 = getelementptr inbounds i8** %31, i64 %28
  %33 = load i8** %32, align 8
  %34 = load i64* %i, align 8
  %35 = load %struct.LodePNGInfo** %3, align 8
  %36 = getelementptr inbounds %struct.LodePNGInfo* %35, i32 0, i32 14
  %37 = load i8*** %36, align 8
  %38 = getelementptr inbounds i8** %37, i64 %34
  %39 = load i8** %38, align 8
  %40 = load i64* %i, align 8
  %41 = load %struct.LodePNGInfo** %3, align 8
  %42 = getelementptr inbounds %struct.LodePNGInfo* %41, i32 0, i32 15
  %43 = load i8*** %42, align 8
  %44 = getelementptr inbounds i8** %43, i64 %40
  %45 = load i8** %44, align 8
  %46 = call i32 @lodepng_add_itext(%struct.LodePNGInfo* %21, i8* %27, i8* %33, i8* %39, i8* %45)
  store i32 %46, i32* %error, align 4
  %47 = load i32* %error, align 4
  %48 = icmp ne i32 %47, 0
  br i1 %48, label %49, label %51

; <label>:49                                      ; preds = %20
  %50 = load i32* %error, align 4
  store i32 %50, i32* %1
  br label %56

; <label>:51                                      ; preds = %20
  br label %52

; <label>:52                                      ; preds = %51
  %53 = load i64* %i, align 8
  %54 = add i64 %53, 1
  store i64 %54, i64* %i, align 8
  br label %14

; <label>:55                                      ; preds = %14
  store i32 0, i32* %1
  br label %56

; <label>:56                                      ; preds = %55, %49
  %57 = load i32* %1
  ret i32 %57
}

; Function Attrs: nounwind uwtable
define internal i32 @LodePNGUnknownChunks_copy(%struct.LodePNGInfo* %dest, %struct.LodePNGInfo* %src) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.LodePNGInfo*, align 8
  %3 = alloca %struct.LodePNGInfo*, align 8
  %i = alloca i32, align 4
  %j = alloca i64, align 8
  store %struct.LodePNGInfo* %dest, %struct.LodePNGInfo** %2, align 8
  store %struct.LodePNGInfo* %src, %struct.LodePNGInfo** %3, align 8
  %4 = load %struct.LodePNGInfo** %2, align 8
  call void @LodePNGUnknownChunks_cleanup(%struct.LodePNGInfo* %4)
  store i32 0, i32* %i, align 4
  br label %5

; <label>:5                                       ; preds = %80, %0
  %6 = load i32* %i, align 4
  %7 = icmp ult i32 %6, 3
  br i1 %7, label %8, label %83

; <label>:8                                       ; preds = %5
  %9 = load i32* %i, align 4
  %10 = zext i32 %9 to i64
  %11 = load %struct.LodePNGInfo** %3, align 8
  %12 = getelementptr inbounds %struct.LodePNGInfo* %11, i32 0, i32 23
  %13 = getelementptr inbounds [3 x i64]* %12, i32 0, i64 %10
  %14 = load i64* %13, align 8
  %15 = load i32* %i, align 4
  %16 = zext i32 %15 to i64
  %17 = load %struct.LodePNGInfo** %2, align 8
  %18 = getelementptr inbounds %struct.LodePNGInfo* %17, i32 0, i32 23
  %19 = getelementptr inbounds [3 x i64]* %18, i32 0, i64 %16
  store i64 %14, i64* %19, align 8
  %20 = load i32* %i, align 4
  %21 = zext i32 %20 to i64
  %22 = load %struct.LodePNGInfo** %3, align 8
  %23 = getelementptr inbounds %struct.LodePNGInfo* %22, i32 0, i32 23
  %24 = getelementptr inbounds [3 x i64]* %23, i32 0, i64 %21
  %25 = load i64* %24, align 8
  %26 = call i8* @lodepng_malloc(i64 %25)
  %27 = load i32* %i, align 4
  %28 = zext i32 %27 to i64
  %29 = load %struct.LodePNGInfo** %2, align 8
  %30 = getelementptr inbounds %struct.LodePNGInfo* %29, i32 0, i32 22
  %31 = getelementptr inbounds [3 x i8*]* %30, i32 0, i64 %28
  store i8* %26, i8** %31, align 8
  %32 = load i32* %i, align 4
  %33 = zext i32 %32 to i64
  %34 = load %struct.LodePNGInfo** %2, align 8
  %35 = getelementptr inbounds %struct.LodePNGInfo* %34, i32 0, i32 22
  %36 = getelementptr inbounds [3 x i8*]* %35, i32 0, i64 %33
  %37 = load i8** %36, align 8
  %38 = icmp ne i8* %37, null
  br i1 %38, label %48, label %39

; <label>:39                                      ; preds = %8
  %40 = load i32* %i, align 4
  %41 = zext i32 %40 to i64
  %42 = load %struct.LodePNGInfo** %2, align 8
  %43 = getelementptr inbounds %struct.LodePNGInfo* %42, i32 0, i32 23
  %44 = getelementptr inbounds [3 x i64]* %43, i32 0, i64 %41
  %45 = load i64* %44, align 8
  %46 = icmp ne i64 %45, 0
  br i1 %46, label %47, label %48

; <label>:47                                      ; preds = %39
  store i32 83, i32* %1
  br label %84

; <label>:48                                      ; preds = %39, %8
  store i64 0, i64* %j, align 8
  br label %49

; <label>:49                                      ; preds = %76, %48
  %50 = load i64* %j, align 8
  %51 = load i32* %i, align 4
  %52 = zext i32 %51 to i64
  %53 = load %struct.LodePNGInfo** %3, align 8
  %54 = getelementptr inbounds %struct.LodePNGInfo* %53, i32 0, i32 23
  %55 = getelementptr inbounds [3 x i64]* %54, i32 0, i64 %52
  %56 = load i64* %55, align 8
  %57 = icmp ult i64 %50, %56
  br i1 %57, label %58, label %79

; <label>:58                                      ; preds = %49
  %59 = load i64* %j, align 8
  %60 = load i32* %i, align 4
  %61 = zext i32 %60 to i64
  %62 = load %struct.LodePNGInfo** %3, align 8
  %63 = getelementptr inbounds %struct.LodePNGInfo* %62, i32 0, i32 22
  %64 = getelementptr inbounds [3 x i8*]* %63, i32 0, i64 %61
  %65 = load i8** %64, align 8
  %66 = getelementptr inbounds i8* %65, i64 %59
  %67 = load i8* %66, align 1
  %68 = load i64* %j, align 8
  %69 = load i32* %i, align 4
  %70 = zext i32 %69 to i64
  %71 = load %struct.LodePNGInfo** %2, align 8
  %72 = getelementptr inbounds %struct.LodePNGInfo* %71, i32 0, i32 22
  %73 = getelementptr inbounds [3 x i8*]* %72, i32 0, i64 %70
  %74 = load i8** %73, align 8
  %75 = getelementptr inbounds i8* %74, i64 %68
  store i8 %67, i8* %75, align 1
  br label %76

; <label>:76                                      ; preds = %58
  %77 = load i64* %j, align 8
  %78 = add i64 %77, 1
  store i64 %78, i64* %j, align 8
  br label %49

; <label>:79                                      ; preds = %49
  br label %80

; <label>:80                                      ; preds = %79
  %81 = load i32* %i, align 4
  %82 = add i32 %81, 1
  store i32 %82, i32* %i, align 4
  br label %5

; <label>:83                                      ; preds = %5
  store i32 0, i32* %1
  br label %84

; <label>:84                                      ; preds = %83, %47
  %85 = load i32* %1
  ret i32 %85
}

; Function Attrs: nounwind uwtable
define void @lodepng_info_swap(%struct.LodePNGInfo* %a, %struct.LodePNGInfo* %b) #0 {
  %1 = alloca %struct.LodePNGInfo*, align 8
  %2 = alloca %struct.LodePNGInfo*, align 8
  %temp = alloca %struct.LodePNGInfo, align 8
  store %struct.LodePNGInfo* %a, %struct.LodePNGInfo** %1, align 8
  store %struct.LodePNGInfo* %b, %struct.LodePNGInfo** %2, align 8
  %3 = load %struct.LodePNGInfo** %1, align 8
  %4 = bitcast %struct.LodePNGInfo* %temp to i8*
  %5 = bitcast %struct.LodePNGInfo* %3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* %5, i64 232, i32 8, i1 false)
  %6 = load %struct.LodePNGInfo** %1, align 8
  %7 = load %struct.LodePNGInfo** %2, align 8
  %8 = bitcast %struct.LodePNGInfo* %6 to i8*
  %9 = bitcast %struct.LodePNGInfo* %7 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %8, i8* %9, i64 232, i32 8, i1 false)
  %10 = load %struct.LodePNGInfo** %2, align 8
  %11 = bitcast %struct.LodePNGInfo* %10 to i8*
  %12 = bitcast %struct.LodePNGInfo* %temp to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %11, i8* %12, i64 232, i32 8, i1 false)
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @lodepng_convert(i8* %out, i8* %in, %struct.LodePNGColorMode* %mode_out, %struct.LodePNGColorMode* %mode_in, i32 %w, i32 %h, i32 %fix_png) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca %struct.LodePNGColorMode*, align 8
  %5 = alloca %struct.LodePNGColorMode*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %error = alloca i32, align 4
  %i = alloca i64, align 8
  %tree = alloca %struct.ColorTree, align 8
  %numpixels = alloca i64, align 8
  %numbytes = alloca i64, align 8
  %palsize = alloca i64, align 8
  %p = alloca i8*, align 8
  %r = alloca i16, align 2
  %g = alloca i16, align 2
  %b = alloca i16, align 2
  %a = alloca i16, align 2
  %r1 = alloca i8, align 1
  %g2 = alloca i8, align 1
  %b3 = alloca i8, align 1
  %a4 = alloca i8, align 1
  store i8* %out, i8** %2, align 8
  store i8* %in, i8** %3, align 8
  store %struct.LodePNGColorMode* %mode_out, %struct.LodePNGColorMode** %4, align 8
  store %struct.LodePNGColorMode* %mode_in, %struct.LodePNGColorMode** %5, align 8
  store i32 %w, i32* %6, align 4
  store i32 %h, i32* %7, align 4
  store i32 %fix_png, i32* %8, align 4
  store i32 0, i32* %error, align 4
  %9 = load i32* %6, align 4
  %10 = load i32* %7, align 4
  %11 = mul i32 %9, %10
  %12 = zext i32 %11 to i64
  store i64 %12, i64* %numpixels, align 8
  %13 = load %struct.LodePNGColorMode** %4, align 8
  %14 = load %struct.LodePNGColorMode** %5, align 8
  %15 = call i32 @lodepng_color_mode_equal(%struct.LodePNGColorMode* %13, %struct.LodePNGColorMode* %14)
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %17, label %39

; <label>:17                                      ; preds = %0
  %18 = load i32* %6, align 4
  %19 = load i32* %7, align 4
  %20 = load %struct.LodePNGColorMode** %5, align 8
  %21 = call i64 @lodepng_get_raw_size(i32 %18, i32 %19, %struct.LodePNGColorMode* %20)
  store i64 %21, i64* %numbytes, align 8
  store i64 0, i64* %i, align 8
  br label %22

; <label>:22                                      ; preds = %34, %17
  %23 = load i64* %i, align 8
  %24 = load i64* %numbytes, align 8
  %25 = icmp ult i64 %23, %24
  br i1 %25, label %26, label %37

; <label>:26                                      ; preds = %22
  %27 = load i64* %i, align 8
  %28 = load i8** %3, align 8
  %29 = getelementptr inbounds i8* %28, i64 %27
  %30 = load i8* %29, align 1
  %31 = load i64* %i, align 8
  %32 = load i8** %2, align 8
  %33 = getelementptr inbounds i8* %32, i64 %31
  store i8 %30, i8* %33, align 1
  br label %34

; <label>:34                                      ; preds = %26
  %35 = load i64* %i, align 8
  %36 = add i64 %35, 1
  store i64 %36, i64* %i, align 8
  br label %22

; <label>:37                                      ; preds = %22
  %38 = load i32* %error, align 4
  store i32 %38, i32* %1
  br label %204

; <label>:39                                      ; preds = %0
  %40 = load %struct.LodePNGColorMode** %4, align 8
  %41 = getelementptr inbounds %struct.LodePNGColorMode* %40, i32 0, i32 0
  %42 = load i32* %41, align 4
  %43 = icmp eq i32 %42, 3
  br i1 %43, label %44, label %89

; <label>:44                                      ; preds = %39
  %45 = load %struct.LodePNGColorMode** %4, align 8
  %46 = getelementptr inbounds %struct.LodePNGColorMode* %45, i32 0, i32 1
  %47 = load i32* %46, align 4
  %48 = shl i32 1, %47
  %49 = sext i32 %48 to i64
  store i64 %49, i64* %palsize, align 8
  %50 = load %struct.LodePNGColorMode** %4, align 8
  %51 = getelementptr inbounds %struct.LodePNGColorMode* %50, i32 0, i32 3
  %52 = load i64* %51, align 8
  %53 = load i64* %palsize, align 8
  %54 = icmp ult i64 %52, %53
  br i1 %54, label %55, label %59

; <label>:55                                      ; preds = %44
  %56 = load %struct.LodePNGColorMode** %4, align 8
  %57 = getelementptr inbounds %struct.LodePNGColorMode* %56, i32 0, i32 3
  %58 = load i64* %57, align 8
  store i64 %58, i64* %palsize, align 8
  br label %59

; <label>:59                                      ; preds = %55, %44
  call void @color_tree_init(%struct.ColorTree* %tree)
  store i64 0, i64* %i, align 8
  br label %60

; <label>:60                                      ; preds = %85, %59
  %61 = load i64* %i, align 8
  %62 = load i64* %palsize, align 8
  %63 = icmp ult i64 %61, %62
  br i1 %63, label %64, label %88

; <label>:64                                      ; preds = %60
  %65 = load i64* %i, align 8
  %66 = mul i64 %65, 4
  %67 = load %struct.LodePNGColorMode** %4, align 8
  %68 = getelementptr inbounds %struct.LodePNGColorMode* %67, i32 0, i32 2
  %69 = load i8** %68, align 8
  %70 = getelementptr inbounds i8* %69, i64 %66
  store i8* %70, i8** %p, align 8
  %71 = load i8** %p, align 8
  %72 = getelementptr inbounds i8* %71, i64 0
  %73 = load i8* %72, align 1
  %74 = load i8** %p, align 8
  %75 = getelementptr inbounds i8* %74, i64 1
  %76 = load i8* %75, align 1
  %77 = load i8** %p, align 8
  %78 = getelementptr inbounds i8* %77, i64 2
  %79 = load i8* %78, align 1
  %80 = load i8** %p, align 8
  %81 = getelementptr inbounds i8* %80, i64 3
  %82 = load i8* %81, align 1
  %83 = load i64* %i, align 8
  %84 = trunc i64 %83 to i32
  call void @color_tree_add(%struct.ColorTree* %tree, i8 zeroext %73, i8 zeroext %76, i8 zeroext %79, i8 zeroext %82, i32 %84)
  br label %85

; <label>:85                                      ; preds = %64
  %86 = load i64* %i, align 8
  %87 = add i64 %86, 1
  store i64 %87, i64* %i, align 8
  br label %60

; <label>:88                                      ; preds = %60
  br label %89

; <label>:89                                      ; preds = %88, %39
  %90 = load %struct.LodePNGColorMode** %5, align 8
  %91 = getelementptr inbounds %struct.LodePNGColorMode* %90, i32 0, i32 1
  %92 = load i32* %91, align 4
  %93 = icmp eq i32 %92, 16
  br i1 %93, label %94, label %129

; <label>:94                                      ; preds = %89
  %95 = load %struct.LodePNGColorMode** %4, align 8
  %96 = getelementptr inbounds %struct.LodePNGColorMode* %95, i32 0, i32 1
  %97 = load i32* %96, align 4
  %98 = icmp eq i32 %97, 16
  br i1 %98, label %99, label %129

; <label>:99                                      ; preds = %94
  store i64 0, i64* %i, align 8
  br label %100

; <label>:100                                     ; preds = %125, %99
  %101 = load i64* %i, align 8
  %102 = load i64* %numpixels, align 8
  %103 = icmp ult i64 %101, %102
  br i1 %103, label %104, label %128

; <label>:104                                     ; preds = %100
  store i16 0, i16* %r, align 2
  store i16 0, i16* %g, align 2
  store i16 0, i16* %b, align 2
  store i16 0, i16* %a, align 2
  %105 = load i8** %3, align 8
  %106 = load i64* %i, align 8
  %107 = load %struct.LodePNGColorMode** %5, align 8
  %108 = call i32 @getPixelColorRGBA16(i16* %r, i16* %g, i16* %b, i16* %a, i8* %105, i64 %106, %struct.LodePNGColorMode* %107)
  store i32 %108, i32* %error, align 4
  %109 = load i32* %error, align 4
  %110 = icmp ne i32 %109, 0
  br i1 %110, label %111, label %112

; <label>:111                                     ; preds = %104
  br label %128

; <label>:112                                     ; preds = %104
  %113 = load i8** %2, align 8
  %114 = load i64* %i, align 8
  %115 = load %struct.LodePNGColorMode** %4, align 8
  %116 = load i16* %r, align 2
  %117 = load i16* %g, align 2
  %118 = load i16* %b, align 2
  %119 = load i16* %a, align 2
  %120 = call i32 @rgba16ToPixel(i8* %113, i64 %114, %struct.LodePNGColorMode* %115, i16 zeroext %116, i16 zeroext %117, i16 zeroext %118, i16 zeroext %119)
  store i32 %120, i32* %error, align 4
  %121 = load i32* %error, align 4
  %122 = icmp ne i32 %121, 0
  br i1 %122, label %123, label %124

; <label>:123                                     ; preds = %112
  br label %128

; <label>:124                                     ; preds = %112
  br label %125

; <label>:125                                     ; preds = %124
  %126 = load i64* %i, align 8
  %127 = add i64 %126, 1
  store i64 %127, i64* %i, align 8
  br label %100

; <label>:128                                     ; preds = %123, %111, %100
  br label %196

; <label>:129                                     ; preds = %94, %89
  %130 = load %struct.LodePNGColorMode** %4, align 8
  %131 = getelementptr inbounds %struct.LodePNGColorMode* %130, i32 0, i32 1
  %132 = load i32* %131, align 4
  %133 = icmp eq i32 %132, 8
  br i1 %133, label %134, label %146

; <label>:134                                     ; preds = %129
  %135 = load %struct.LodePNGColorMode** %4, align 8
  %136 = getelementptr inbounds %struct.LodePNGColorMode* %135, i32 0, i32 0
  %137 = load i32* %136, align 4
  %138 = icmp eq i32 %137, 6
  br i1 %138, label %139, label %146

; <label>:139                                     ; preds = %134
  %140 = load i8** %2, align 8
  %141 = load i64* %numpixels, align 8
  %142 = load i8** %3, align 8
  %143 = load %struct.LodePNGColorMode** %5, align 8
  %144 = load i32* %8, align 4
  %145 = call i32 @getPixelColorsRGBA8(i8* %140, i64 %141, i32 1, i8* %142, %struct.LodePNGColorMode* %143, i32 %144)
  store i32 %145, i32* %error, align 4
  br label %195

; <label>:146                                     ; preds = %134, %129
  %147 = load %struct.LodePNGColorMode** %4, align 8
  %148 = getelementptr inbounds %struct.LodePNGColorMode* %147, i32 0, i32 1
  %149 = load i32* %148, align 4
  %150 = icmp eq i32 %149, 8
  br i1 %150, label %151, label %163

; <label>:151                                     ; preds = %146
  %152 = load %struct.LodePNGColorMode** %4, align 8
  %153 = getelementptr inbounds %struct.LodePNGColorMode* %152, i32 0, i32 0
  %154 = load i32* %153, align 4
  %155 = icmp eq i32 %154, 2
  br i1 %155, label %156, label %163

; <label>:156                                     ; preds = %151
  %157 = load i8** %2, align 8
  %158 = load i64* %numpixels, align 8
  %159 = load i8** %3, align 8
  %160 = load %struct.LodePNGColorMode** %5, align 8
  %161 = load i32* %8, align 4
  %162 = call i32 @getPixelColorsRGBA8(i8* %157, i64 %158, i32 0, i8* %159, %struct.LodePNGColorMode* %160, i32 %161)
  store i32 %162, i32* %error, align 4
  br label %194

; <label>:163                                     ; preds = %151, %146
  store i8 0, i8* %r1, align 1
  store i8 0, i8* %g2, align 1
  store i8 0, i8* %b3, align 1
  store i8 0, i8* %a4, align 1
  store i64 0, i64* %i, align 8
  br label %164

; <label>:164                                     ; preds = %190, %163
  %165 = load i64* %i, align 8
  %166 = load i64* %numpixels, align 8
  %167 = icmp ult i64 %165, %166
  br i1 %167, label %168, label %193

; <label>:168                                     ; preds = %164
  %169 = load i8** %3, align 8
  %170 = load i64* %i, align 8
  %171 = load %struct.LodePNGColorMode** %5, align 8
  %172 = load i32* %8, align 4
  %173 = call i32 @getPixelColorRGBA8(i8* %r1, i8* %g2, i8* %b3, i8* %a4, i8* %169, i64 %170, %struct.LodePNGColorMode* %171, i32 %172)
  store i32 %173, i32* %error, align 4
  %174 = load i32* %error, align 4
  %175 = icmp ne i32 %174, 0
  br i1 %175, label %176, label %177

; <label>:176                                     ; preds = %168
  br label %193

; <label>:177                                     ; preds = %168
  %178 = load i8** %2, align 8
  %179 = load i64* %i, align 8
  %180 = load %struct.LodePNGColorMode** %4, align 8
  %181 = load i8* %r1, align 1
  %182 = load i8* %g2, align 1
  %183 = load i8* %b3, align 1
  %184 = load i8* %a4, align 1
  %185 = call i32 @rgba8ToPixel(i8* %178, i64 %179, %struct.LodePNGColorMode* %180, %struct.ColorTree* %tree, i8 zeroext %181, i8 zeroext %182, i8 zeroext %183, i8 zeroext %184)
  store i32 %185, i32* %error, align 4
  %186 = load i32* %error, align 4
  %187 = icmp ne i32 %186, 0
  br i1 %187, label %188, label %189

; <label>:188                                     ; preds = %177
  br label %193

; <label>:189                                     ; preds = %177
  br label %190

; <label>:190                                     ; preds = %189
  %191 = load i64* %i, align 8
  %192 = add i64 %191, 1
  store i64 %192, i64* %i, align 8
  br label %164

; <label>:193                                     ; preds = %188, %176, %164
  br label %194

; <label>:194                                     ; preds = %193, %156
  br label %195

; <label>:195                                     ; preds = %194, %139
  br label %196

; <label>:196                                     ; preds = %195, %128
  %197 = load %struct.LodePNGColorMode** %4, align 8
  %198 = getelementptr inbounds %struct.LodePNGColorMode* %197, i32 0, i32 0
  %199 = load i32* %198, align 4
  %200 = icmp eq i32 %199, 3
  br i1 %200, label %201, label %202

; <label>:201                                     ; preds = %196
  call void @color_tree_cleanup(%struct.ColorTree* %tree)
  br label %202

; <label>:202                                     ; preds = %201, %196
  %203 = load i32* %error, align 4
  store i32 %203, i32* %1
  br label %204

; <label>:204                                     ; preds = %202, %37
  %205 = load i32* %1
  ret i32 %205
}

; Function Attrs: nounwind uwtable
define internal i32 @lodepng_color_mode_equal(%struct.LodePNGColorMode* %a, %struct.LodePNGColorMode* %b) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.LodePNGColorMode*, align 8
  %3 = alloca %struct.LodePNGColorMode*, align 8
  %i = alloca i64, align 8
  store %struct.LodePNGColorMode* %a, %struct.LodePNGColorMode** %2, align 8
  store %struct.LodePNGColorMode* %b, %struct.LodePNGColorMode** %3, align 8
  %4 = load %struct.LodePNGColorMode** %2, align 8
  %5 = getelementptr inbounds %struct.LodePNGColorMode* %4, i32 0, i32 0
  %6 = load i32* %5, align 4
  %7 = load %struct.LodePNGColorMode** %3, align 8
  %8 = getelementptr inbounds %struct.LodePNGColorMode* %7, i32 0, i32 0
  %9 = load i32* %8, align 4
  %10 = icmp ne i32 %6, %9
  br i1 %10, label %11, label %12

; <label>:11                                      ; preds = %0
  store i32 0, i32* %1
  br label %102

; <label>:12                                      ; preds = %0
  %13 = load %struct.LodePNGColorMode** %2, align 8
  %14 = getelementptr inbounds %struct.LodePNGColorMode* %13, i32 0, i32 1
  %15 = load i32* %14, align 4
  %16 = load %struct.LodePNGColorMode** %3, align 8
  %17 = getelementptr inbounds %struct.LodePNGColorMode* %16, i32 0, i32 1
  %18 = load i32* %17, align 4
  %19 = icmp ne i32 %15, %18
  br i1 %19, label %20, label %21

; <label>:20                                      ; preds = %12
  store i32 0, i32* %1
  br label %102

; <label>:21                                      ; preds = %12
  %22 = load %struct.LodePNGColorMode** %2, align 8
  %23 = getelementptr inbounds %struct.LodePNGColorMode* %22, i32 0, i32 4
  %24 = load i32* %23, align 4
  %25 = load %struct.LodePNGColorMode** %3, align 8
  %26 = getelementptr inbounds %struct.LodePNGColorMode* %25, i32 0, i32 4
  %27 = load i32* %26, align 4
  %28 = icmp ne i32 %24, %27
  br i1 %28, label %29, label %30

; <label>:29                                      ; preds = %21
  store i32 0, i32* %1
  br label %102

; <label>:30                                      ; preds = %21
  %31 = load %struct.LodePNGColorMode** %2, align 8
  %32 = getelementptr inbounds %struct.LodePNGColorMode* %31, i32 0, i32 4
  %33 = load i32* %32, align 4
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %35, label %63

; <label>:35                                      ; preds = %30
  %36 = load %struct.LodePNGColorMode** %2, align 8
  %37 = getelementptr inbounds %struct.LodePNGColorMode* %36, i32 0, i32 5
  %38 = load i32* %37, align 4
  %39 = load %struct.LodePNGColorMode** %3, align 8
  %40 = getelementptr inbounds %struct.LodePNGColorMode* %39, i32 0, i32 5
  %41 = load i32* %40, align 4
  %42 = icmp ne i32 %38, %41
  br i1 %42, label %43, label %44

; <label>:43                                      ; preds = %35
  store i32 0, i32* %1
  br label %102

; <label>:44                                      ; preds = %35
  %45 = load %struct.LodePNGColorMode** %2, align 8
  %46 = getelementptr inbounds %struct.LodePNGColorMode* %45, i32 0, i32 6
  %47 = load i32* %46, align 4
  %48 = load %struct.LodePNGColorMode** %3, align 8
  %49 = getelementptr inbounds %struct.LodePNGColorMode* %48, i32 0, i32 6
  %50 = load i32* %49, align 4
  %51 = icmp ne i32 %47, %50
  br i1 %51, label %52, label %53

; <label>:52                                      ; preds = %44
  store i32 0, i32* %1
  br label %102

; <label>:53                                      ; preds = %44
  %54 = load %struct.LodePNGColorMode** %2, align 8
  %55 = getelementptr inbounds %struct.LodePNGColorMode* %54, i32 0, i32 7
  %56 = load i32* %55, align 4
  %57 = load %struct.LodePNGColorMode** %3, align 8
  %58 = getelementptr inbounds %struct.LodePNGColorMode* %57, i32 0, i32 7
  %59 = load i32* %58, align 4
  %60 = icmp ne i32 %56, %59
  br i1 %60, label %61, label %62

; <label>:61                                      ; preds = %53
  store i32 0, i32* %1
  br label %102

; <label>:62                                      ; preds = %53
  br label %63

; <label>:63                                      ; preds = %62, %30
  %64 = load %struct.LodePNGColorMode** %2, align 8
  %65 = getelementptr inbounds %struct.LodePNGColorMode* %64, i32 0, i32 3
  %66 = load i64* %65, align 8
  %67 = load %struct.LodePNGColorMode** %3, align 8
  %68 = getelementptr inbounds %struct.LodePNGColorMode* %67, i32 0, i32 3
  %69 = load i64* %68, align 8
  %70 = icmp ne i64 %66, %69
  br i1 %70, label %71, label %72

; <label>:71                                      ; preds = %63
  store i32 0, i32* %1
  br label %102

; <label>:72                                      ; preds = %63
  store i64 0, i64* %i, align 8
  br label %73

; <label>:73                                      ; preds = %98, %72
  %74 = load i64* %i, align 8
  %75 = load %struct.LodePNGColorMode** %2, align 8
  %76 = getelementptr inbounds %struct.LodePNGColorMode* %75, i32 0, i32 3
  %77 = load i64* %76, align 8
  %78 = mul i64 %77, 4
  %79 = icmp ult i64 %74, %78
  br i1 %79, label %80, label %101

; <label>:80                                      ; preds = %73
  %81 = load i64* %i, align 8
  %82 = load %struct.LodePNGColorMode** %2, align 8
  %83 = getelementptr inbounds %struct.LodePNGColorMode* %82, i32 0, i32 2
  %84 = load i8** %83, align 8
  %85 = getelementptr inbounds i8* %84, i64 %81
  %86 = load i8* %85, align 1
  %87 = zext i8 %86 to i32
  %88 = load i64* %i, align 8
  %89 = load %struct.LodePNGColorMode** %3, align 8
  %90 = getelementptr inbounds %struct.LodePNGColorMode* %89, i32 0, i32 2
  %91 = load i8** %90, align 8
  %92 = getelementptr inbounds i8* %91, i64 %88
  %93 = load i8* %92, align 1
  %94 = zext i8 %93 to i32
  %95 = icmp ne i32 %87, %94
  br i1 %95, label %96, label %97

; <label>:96                                      ; preds = %80
  store i32 0, i32* %1
  br label %102

; <label>:97                                      ; preds = %80
  br label %98

; <label>:98                                      ; preds = %97
  %99 = load i64* %i, align 8
  %100 = add i64 %99, 1
  store i64 %100, i64* %i, align 8
  br label %73

; <label>:101                                     ; preds = %73
  store i32 1, i32* %1
  br label %102

; <label>:102                                     ; preds = %101, %96, %71, %61, %52, %43, %29, %20, %11
  %103 = load i32* %1
  ret i32 %103
}

; Function Attrs: nounwind uwtable
define internal void @color_tree_init(%struct.ColorTree* %tree) #0 {
  %1 = alloca %struct.ColorTree*, align 8
  %i = alloca i32, align 4
  store %struct.ColorTree* %tree, %struct.ColorTree** %1, align 8
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %11, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 16
  br i1 %4, label %5, label %14

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4
  %7 = sext i32 %6 to i64
  %8 = load %struct.ColorTree** %1, align 8
  %9 = getelementptr inbounds %struct.ColorTree* %8, i32 0, i32 0
  %10 = getelementptr inbounds [16 x %struct.ColorTree*]* %9, i32 0, i64 %7
  store %struct.ColorTree* null, %struct.ColorTree** %10, align 8
  br label %11

; <label>:11                                      ; preds = %5
  %12 = load i32* %i, align 4
  %13 = add nsw i32 %12, 1
  store i32 %13, i32* %i, align 4
  br label %2

; <label>:14                                      ; preds = %2
  %15 = load %struct.ColorTree** %1, align 8
  %16 = getelementptr inbounds %struct.ColorTree* %15, i32 0, i32 1
  store i32 -1, i32* %16, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @color_tree_add(%struct.ColorTree* %tree, i8 zeroext %r, i8 zeroext %g, i8 zeroext %b, i8 zeroext %a, i32 %index) #0 {
  %1 = alloca %struct.ColorTree*, align 8
  %2 = alloca i8, align 1
  %3 = alloca i8, align 1
  %4 = alloca i8, align 1
  %5 = alloca i8, align 1
  %6 = alloca i32, align 4
  %bit = alloca i32, align 4
  %i = alloca i32, align 4
  store %struct.ColorTree* %tree, %struct.ColorTree** %1, align 8
  store i8 %r, i8* %2, align 1
  store i8 %g, i8* %3, align 1
  store i8 %b, i8* %4, align 1
  store i8 %a, i8* %5, align 1
  store i32 %index, i32* %6, align 4
  store i32 0, i32* %bit, align 4
  br label %7

; <label>:7                                       ; preds = %66, %0
  %8 = load i32* %bit, align 4
  %9 = icmp slt i32 %8, 8
  br i1 %9, label %10, label %69

; <label>:10                                      ; preds = %7
  %11 = load i8* %2, align 1
  %12 = zext i8 %11 to i32
  %13 = load i32* %bit, align 4
  %14 = ashr i32 %12, %13
  %15 = and i32 %14, 1
  %16 = mul nsw i32 8, %15
  %17 = load i8* %3, align 1
  %18 = zext i8 %17 to i32
  %19 = load i32* %bit, align 4
  %20 = ashr i32 %18, %19
  %21 = and i32 %20, 1
  %22 = mul nsw i32 4, %21
  %23 = add nsw i32 %16, %22
  %24 = load i8* %4, align 1
  %25 = zext i8 %24 to i32
  %26 = load i32* %bit, align 4
  %27 = ashr i32 %25, %26
  %28 = and i32 %27, 1
  %29 = mul nsw i32 2, %28
  %30 = add nsw i32 %23, %29
  %31 = load i8* %5, align 1
  %32 = zext i8 %31 to i32
  %33 = load i32* %bit, align 4
  %34 = ashr i32 %32, %33
  %35 = and i32 %34, 1
  %36 = mul nsw i32 1, %35
  %37 = add nsw i32 %30, %36
  store i32 %37, i32* %i, align 4
  %38 = load i32* %i, align 4
  %39 = sext i32 %38 to i64
  %40 = load %struct.ColorTree** %1, align 8
  %41 = getelementptr inbounds %struct.ColorTree* %40, i32 0, i32 0
  %42 = getelementptr inbounds [16 x %struct.ColorTree*]* %41, i32 0, i64 %39
  %43 = load %struct.ColorTree** %42, align 8
  %44 = icmp ne %struct.ColorTree* %43, null
  br i1 %44, label %59, label %45

; <label>:45                                      ; preds = %10
  %46 = call i8* @lodepng_malloc(i64 136)
  %47 = bitcast i8* %46 to %struct.ColorTree*
  %48 = load i32* %i, align 4
  %49 = sext i32 %48 to i64
  %50 = load %struct.ColorTree** %1, align 8
  %51 = getelementptr inbounds %struct.ColorTree* %50, i32 0, i32 0
  %52 = getelementptr inbounds [16 x %struct.ColorTree*]* %51, i32 0, i64 %49
  store %struct.ColorTree* %47, %struct.ColorTree** %52, align 8
  %53 = load i32* %i, align 4
  %54 = sext i32 %53 to i64
  %55 = load %struct.ColorTree** %1, align 8
  %56 = getelementptr inbounds %struct.ColorTree* %55, i32 0, i32 0
  %57 = getelementptr inbounds [16 x %struct.ColorTree*]* %56, i32 0, i64 %54
  %58 = load %struct.ColorTree** %57, align 8
  call void @color_tree_init(%struct.ColorTree* %58)
  br label %59

; <label>:59                                      ; preds = %45, %10
  %60 = load i32* %i, align 4
  %61 = sext i32 %60 to i64
  %62 = load %struct.ColorTree** %1, align 8
  %63 = getelementptr inbounds %struct.ColorTree* %62, i32 0, i32 0
  %64 = getelementptr inbounds [16 x %struct.ColorTree*]* %63, i32 0, i64 %61
  %65 = load %struct.ColorTree** %64, align 8
  store %struct.ColorTree* %65, %struct.ColorTree** %1, align 8
  br label %66

; <label>:66                                      ; preds = %59
  %67 = load i32* %bit, align 4
  %68 = add nsw i32 %67, 1
  store i32 %68, i32* %bit, align 4
  br label %7

; <label>:69                                      ; preds = %7
  %70 = load i32* %6, align 4
  %71 = load %struct.ColorTree** %1, align 8
  %72 = getelementptr inbounds %struct.ColorTree* %71, i32 0, i32 1
  store i32 %70, i32* %72, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define internal i32 @getPixelColorRGBA16(i16* %r, i16* %g, i16* %b, i16* %a, i8* %in, i64 %i, %struct.LodePNGColorMode* %mode) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i16*, align 8
  %3 = alloca i16*, align 8
  %4 = alloca i16*, align 8
  %5 = alloca i16*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i64, align 8
  %8 = alloca %struct.LodePNGColorMode*, align 8
  store i16* %r, i16** %2, align 8
  store i16* %g, i16** %3, align 8
  store i16* %b, i16** %4, align 8
  store i16* %a, i16** %5, align 8
  store i8* %in, i8** %6, align 8
  store i64 %i, i64* %7, align 8
  store %struct.LodePNGColorMode* %mode, %struct.LodePNGColorMode** %8, align 8
  %9 = load %struct.LodePNGColorMode** %8, align 8
  %10 = getelementptr inbounds %struct.LodePNGColorMode* %9, i32 0, i32 1
  %11 = load i32* %10, align 4
  %12 = icmp ne i32 %11, 16
  br i1 %12, label %13, label %14

; <label>:13                                      ; preds = %0
  store i32 85, i32* %1
  br label %329

; <label>:14                                      ; preds = %0
  %15 = load %struct.LodePNGColorMode** %8, align 8
  %16 = getelementptr inbounds %struct.LodePNGColorMode* %15, i32 0, i32 0
  %17 = load i32* %16, align 4
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %70

; <label>:19                                      ; preds = %14
  %20 = load i64* %7, align 8
  %21 = mul i64 %20, 2
  %22 = add i64 %21, 0
  %23 = load i8** %6, align 8
  %24 = getelementptr inbounds i8* %23, i64 %22
  %25 = load i8* %24, align 1
  %26 = zext i8 %25 to i32
  %27 = mul nsw i32 256, %26
  %28 = load i64* %7, align 8
  %29 = mul i64 %28, 2
  %30 = add i64 %29, 1
  %31 = load i8** %6, align 8
  %32 = getelementptr inbounds i8* %31, i64 %30
  %33 = load i8* %32, align 1
  %34 = zext i8 %33 to i32
  %35 = add nsw i32 %27, %34
  %36 = trunc i32 %35 to i16
  %37 = load i16** %4, align 8
  store i16 %36, i16* %37, align 2
  %38 = load i16** %3, align 8
  store i16 %36, i16* %38, align 2
  %39 = load i16** %2, align 8
  store i16 %36, i16* %39, align 2
  %40 = load %struct.LodePNGColorMode** %8, align 8
  %41 = getelementptr inbounds %struct.LodePNGColorMode* %40, i32 0, i32 4
  %42 = load i32* %41, align 4
  %43 = icmp ne i32 %42, 0
  br i1 %43, label %44, label %67

; <label>:44                                      ; preds = %19
  %45 = load i64* %7, align 8
  %46 = mul i64 %45, 2
  %47 = add i64 %46, 0
  %48 = load i8** %6, align 8
  %49 = getelementptr inbounds i8* %48, i64 %47
  %50 = load i8* %49, align 1
  %51 = zext i8 %50 to i32
  %52 = mul i32 256, %51
  %53 = load i64* %7, align 8
  %54 = mul i64 %53, 2
  %55 = add i64 %54, 1
  %56 = load i8** %6, align 8
  %57 = getelementptr inbounds i8* %56, i64 %55
  %58 = load i8* %57, align 1
  %59 = zext i8 %58 to i32
  %60 = add i32 %52, %59
  %61 = load %struct.LodePNGColorMode** %8, align 8
  %62 = getelementptr inbounds %struct.LodePNGColorMode* %61, i32 0, i32 5
  %63 = load i32* %62, align 4
  %64 = icmp eq i32 %60, %63
  br i1 %64, label %65, label %67

; <label>:65                                      ; preds = %44
  %66 = load i16** %5, align 8
  store i16 0, i16* %66, align 2
  br label %69

; <label>:67                                      ; preds = %44, %19
  %68 = load i16** %5, align 8
  store i16 -1, i16* %68, align 2
  br label %69

; <label>:69                                      ; preds = %67, %65
  br label %328

; <label>:70                                      ; preds = %14
  %71 = load %struct.LodePNGColorMode** %8, align 8
  %72 = getelementptr inbounds %struct.LodePNGColorMode* %71, i32 0, i32 0
  %73 = load i32* %72, align 4
  %74 = icmp eq i32 %73, 2
  br i1 %74, label %75, label %202

; <label>:75                                      ; preds = %70
  %76 = load i64* %7, align 8
  %77 = mul i64 %76, 6
  %78 = add i64 %77, 0
  %79 = load i8** %6, align 8
  %80 = getelementptr inbounds i8* %79, i64 %78
  %81 = load i8* %80, align 1
  %82 = zext i8 %81 to i32
  %83 = mul nsw i32 256, %82
  %84 = load i64* %7, align 8
  %85 = mul i64 %84, 6
  %86 = add i64 %85, 1
  %87 = load i8** %6, align 8
  %88 = getelementptr inbounds i8* %87, i64 %86
  %89 = load i8* %88, align 1
  %90 = zext i8 %89 to i32
  %91 = add nsw i32 %83, %90
  %92 = trunc i32 %91 to i16
  %93 = load i16** %2, align 8
  store i16 %92, i16* %93, align 2
  %94 = load i64* %7, align 8
  %95 = mul i64 %94, 6
  %96 = add i64 %95, 2
  %97 = load i8** %6, align 8
  %98 = getelementptr inbounds i8* %97, i64 %96
  %99 = load i8* %98, align 1
  %100 = zext i8 %99 to i32
  %101 = mul nsw i32 256, %100
  %102 = load i64* %7, align 8
  %103 = mul i64 %102, 6
  %104 = add i64 %103, 3
  %105 = load i8** %6, align 8
  %106 = getelementptr inbounds i8* %105, i64 %104
  %107 = load i8* %106, align 1
  %108 = zext i8 %107 to i32
  %109 = add nsw i32 %101, %108
  %110 = trunc i32 %109 to i16
  %111 = load i16** %3, align 8
  store i16 %110, i16* %111, align 2
  %112 = load i64* %7, align 8
  %113 = mul i64 %112, 6
  %114 = add i64 %113, 4
  %115 = load i8** %6, align 8
  %116 = getelementptr inbounds i8* %115, i64 %114
  %117 = load i8* %116, align 1
  %118 = zext i8 %117 to i32
  %119 = mul nsw i32 256, %118
  %120 = load i64* %7, align 8
  %121 = mul i64 %120, 6
  %122 = add i64 %121, 5
  %123 = load i8** %6, align 8
  %124 = getelementptr inbounds i8* %123, i64 %122
  %125 = load i8* %124, align 1
  %126 = zext i8 %125 to i32
  %127 = add nsw i32 %119, %126
  %128 = trunc i32 %127 to i16
  %129 = load i16** %4, align 8
  store i16 %128, i16* %129, align 2
  %130 = load %struct.LodePNGColorMode** %8, align 8
  %131 = getelementptr inbounds %struct.LodePNGColorMode* %130, i32 0, i32 4
  %132 = load i32* %131, align 4
  %133 = icmp ne i32 %132, 0
  br i1 %133, label %134, label %199

; <label>:134                                     ; preds = %75
  %135 = load i64* %7, align 8
  %136 = mul i64 %135, 6
  %137 = add i64 %136, 0
  %138 = load i8** %6, align 8
  %139 = getelementptr inbounds i8* %138, i64 %137
  %140 = load i8* %139, align 1
  %141 = zext i8 %140 to i32
  %142 = mul i32 256, %141
  %143 = load i64* %7, align 8
  %144 = mul i64 %143, 6
  %145 = add i64 %144, 1
  %146 = load i8** %6, align 8
  %147 = getelementptr inbounds i8* %146, i64 %145
  %148 = load i8* %147, align 1
  %149 = zext i8 %148 to i32
  %150 = add i32 %142, %149
  %151 = load %struct.LodePNGColorMode** %8, align 8
  %152 = getelementptr inbounds %struct.LodePNGColorMode* %151, i32 0, i32 5
  %153 = load i32* %152, align 4
  %154 = icmp eq i32 %150, %153
  br i1 %154, label %155, label %199

; <label>:155                                     ; preds = %134
  %156 = load i64* %7, align 8
  %157 = mul i64 %156, 6
  %158 = add i64 %157, 2
  %159 = load i8** %6, align 8
  %160 = getelementptr inbounds i8* %159, i64 %158
  %161 = load i8* %160, align 1
  %162 = zext i8 %161 to i32
  %163 = mul i32 256, %162
  %164 = load i64* %7, align 8
  %165 = mul i64 %164, 6
  %166 = add i64 %165, 3
  %167 = load i8** %6, align 8
  %168 = getelementptr inbounds i8* %167, i64 %166
  %169 = load i8* %168, align 1
  %170 = zext i8 %169 to i32
  %171 = add i32 %163, %170
  %172 = load %struct.LodePNGColorMode** %8, align 8
  %173 = getelementptr inbounds %struct.LodePNGColorMode* %172, i32 0, i32 6
  %174 = load i32* %173, align 4
  %175 = icmp eq i32 %171, %174
  br i1 %175, label %176, label %199

; <label>:176                                     ; preds = %155
  %177 = load i64* %7, align 8
  %178 = mul i64 %177, 6
  %179 = add i64 %178, 4
  %180 = load i8** %6, align 8
  %181 = getelementptr inbounds i8* %180, i64 %179
  %182 = load i8* %181, align 1
  %183 = zext i8 %182 to i32
  %184 = mul i32 256, %183
  %185 = load i64* %7, align 8
  %186 = mul i64 %185, 6
  %187 = add i64 %186, 5
  %188 = load i8** %6, align 8
  %189 = getelementptr inbounds i8* %188, i64 %187
  %190 = load i8* %189, align 1
  %191 = zext i8 %190 to i32
  %192 = add i32 %184, %191
  %193 = load %struct.LodePNGColorMode** %8, align 8
  %194 = getelementptr inbounds %struct.LodePNGColorMode* %193, i32 0, i32 7
  %195 = load i32* %194, align 4
  %196 = icmp eq i32 %192, %195
  br i1 %196, label %197, label %199

; <label>:197                                     ; preds = %176
  %198 = load i16** %5, align 8
  store i16 0, i16* %198, align 2
  br label %201

; <label>:199                                     ; preds = %176, %155, %134, %75
  %200 = load i16** %5, align 8
  store i16 -1, i16* %200, align 2
  br label %201

; <label>:201                                     ; preds = %199, %197
  br label %327

; <label>:202                                     ; preds = %70
  %203 = load %struct.LodePNGColorMode** %8, align 8
  %204 = getelementptr inbounds %struct.LodePNGColorMode* %203, i32 0, i32 0
  %205 = load i32* %204, align 4
  %206 = icmp eq i32 %205, 4
  br i1 %206, label %207, label %246

; <label>:207                                     ; preds = %202
  %208 = load i64* %7, align 8
  %209 = mul i64 %208, 4
  %210 = add i64 %209, 0
  %211 = load i8** %6, align 8
  %212 = getelementptr inbounds i8* %211, i64 %210
  %213 = load i8* %212, align 1
  %214 = zext i8 %213 to i32
  %215 = mul nsw i32 256, %214
  %216 = load i64* %7, align 8
  %217 = mul i64 %216, 4
  %218 = add i64 %217, 1
  %219 = load i8** %6, align 8
  %220 = getelementptr inbounds i8* %219, i64 %218
  %221 = load i8* %220, align 1
  %222 = zext i8 %221 to i32
  %223 = add nsw i32 %215, %222
  %224 = trunc i32 %223 to i16
  %225 = load i16** %4, align 8
  store i16 %224, i16* %225, align 2
  %226 = load i16** %3, align 8
  store i16 %224, i16* %226, align 2
  %227 = load i16** %2, align 8
  store i16 %224, i16* %227, align 2
  %228 = load i64* %7, align 8
  %229 = mul i64 %228, 4
  %230 = add i64 %229, 2
  %231 = load i8** %6, align 8
  %232 = getelementptr inbounds i8* %231, i64 %230
  %233 = load i8* %232, align 1
  %234 = zext i8 %233 to i32
  %235 = mul nsw i32 256, %234
  %236 = load i64* %7, align 8
  %237 = mul i64 %236, 4
  %238 = add i64 %237, 3
  %239 = load i8** %6, align 8
  %240 = getelementptr inbounds i8* %239, i64 %238
  %241 = load i8* %240, align 1
  %242 = zext i8 %241 to i32
  %243 = add nsw i32 %235, %242
  %244 = trunc i32 %243 to i16
  %245 = load i16** %5, align 8
  store i16 %244, i16* %245, align 2
  br label %326

; <label>:246                                     ; preds = %202
  %247 = load %struct.LodePNGColorMode** %8, align 8
  %248 = getelementptr inbounds %struct.LodePNGColorMode* %247, i32 0, i32 0
  %249 = load i32* %248, align 4
  %250 = icmp eq i32 %249, 6
  br i1 %250, label %251, label %324

; <label>:251                                     ; preds = %246
  %252 = load i64* %7, align 8
  %253 = mul i64 %252, 8
  %254 = add i64 %253, 0
  %255 = load i8** %6, align 8
  %256 = getelementptr inbounds i8* %255, i64 %254
  %257 = load i8* %256, align 1
  %258 = zext i8 %257 to i32
  %259 = mul nsw i32 256, %258
  %260 = load i64* %7, align 8
  %261 = mul i64 %260, 8
  %262 = add i64 %261, 1
  %263 = load i8** %6, align 8
  %264 = getelementptr inbounds i8* %263, i64 %262
  %265 = load i8* %264, align 1
  %266 = zext i8 %265 to i32
  %267 = add nsw i32 %259, %266
  %268 = trunc i32 %267 to i16
  %269 = load i16** %2, align 8
  store i16 %268, i16* %269, align 2
  %270 = load i64* %7, align 8
  %271 = mul i64 %270, 8
  %272 = add i64 %271, 2
  %273 = load i8** %6, align 8
  %274 = getelementptr inbounds i8* %273, i64 %272
  %275 = load i8* %274, align 1
  %276 = zext i8 %275 to i32
  %277 = mul nsw i32 256, %276
  %278 = load i64* %7, align 8
  %279 = mul i64 %278, 8
  %280 = add i64 %279, 3
  %281 = load i8** %6, align 8
  %282 = getelementptr inbounds i8* %281, i64 %280
  %283 = load i8* %282, align 1
  %284 = zext i8 %283 to i32
  %285 = add nsw i32 %277, %284
  %286 = trunc i32 %285 to i16
  %287 = load i16** %3, align 8
  store i16 %286, i16* %287, align 2
  %288 = load i64* %7, align 8
  %289 = mul i64 %288, 8
  %290 = add i64 %289, 4
  %291 = load i8** %6, align 8
  %292 = getelementptr inbounds i8* %291, i64 %290
  %293 = load i8* %292, align 1
  %294 = zext i8 %293 to i32
  %295 = mul nsw i32 256, %294
  %296 = load i64* %7, align 8
  %297 = mul i64 %296, 8
  %298 = add i64 %297, 5
  %299 = load i8** %6, align 8
  %300 = getelementptr inbounds i8* %299, i64 %298
  %301 = load i8* %300, align 1
  %302 = zext i8 %301 to i32
  %303 = add nsw i32 %295, %302
  %304 = trunc i32 %303 to i16
  %305 = load i16** %4, align 8
  store i16 %304, i16* %305, align 2
  %306 = load i64* %7, align 8
  %307 = mul i64 %306, 8
  %308 = add i64 %307, 6
  %309 = load i8** %6, align 8
  %310 = getelementptr inbounds i8* %309, i64 %308
  %311 = load i8* %310, align 1
  %312 = zext i8 %311 to i32
  %313 = mul nsw i32 256, %312
  %314 = load i64* %7, align 8
  %315 = mul i64 %314, 8
  %316 = add i64 %315, 7
  %317 = load i8** %6, align 8
  %318 = getelementptr inbounds i8* %317, i64 %316
  %319 = load i8* %318, align 1
  %320 = zext i8 %319 to i32
  %321 = add nsw i32 %313, %320
  %322 = trunc i32 %321 to i16
  %323 = load i16** %5, align 8
  store i16 %322, i16* %323, align 2
  br label %325

; <label>:324                                     ; preds = %246
  store i32 85, i32* %1
  br label %329

; <label>:325                                     ; preds = %251
  br label %326

; <label>:326                                     ; preds = %325, %207
  br label %327

; <label>:327                                     ; preds = %326, %201
  br label %328

; <label>:328                                     ; preds = %327, %69
  store i32 0, i32* %1
  br label %329

; <label>:329                                     ; preds = %328, %324, %13
  %330 = load i32* %1
  ret i32 %330
}

; Function Attrs: nounwind uwtable
define internal i32 @rgba16ToPixel(i8* %out, i64 %i, %struct.LodePNGColorMode* %mode, i16 zeroext %r, i16 zeroext %g, i16 zeroext %b, i16 zeroext %a) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8*, align 8
  %3 = alloca i64, align 8
  %4 = alloca %struct.LodePNGColorMode*, align 8
  %5 = alloca i16, align 2
  %6 = alloca i16, align 2
  %7 = alloca i16, align 2
  %8 = alloca i16, align 2
  %grey = alloca i16, align 2
  %grey1 = alloca i16, align 2
  store i8* %out, i8** %2, align 8
  store i64 %i, i64* %3, align 8
  store %struct.LodePNGColorMode* %mode, %struct.LodePNGColorMode** %4, align 8
  store i16 %r, i16* %5, align 2
  store i16 %g, i16* %6, align 2
  store i16 %b, i16* %7, align 2
  store i16 %a, i16* %8, align 2
  %9 = load %struct.LodePNGColorMode** %4, align 8
  %10 = getelementptr inbounds %struct.LodePNGColorMode* %9, i32 0, i32 1
  %11 = load i32* %10, align 4
  %12 = icmp ne i32 %11, 16
  br i1 %12, label %13, label %14

; <label>:13                                      ; preds = %0
  store i32 85, i32* %1
  br label %234

; <label>:14                                      ; preds = %0
  %15 = load %struct.LodePNGColorMode** %4, align 8
  %16 = getelementptr inbounds %struct.LodePNGColorMode* %15, i32 0, i32 0
  %17 = load i32* %16, align 4
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %40

; <label>:19                                      ; preds = %14
  %20 = load i16* %5, align 2
  store i16 %20, i16* %grey, align 2
  %21 = load i16* %grey, align 2
  %22 = zext i16 %21 to i32
  %23 = ashr i32 %22, 8
  %24 = and i32 %23, 255
  %25 = trunc i32 %24 to i8
  %26 = load i64* %3, align 8
  %27 = mul i64 %26, 2
  %28 = add i64 %27, 0
  %29 = load i8** %2, align 8
  %30 = getelementptr inbounds i8* %29, i64 %28
  store i8 %25, i8* %30, align 1
  %31 = load i16* %grey, align 2
  %32 = zext i16 %31 to i32
  %33 = and i32 %32, 255
  %34 = trunc i32 %33 to i8
  %35 = load i64* %3, align 8
  %36 = mul i64 %35, 2
  %37 = add i64 %36, 1
  %38 = load i8** %2, align 8
  %39 = getelementptr inbounds i8* %38, i64 %37
  store i8 %34, i8* %39, align 1
  br label %233

; <label>:40                                      ; preds = %14
  %41 = load %struct.LodePNGColorMode** %4, align 8
  %42 = getelementptr inbounds %struct.LodePNGColorMode* %41, i32 0, i32 0
  %43 = load i32* %42, align 4
  %44 = icmp eq i32 %43, 2
  br i1 %44, label %45, label %103

; <label>:45                                      ; preds = %40
  %46 = load i16* %5, align 2
  %47 = zext i16 %46 to i32
  %48 = ashr i32 %47, 8
  %49 = and i32 %48, 255
  %50 = trunc i32 %49 to i8
  %51 = load i64* %3, align 8
  %52 = mul i64 %51, 6
  %53 = add i64 %52, 0
  %54 = load i8** %2, align 8
  %55 = getelementptr inbounds i8* %54, i64 %53
  store i8 %50, i8* %55, align 1
  %56 = load i16* %5, align 2
  %57 = zext i16 %56 to i32
  %58 = and i32 %57, 255
  %59 = trunc i32 %58 to i8
  %60 = load i64* %3, align 8
  %61 = mul i64 %60, 6
  %62 = add i64 %61, 1
  %63 = load i8** %2, align 8
  %64 = getelementptr inbounds i8* %63, i64 %62
  store i8 %59, i8* %64, align 1
  %65 = load i16* %6, align 2
  %66 = zext i16 %65 to i32
  %67 = ashr i32 %66, 8
  %68 = and i32 %67, 255
  %69 = trunc i32 %68 to i8
  %70 = load i64* %3, align 8
  %71 = mul i64 %70, 6
  %72 = add i64 %71, 2
  %73 = load i8** %2, align 8
  %74 = getelementptr inbounds i8* %73, i64 %72
  store i8 %69, i8* %74, align 1
  %75 = load i16* %6, align 2
  %76 = zext i16 %75 to i32
  %77 = and i32 %76, 255
  %78 = trunc i32 %77 to i8
  %79 = load i64* %3, align 8
  %80 = mul i64 %79, 6
  %81 = add i64 %80, 3
  %82 = load i8** %2, align 8
  %83 = getelementptr inbounds i8* %82, i64 %81
  store i8 %78, i8* %83, align 1
  %84 = load i16* %7, align 2
  %85 = zext i16 %84 to i32
  %86 = ashr i32 %85, 8
  %87 = and i32 %86, 255
  %88 = trunc i32 %87 to i8
  %89 = load i64* %3, align 8
  %90 = mul i64 %89, 6
  %91 = add i64 %90, 4
  %92 = load i8** %2, align 8
  %93 = getelementptr inbounds i8* %92, i64 %91
  store i8 %88, i8* %93, align 1
  %94 = load i16* %7, align 2
  %95 = zext i16 %94 to i32
  %96 = and i32 %95, 255
  %97 = trunc i32 %96 to i8
  %98 = load i64* %3, align 8
  %99 = mul i64 %98, 6
  %100 = add i64 %99, 5
  %101 = load i8** %2, align 8
  %102 = getelementptr inbounds i8* %101, i64 %100
  store i8 %97, i8* %102, align 1
  br label %232

; <label>:103                                     ; preds = %40
  %104 = load %struct.LodePNGColorMode** %4, align 8
  %105 = getelementptr inbounds %struct.LodePNGColorMode* %104, i32 0, i32 0
  %106 = load i32* %105, align 4
  %107 = icmp eq i32 %106, 4
  br i1 %107, label %108, label %148

; <label>:108                                     ; preds = %103
  %109 = load i16* %5, align 2
  store i16 %109, i16* %grey1, align 2
  %110 = load i16* %grey1, align 2
  %111 = zext i16 %110 to i32
  %112 = ashr i32 %111, 8
  %113 = and i32 %112, 255
  %114 = trunc i32 %113 to i8
  %115 = load i64* %3, align 8
  %116 = mul i64 %115, 4
  %117 = add i64 %116, 0
  %118 = load i8** %2, align 8
  %119 = getelementptr inbounds i8* %118, i64 %117
  store i8 %114, i8* %119, align 1
  %120 = load i16* %grey1, align 2
  %121 = zext i16 %120 to i32
  %122 = and i32 %121, 255
  %123 = trunc i32 %122 to i8
  %124 = load i64* %3, align 8
  %125 = mul i64 %124, 4
  %126 = add i64 %125, 1
  %127 = load i8** %2, align 8
  %128 = getelementptr inbounds i8* %127, i64 %126
  store i8 %123, i8* %128, align 1
  %129 = load i16* %8, align 2
  %130 = zext i16 %129 to i32
  %131 = ashr i32 %130, 8
  %132 = and i32 %131, 255
  %133 = trunc i32 %132 to i8
  %134 = load i64* %3, align 8
  %135 = mul i64 %134, 4
  %136 = add i64 %135, 2
  %137 = load i8** %2, align 8
  %138 = getelementptr inbounds i8* %137, i64 %136
  store i8 %133, i8* %138, align 1
  %139 = load i16* %8, align 2
  %140 = zext i16 %139 to i32
  %141 = and i32 %140, 255
  %142 = trunc i32 %141 to i8
  %143 = load i64* %3, align 8
  %144 = mul i64 %143, 4
  %145 = add i64 %144, 3
  %146 = load i8** %2, align 8
  %147 = getelementptr inbounds i8* %146, i64 %145
  store i8 %142, i8* %147, align 1
  br label %231

; <label>:148                                     ; preds = %103
  %149 = load %struct.LodePNGColorMode** %4, align 8
  %150 = getelementptr inbounds %struct.LodePNGColorMode* %149, i32 0, i32 0
  %151 = load i32* %150, align 4
  %152 = icmp eq i32 %151, 6
  br i1 %152, label %153, label %230

; <label>:153                                     ; preds = %148
  %154 = load i16* %5, align 2
  %155 = zext i16 %154 to i32
  %156 = ashr i32 %155, 8
  %157 = and i32 %156, 255
  %158 = trunc i32 %157 to i8
  %159 = load i64* %3, align 8
  %160 = mul i64 %159, 8
  %161 = add i64 %160, 0
  %162 = load i8** %2, align 8
  %163 = getelementptr inbounds i8* %162, i64 %161
  store i8 %158, i8* %163, align 1
  %164 = load i16* %5, align 2
  %165 = zext i16 %164 to i32
  %166 = and i32 %165, 255
  %167 = trunc i32 %166 to i8
  %168 = load i64* %3, align 8
  %169 = mul i64 %168, 8
  %170 = add i64 %169, 1
  %171 = load i8** %2, align 8
  %172 = getelementptr inbounds i8* %171, i64 %170
  store i8 %167, i8* %172, align 1
  %173 = load i16* %6, align 2
  %174 = zext i16 %173 to i32
  %175 = ashr i32 %174, 8
  %176 = and i32 %175, 255
  %177 = trunc i32 %176 to i8
  %178 = load i64* %3, align 8
  %179 = mul i64 %178, 8
  %180 = add i64 %179, 2
  %181 = load i8** %2, align 8
  %182 = getelementptr inbounds i8* %181, i64 %180
  store i8 %177, i8* %182, align 1
  %183 = load i16* %6, align 2
  %184 = zext i16 %183 to i32
  %185 = and i32 %184, 255
  %186 = trunc i32 %185 to i8
  %187 = load i64* %3, align 8
  %188 = mul i64 %187, 8
  %189 = add i64 %188, 3
  %190 = load i8** %2, align 8
  %191 = getelementptr inbounds i8* %190, i64 %189
  store i8 %186, i8* %191, align 1
  %192 = load i16* %7, align 2
  %193 = zext i16 %192 to i32
  %194 = ashr i32 %193, 8
  %195 = and i32 %194, 255
  %196 = trunc i32 %195 to i8
  %197 = load i64* %3, align 8
  %198 = mul i64 %197, 8
  %199 = add i64 %198, 4
  %200 = load i8** %2, align 8
  %201 = getelementptr inbounds i8* %200, i64 %199
  store i8 %196, i8* %201, align 1
  %202 = load i16* %7, align 2
  %203 = zext i16 %202 to i32
  %204 = and i32 %203, 255
  %205 = trunc i32 %204 to i8
  %206 = load i64* %3, align 8
  %207 = mul i64 %206, 8
  %208 = add i64 %207, 5
  %209 = load i8** %2, align 8
  %210 = getelementptr inbounds i8* %209, i64 %208
  store i8 %205, i8* %210, align 1
  %211 = load i16* %8, align 2
  %212 = zext i16 %211 to i32
  %213 = ashr i32 %212, 8
  %214 = and i32 %213, 255
  %215 = trunc i32 %214 to i8
  %216 = load i64* %3, align 8
  %217 = mul i64 %216, 8
  %218 = add i64 %217, 6
  %219 = load i8** %2, align 8
  %220 = getelementptr inbounds i8* %219, i64 %218
  store i8 %215, i8* %220, align 1
  %221 = load i16* %8, align 2
  %222 = zext i16 %221 to i32
  %223 = and i32 %222, 255
  %224 = trunc i32 %223 to i8
  %225 = load i64* %3, align 8
  %226 = mul i64 %225, 8
  %227 = add i64 %226, 7
  %228 = load i8** %2, align 8
  %229 = getelementptr inbounds i8* %228, i64 %227
  store i8 %224, i8* %229, align 1
  br label %230

; <label>:230                                     ; preds = %153, %148
  br label %231

; <label>:231                                     ; preds = %230, %108
  br label %232

; <label>:232                                     ; preds = %231, %45
  br label %233

; <label>:233                                     ; preds = %232, %19
  store i32 0, i32* %1
  br label %234

; <label>:234                                     ; preds = %233, %13
  %235 = load i32* %1
  ret i32 %235
}

; Function Attrs: nounwind uwtable
define internal i32 @getPixelColorsRGBA8(i8* %buffer, i64 %numpixels, i32 %has_alpha, i8* %in, %struct.LodePNGColorMode* %mode, i32 %fix_png) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8*, align 8
  %3 = alloca i64, align 8
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca %struct.LodePNGColorMode*, align 8
  %7 = alloca i32, align 4
  %num_channels = alloca i32, align 4
  %i = alloca i64, align 8
  %highest = alloca i32, align 4
  %j = alloca i64, align 8
  %value = alloca i32, align 4
  %index = alloca i32, align 4
  %j1 = alloca i64, align 8
  store i8* %buffer, i8** %2, align 8
  store i64 %numpixels, i64* %3, align 8
  store i32 %has_alpha, i32* %4, align 4
  store i8* %in, i8** %5, align 8
  store %struct.LodePNGColorMode* %mode, %struct.LodePNGColorMode** %6, align 8
  store i32 %fix_png, i32* %7, align 4
  %8 = load i32* %4, align 4
  %9 = icmp ne i32 %8, 0
  %10 = select i1 %9, i32 4, i32 3
  store i32 %10, i32* %num_channels, align 4
  %11 = load %struct.LodePNGColorMode** %6, align 8
  %12 = getelementptr inbounds %struct.LodePNGColorMode* %11, i32 0, i32 0
  %13 = load i32* %12, align 4
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %191

; <label>:15                                      ; preds = %0
  %16 = load %struct.LodePNGColorMode** %6, align 8
  %17 = getelementptr inbounds %struct.LodePNGColorMode* %16, i32 0, i32 1
  %18 = load i32* %17, align 4
  %19 = icmp eq i32 %18, 8
  br i1 %19, label %20, label %68

; <label>:20                                      ; preds = %15
  store i64 0, i64* %i, align 8
  br label %21

; <label>:21                                      ; preds = %60, %20
  %22 = load i64* %i, align 8
  %23 = load i64* %3, align 8
  %24 = icmp ult i64 %22, %23
  br i1 %24, label %25, label %67

; <label>:25                                      ; preds = %21
  %26 = load i64* %i, align 8
  %27 = load i8** %5, align 8
  %28 = getelementptr inbounds i8* %27, i64 %26
  %29 = load i8* %28, align 1
  %30 = load i8** %2, align 8
  %31 = getelementptr inbounds i8* %30, i64 2
  store i8 %29, i8* %31, align 1
  %32 = load i8** %2, align 8
  %33 = getelementptr inbounds i8* %32, i64 1
  store i8 %29, i8* %33, align 1
  %34 = load i8** %2, align 8
  %35 = getelementptr inbounds i8* %34, i64 0
  store i8 %29, i8* %35, align 1
  %36 = load i32* %4, align 4
  %37 = icmp ne i32 %36, 0
  br i1 %37, label %38, label %59

; <label>:38                                      ; preds = %25
  %39 = load %struct.LodePNGColorMode** %6, align 8
  %40 = getelementptr inbounds %struct.LodePNGColorMode* %39, i32 0, i32 4
  %41 = load i32* %40, align 4
  %42 = icmp ne i32 %41, 0
  br i1 %42, label %43, label %53

; <label>:43                                      ; preds = %38
  %44 = load i64* %i, align 8
  %45 = load i8** %5, align 8
  %46 = getelementptr inbounds i8* %45, i64 %44
  %47 = load i8* %46, align 1
  %48 = zext i8 %47 to i32
  %49 = load %struct.LodePNGColorMode** %6, align 8
  %50 = getelementptr inbounds %struct.LodePNGColorMode* %49, i32 0, i32 5
  %51 = load i32* %50, align 4
  %52 = icmp eq i32 %48, %51
  br label %53

; <label>:53                                      ; preds = %43, %38
  %54 = phi i1 [ false, %38 ], [ %52, %43 ]
  %55 = select i1 %54, i32 0, i32 255
  %56 = trunc i32 %55 to i8
  %57 = load i8** %2, align 8
  %58 = getelementptr inbounds i8* %57, i64 3
  store i8 %56, i8* %58, align 1
  br label %59

; <label>:59                                      ; preds = %53, %25
  br label %60

; <label>:60                                      ; preds = %59
  %61 = load i64* %i, align 8
  %62 = add i64 %61, 1
  store i64 %62, i64* %i, align 8
  %63 = load i32* %num_channels, align 4
  %64 = load i8** %2, align 8
  %65 = zext i32 %63 to i64
  %66 = getelementptr inbounds i8* %64, i64 %65
  store i8* %66, i8** %2, align 8
  br label %21

; <label>:67                                      ; preds = %21
  br label %190

; <label>:68                                      ; preds = %15
  %69 = load %struct.LodePNGColorMode** %6, align 8
  %70 = getelementptr inbounds %struct.LodePNGColorMode* %69, i32 0, i32 1
  %71 = load i32* %70, align 4
  %72 = icmp eq i32 %71, 16
  br i1 %72, label %73, label %133

; <label>:73                                      ; preds = %68
  store i64 0, i64* %i, align 8
  br label %74

; <label>:74                                      ; preds = %125, %73
  %75 = load i64* %i, align 8
  %76 = load i64* %3, align 8
  %77 = icmp ult i64 %75, %76
  br i1 %77, label %78, label %132

; <label>:78                                      ; preds = %74
  %79 = load i64* %i, align 8
  %80 = mul i64 %79, 2
  %81 = load i8** %5, align 8
  %82 = getelementptr inbounds i8* %81, i64 %80
  %83 = load i8* %82, align 1
  %84 = load i8** %2, align 8
  %85 = getelementptr inbounds i8* %84, i64 2
  store i8 %83, i8* %85, align 1
  %86 = load i8** %2, align 8
  %87 = getelementptr inbounds i8* %86, i64 1
  store i8 %83, i8* %87, align 1
  %88 = load i8** %2, align 8
  %89 = getelementptr inbounds i8* %88, i64 0
  store i8 %83, i8* %89, align 1
  %90 = load i32* %4, align 4
  %91 = icmp ne i32 %90, 0
  br i1 %91, label %92, label %124

; <label>:92                                      ; preds = %78
  %93 = load %struct.LodePNGColorMode** %6, align 8
  %94 = getelementptr inbounds %struct.LodePNGColorMode* %93, i32 0, i32 4
  %95 = load i32* %94, align 4
  %96 = icmp ne i32 %95, 0
  br i1 %96, label %97, label %118

; <label>:97                                      ; preds = %92
  %98 = load i64* %i, align 8
  %99 = mul i64 %98, 2
  %100 = add i64 %99, 0
  %101 = load i8** %5, align 8
  %102 = getelementptr inbounds i8* %101, i64 %100
  %103 = load i8* %102, align 1
  %104 = zext i8 %103 to i32
  %105 = mul i32 256, %104
  %106 = load i64* %i, align 8
  %107 = mul i64 %106, 2
  %108 = add i64 %107, 1
  %109 = load i8** %5, align 8
  %110 = getelementptr inbounds i8* %109, i64 %108
  %111 = load i8* %110, align 1
  %112 = zext i8 %111 to i32
  %113 = add i32 %105, %112
  %114 = load %struct.LodePNGColorMode** %6, align 8
  %115 = getelementptr inbounds %struct.LodePNGColorMode* %114, i32 0, i32 5
  %116 = load i32* %115, align 4
  %117 = icmp eq i32 %113, %116
  br label %118

; <label>:118                                     ; preds = %97, %92
  %119 = phi i1 [ false, %92 ], [ %117, %97 ]
  %120 = select i1 %119, i32 0, i32 255
  %121 = trunc i32 %120 to i8
  %122 = load i8** %2, align 8
  %123 = getelementptr inbounds i8* %122, i64 3
  store i8 %121, i8* %123, align 1
  br label %124

; <label>:124                                     ; preds = %118, %78
  br label %125

; <label>:125                                     ; preds = %124
  %126 = load i64* %i, align 8
  %127 = add i64 %126, 1
  store i64 %127, i64* %i, align 8
  %128 = load i32* %num_channels, align 4
  %129 = load i8** %2, align 8
  %130 = zext i32 %128 to i64
  %131 = getelementptr inbounds i8* %129, i64 %130
  store i8* %131, i8** %2, align 8
  br label %74

; <label>:132                                     ; preds = %74
  br label %189

; <label>:133                                     ; preds = %68
  %134 = load %struct.LodePNGColorMode** %6, align 8
  %135 = getelementptr inbounds %struct.LodePNGColorMode* %134, i32 0, i32 1
  %136 = load i32* %135, align 4
  %137 = shl i32 1, %136
  %138 = sub i32 %137, 1
  store i32 %138, i32* %highest, align 4
  store i64 0, i64* %j, align 8
  store i64 0, i64* %i, align 8
  br label %139

; <label>:139                                     ; preds = %181, %133
  %140 = load i64* %i, align 8
  %141 = load i64* %3, align 8
  %142 = icmp ult i64 %140, %141
  br i1 %142, label %143, label %188

; <label>:143                                     ; preds = %139
  %144 = load i8** %5, align 8
  %145 = load %struct.LodePNGColorMode** %6, align 8
  %146 = getelementptr inbounds %struct.LodePNGColorMode* %145, i32 0, i32 1
  %147 = load i32* %146, align 4
  %148 = zext i32 %147 to i64
  %149 = call i32 @readBitsFromReversedStream(i64* %j, i8* %144, i64 %148)
  store i32 %149, i32* %value, align 4
  %150 = load i32* %value, align 4
  %151 = mul i32 %150, 255
  %152 = load i32* %highest, align 4
  %153 = udiv i32 %151, %152
  %154 = trunc i32 %153 to i8
  %155 = load i8** %2, align 8
  %156 = getelementptr inbounds i8* %155, i64 2
  store i8 %154, i8* %156, align 1
  %157 = load i8** %2, align 8
  %158 = getelementptr inbounds i8* %157, i64 1
  store i8 %154, i8* %158, align 1
  %159 = load i8** %2, align 8
  %160 = getelementptr inbounds i8* %159, i64 0
  store i8 %154, i8* %160, align 1
  %161 = load i32* %4, align 4
  %162 = icmp ne i32 %161, 0
  br i1 %162, label %163, label %180

; <label>:163                                     ; preds = %143
  %164 = load %struct.LodePNGColorMode** %6, align 8
  %165 = getelementptr inbounds %struct.LodePNGColorMode* %164, i32 0, i32 4
  %166 = load i32* %165, align 4
  %167 = icmp ne i32 %166, 0
  br i1 %167, label %168, label %174

; <label>:168                                     ; preds = %163
  %169 = load i32* %value, align 4
  %170 = load %struct.LodePNGColorMode** %6, align 8
  %171 = getelementptr inbounds %struct.LodePNGColorMode* %170, i32 0, i32 5
  %172 = load i32* %171, align 4
  %173 = icmp eq i32 %169, %172
  br label %174

; <label>:174                                     ; preds = %168, %163
  %175 = phi i1 [ false, %163 ], [ %173, %168 ]
  %176 = select i1 %175, i32 0, i32 255
  %177 = trunc i32 %176 to i8
  %178 = load i8** %2, align 8
  %179 = getelementptr inbounds i8* %178, i64 3
  store i8 %177, i8* %179, align 1
  br label %180

; <label>:180                                     ; preds = %174, %143
  br label %181

; <label>:181                                     ; preds = %180
  %182 = load i64* %i, align 8
  %183 = add i64 %182, 1
  store i64 %183, i64* %i, align 8
  %184 = load i32* %num_channels, align 4
  %185 = load i8** %2, align 8
  %186 = zext i32 %184 to i64
  %187 = getelementptr inbounds i8* %185, i64 %186
  store i8* %187, i8** %2, align 8
  br label %139

; <label>:188                                     ; preds = %139
  br label %189

; <label>:189                                     ; preds = %188, %132
  br label %190

; <label>:190                                     ; preds = %189, %67
  br label %713

; <label>:191                                     ; preds = %0
  %192 = load %struct.LodePNGColorMode** %6, align 8
  %193 = getelementptr inbounds %struct.LodePNGColorMode* %192, i32 0, i32 0
  %194 = load i32* %193, align 4
  %195 = icmp eq i32 %194, 2
  br i1 %195, label %196, label %396

; <label>:196                                     ; preds = %191
  %197 = load %struct.LodePNGColorMode** %6, align 8
  %198 = getelementptr inbounds %struct.LodePNGColorMode* %197, i32 0, i32 1
  %199 = load i32* %198, align 4
  %200 = icmp eq i32 %199, 8
  br i1 %200, label %201, label %280

; <label>:201                                     ; preds = %196
  store i64 0, i64* %i, align 8
  br label %202

; <label>:202                                     ; preds = %272, %201
  %203 = load i64* %i, align 8
  %204 = load i64* %3, align 8
  %205 = icmp ult i64 %203, %204
  br i1 %205, label %206, label %279

; <label>:206                                     ; preds = %202
  %207 = load i64* %i, align 8
  %208 = mul i64 %207, 3
  %209 = add i64 %208, 0
  %210 = load i8** %5, align 8
  %211 = getelementptr inbounds i8* %210, i64 %209
  %212 = load i8* %211, align 1
  %213 = load i8** %2, align 8
  %214 = getelementptr inbounds i8* %213, i64 0
  store i8 %212, i8* %214, align 1
  %215 = load i64* %i, align 8
  %216 = mul i64 %215, 3
  %217 = add i64 %216, 1
  %218 = load i8** %5, align 8
  %219 = getelementptr inbounds i8* %218, i64 %217
  %220 = load i8* %219, align 1
  %221 = load i8** %2, align 8
  %222 = getelementptr inbounds i8* %221, i64 1
  store i8 %220, i8* %222, align 1
  %223 = load i64* %i, align 8
  %224 = mul i64 %223, 3
  %225 = add i64 %224, 2
  %226 = load i8** %5, align 8
  %227 = getelementptr inbounds i8* %226, i64 %225
  %228 = load i8* %227, align 1
  %229 = load i8** %2, align 8
  %230 = getelementptr inbounds i8* %229, i64 2
  store i8 %228, i8* %230, align 1
  %231 = load i32* %4, align 4
  %232 = icmp ne i32 %231, 0
  br i1 %232, label %233, label %271

; <label>:233                                     ; preds = %206
  %234 = load %struct.LodePNGColorMode** %6, align 8
  %235 = getelementptr inbounds %struct.LodePNGColorMode* %234, i32 0, i32 4
  %236 = load i32* %235, align 4
  %237 = icmp ne i32 %236, 0
  br i1 %237, label %238, label %265

; <label>:238                                     ; preds = %233
  %239 = load i8** %2, align 8
  %240 = getelementptr inbounds i8* %239, i64 0
  %241 = load i8* %240, align 1
  %242 = zext i8 %241 to i32
  %243 = load %struct.LodePNGColorMode** %6, align 8
  %244 = getelementptr inbounds %struct.LodePNGColorMode* %243, i32 0, i32 5
  %245 = load i32* %244, align 4
  %246 = icmp eq i32 %242, %245
  br i1 %246, label %247, label %265

; <label>:247                                     ; preds = %238
  %248 = load i8** %2, align 8
  %249 = getelementptr inbounds i8* %248, i64 1
  %250 = load i8* %249, align 1
  %251 = zext i8 %250 to i32
  %252 = load %struct.LodePNGColorMode** %6, align 8
  %253 = getelementptr inbounds %struct.LodePNGColorMode* %252, i32 0, i32 6
  %254 = load i32* %253, align 4
  %255 = icmp eq i32 %251, %254
  br i1 %255, label %256, label %265

; <label>:256                                     ; preds = %247
  %257 = load i8** %2, align 8
  %258 = getelementptr inbounds i8* %257, i64 2
  %259 = load i8* %258, align 1
  %260 = zext i8 %259 to i32
  %261 = load %struct.LodePNGColorMode** %6, align 8
  %262 = getelementptr inbounds %struct.LodePNGColorMode* %261, i32 0, i32 7
  %263 = load i32* %262, align 4
  %264 = icmp eq i32 %260, %263
  br label %265

; <label>:265                                     ; preds = %256, %247, %238, %233
  %266 = phi i1 [ false, %247 ], [ false, %238 ], [ false, %233 ], [ %264, %256 ]
  %267 = select i1 %266, i32 0, i32 255
  %268 = trunc i32 %267 to i8
  %269 = load i8** %2, align 8
  %270 = getelementptr inbounds i8* %269, i64 3
  store i8 %268, i8* %270, align 1
  br label %271

; <label>:271                                     ; preds = %265, %206
  br label %272

; <label>:272                                     ; preds = %271
  %273 = load i64* %i, align 8
  %274 = add i64 %273, 1
  store i64 %274, i64* %i, align 8
  %275 = load i32* %num_channels, align 4
  %276 = load i8** %2, align 8
  %277 = zext i32 %275 to i64
  %278 = getelementptr inbounds i8* %276, i64 %277
  store i8* %278, i8** %2, align 8
  br label %202

; <label>:279                                     ; preds = %202
  br label %395

; <label>:280                                     ; preds = %196
  store i64 0, i64* %i, align 8
  br label %281

; <label>:281                                     ; preds = %387, %280
  %282 = load i64* %i, align 8
  %283 = load i64* %3, align 8
  %284 = icmp ult i64 %282, %283
  br i1 %284, label %285, label %394

; <label>:285                                     ; preds = %281
  %286 = load i64* %i, align 8
  %287 = mul i64 %286, 6
  %288 = add i64 %287, 0
  %289 = load i8** %5, align 8
  %290 = getelementptr inbounds i8* %289, i64 %288
  %291 = load i8* %290, align 1
  %292 = load i8** %2, align 8
  %293 = getelementptr inbounds i8* %292, i64 0
  store i8 %291, i8* %293, align 1
  %294 = load i64* %i, align 8
  %295 = mul i64 %294, 6
  %296 = add i64 %295, 2
  %297 = load i8** %5, align 8
  %298 = getelementptr inbounds i8* %297, i64 %296
  %299 = load i8* %298, align 1
  %300 = load i8** %2, align 8
  %301 = getelementptr inbounds i8* %300, i64 1
  store i8 %299, i8* %301, align 1
  %302 = load i64* %i, align 8
  %303 = mul i64 %302, 6
  %304 = add i64 %303, 4
  %305 = load i8** %5, align 8
  %306 = getelementptr inbounds i8* %305, i64 %304
  %307 = load i8* %306, align 1
  %308 = load i8** %2, align 8
  %309 = getelementptr inbounds i8* %308, i64 2
  store i8 %307, i8* %309, align 1
  %310 = load i32* %4, align 4
  %311 = icmp ne i32 %310, 0
  br i1 %311, label %312, label %386

; <label>:312                                     ; preds = %285
  %313 = load %struct.LodePNGColorMode** %6, align 8
  %314 = getelementptr inbounds %struct.LodePNGColorMode* %313, i32 0, i32 4
  %315 = load i32* %314, align 4
  %316 = icmp ne i32 %315, 0
  br i1 %316, label %317, label %380

; <label>:317                                     ; preds = %312
  %318 = load i64* %i, align 8
  %319 = mul i64 %318, 6
  %320 = add i64 %319, 0
  %321 = load i8** %5, align 8
  %322 = getelementptr inbounds i8* %321, i64 %320
  %323 = load i8* %322, align 1
  %324 = zext i8 %323 to i32
  %325 = mul i32 256, %324
  %326 = load i64* %i, align 8
  %327 = mul i64 %326, 6
  %328 = add i64 %327, 1
  %329 = load i8** %5, align 8
  %330 = getelementptr inbounds i8* %329, i64 %328
  %331 = load i8* %330, align 1
  %332 = zext i8 %331 to i32
  %333 = add i32 %325, %332
  %334 = load %struct.LodePNGColorMode** %6, align 8
  %335 = getelementptr inbounds %struct.LodePNGColorMode* %334, i32 0, i32 5
  %336 = load i32* %335, align 4
  %337 = icmp eq i32 %333, %336
  br i1 %337, label %338, label %380

; <label>:338                                     ; preds = %317
  %339 = load i64* %i, align 8
  %340 = mul i64 %339, 6
  %341 = add i64 %340, 2
  %342 = load i8** %5, align 8
  %343 = getelementptr inbounds i8* %342, i64 %341
  %344 = load i8* %343, align 1
  %345 = zext i8 %344 to i32
  %346 = mul i32 256, %345
  %347 = load i64* %i, align 8
  %348 = mul i64 %347, 6
  %349 = add i64 %348, 3
  %350 = load i8** %5, align 8
  %351 = getelementptr inbounds i8* %350, i64 %349
  %352 = load i8* %351, align 1
  %353 = zext i8 %352 to i32
  %354 = add i32 %346, %353
  %355 = load %struct.LodePNGColorMode** %6, align 8
  %356 = getelementptr inbounds %struct.LodePNGColorMode* %355, i32 0, i32 6
  %357 = load i32* %356, align 4
  %358 = icmp eq i32 %354, %357
  br i1 %358, label %359, label %380

; <label>:359                                     ; preds = %338
  %360 = load i64* %i, align 8
  %361 = mul i64 %360, 6
  %362 = add i64 %361, 4
  %363 = load i8** %5, align 8
  %364 = getelementptr inbounds i8* %363, i64 %362
  %365 = load i8* %364, align 1
  %366 = zext i8 %365 to i32
  %367 = mul i32 256, %366
  %368 = load i64* %i, align 8
  %369 = mul i64 %368, 6
  %370 = add i64 %369, 5
  %371 = load i8** %5, align 8
  %372 = getelementptr inbounds i8* %371, i64 %370
  %373 = load i8* %372, align 1
  %374 = zext i8 %373 to i32
  %375 = add i32 %367, %374
  %376 = load %struct.LodePNGColorMode** %6, align 8
  %377 = getelementptr inbounds %struct.LodePNGColorMode* %376, i32 0, i32 7
  %378 = load i32* %377, align 4
  %379 = icmp eq i32 %375, %378
  br label %380

; <label>:380                                     ; preds = %359, %338, %317, %312
  %381 = phi i1 [ false, %338 ], [ false, %317 ], [ false, %312 ], [ %379, %359 ]
  %382 = select i1 %381, i32 0, i32 255
  %383 = trunc i32 %382 to i8
  %384 = load i8** %2, align 8
  %385 = getelementptr inbounds i8* %384, i64 3
  store i8 %383, i8* %385, align 1
  br label %386

; <label>:386                                     ; preds = %380, %285
  br label %387

; <label>:387                                     ; preds = %386
  %388 = load i64* %i, align 8
  %389 = add i64 %388, 1
  store i64 %389, i64* %i, align 8
  %390 = load i32* %num_channels, align 4
  %391 = load i8** %2, align 8
  %392 = zext i32 %390 to i64
  %393 = getelementptr inbounds i8* %391, i64 %392
  store i8* %393, i8** %2, align 8
  br label %281

; <label>:394                                     ; preds = %281
  br label %395

; <label>:395                                     ; preds = %394, %279
  br label %712

; <label>:396                                     ; preds = %191
  %397 = load %struct.LodePNGColorMode** %6, align 8
  %398 = getelementptr inbounds %struct.LodePNGColorMode* %397, i32 0, i32 0
  %399 = load i32* %398, align 4
  %400 = icmp eq i32 %399, 3
  br i1 %400, label %401, label %511

; <label>:401                                     ; preds = %396
  store i64 0, i64* %j1, align 8
  store i64 0, i64* %i, align 8
  br label %402

; <label>:402                                     ; preds = %503, %401
  %403 = load i64* %i, align 8
  %404 = load i64* %3, align 8
  %405 = icmp ult i64 %403, %404
  br i1 %405, label %406, label %510

; <label>:406                                     ; preds = %402
  %407 = load %struct.LodePNGColorMode** %6, align 8
  %408 = getelementptr inbounds %struct.LodePNGColorMode* %407, i32 0, i32 1
  %409 = load i32* %408, align 4
  %410 = icmp eq i32 %409, 8
  br i1 %410, label %411, label %417

; <label>:411                                     ; preds = %406
  %412 = load i64* %i, align 8
  %413 = load i8** %5, align 8
  %414 = getelementptr inbounds i8* %413, i64 %412
  %415 = load i8* %414, align 1
  %416 = zext i8 %415 to i32
  store i32 %416, i32* %index, align 4
  br label %424

; <label>:417                                     ; preds = %406
  %418 = load i8** %5, align 8
  %419 = load %struct.LodePNGColorMode** %6, align 8
  %420 = getelementptr inbounds %struct.LodePNGColorMode* %419, i32 0, i32 1
  %421 = load i32* %420, align 4
  %422 = zext i32 %421 to i64
  %423 = call i32 @readBitsFromReversedStream(i64* %j1, i8* %418, i64 %422)
  store i32 %423, i32* %index, align 4
  br label %424

; <label>:424                                     ; preds = %417, %411
  %425 = load i32* %index, align 4
  %426 = zext i32 %425 to i64
  %427 = load %struct.LodePNGColorMode** %6, align 8
  %428 = getelementptr inbounds %struct.LodePNGColorMode* %427, i32 0, i32 3
  %429 = load i64* %428, align 8
  %430 = icmp uge i64 %426, %429
  br i1 %430, label %431, label %453

; <label>:431                                     ; preds = %424
  %432 = load i32* %7, align 4
  %433 = icmp ne i32 %432, 0
  br i1 %433, label %440, label %434

; <label>:434                                     ; preds = %431
  %435 = load %struct.LodePNGColorMode** %6, align 8
  %436 = getelementptr inbounds %struct.LodePNGColorMode* %435, i32 0, i32 1
  %437 = load i32* %436, align 4
  %438 = icmp eq i32 %437, 8
  %439 = select i1 %438, i32 46, i32 47
  store i32 %439, i32* %1
  br label %714

; <label>:440                                     ; preds = %431
  %441 = load i8** %2, align 8
  %442 = getelementptr inbounds i8* %441, i64 2
  store i8 0, i8* %442, align 1
  %443 = load i8** %2, align 8
  %444 = getelementptr inbounds i8* %443, i64 1
  store i8 0, i8* %444, align 1
  %445 = load i8** %2, align 8
  %446 = getelementptr inbounds i8* %445, i64 0
  store i8 0, i8* %446, align 1
  %447 = load i32* %4, align 4
  %448 = icmp ne i32 %447, 0
  br i1 %448, label %449, label %452

; <label>:449                                     ; preds = %440
  %450 = load i8** %2, align 8
  %451 = getelementptr inbounds i8* %450, i64 3
  store i8 -1, i8* %451, align 1
  br label %452

; <label>:452                                     ; preds = %449, %440
  br label %502

; <label>:453                                     ; preds = %424
  %454 = load i32* %index, align 4
  %455 = mul i32 %454, 4
  %456 = add i32 %455, 0
  %457 = zext i32 %456 to i64
  %458 = load %struct.LodePNGColorMode** %6, align 8
  %459 = getelementptr inbounds %struct.LodePNGColorMode* %458, i32 0, i32 2
  %460 = load i8** %459, align 8
  %461 = getelementptr inbounds i8* %460, i64 %457
  %462 = load i8* %461, align 1
  %463 = load i8** %2, align 8
  %464 = getelementptr inbounds i8* %463, i64 0
  store i8 %462, i8* %464, align 1
  %465 = load i32* %index, align 4
  %466 = mul i32 %465, 4
  %467 = add i32 %466, 1
  %468 = zext i32 %467 to i64
  %469 = load %struct.LodePNGColorMode** %6, align 8
  %470 = getelementptr inbounds %struct.LodePNGColorMode* %469, i32 0, i32 2
  %471 = load i8** %470, align 8
  %472 = getelementptr inbounds i8* %471, i64 %468
  %473 = load i8* %472, align 1
  %474 = load i8** %2, align 8
  %475 = getelementptr inbounds i8* %474, i64 1
  store i8 %473, i8* %475, align 1
  %476 = load i32* %index, align 4
  %477 = mul i32 %476, 4
  %478 = add i32 %477, 2
  %479 = zext i32 %478 to i64
  %480 = load %struct.LodePNGColorMode** %6, align 8
  %481 = getelementptr inbounds %struct.LodePNGColorMode* %480, i32 0, i32 2
  %482 = load i8** %481, align 8
  %483 = getelementptr inbounds i8* %482, i64 %479
  %484 = load i8* %483, align 1
  %485 = load i8** %2, align 8
  %486 = getelementptr inbounds i8* %485, i64 2
  store i8 %484, i8* %486, align 1
  %487 = load i32* %4, align 4
  %488 = icmp ne i32 %487, 0
  br i1 %488, label %489, label %501

; <label>:489                                     ; preds = %453
  %490 = load i32* %index, align 4
  %491 = mul i32 %490, 4
  %492 = add i32 %491, 3
  %493 = zext i32 %492 to i64
  %494 = load %struct.LodePNGColorMode** %6, align 8
  %495 = getelementptr inbounds %struct.LodePNGColorMode* %494, i32 0, i32 2
  %496 = load i8** %495, align 8
  %497 = getelementptr inbounds i8* %496, i64 %493
  %498 = load i8* %497, align 1
  %499 = load i8** %2, align 8
  %500 = getelementptr inbounds i8* %499, i64 3
  store i8 %498, i8* %500, align 1
  br label %501

; <label>:501                                     ; preds = %489, %453
  br label %502

; <label>:502                                     ; preds = %501, %452
  br label %503

; <label>:503                                     ; preds = %502
  %504 = load i64* %i, align 8
  %505 = add i64 %504, 1
  store i64 %505, i64* %i, align 8
  %506 = load i32* %num_channels, align 4
  %507 = load i8** %2, align 8
  %508 = zext i32 %506 to i64
  %509 = getelementptr inbounds i8* %507, i64 %508
  store i8* %509, i8** %2, align 8
  br label %402

; <label>:510                                     ; preds = %402
  br label %711

; <label>:511                                     ; preds = %396
  %512 = load %struct.LodePNGColorMode** %6, align 8
  %513 = getelementptr inbounds %struct.LodePNGColorMode* %512, i32 0, i32 0
  %514 = load i32* %513, align 4
  %515 = icmp eq i32 %514, 4
  br i1 %515, label %516, label %598

; <label>:516                                     ; preds = %511
  %517 = load %struct.LodePNGColorMode** %6, align 8
  %518 = getelementptr inbounds %struct.LodePNGColorMode* %517, i32 0, i32 1
  %519 = load i32* %518, align 4
  %520 = icmp eq i32 %519, 8
  br i1 %520, label %521, label %559

; <label>:521                                     ; preds = %516
  store i64 0, i64* %i, align 8
  br label %522

; <label>:522                                     ; preds = %551, %521
  %523 = load i64* %i, align 8
  %524 = load i64* %3, align 8
  %525 = icmp ult i64 %523, %524
  br i1 %525, label %526, label %558

; <label>:526                                     ; preds = %522
  %527 = load i64* %i, align 8
  %528 = mul i64 %527, 2
  %529 = add i64 %528, 0
  %530 = load i8** %5, align 8
  %531 = getelementptr inbounds i8* %530, i64 %529
  %532 = load i8* %531, align 1
  %533 = load i8** %2, align 8
  %534 = getelementptr inbounds i8* %533, i64 2
  store i8 %532, i8* %534, align 1
  %535 = load i8** %2, align 8
  %536 = getelementptr inbounds i8* %535, i64 1
  store i8 %532, i8* %536, align 1
  %537 = load i8** %2, align 8
  %538 = getelementptr inbounds i8* %537, i64 0
  store i8 %532, i8* %538, align 1
  %539 = load i32* %4, align 4
  %540 = icmp ne i32 %539, 0
  br i1 %540, label %541, label %550

; <label>:541                                     ; preds = %526
  %542 = load i64* %i, align 8
  %543 = mul i64 %542, 2
  %544 = add i64 %543, 1
  %545 = load i8** %5, align 8
  %546 = getelementptr inbounds i8* %545, i64 %544
  %547 = load i8* %546, align 1
  %548 = load i8** %2, align 8
  %549 = getelementptr inbounds i8* %548, i64 3
  store i8 %547, i8* %549, align 1
  br label %550

; <label>:550                                     ; preds = %541, %526
  br label %551

; <label>:551                                     ; preds = %550
  %552 = load i64* %i, align 8
  %553 = add i64 %552, 1
  store i64 %553, i64* %i, align 8
  %554 = load i32* %num_channels, align 4
  %555 = load i8** %2, align 8
  %556 = zext i32 %554 to i64
  %557 = getelementptr inbounds i8* %555, i64 %556
  store i8* %557, i8** %2, align 8
  br label %522

; <label>:558                                     ; preds = %522
  br label %597

; <label>:559                                     ; preds = %516
  store i64 0, i64* %i, align 8
  br label %560

; <label>:560                                     ; preds = %589, %559
  %561 = load i64* %i, align 8
  %562 = load i64* %3, align 8
  %563 = icmp ult i64 %561, %562
  br i1 %563, label %564, label %596

; <label>:564                                     ; preds = %560
  %565 = load i64* %i, align 8
  %566 = mul i64 %565, 4
  %567 = add i64 %566, 0
  %568 = load i8** %5, align 8
  %569 = getelementptr inbounds i8* %568, i64 %567
  %570 = load i8* %569, align 1
  %571 = load i8** %2, align 8
  %572 = getelementptr inbounds i8* %571, i64 2
  store i8 %570, i8* %572, align 1
  %573 = load i8** %2, align 8
  %574 = getelementptr inbounds i8* %573, i64 1
  store i8 %570, i8* %574, align 1
  %575 = load i8** %2, align 8
  %576 = getelementptr inbounds i8* %575, i64 0
  store i8 %570, i8* %576, align 1
  %577 = load i32* %4, align 4
  %578 = icmp ne i32 %577, 0
  br i1 %578, label %579, label %588

; <label>:579                                     ; preds = %564
  %580 = load i64* %i, align 8
  %581 = mul i64 %580, 4
  %582 = add i64 %581, 2
  %583 = load i8** %5, align 8
  %584 = getelementptr inbounds i8* %583, i64 %582
  %585 = load i8* %584, align 1
  %586 = load i8** %2, align 8
  %587 = getelementptr inbounds i8* %586, i64 3
  store i8 %585, i8* %587, align 1
  br label %588

; <label>:588                                     ; preds = %579, %564
  br label %589

; <label>:589                                     ; preds = %588
  %590 = load i64* %i, align 8
  %591 = add i64 %590, 1
  store i64 %591, i64* %i, align 8
  %592 = load i32* %num_channels, align 4
  %593 = load i8** %2, align 8
  %594 = zext i32 %592 to i64
  %595 = getelementptr inbounds i8* %593, i64 %594
  store i8* %595, i8** %2, align 8
  br label %560

; <label>:596                                     ; preds = %560
  br label %597

; <label>:597                                     ; preds = %596, %558
  br label %710

; <label>:598                                     ; preds = %511
  %599 = load %struct.LodePNGColorMode** %6, align 8
  %600 = getelementptr inbounds %struct.LodePNGColorMode* %599, i32 0, i32 0
  %601 = load i32* %600, align 4
  %602 = icmp eq i32 %601, 6
  br i1 %602, label %603, label %709

; <label>:603                                     ; preds = %598
  %604 = load %struct.LodePNGColorMode** %6, align 8
  %605 = getelementptr inbounds %struct.LodePNGColorMode* %604, i32 0, i32 1
  %606 = load i32* %605, align 4
  %607 = icmp eq i32 %606, 8
  br i1 %607, label %608, label %658

; <label>:608                                     ; preds = %603
  store i64 0, i64* %i, align 8
  br label %609

; <label>:609                                     ; preds = %650, %608
  %610 = load i64* %i, align 8
  %611 = load i64* %3, align 8
  %612 = icmp ult i64 %610, %611
  br i1 %612, label %613, label %657

; <label>:613                                     ; preds = %609
  %614 = load i64* %i, align 8
  %615 = mul i64 %614, 4
  %616 = add i64 %615, 0
  %617 = load i8** %5, align 8
  %618 = getelementptr inbounds i8* %617, i64 %616
  %619 = load i8* %618, align 1
  %620 = load i8** %2, align 8
  %621 = getelementptr inbounds i8* %620, i64 0
  store i8 %619, i8* %621, align 1
  %622 = load i64* %i, align 8
  %623 = mul i64 %622, 4
  %624 = add i64 %623, 1
  %625 = load i8** %5, align 8
  %626 = getelementptr inbounds i8* %625, i64 %624
  %627 = load i8* %626, align 1
  %628 = load i8** %2, align 8
  %629 = getelementptr inbounds i8* %628, i64 1
  store i8 %627, i8* %629, align 1
  %630 = load i64* %i, align 8
  %631 = mul i64 %630, 4
  %632 = add i64 %631, 2
  %633 = load i8** %5, align 8
  %634 = getelementptr inbounds i8* %633, i64 %632
  %635 = load i8* %634, align 1
  %636 = load i8** %2, align 8
  %637 = getelementptr inbounds i8* %636, i64 2
  store i8 %635, i8* %637, align 1
  %638 = load i32* %4, align 4
  %639 = icmp ne i32 %638, 0
  br i1 %639, label %640, label %649

; <label>:640                                     ; preds = %613
  %641 = load i64* %i, align 8
  %642 = mul i64 %641, 4
  %643 = add i64 %642, 3
  %644 = load i8** %5, align 8
  %645 = getelementptr inbounds i8* %644, i64 %643
  %646 = load i8* %645, align 1
  %647 = load i8** %2, align 8
  %648 = getelementptr inbounds i8* %647, i64 3
  store i8 %646, i8* %648, align 1
  br label %649

; <label>:649                                     ; preds = %640, %613
  br label %650

; <label>:650                                     ; preds = %649
  %651 = load i64* %i, align 8
  %652 = add i64 %651, 1
  store i64 %652, i64* %i, align 8
  %653 = load i32* %num_channels, align 4
  %654 = load i8** %2, align 8
  %655 = zext i32 %653 to i64
  %656 = getelementptr inbounds i8* %654, i64 %655
  store i8* %656, i8** %2, align 8
  br label %609

; <label>:657                                     ; preds = %609
  br label %708

; <label>:658                                     ; preds = %603
  store i64 0, i64* %i, align 8
  br label %659

; <label>:659                                     ; preds = %700, %658
  %660 = load i64* %i, align 8
  %661 = load i64* %3, align 8
  %662 = icmp ult i64 %660, %661
  br i1 %662, label %663, label %707

; <label>:663                                     ; preds = %659
  %664 = load i64* %i, align 8
  %665 = mul i64 %664, 8
  %666 = add i64 %665, 0
  %667 = load i8** %5, align 8
  %668 = getelementptr inbounds i8* %667, i64 %666
  %669 = load i8* %668, align 1
  %670 = load i8** %2, align 8
  %671 = getelementptr inbounds i8* %670, i64 0
  store i8 %669, i8* %671, align 1
  %672 = load i64* %i, align 8
  %673 = mul i64 %672, 8
  %674 = add i64 %673, 2
  %675 = load i8** %5, align 8
  %676 = getelementptr inbounds i8* %675, i64 %674
  %677 = load i8* %676, align 1
  %678 = load i8** %2, align 8
  %679 = getelementptr inbounds i8* %678, i64 1
  store i8 %677, i8* %679, align 1
  %680 = load i64* %i, align 8
  %681 = mul i64 %680, 8
  %682 = add i64 %681, 4
  %683 = load i8** %5, align 8
  %684 = getelementptr inbounds i8* %683, i64 %682
  %685 = load i8* %684, align 1
  %686 = load i8** %2, align 8
  %687 = getelementptr inbounds i8* %686, i64 2
  store i8 %685, i8* %687, align 1
  %688 = load i32* %4, align 4
  %689 = icmp ne i32 %688, 0
  br i1 %689, label %690, label %699

; <label>:690                                     ; preds = %663
  %691 = load i64* %i, align 8
  %692 = mul i64 %691, 8
  %693 = add i64 %692, 6
  %694 = load i8** %5, align 8
  %695 = getelementptr inbounds i8* %694, i64 %693
  %696 = load i8* %695, align 1
  %697 = load i8** %2, align 8
  %698 = getelementptr inbounds i8* %697, i64 3
  store i8 %696, i8* %698, align 1
  br label %699

; <label>:699                                     ; preds = %690, %663
  br label %700

; <label>:700                                     ; preds = %699
  %701 = load i64* %i, align 8
  %702 = add i64 %701, 1
  store i64 %702, i64* %i, align 8
  %703 = load i32* %num_channels, align 4
  %704 = load i8** %2, align 8
  %705 = zext i32 %703 to i64
  %706 = getelementptr inbounds i8* %704, i64 %705
  store i8* %706, i8** %2, align 8
  br label %659

; <label>:707                                     ; preds = %659
  br label %708

; <label>:708                                     ; preds = %707, %657
  br label %709

; <label>:709                                     ; preds = %708, %598
  br label %710

; <label>:710                                     ; preds = %709, %597
  br label %711

; <label>:711                                     ; preds = %710, %510
  br label %712

; <label>:712                                     ; preds = %711, %395
  br label %713

; <label>:713                                     ; preds = %712, %190
  store i32 0, i32* %1
  br label %714

; <label>:714                                     ; preds = %713, %434
  %715 = load i32* %1
  ret i32 %715
}

; Function Attrs: nounwind uwtable
define internal i32 @getPixelColorRGBA8(i8* %r, i8* %g, i8* %b, i8* %a, i8* %in, i64 %i, %struct.LodePNGColorMode* %mode, i32 %fix_png) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i64, align 8
  %8 = alloca %struct.LodePNGColorMode*, align 8
  %9 = alloca i32, align 4
  %highest = alloca i32, align 4
  %j = alloca i64, align 8
  %value = alloca i32, align 4
  %index = alloca i32, align 4
  %j1 = alloca i64, align 8
  store i8* %r, i8** %2, align 8
  store i8* %g, i8** %3, align 8
  store i8* %b, i8** %4, align 8
  store i8* %a, i8** %5, align 8
  store i8* %in, i8** %6, align 8
  store i64 %i, i64* %7, align 8
  store %struct.LodePNGColorMode* %mode, %struct.LodePNGColorMode** %8, align 8
  store i32 %fix_png, i32* %9, align 4
  %10 = load %struct.LodePNGColorMode** %8, align 8
  %11 = getelementptr inbounds %struct.LodePNGColorMode* %10, i32 0, i32 0
  %12 = load i32* %11, align 4
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %132

; <label>:14                                      ; preds = %0
  %15 = load %struct.LodePNGColorMode** %8, align 8
  %16 = getelementptr inbounds %struct.LodePNGColorMode* %15, i32 0, i32 1
  %17 = load i32* %16, align 4
  %18 = icmp eq i32 %17, 8
  br i1 %18, label %19, label %44

; <label>:19                                      ; preds = %14
  %20 = load i64* %7, align 8
  %21 = load i8** %6, align 8
  %22 = getelementptr inbounds i8* %21, i64 %20
  %23 = load i8* %22, align 1
  %24 = load i8** %4, align 8
  store i8 %23, i8* %24, align 1
  %25 = load i8** %3, align 8
  store i8 %23, i8* %25, align 1
  %26 = load i8** %2, align 8
  store i8 %23, i8* %26, align 1
  %27 = load %struct.LodePNGColorMode** %8, align 8
  %28 = getelementptr inbounds %struct.LodePNGColorMode* %27, i32 0, i32 4
  %29 = load i32* %28, align 4
  %30 = icmp ne i32 %29, 0
  br i1 %30, label %31, label %41

; <label>:31                                      ; preds = %19
  %32 = load i8** %2, align 8
  %33 = load i8* %32, align 1
  %34 = zext i8 %33 to i32
  %35 = load %struct.LodePNGColorMode** %8, align 8
  %36 = getelementptr inbounds %struct.LodePNGColorMode* %35, i32 0, i32 5
  %37 = load i32* %36, align 4
  %38 = icmp eq i32 %34, %37
  br i1 %38, label %39, label %41

; <label>:39                                      ; preds = %31
  %40 = load i8** %5, align 8
  store i8 0, i8* %40, align 1
  br label %43

; <label>:41                                      ; preds = %31, %19
  %42 = load i8** %5, align 8
  store i8 -1, i8* %42, align 1
  br label %43

; <label>:43                                      ; preds = %41, %39
  br label %131

; <label>:44                                      ; preds = %14
  %45 = load %struct.LodePNGColorMode** %8, align 8
  %46 = getelementptr inbounds %struct.LodePNGColorMode* %45, i32 0, i32 1
  %47 = load i32* %46, align 4
  %48 = icmp eq i32 %47, 16
  br i1 %48, label %49, label %89

; <label>:49                                      ; preds = %44
  %50 = load i64* %7, align 8
  %51 = mul i64 %50, 2
  %52 = add i64 %51, 0
  %53 = load i8** %6, align 8
  %54 = getelementptr inbounds i8* %53, i64 %52
  %55 = load i8* %54, align 1
  %56 = load i8** %4, align 8
  store i8 %55, i8* %56, align 1
  %57 = load i8** %3, align 8
  store i8 %55, i8* %57, align 1
  %58 = load i8** %2, align 8
  store i8 %55, i8* %58, align 1
  %59 = load %struct.LodePNGColorMode** %8, align 8
  %60 = getelementptr inbounds %struct.LodePNGColorMode* %59, i32 0, i32 4
  %61 = load i32* %60, align 4
  %62 = icmp ne i32 %61, 0
  br i1 %62, label %63, label %86

; <label>:63                                      ; preds = %49
  %64 = load i64* %7, align 8
  %65 = mul i64 %64, 2
  %66 = add i64 %65, 0
  %67 = load i8** %6, align 8
  %68 = getelementptr inbounds i8* %67, i64 %66
  %69 = load i8* %68, align 1
  %70 = zext i8 %69 to i32
  %71 = mul i32 256, %70
  %72 = load i64* %7, align 8
  %73 = mul i64 %72, 2
  %74 = add i64 %73, 1
  %75 = load i8** %6, align 8
  %76 = getelementptr inbounds i8* %75, i64 %74
  %77 = load i8* %76, align 1
  %78 = zext i8 %77 to i32
  %79 = add i32 %71, %78
  %80 = load %struct.LodePNGColorMode** %8, align 8
  %81 = getelementptr inbounds %struct.LodePNGColorMode* %80, i32 0, i32 5
  %82 = load i32* %81, align 4
  %83 = icmp eq i32 %79, %82
  br i1 %83, label %84, label %86

; <label>:84                                      ; preds = %63
  %85 = load i8** %5, align 8
  store i8 0, i8* %85, align 1
  br label %88

; <label>:86                                      ; preds = %63, %49
  %87 = load i8** %5, align 8
  store i8 -1, i8* %87, align 1
  br label %88

; <label>:88                                      ; preds = %86, %84
  br label %130

; <label>:89                                      ; preds = %44
  %90 = load %struct.LodePNGColorMode** %8, align 8
  %91 = getelementptr inbounds %struct.LodePNGColorMode* %90, i32 0, i32 1
  %92 = load i32* %91, align 4
  %93 = shl i32 1, %92
  %94 = sub i32 %93, 1
  store i32 %94, i32* %highest, align 4
  %95 = load i64* %7, align 8
  %96 = load %struct.LodePNGColorMode** %8, align 8
  %97 = getelementptr inbounds %struct.LodePNGColorMode* %96, i32 0, i32 1
  %98 = load i32* %97, align 4
  %99 = zext i32 %98 to i64
  %100 = mul i64 %95, %99
  store i64 %100, i64* %j, align 8
  %101 = load i8** %6, align 8
  %102 = load %struct.LodePNGColorMode** %8, align 8
  %103 = getelementptr inbounds %struct.LodePNGColorMode* %102, i32 0, i32 1
  %104 = load i32* %103, align 4
  %105 = zext i32 %104 to i64
  %106 = call i32 @readBitsFromReversedStream(i64* %j, i8* %101, i64 %105)
  store i32 %106, i32* %value, align 4
  %107 = load i32* %value, align 4
  %108 = mul i32 %107, 255
  %109 = load i32* %highest, align 4
  %110 = udiv i32 %108, %109
  %111 = trunc i32 %110 to i8
  %112 = load i8** %4, align 8
  store i8 %111, i8* %112, align 1
  %113 = load i8** %3, align 8
  store i8 %111, i8* %113, align 1
  %114 = load i8** %2, align 8
  store i8 %111, i8* %114, align 1
  %115 = load %struct.LodePNGColorMode** %8, align 8
  %116 = getelementptr inbounds %struct.LodePNGColorMode* %115, i32 0, i32 4
  %117 = load i32* %116, align 4
  %118 = icmp ne i32 %117, 0
  br i1 %118, label %119, label %127

; <label>:119                                     ; preds = %89
  %120 = load i32* %value, align 4
  %121 = load %struct.LodePNGColorMode** %8, align 8
  %122 = getelementptr inbounds %struct.LodePNGColorMode* %121, i32 0, i32 5
  %123 = load i32* %122, align 4
  %124 = icmp eq i32 %120, %123
  br i1 %124, label %125, label %127

; <label>:125                                     ; preds = %119
  %126 = load i8** %5, align 8
  store i8 0, i8* %126, align 1
  br label %129

; <label>:127                                     ; preds = %119, %89
  %128 = load i8** %5, align 8
  store i8 -1, i8* %128, align 1
  br label %129

; <label>:129                                     ; preds = %127, %125
  br label %130

; <label>:130                                     ; preds = %129, %88
  br label %131

; <label>:131                                     ; preds = %130, %43
  br label %502

; <label>:132                                     ; preds = %0
  %133 = load %struct.LodePNGColorMode** %8, align 8
  %134 = getelementptr inbounds %struct.LodePNGColorMode* %133, i32 0, i32 0
  %135 = load i32* %134, align 4
  %136 = icmp eq i32 %135, 2
  br i1 %136, label %137, label %292

; <label>:137                                     ; preds = %132
  %138 = load %struct.LodePNGColorMode** %8, align 8
  %139 = getelementptr inbounds %struct.LodePNGColorMode* %138, i32 0, i32 1
  %140 = load i32* %139, align 4
  %141 = icmp eq i32 %140, 8
  br i1 %141, label %142, label %197

; <label>:142                                     ; preds = %137
  %143 = load i64* %7, align 8
  %144 = mul i64 %143, 3
  %145 = add i64 %144, 0
  %146 = load i8** %6, align 8
  %147 = getelementptr inbounds i8* %146, i64 %145
  %148 = load i8* %147, align 1
  %149 = load i8** %2, align 8
  store i8 %148, i8* %149, align 1
  %150 = load i64* %7, align 8
  %151 = mul i64 %150, 3
  %152 = add i64 %151, 1
  %153 = load i8** %6, align 8
  %154 = getelementptr inbounds i8* %153, i64 %152
  %155 = load i8* %154, align 1
  %156 = load i8** %3, align 8
  store i8 %155, i8* %156, align 1
  %157 = load i64* %7, align 8
  %158 = mul i64 %157, 3
  %159 = add i64 %158, 2
  %160 = load i8** %6, align 8
  %161 = getelementptr inbounds i8* %160, i64 %159
  %162 = load i8* %161, align 1
  %163 = load i8** %4, align 8
  store i8 %162, i8* %163, align 1
  %164 = load %struct.LodePNGColorMode** %8, align 8
  %165 = getelementptr inbounds %struct.LodePNGColorMode* %164, i32 0, i32 4
  %166 = load i32* %165, align 4
  %167 = icmp ne i32 %166, 0
  br i1 %167, label %168, label %194

; <label>:168                                     ; preds = %142
  %169 = load i8** %2, align 8
  %170 = load i8* %169, align 1
  %171 = zext i8 %170 to i32
  %172 = load %struct.LodePNGColorMode** %8, align 8
  %173 = getelementptr inbounds %struct.LodePNGColorMode* %172, i32 0, i32 5
  %174 = load i32* %173, align 4
  %175 = icmp eq i32 %171, %174
  br i1 %175, label %176, label %194

; <label>:176                                     ; preds = %168
  %177 = load i8** %3, align 8
  %178 = load i8* %177, align 1
  %179 = zext i8 %178 to i32
  %180 = load %struct.LodePNGColorMode** %8, align 8
  %181 = getelementptr inbounds %struct.LodePNGColorMode* %180, i32 0, i32 6
  %182 = load i32* %181, align 4
  %183 = icmp eq i32 %179, %182
  br i1 %183, label %184, label %194

; <label>:184                                     ; preds = %176
  %185 = load i8** %4, align 8
  %186 = load i8* %185, align 1
  %187 = zext i8 %186 to i32
  %188 = load %struct.LodePNGColorMode** %8, align 8
  %189 = getelementptr inbounds %struct.LodePNGColorMode* %188, i32 0, i32 7
  %190 = load i32* %189, align 4
  %191 = icmp eq i32 %187, %190
  br i1 %191, label %192, label %194

; <label>:192                                     ; preds = %184
  %193 = load i8** %5, align 8
  store i8 0, i8* %193, align 1
  br label %196

; <label>:194                                     ; preds = %184, %176, %168, %142
  %195 = load i8** %5, align 8
  store i8 -1, i8* %195, align 1
  br label %196

; <label>:196                                     ; preds = %194, %192
  br label %291

; <label>:197                                     ; preds = %137
  %198 = load i64* %7, align 8
  %199 = mul i64 %198, 6
  %200 = add i64 %199, 0
  %201 = load i8** %6, align 8
  %202 = getelementptr inbounds i8* %201, i64 %200
  %203 = load i8* %202, align 1
  %204 = load i8** %2, align 8
  store i8 %203, i8* %204, align 1
  %205 = load i64* %7, align 8
  %206 = mul i64 %205, 6
  %207 = add i64 %206, 2
  %208 = load i8** %6, align 8
  %209 = getelementptr inbounds i8* %208, i64 %207
  %210 = load i8* %209, align 1
  %211 = load i8** %3, align 8
  store i8 %210, i8* %211, align 1
  %212 = load i64* %7, align 8
  %213 = mul i64 %212, 6
  %214 = add i64 %213, 4
  %215 = load i8** %6, align 8
  %216 = getelementptr inbounds i8* %215, i64 %214
  %217 = load i8* %216, align 1
  %218 = load i8** %4, align 8
  store i8 %217, i8* %218, align 1
  %219 = load %struct.LodePNGColorMode** %8, align 8
  %220 = getelementptr inbounds %struct.LodePNGColorMode* %219, i32 0, i32 4
  %221 = load i32* %220, align 4
  %222 = icmp ne i32 %221, 0
  br i1 %222, label %223, label %288

; <label>:223                                     ; preds = %197
  %224 = load i64* %7, align 8
  %225 = mul i64 %224, 6
  %226 = add i64 %225, 0
  %227 = load i8** %6, align 8
  %228 = getelementptr inbounds i8* %227, i64 %226
  %229 = load i8* %228, align 1
  %230 = zext i8 %229 to i32
  %231 = mul i32 256, %230
  %232 = load i64* %7, align 8
  %233 = mul i64 %232, 6
  %234 = add i64 %233, 1
  %235 = load i8** %6, align 8
  %236 = getelementptr inbounds i8* %235, i64 %234
  %237 = load i8* %236, align 1
  %238 = zext i8 %237 to i32
  %239 = add i32 %231, %238
  %240 = load %struct.LodePNGColorMode** %8, align 8
  %241 = getelementptr inbounds %struct.LodePNGColorMode* %240, i32 0, i32 5
  %242 = load i32* %241, align 4
  %243 = icmp eq i32 %239, %242
  br i1 %243, label %244, label %288

; <label>:244                                     ; preds = %223
  %245 = load i64* %7, align 8
  %246 = mul i64 %245, 6
  %247 = add i64 %246, 2
  %248 = load i8** %6, align 8
  %249 = getelementptr inbounds i8* %248, i64 %247
  %250 = load i8* %249, align 1
  %251 = zext i8 %250 to i32
  %252 = mul i32 256, %251
  %253 = load i64* %7, align 8
  %254 = mul i64 %253, 6
  %255 = add i64 %254, 3
  %256 = load i8** %6, align 8
  %257 = getelementptr inbounds i8* %256, i64 %255
  %258 = load i8* %257, align 1
  %259 = zext i8 %258 to i32
  %260 = add i32 %252, %259
  %261 = load %struct.LodePNGColorMode** %8, align 8
  %262 = getelementptr inbounds %struct.LodePNGColorMode* %261, i32 0, i32 6
  %263 = load i32* %262, align 4
  %264 = icmp eq i32 %260, %263
  br i1 %264, label %265, label %288

; <label>:265                                     ; preds = %244
  %266 = load i64* %7, align 8
  %267 = mul i64 %266, 6
  %268 = add i64 %267, 4
  %269 = load i8** %6, align 8
  %270 = getelementptr inbounds i8* %269, i64 %268
  %271 = load i8* %270, align 1
  %272 = zext i8 %271 to i32
  %273 = mul i32 256, %272
  %274 = load i64* %7, align 8
  %275 = mul i64 %274, 6
  %276 = add i64 %275, 5
  %277 = load i8** %6, align 8
  %278 = getelementptr inbounds i8* %277, i64 %276
  %279 = load i8* %278, align 1
  %280 = zext i8 %279 to i32
  %281 = add i32 %273, %280
  %282 = load %struct.LodePNGColorMode** %8, align 8
  %283 = getelementptr inbounds %struct.LodePNGColorMode* %282, i32 0, i32 7
  %284 = load i32* %283, align 4
  %285 = icmp eq i32 %281, %284
  br i1 %285, label %286, label %288

; <label>:286                                     ; preds = %265
  %287 = load i8** %5, align 8
  store i8 0, i8* %287, align 1
  br label %290

; <label>:288                                     ; preds = %265, %244, %223, %197
  %289 = load i8** %5, align 8
  store i8 -1, i8* %289, align 1
  br label %290

; <label>:290                                     ; preds = %288, %286
  br label %291

; <label>:291                                     ; preds = %290, %196
  br label %501

; <label>:292                                     ; preds = %132
  %293 = load %struct.LodePNGColorMode** %8, align 8
  %294 = getelementptr inbounds %struct.LodePNGColorMode* %293, i32 0, i32 0
  %295 = load i32* %294, align 4
  %296 = icmp eq i32 %295, 3
  br i1 %296, label %297, label %384

; <label>:297                                     ; preds = %292
  %298 = load %struct.LodePNGColorMode** %8, align 8
  %299 = getelementptr inbounds %struct.LodePNGColorMode* %298, i32 0, i32 1
  %300 = load i32* %299, align 4
  %301 = icmp eq i32 %300, 8
  br i1 %301, label %302, label %308

; <label>:302                                     ; preds = %297
  %303 = load i64* %7, align 8
  %304 = load i8** %6, align 8
  %305 = getelementptr inbounds i8* %304, i64 %303
  %306 = load i8* %305, align 1
  %307 = zext i8 %306 to i32
  store i32 %307, i32* %index, align 4
  br label %321

; <label>:308                                     ; preds = %297
  %309 = load i64* %7, align 8
  %310 = load %struct.LodePNGColorMode** %8, align 8
  %311 = getelementptr inbounds %struct.LodePNGColorMode* %310, i32 0, i32 1
  %312 = load i32* %311, align 4
  %313 = zext i32 %312 to i64
  %314 = mul i64 %309, %313
  store i64 %314, i64* %j1, align 8
  %315 = load i8** %6, align 8
  %316 = load %struct.LodePNGColorMode** %8, align 8
  %317 = getelementptr inbounds %struct.LodePNGColorMode* %316, i32 0, i32 1
  %318 = load i32* %317, align 4
  %319 = zext i32 %318 to i64
  %320 = call i32 @readBitsFromReversedStream(i64* %j1, i8* %315, i64 %319)
  store i32 %320, i32* %index, align 4
  br label %321

; <label>:321                                     ; preds = %308, %302
  %322 = load i32* %index, align 4
  %323 = zext i32 %322 to i64
  %324 = load %struct.LodePNGColorMode** %8, align 8
  %325 = getelementptr inbounds %struct.LodePNGColorMode* %324, i32 0, i32 3
  %326 = load i64* %325, align 8
  %327 = icmp uge i64 %323, %326
  br i1 %327, label %328, label %342

; <label>:328                                     ; preds = %321
  %329 = load i32* %9, align 4
  %330 = icmp ne i32 %329, 0
  br i1 %330, label %337, label %331

; <label>:331                                     ; preds = %328
  %332 = load %struct.LodePNGColorMode** %8, align 8
  %333 = getelementptr inbounds %struct.LodePNGColorMode* %332, i32 0, i32 1
  %334 = load i32* %333, align 4
  %335 = icmp eq i32 %334, 8
  %336 = select i1 %335, i32 46, i32 47
  store i32 %336, i32* %1
  br label %503

; <label>:337                                     ; preds = %328
  %338 = load i8** %4, align 8
  store i8 0, i8* %338, align 1
  %339 = load i8** %3, align 8
  store i8 0, i8* %339, align 1
  %340 = load i8** %2, align 8
  store i8 0, i8* %340, align 1
  %341 = load i8** %5, align 8
  store i8 -1, i8* %341, align 1
  br label %383

; <label>:342                                     ; preds = %321
  %343 = load i32* %index, align 4
  %344 = mul i32 %343, 4
  %345 = add i32 %344, 0
  %346 = zext i32 %345 to i64
  %347 = load %struct.LodePNGColorMode** %8, align 8
  %348 = getelementptr inbounds %struct.LodePNGColorMode* %347, i32 0, i32 2
  %349 = load i8** %348, align 8
  %350 = getelementptr inbounds i8* %349, i64 %346
  %351 = load i8* %350, align 1
  %352 = load i8** %2, align 8
  store i8 %351, i8* %352, align 1
  %353 = load i32* %index, align 4
  %354 = mul i32 %353, 4
  %355 = add i32 %354, 1
  %356 = zext i32 %355 to i64
  %357 = load %struct.LodePNGColorMode** %8, align 8
  %358 = getelementptr inbounds %struct.LodePNGColorMode* %357, i32 0, i32 2
  %359 = load i8** %358, align 8
  %360 = getelementptr inbounds i8* %359, i64 %356
  %361 = load i8* %360, align 1
  %362 = load i8** %3, align 8
  store i8 %361, i8* %362, align 1
  %363 = load i32* %index, align 4
  %364 = mul i32 %363, 4
  %365 = add i32 %364, 2
  %366 = zext i32 %365 to i64
  %367 = load %struct.LodePNGColorMode** %8, align 8
  %368 = getelementptr inbounds %struct.LodePNGColorMode* %367, i32 0, i32 2
  %369 = load i8** %368, align 8
  %370 = getelementptr inbounds i8* %369, i64 %366
  %371 = load i8* %370, align 1
  %372 = load i8** %4, align 8
  store i8 %371, i8* %372, align 1
  %373 = load i32* %index, align 4
  %374 = mul i32 %373, 4
  %375 = add i32 %374, 3
  %376 = zext i32 %375 to i64
  %377 = load %struct.LodePNGColorMode** %8, align 8
  %378 = getelementptr inbounds %struct.LodePNGColorMode* %377, i32 0, i32 2
  %379 = load i8** %378, align 8
  %380 = getelementptr inbounds i8* %379, i64 %376
  %381 = load i8* %380, align 1
  %382 = load i8** %5, align 8
  store i8 %381, i8* %382, align 1
  br label %383

; <label>:383                                     ; preds = %342, %337
  br label %500

; <label>:384                                     ; preds = %292
  %385 = load %struct.LodePNGColorMode** %8, align 8
  %386 = getelementptr inbounds %struct.LodePNGColorMode* %385, i32 0, i32 0
  %387 = load i32* %386, align 4
  %388 = icmp eq i32 %387, 4
  br i1 %388, label %389, label %429

; <label>:389                                     ; preds = %384
  %390 = load %struct.LodePNGColorMode** %8, align 8
  %391 = getelementptr inbounds %struct.LodePNGColorMode* %390, i32 0, i32 1
  %392 = load i32* %391, align 4
  %393 = icmp eq i32 %392, 8
  br i1 %393, label %394, label %411

; <label>:394                                     ; preds = %389
  %395 = load i64* %7, align 8
  %396 = mul i64 %395, 2
  %397 = add i64 %396, 0
  %398 = load i8** %6, align 8
  %399 = getelementptr inbounds i8* %398, i64 %397
  %400 = load i8* %399, align 1
  %401 = load i8** %4, align 8
  store i8 %400, i8* %401, align 1
  %402 = load i8** %3, align 8
  store i8 %400, i8* %402, align 1
  %403 = load i8** %2, align 8
  store i8 %400, i8* %403, align 1
  %404 = load i64* %7, align 8
  %405 = mul i64 %404, 2
  %406 = add i64 %405, 1
  %407 = load i8** %6, align 8
  %408 = getelementptr inbounds i8* %407, i64 %406
  %409 = load i8* %408, align 1
  %410 = load i8** %5, align 8
  store i8 %409, i8* %410, align 1
  br label %428

; <label>:411                                     ; preds = %389
  %412 = load i64* %7, align 8
  %413 = mul i64 %412, 4
  %414 = add i64 %413, 0
  %415 = load i8** %6, align 8
  %416 = getelementptr inbounds i8* %415, i64 %414
  %417 = load i8* %416, align 1
  %418 = load i8** %4, align 8
  store i8 %417, i8* %418, align 1
  %419 = load i8** %3, align 8
  store i8 %417, i8* %419, align 1
  %420 = load i8** %2, align 8
  store i8 %417, i8* %420, align 1
  %421 = load i64* %7, align 8
  %422 = mul i64 %421, 4
  %423 = add i64 %422, 2
  %424 = load i8** %6, align 8
  %425 = getelementptr inbounds i8* %424, i64 %423
  %426 = load i8* %425, align 1
  %427 = load i8** %5, align 8
  store i8 %426, i8* %427, align 1
  br label %428

; <label>:428                                     ; preds = %411, %394
  br label %499

; <label>:429                                     ; preds = %384
  %430 = load %struct.LodePNGColorMode** %8, align 8
  %431 = getelementptr inbounds %struct.LodePNGColorMode* %430, i32 0, i32 0
  %432 = load i32* %431, align 4
  %433 = icmp eq i32 %432, 6
  br i1 %433, label %434, label %498

; <label>:434                                     ; preds = %429
  %435 = load %struct.LodePNGColorMode** %8, align 8
  %436 = getelementptr inbounds %struct.LodePNGColorMode* %435, i32 0, i32 1
  %437 = load i32* %436, align 4
  %438 = icmp eq i32 %437, 8
  br i1 %438, label %439, label %468

; <label>:439                                     ; preds = %434
  %440 = load i64* %7, align 8
  %441 = mul i64 %440, 4
  %442 = add i64 %441, 0
  %443 = load i8** %6, align 8
  %444 = getelementptr inbounds i8* %443, i64 %442
  %445 = load i8* %444, align 1
  %446 = load i8** %2, align 8
  store i8 %445, i8* %446, align 1
  %447 = load i64* %7, align 8
  %448 = mul i64 %447, 4
  %449 = add i64 %448, 1
  %450 = load i8** %6, align 8
  %451 = getelementptr inbounds i8* %450, i64 %449
  %452 = load i8* %451, align 1
  %453 = load i8** %3, align 8
  store i8 %452, i8* %453, align 1
  %454 = load i64* %7, align 8
  %455 = mul i64 %454, 4
  %456 = add i64 %455, 2
  %457 = load i8** %6, align 8
  %458 = getelementptr inbounds i8* %457, i64 %456
  %459 = load i8* %458, align 1
  %460 = load i8** %4, align 8
  store i8 %459, i8* %460, align 1
  %461 = load i64* %7, align 8
  %462 = mul i64 %461, 4
  %463 = add i64 %462, 3
  %464 = load i8** %6, align 8
  %465 = getelementptr inbounds i8* %464, i64 %463
  %466 = load i8* %465, align 1
  %467 = load i8** %5, align 8
  store i8 %466, i8* %467, align 1
  br label %497

; <label>:468                                     ; preds = %434
  %469 = load i64* %7, align 8
  %470 = mul i64 %469, 8
  %471 = add i64 %470, 0
  %472 = load i8** %6, align 8
  %473 = getelementptr inbounds i8* %472, i64 %471
  %474 = load i8* %473, align 1
  %475 = load i8** %2, align 8
  store i8 %474, i8* %475, align 1
  %476 = load i64* %7, align 8
  %477 = mul i64 %476, 8
  %478 = add i64 %477, 2
  %479 = load i8** %6, align 8
  %480 = getelementptr inbounds i8* %479, i64 %478
  %481 = load i8* %480, align 1
  %482 = load i8** %3, align 8
  store i8 %481, i8* %482, align 1
  %483 = load i64* %7, align 8
  %484 = mul i64 %483, 8
  %485 = add i64 %484, 4
  %486 = load i8** %6, align 8
  %487 = getelementptr inbounds i8* %486, i64 %485
  %488 = load i8* %487, align 1
  %489 = load i8** %4, align 8
  store i8 %488, i8* %489, align 1
  %490 = load i64* %7, align 8
  %491 = mul i64 %490, 8
  %492 = add i64 %491, 6
  %493 = load i8** %6, align 8
  %494 = getelementptr inbounds i8* %493, i64 %492
  %495 = load i8* %494, align 1
  %496 = load i8** %5, align 8
  store i8 %495, i8* %496, align 1
  br label %497

; <label>:497                                     ; preds = %468, %439
  br label %498

; <label>:498                                     ; preds = %497, %429
  br label %499

; <label>:499                                     ; preds = %498, %428
  br label %500

; <label>:500                                     ; preds = %499, %383
  br label %501

; <label>:501                                     ; preds = %500, %291
  br label %502

; <label>:502                                     ; preds = %501, %131
  store i32 0, i32* %1
  br label %503

; <label>:503                                     ; preds = %502, %331
  %504 = load i32* %1
  ret i32 %504
}

; Function Attrs: nounwind uwtable
define internal i32 @rgba8ToPixel(i8* %out, i64 %i, %struct.LodePNGColorMode* %mode, %struct.ColorTree* %tree, i8 zeroext %r, i8 zeroext %g, i8 zeroext %b, i8 zeroext %a) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8*, align 8
  %3 = alloca i64, align 8
  %4 = alloca %struct.LodePNGColorMode*, align 8
  %5 = alloca %struct.ColorTree*, align 8
  %6 = alloca i8, align 1
  %7 = alloca i8, align 1
  %8 = alloca i8, align 1
  %9 = alloca i8, align 1
  %grey = alloca i8, align 1
  %index = alloca i32, align 4
  %grey1 = alloca i8, align 1
  store i8* %out, i8** %2, align 8
  store i64 %i, i64* %3, align 8
  store %struct.LodePNGColorMode* %mode, %struct.LodePNGColorMode** %4, align 8
  store %struct.ColorTree* %tree, %struct.ColorTree** %5, align 8
  store i8 %r, i8* %6, align 1
  store i8 %g, i8* %7, align 1
  store i8 %b, i8* %8, align 1
  store i8 %a, i8* %9, align 1
  %10 = load %struct.LodePNGColorMode** %4, align 8
  %11 = getelementptr inbounds %struct.LodePNGColorMode* %10, i32 0, i32 0
  %12 = load i32* %11, align 4
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %66

; <label>:14                                      ; preds = %0
  %15 = load i8* %6, align 1
  store i8 %15, i8* %grey, align 1
  %16 = load %struct.LodePNGColorMode** %4, align 8
  %17 = getelementptr inbounds %struct.LodePNGColorMode* %16, i32 0, i32 1
  %18 = load i32* %17, align 4
  %19 = icmp eq i32 %18, 8
  br i1 %19, label %20, label %25

; <label>:20                                      ; preds = %14
  %21 = load i8* %grey, align 1
  %22 = load i64* %3, align 8
  %23 = load i8** %2, align 8
  %24 = getelementptr inbounds i8* %23, i64 %22
  store i8 %21, i8* %24, align 1
  br label %65

; <label>:25                                      ; preds = %14
  %26 = load %struct.LodePNGColorMode** %4, align 8
  %27 = getelementptr inbounds %struct.LodePNGColorMode* %26, i32 0, i32 1
  %28 = load i32* %27, align 4
  %29 = icmp eq i32 %28, 16
  br i1 %29, label %30, label %42

; <label>:30                                      ; preds = %25
  %31 = load i8* %grey, align 1
  %32 = load i64* %3, align 8
  %33 = mul i64 %32, 2
  %34 = add i64 %33, 1
  %35 = load i8** %2, align 8
  %36 = getelementptr inbounds i8* %35, i64 %34
  store i8 %31, i8* %36, align 1
  %37 = load i64* %3, align 8
  %38 = mul i64 %37, 2
  %39 = add i64 %38, 0
  %40 = load i8** %2, align 8
  %41 = getelementptr inbounds i8* %40, i64 %39
  store i8 %31, i8* %41, align 1
  br label %64

; <label>:42                                      ; preds = %25
  %43 = load i8* %grey, align 1
  %44 = zext i8 %43 to i32
  %45 = load %struct.LodePNGColorMode** %4, align 8
  %46 = getelementptr inbounds %struct.LodePNGColorMode* %45, i32 0, i32 1
  %47 = load i32* %46, align 4
  %48 = sub i32 8, %47
  %49 = ashr i32 %44, %48
  %50 = load %struct.LodePNGColorMode** %4, align 8
  %51 = getelementptr inbounds %struct.LodePNGColorMode* %50, i32 0, i32 1
  %52 = load i32* %51, align 4
  %53 = shl i32 1, %52
  %54 = sub nsw i32 %53, 1
  %55 = and i32 %49, %54
  %56 = trunc i32 %55 to i8
  store i8 %56, i8* %grey, align 1
  %57 = load i8** %2, align 8
  %58 = load i64* %3, align 8
  %59 = load %struct.LodePNGColorMode** %4, align 8
  %60 = getelementptr inbounds %struct.LodePNGColorMode* %59, i32 0, i32 1
  %61 = load i32* %60, align 4
  %62 = load i8* %grey, align 1
  %63 = zext i8 %62 to i32
  call void @addColorBits(i8* %57, i64 %58, i32 %61, i32 %63)
  br label %64

; <label>:64                                      ; preds = %42, %30
  br label %65

; <label>:65                                      ; preds = %64, %20
  br label %303

; <label>:66                                      ; preds = %0
  %67 = load %struct.LodePNGColorMode** %4, align 8
  %68 = getelementptr inbounds %struct.LodePNGColorMode* %67, i32 0, i32 0
  %69 = load i32* %68, align 4
  %70 = icmp eq i32 %69, 2
  br i1 %70, label %71, label %130

; <label>:71                                      ; preds = %66
  %72 = load %struct.LodePNGColorMode** %4, align 8
  %73 = getelementptr inbounds %struct.LodePNGColorMode* %72, i32 0, i32 1
  %74 = load i32* %73, align 4
  %75 = icmp eq i32 %74, 8
  br i1 %75, label %76, label %95

; <label>:76                                      ; preds = %71
  %77 = load i8* %6, align 1
  %78 = load i64* %3, align 8
  %79 = mul i64 %78, 3
  %80 = add i64 %79, 0
  %81 = load i8** %2, align 8
  %82 = getelementptr inbounds i8* %81, i64 %80
  store i8 %77, i8* %82, align 1
  %83 = load i8* %7, align 1
  %84 = load i64* %3, align 8
  %85 = mul i64 %84, 3
  %86 = add i64 %85, 1
  %87 = load i8** %2, align 8
  %88 = getelementptr inbounds i8* %87, i64 %86
  store i8 %83, i8* %88, align 1
  %89 = load i8* %8, align 1
  %90 = load i64* %3, align 8
  %91 = mul i64 %90, 3
  %92 = add i64 %91, 2
  %93 = load i8** %2, align 8
  %94 = getelementptr inbounds i8* %93, i64 %92
  store i8 %89, i8* %94, align 1
  br label %129

; <label>:95                                      ; preds = %71
  %96 = load i8* %6, align 1
  %97 = load i64* %3, align 8
  %98 = mul i64 %97, 6
  %99 = add i64 %98, 1
  %100 = load i8** %2, align 8
  %101 = getelementptr inbounds i8* %100, i64 %99
  store i8 %96, i8* %101, align 1
  %102 = load i64* %3, align 8
  %103 = mul i64 %102, 6
  %104 = add i64 %103, 0
  %105 = load i8** %2, align 8
  %106 = getelementptr inbounds i8* %105, i64 %104
  store i8 %96, i8* %106, align 1
  %107 = load i8* %7, align 1
  %108 = load i64* %3, align 8
  %109 = mul i64 %108, 6
  %110 = add i64 %109, 3
  %111 = load i8** %2, align 8
  %112 = getelementptr inbounds i8* %111, i64 %110
  store i8 %107, i8* %112, align 1
  %113 = load i64* %3, align 8
  %114 = mul i64 %113, 6
  %115 = add i64 %114, 2
  %116 = load i8** %2, align 8
  %117 = getelementptr inbounds i8* %116, i64 %115
  store i8 %107, i8* %117, align 1
  %118 = load i8* %8, align 1
  %119 = load i64* %3, align 8
  %120 = mul i64 %119, 6
  %121 = add i64 %120, 5
  %122 = load i8** %2, align 8
  %123 = getelementptr inbounds i8* %122, i64 %121
  store i8 %118, i8* %123, align 1
  %124 = load i64* %3, align 8
  %125 = mul i64 %124, 6
  %126 = add i64 %125, 4
  %127 = load i8** %2, align 8
  %128 = getelementptr inbounds i8* %127, i64 %126
  store i8 %118, i8* %128, align 1
  br label %129

; <label>:129                                     ; preds = %95, %76
  br label %302

; <label>:130                                     ; preds = %66
  %131 = load %struct.LodePNGColorMode** %4, align 8
  %132 = getelementptr inbounds %struct.LodePNGColorMode* %131, i32 0, i32 0
  %133 = load i32* %132, align 4
  %134 = icmp eq i32 %133, 3
  br i1 %134, label %135, label %164

; <label>:135                                     ; preds = %130
  %136 = load %struct.ColorTree** %5, align 8
  %137 = load i8* %6, align 1
  %138 = load i8* %7, align 1
  %139 = load i8* %8, align 1
  %140 = load i8* %9, align 1
  %141 = call i32 @color_tree_get(%struct.ColorTree* %136, i8 zeroext %137, i8 zeroext %138, i8 zeroext %139, i8 zeroext %140)
  store i32 %141, i32* %index, align 4
  %142 = load i32* %index, align 4
  %143 = icmp slt i32 %142, 0
  br i1 %143, label %144, label %145

; <label>:144                                     ; preds = %135
  store i32 82, i32* %1
  br label %304

; <label>:145                                     ; preds = %135
  %146 = load %struct.LodePNGColorMode** %4, align 8
  %147 = getelementptr inbounds %struct.LodePNGColorMode* %146, i32 0, i32 1
  %148 = load i32* %147, align 4
  %149 = icmp eq i32 %148, 8
  br i1 %149, label %150, label %156

; <label>:150                                     ; preds = %145
  %151 = load i32* %index, align 4
  %152 = trunc i32 %151 to i8
  %153 = load i64* %3, align 8
  %154 = load i8** %2, align 8
  %155 = getelementptr inbounds i8* %154, i64 %153
  store i8 %152, i8* %155, align 1
  br label %163

; <label>:156                                     ; preds = %145
  %157 = load i8** %2, align 8
  %158 = load i64* %3, align 8
  %159 = load %struct.LodePNGColorMode** %4, align 8
  %160 = getelementptr inbounds %struct.LodePNGColorMode* %159, i32 0, i32 1
  %161 = load i32* %160, align 4
  %162 = load i32* %index, align 4
  call void @addColorBits(i8* %157, i64 %158, i32 %161, i32 %162)
  br label %163

; <label>:163                                     ; preds = %156, %150
  br label %301

; <label>:164                                     ; preds = %130
  %165 = load %struct.LodePNGColorMode** %4, align 8
  %166 = getelementptr inbounds %struct.LodePNGColorMode* %165, i32 0, i32 0
  %167 = load i32* %166, align 4
  %168 = icmp eq i32 %167, 4
  br i1 %168, label %169, label %218

; <label>:169                                     ; preds = %164
  %170 = load i8* %6, align 1
  store i8 %170, i8* %grey1, align 1
  %171 = load %struct.LodePNGColorMode** %4, align 8
  %172 = getelementptr inbounds %struct.LodePNGColorMode* %171, i32 0, i32 1
  %173 = load i32* %172, align 4
  %174 = icmp eq i32 %173, 8
  br i1 %174, label %175, label %188

; <label>:175                                     ; preds = %169
  %176 = load i8* %grey1, align 1
  %177 = load i64* %3, align 8
  %178 = mul i64 %177, 2
  %179 = add i64 %178, 0
  %180 = load i8** %2, align 8
  %181 = getelementptr inbounds i8* %180, i64 %179
  store i8 %176, i8* %181, align 1
  %182 = load i8* %9, align 1
  %183 = load i64* %3, align 8
  %184 = mul i64 %183, 2
  %185 = add i64 %184, 1
  %186 = load i8** %2, align 8
  %187 = getelementptr inbounds i8* %186, i64 %185
  store i8 %182, i8* %187, align 1
  br label %217

; <label>:188                                     ; preds = %169
  %189 = load %struct.LodePNGColorMode** %4, align 8
  %190 = getelementptr inbounds %struct.LodePNGColorMode* %189, i32 0, i32 1
  %191 = load i32* %190, align 4
  %192 = icmp eq i32 %191, 16
  br i1 %192, label %193, label %216

; <label>:193                                     ; preds = %188
  %194 = load i8* %grey1, align 1
  %195 = load i64* %3, align 8
  %196 = mul i64 %195, 4
  %197 = add i64 %196, 1
  %198 = load i8** %2, align 8
  %199 = getelementptr inbounds i8* %198, i64 %197
  store i8 %194, i8* %199, align 1
  %200 = load i64* %3, align 8
  %201 = mul i64 %200, 4
  %202 = add i64 %201, 0
  %203 = load i8** %2, align 8
  %204 = getelementptr inbounds i8* %203, i64 %202
  store i8 %194, i8* %204, align 1
  %205 = load i8* %9, align 1
  %206 = load i64* %3, align 8
  %207 = mul i64 %206, 4
  %208 = add i64 %207, 3
  %209 = load i8** %2, align 8
  %210 = getelementptr inbounds i8* %209, i64 %208
  store i8 %205, i8* %210, align 1
  %211 = load i64* %3, align 8
  %212 = mul i64 %211, 4
  %213 = add i64 %212, 2
  %214 = load i8** %2, align 8
  %215 = getelementptr inbounds i8* %214, i64 %213
  store i8 %205, i8* %215, align 1
  br label %216

; <label>:216                                     ; preds = %193, %188
  br label %217

; <label>:217                                     ; preds = %216, %175
  br label %300

; <label>:218                                     ; preds = %164
  %219 = load %struct.LodePNGColorMode** %4, align 8
  %220 = getelementptr inbounds %struct.LodePNGColorMode* %219, i32 0, i32 0
  %221 = load i32* %220, align 4
  %222 = icmp eq i32 %221, 6
  br i1 %222, label %223, label %299

; <label>:223                                     ; preds = %218
  %224 = load %struct.LodePNGColorMode** %4, align 8
  %225 = getelementptr inbounds %struct.LodePNGColorMode* %224, i32 0, i32 1
  %226 = load i32* %225, align 4
  %227 = icmp eq i32 %226, 8
  br i1 %227, label %228, label %253

; <label>:228                                     ; preds = %223
  %229 = load i8* %6, align 1
  %230 = load i64* %3, align 8
  %231 = mul i64 %230, 4
  %232 = add i64 %231, 0
  %233 = load i8** %2, align 8
  %234 = getelementptr inbounds i8* %233, i64 %232
  store i8 %229, i8* %234, align 1
  %235 = load i8* %7, align 1
  %236 = load i64* %3, align 8
  %237 = mul i64 %236, 4
  %238 = add i64 %237, 1
  %239 = load i8** %2, align 8
  %240 = getelementptr inbounds i8* %239, i64 %238
  store i8 %235, i8* %240, align 1
  %241 = load i8* %8, align 1
  %242 = load i64* %3, align 8
  %243 = mul i64 %242, 4
  %244 = add i64 %243, 2
  %245 = load i8** %2, align 8
  %246 = getelementptr inbounds i8* %245, i64 %244
  store i8 %241, i8* %246, align 1
  %247 = load i8* %9, align 1
  %248 = load i64* %3, align 8
  %249 = mul i64 %248, 4
  %250 = add i64 %249, 3
  %251 = load i8** %2, align 8
  %252 = getelementptr inbounds i8* %251, i64 %250
  store i8 %247, i8* %252, align 1
  br label %298

; <label>:253                                     ; preds = %223
  %254 = load i8* %6, align 1
  %255 = load i64* %3, align 8
  %256 = mul i64 %255, 8
  %257 = add i64 %256, 1
  %258 = load i8** %2, align 8
  %259 = getelementptr inbounds i8* %258, i64 %257
  store i8 %254, i8* %259, align 1
  %260 = load i64* %3, align 8
  %261 = mul i64 %260, 8
  %262 = add i64 %261, 0
  %263 = load i8** %2, align 8
  %264 = getelementptr inbounds i8* %263, i64 %262
  store i8 %254, i8* %264, align 1
  %265 = load i8* %7, align 1
  %266 = load i64* %3, align 8
  %267 = mul i64 %266, 8
  %268 = add i64 %267, 3
  %269 = load i8** %2, align 8
  %270 = getelementptr inbounds i8* %269, i64 %268
  store i8 %265, i8* %270, align 1
  %271 = load i64* %3, align 8
  %272 = mul i64 %271, 8
  %273 = add i64 %272, 2
  %274 = load i8** %2, align 8
  %275 = getelementptr inbounds i8* %274, i64 %273
  store i8 %265, i8* %275, align 1
  %276 = load i8* %8, align 1
  %277 = load i64* %3, align 8
  %278 = mul i64 %277, 8
  %279 = add i64 %278, 5
  %280 = load i8** %2, align 8
  %281 = getelementptr inbounds i8* %280, i64 %279
  store i8 %276, i8* %281, align 1
  %282 = load i64* %3, align 8
  %283 = mul i64 %282, 8
  %284 = add i64 %283, 4
  %285 = load i8** %2, align 8
  %286 = getelementptr inbounds i8* %285, i64 %284
  store i8 %276, i8* %286, align 1
  %287 = load i8* %9, align 1
  %288 = load i64* %3, align 8
  %289 = mul i64 %288, 8
  %290 = add i64 %289, 7
  %291 = load i8** %2, align 8
  %292 = getelementptr inbounds i8* %291, i64 %290
  store i8 %287, i8* %292, align 1
  %293 = load i64* %3, align 8
  %294 = mul i64 %293, 8
  %295 = add i64 %294, 6
  %296 = load i8** %2, align 8
  %297 = getelementptr inbounds i8* %296, i64 %295
  store i8 %287, i8* %297, align 1
  br label %298

; <label>:298                                     ; preds = %253, %228
  br label %299

; <label>:299                                     ; preds = %298, %218
  br label %300

; <label>:300                                     ; preds = %299, %217
  br label %301

; <label>:301                                     ; preds = %300, %163
  br label %302

; <label>:302                                     ; preds = %301, %129
  br label %303

; <label>:303                                     ; preds = %302, %65
  store i32 0, i32* %1
  br label %304

; <label>:304                                     ; preds = %303, %144
  %305 = load i32* %1
  ret i32 %305
}

; Function Attrs: nounwind uwtable
define internal void @color_tree_cleanup(%struct.ColorTree* %tree) #0 {
  %1 = alloca %struct.ColorTree*, align 8
  %i = alloca i32, align 4
  store %struct.ColorTree* %tree, %struct.ColorTree** %1, align 8
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %28, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 16
  br i1 %4, label %5, label %31

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4
  %7 = sext i32 %6 to i64
  %8 = load %struct.ColorTree** %1, align 8
  %9 = getelementptr inbounds %struct.ColorTree* %8, i32 0, i32 0
  %10 = getelementptr inbounds [16 x %struct.ColorTree*]* %9, i32 0, i64 %7
  %11 = load %struct.ColorTree** %10, align 8
  %12 = icmp ne %struct.ColorTree* %11, null
  br i1 %12, label %13, label %27

; <label>:13                                      ; preds = %5
  %14 = load i32* %i, align 4
  %15 = sext i32 %14 to i64
  %16 = load %struct.ColorTree** %1, align 8
  %17 = getelementptr inbounds %struct.ColorTree* %16, i32 0, i32 0
  %18 = getelementptr inbounds [16 x %struct.ColorTree*]* %17, i32 0, i64 %15
  %19 = load %struct.ColorTree** %18, align 8
  call void @color_tree_cleanup(%struct.ColorTree* %19)
  %20 = load i32* %i, align 4
  %21 = sext i32 %20 to i64
  %22 = load %struct.ColorTree** %1, align 8
  %23 = getelementptr inbounds %struct.ColorTree* %22, i32 0, i32 0
  %24 = getelementptr inbounds [16 x %struct.ColorTree*]* %23, i32 0, i64 %21
  %25 = load %struct.ColorTree** %24, align 8
  %26 = bitcast %struct.ColorTree* %25 to i8*
  call void @lodepng_free(i8* %26)
  br label %27

; <label>:27                                      ; preds = %13, %5
  br label %28

; <label>:28                                      ; preds = %27
  %29 = load i32* %i, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, i32* %i, align 4
  br label %2

; <label>:31                                      ; preds = %2
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @getValueRequiredBits(i16 zeroext %value) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i16, align 2
  store i16 %value, i16* %2, align 2
  %3 = load i16* %2, align 2
  %4 = zext i16 %3 to i32
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %10, label %6

; <label>:6                                       ; preds = %0
  %7 = load i16* %2, align 2
  %8 = zext i16 %7 to i32
  %9 = icmp eq i32 %8, 255
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %6, %0
  store i32 1, i32* %1
  br label %23

; <label>:11                                      ; preds = %6
  %12 = load i16* %2, align 2
  %13 = zext i16 %12 to i32
  %14 = srem i32 %13, 17
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %22

; <label>:16                                      ; preds = %11
  %17 = load i16* %2, align 2
  %18 = zext i16 %17 to i32
  %19 = srem i32 %18, 85
  %20 = icmp eq i32 %19, 0
  %21 = select i1 %20, i32 2, i32 4
  store i32 %21, i32* %1
  br label %23

; <label>:22                                      ; preds = %11
  store i32 8, i32* %1
  br label %23

; <label>:23                                      ; preds = %22, %16, %10
  %24 = load i32* %1
  ret i32 %24
}

; Function Attrs: nounwind uwtable
define i32 @lodepng_auto_choose_color(%struct.LodePNGColorMode* %mode_out, i8* %image, i32 %w, i32 %h, %struct.LodePNGColorMode* %mode_in, i32 %auto_convert) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.LodePNGColorMode*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca %struct.LodePNGColorMode*, align 8
  %7 = alloca i32, align 4
  %profile = alloca %struct.ColorProfile, align 8
  %error = alloca i32, align 4
  %no_nibbles = alloca i32, align 4
  %no_palette = alloca i32, align 4
  %n = alloca i32, align 4
  %palette_ok = alloca i32, align 4
  %palettebits = alloca i32, align 4
  %grey_ok = alloca i32, align 4
  %grey = alloca i32, align 4
  %i = alloca i32, align 4
  %p = alloca i8*, align 8
  %i1 = alloca i64, align 8
  store %struct.LodePNGColorMode* %mode_out, %struct.LodePNGColorMode** %2, align 8
  store i8* %image, i8** %3, align 8
  store i32 %w, i32* %4, align 4
  store i32 %h, i32* %5, align 4
  store %struct.LodePNGColorMode* %mode_in, %struct.LodePNGColorMode** %6, align 8
  store i32 %auto_convert, i32* %7, align 4
  store i32 0, i32* %error, align 4
  %8 = load i32* %7, align 4
  %9 = icmp eq i32 %8, 3
  br i1 %9, label %13, label %10

; <label>:10                                      ; preds = %0
  %11 = load i32* %7, align 4
  %12 = icmp eq i32 %11, 5
  br label %13

; <label>:13                                      ; preds = %10, %0
  %14 = phi i1 [ true, %0 ], [ %12, %10 ]
  %15 = zext i1 %14 to i32
  store i32 %15, i32* %no_nibbles, align 4
  %16 = load i32* %7, align 4
  %17 = icmp eq i32 %16, 4
  br i1 %17, label %21, label %18

; <label>:18                                      ; preds = %13
  %19 = load i32* %7, align 4
  %20 = icmp eq i32 %19, 5
  br label %21

; <label>:21                                      ; preds = %18, %13
  %22 = phi i1 [ true, %13 ], [ %20, %18 ]
  %23 = zext i1 %22 to i32
  store i32 %23, i32* %no_palette, align 4
  %24 = load i32* %7, align 4
  %25 = icmp eq i32 %24, 1
  br i1 %25, label %26, label %38

; <label>:26                                      ; preds = %21
  %27 = load %struct.LodePNGColorMode** %2, align 8
  %28 = getelementptr inbounds %struct.LodePNGColorMode* %27, i32 0, i32 0
  %29 = load i32* %28, align 4
  %30 = icmp ne i32 %29, 6
  br i1 %30, label %31, label %37

; <label>:31                                      ; preds = %26
  %32 = load %struct.LodePNGColorMode** %2, align 8
  %33 = getelementptr inbounds %struct.LodePNGColorMode* %32, i32 0, i32 0
  %34 = load i32* %33, align 4
  %35 = icmp ne i32 %34, 4
  br i1 %35, label %36, label %37

; <label>:36                                      ; preds = %31
  store i32 0, i32* %1
  br label %374

; <label>:37                                      ; preds = %31, %26
  br label %38

; <label>:38                                      ; preds = %37, %21
  %39 = load %struct.LodePNGColorMode** %6, align 8
  call void @color_profile_init(%struct.ColorProfile* %profile, %struct.LodePNGColorMode* %39)
  %40 = load i32* %7, align 4
  %41 = icmp eq i32 %40, 1
  br i1 %41, label %42, label %47

; <label>:42                                      ; preds = %38
  %43 = getelementptr inbounds %struct.ColorProfile* %profile, i32 0, i32 3
  store i8 1, i8* %43, align 1
  %44 = getelementptr inbounds %struct.ColorProfile* %profile, i32 0, i32 16
  store i8 1, i8* %44, align 1
  %45 = getelementptr inbounds %struct.ColorProfile* %profile, i32 0, i32 14
  store i8 1, i8* %45, align 1
  %46 = getelementptr inbounds %struct.ColorProfile* %profile, i32 0, i32 1
  store i8 1, i8* %46, align 1
  br label %47

; <label>:47                                      ; preds = %42, %38
  %48 = load i8** %3, align 8
  %49 = load i32* %4, align 4
  %50 = load i32* %5, align 4
  %51 = mul i32 %49, %50
  %52 = zext i32 %51 to i64
  %53 = load %struct.LodePNGColorMode** %6, align 8
  %54 = call i32 @get_color_profile(%struct.ColorProfile* %profile, i8* %48, i64 %52, %struct.LodePNGColorMode* %53, i32 0)
  store i32 %54, i32* %error, align 4
  %55 = load i32* %error, align 4
  %56 = icmp ne i32 %55, 0
  br i1 %56, label %91, label %57

; <label>:57                                      ; preds = %47
  %58 = load i32* %7, align 4
  %59 = icmp eq i32 %58, 1
  br i1 %59, label %60, label %91

; <label>:60                                      ; preds = %57
  %61 = getelementptr inbounds %struct.ColorProfile* %profile, i32 0, i32 8
  %62 = load i8* %61, align 1
  %63 = icmp ne i8 %62, 0
  br i1 %63, label %90, label %64

; <label>:64                                      ; preds = %60
  %65 = load %struct.LodePNGColorMode** %2, align 8
  %66 = getelementptr inbounds %struct.LodePNGColorMode* %65, i32 0, i32 0
  %67 = load i32* %66, align 4
  %68 = icmp eq i32 %67, 6
  %69 = select i1 %68, i32 2, i32 0
  %70 = load %struct.LodePNGColorMode** %2, align 8
  %71 = getelementptr inbounds %struct.LodePNGColorMode* %70, i32 0, i32 0
  store i32 %69, i32* %71, align 4
  %72 = getelementptr inbounds %struct.ColorProfile* %profile, i32 0, i32 4
  %73 = load i8* %72, align 1
  %74 = icmp ne i8 %73, 0
  br i1 %74, label %75, label %89

; <label>:75                                      ; preds = %64
  %76 = load %struct.LodePNGColorMode** %2, align 8
  %77 = getelementptr inbounds %struct.ColorProfile* %profile, i32 0, i32 5
  %78 = load i16* %77, align 2
  %79 = zext i16 %78 to i32
  %80 = getelementptr inbounds %struct.ColorProfile* %profile, i32 0, i32 6
  %81 = load i16* %80, align 2
  %82 = zext i16 %81 to i32
  %83 = getelementptr inbounds %struct.ColorProfile* %profile, i32 0, i32 7
  %84 = load i16* %83, align 2
  %85 = zext i16 %84 to i32
  %86 = load %struct.LodePNGColorMode** %2, align 8
  %87 = getelementptr inbounds %struct.LodePNGColorMode* %86, i32 0, i32 1
  %88 = load i32* %87, align 4
  call void @setColorKeyFrom16bit(%struct.LodePNGColorMode* %76, i32 %79, i32 %82, i32 %85, i32 %88)
  br label %89

; <label>:89                                      ; preds = %75, %64
  br label %90

; <label>:90                                      ; preds = %89, %60
  br label %324

; <label>:91                                      ; preds = %57, %47
  %92 = load i32* %error, align 4
  %93 = icmp ne i32 %92, 0
  br i1 %93, label %323, label %94

; <label>:94                                      ; preds = %91
  %95 = load i32* %7, align 4
  %96 = icmp ne i32 %95, 1
  br i1 %96, label %97, label %323

; <label>:97                                      ; preds = %94
  %98 = load %struct.LodePNGColorMode** %2, align 8
  %99 = getelementptr inbounds %struct.LodePNGColorMode* %98, i32 0, i32 4
  store i32 0, i32* %99, align 4
  %100 = getelementptr inbounds %struct.ColorProfile* %profile, i32 0, i32 0
  %101 = load i8* %100, align 1
  %102 = icmp ne i8 %101, 0
  br i1 %102, label %103, label %144

; <label>:103                                     ; preds = %97
  %104 = load %struct.LodePNGColorMode** %2, align 8
  %105 = getelementptr inbounds %struct.LodePNGColorMode* %104, i32 0, i32 1
  store i32 16, i32* %105, align 4
  %106 = getelementptr inbounds %struct.ColorProfile* %profile, i32 0, i32 8
  %107 = load i8* %106, align 1
  %108 = icmp ne i8 %107, 0
  br i1 %108, label %109, label %117

; <label>:109                                     ; preds = %103
  %110 = getelementptr inbounds %struct.ColorProfile* %profile, i32 0, i32 2
  %111 = load i8* %110, align 1
  %112 = zext i8 %111 to i32
  %113 = icmp ne i32 %112, 0
  %114 = select i1 %113, i32 6, i32 4
  %115 = load %struct.LodePNGColorMode** %2, align 8
  %116 = getelementptr inbounds %struct.LodePNGColorMode* %115, i32 0, i32 0
  store i32 %114, i32* %116, align 4
  br label %143

; <label>:117                                     ; preds = %103
  %118 = getelementptr inbounds %struct.ColorProfile* %profile, i32 0, i32 2
  %119 = load i8* %118, align 1
  %120 = zext i8 %119 to i32
  %121 = icmp ne i32 %120, 0
  %122 = select i1 %121, i32 2, i32 0
  %123 = load %struct.LodePNGColorMode** %2, align 8
  %124 = getelementptr inbounds %struct.LodePNGColorMode* %123, i32 0, i32 0
  store i32 %122, i32* %124, align 4
  %125 = getelementptr inbounds %struct.ColorProfile* %profile, i32 0, i32 4
  %126 = load i8* %125, align 1
  %127 = icmp ne i8 %126, 0
  br i1 %127, label %128, label %142

; <label>:128                                     ; preds = %117
  %129 = load %struct.LodePNGColorMode** %2, align 8
  %130 = getelementptr inbounds %struct.ColorProfile* %profile, i32 0, i32 5
  %131 = load i16* %130, align 2
  %132 = zext i16 %131 to i32
  %133 = getelementptr inbounds %struct.ColorProfile* %profile, i32 0, i32 6
  %134 = load i16* %133, align 2
  %135 = zext i16 %134 to i32
  %136 = getelementptr inbounds %struct.ColorProfile* %profile, i32 0, i32 7
  %137 = load i16* %136, align 2
  %138 = zext i16 %137 to i32
  %139 = load %struct.LodePNGColorMode** %2, align 8
  %140 = getelementptr inbounds %struct.LodePNGColorMode* %139, i32 0, i32 1
  %141 = load i32* %140, align 4
  call void @setColorKeyFrom16bit(%struct.LodePNGColorMode* %129, i32 %132, i32 %135, i32 %138, i32 %141)
  br label %142

; <label>:142                                     ; preds = %128, %117
  br label %143

; <label>:143                                     ; preds = %142, %109
  br label %322

; <label>:144                                     ; preds = %97
  %145 = getelementptr inbounds %struct.ColorProfile* %profile, i32 0, i32 10
  %146 = load i32* %145, align 4
  store i32 %146, i32* %n, align 4
  %147 = load i32* %no_palette, align 4
  %148 = icmp ne i32 %147, 0
  br i1 %148, label %159, label %149

; <label>:149                                     ; preds = %144
  %150 = load i32* %n, align 4
  %151 = icmp ule i32 %150, 256
  br i1 %151, label %152, label %159

; <label>:152                                     ; preds = %149
  %153 = load i32* %n, align 4
  %154 = mul i32 %153, 2
  %155 = load i32* %4, align 4
  %156 = load i32* %5, align 4
  %157 = mul i32 %155, %156
  %158 = icmp ult i32 %154, %157
  br label %159

; <label>:159                                     ; preds = %152, %149, %144
  %160 = phi i1 [ false, %149 ], [ false, %144 ], [ %158, %152 ]
  %161 = zext i1 %160 to i32
  store i32 %161, i32* %palette_ok, align 4
  %162 = load i32* %n, align 4
  %163 = icmp ule i32 %162, 2
  br i1 %163, label %164, label %165

; <label>:164                                     ; preds = %159
  br label %175

; <label>:165                                     ; preds = %159
  %166 = load i32* %n, align 4
  %167 = icmp ule i32 %166, 4
  br i1 %167, label %168, label %169

; <label>:168                                     ; preds = %165
  br label %173

; <label>:169                                     ; preds = %165
  %170 = load i32* %n, align 4
  %171 = icmp ule i32 %170, 16
  %172 = select i1 %171, i32 4, i32 8
  br label %173

; <label>:173                                     ; preds = %169, %168
  %174 = phi i32 [ 2, %168 ], [ %172, %169 ]
  br label %175

; <label>:175                                     ; preds = %173, %164
  %176 = phi i32 [ 1, %164 ], [ %174, %173 ]
  store i32 %176, i32* %palettebits, align 4
  %177 = getelementptr inbounds %struct.ColorProfile* %profile, i32 0, i32 2
  %178 = load i8* %177, align 1
  %179 = icmp ne i8 %178, 0
  br i1 %179, label %185, label %180

; <label>:180                                     ; preds = %175
  %181 = getelementptr inbounds %struct.ColorProfile* %profile, i32 0, i32 8
  %182 = load i8* %181, align 1
  %183 = icmp ne i8 %182, 0
  %184 = xor i1 %183, true
  br label %185

; <label>:185                                     ; preds = %180, %175
  %186 = phi i1 [ false, %175 ], [ %184, %180 ]
  %187 = zext i1 %186 to i32
  store i32 %187, i32* %grey_ok, align 4
  %188 = load i32* %palette_ok, align 4
  %189 = icmp ne i32 %188, 0
  br i1 %189, label %193, label %190

; <label>:190                                     ; preds = %185
  %191 = load i32* %grey_ok, align 4
  %192 = icmp ne i32 %191, 0
  br i1 %192, label %193, label %280

; <label>:193                                     ; preds = %190, %185
  %194 = load i32* %palette_ok, align 4
  %195 = icmp ne i32 %194, 0
  br i1 %195, label %196, label %204

; <label>:196                                     ; preds = %193
  %197 = load i32* %grey_ok, align 4
  %198 = icmp ne i32 %197, 0
  br i1 %198, label %199, label %226

; <label>:199                                     ; preds = %196
  %200 = getelementptr inbounds %struct.ColorProfile* %profile, i32 0, i32 15
  %201 = load i32* %200, align 4
  %202 = load i32* %palettebits, align 4
  %203 = icmp ule i32 %201, %202
  br i1 %203, label %204, label %226

; <label>:204                                     ; preds = %199, %193
  %205 = getelementptr inbounds %struct.ColorProfile* %profile, i32 0, i32 5
  %206 = load i16* %205, align 2
  %207 = zext i16 %206 to i32
  store i32 %207, i32* %grey, align 4
  %208 = load %struct.LodePNGColorMode** %2, align 8
  %209 = getelementptr inbounds %struct.LodePNGColorMode* %208, i32 0, i32 0
  store i32 0, i32* %209, align 4
  %210 = getelementptr inbounds %struct.ColorProfile* %profile, i32 0, i32 15
  %211 = load i32* %210, align 4
  %212 = load %struct.LodePNGColorMode** %2, align 8
  %213 = getelementptr inbounds %struct.LodePNGColorMode* %212, i32 0, i32 1
  store i32 %211, i32* %213, align 4
  %214 = getelementptr inbounds %struct.ColorProfile* %profile, i32 0, i32 4
  %215 = load i8* %214, align 1
  %216 = icmp ne i8 %215, 0
  br i1 %216, label %217, label %225

; <label>:217                                     ; preds = %204
  %218 = load %struct.LodePNGColorMode** %2, align 8
  %219 = load i32* %grey, align 4
  %220 = load i32* %grey, align 4
  %221 = load i32* %grey, align 4
  %222 = load %struct.LodePNGColorMode** %2, align 8
  %223 = getelementptr inbounds %struct.LodePNGColorMode* %222, i32 0, i32 1
  %224 = load i32* %223, align 4
  call void @setColorKeyFrom16bit(%struct.LodePNGColorMode* %218, i32 %219, i32 %220, i32 %221, i32 %224)
  br label %225

; <label>:225                                     ; preds = %217, %204
  br label %279

; <label>:226                                     ; preds = %199, %196
  %227 = getelementptr inbounds %struct.ColorProfile* %profile, i32 0, i32 12
  %228 = load i8** %227, align 8
  store i8* %228, i8** %p, align 8
  %229 = load %struct.LodePNGColorMode** %2, align 8
  call void @lodepng_palette_clear(%struct.LodePNGColorMode* %229)
  store i32 0, i32* %i, align 4
  br label %230

; <label>:230                                     ; preds = %270, %226
  %231 = load i32* %i, align 4
  %232 = getelementptr inbounds %struct.ColorProfile* %profile, i32 0, i32 10
  %233 = load i32* %232, align 4
  %234 = icmp ult i32 %231, %233
  br i1 %234, label %235, label %273

; <label>:235                                     ; preds = %230
  %236 = load %struct.LodePNGColorMode** %2, align 8
  %237 = load i32* %i, align 4
  %238 = mul i32 %237, 4
  %239 = add i32 %238, 0
  %240 = zext i32 %239 to i64
  %241 = load i8** %p, align 8
  %242 = getelementptr inbounds i8* %241, i64 %240
  %243 = load i8* %242, align 1
  %244 = load i32* %i, align 4
  %245 = mul i32 %244, 4
  %246 = add i32 %245, 1
  %247 = zext i32 %246 to i64
  %248 = load i8** %p, align 8
  %249 = getelementptr inbounds i8* %248, i64 %247
  %250 = load i8* %249, align 1
  %251 = load i32* %i, align 4
  %252 = mul i32 %251, 4
  %253 = add i32 %252, 2
  %254 = zext i32 %253 to i64
  %255 = load i8** %p, align 8
  %256 = getelementptr inbounds i8* %255, i64 %254
  %257 = load i8* %256, align 1
  %258 = load i32* %i, align 4
  %259 = mul i32 %258, 4
  %260 = add i32 %259, 3
  %261 = zext i32 %260 to i64
  %262 = load i8** %p, align 8
  %263 = getelementptr inbounds i8* %262, i64 %261
  %264 = load i8* %263, align 1
  %265 = call i32 @lodepng_palette_add(%struct.LodePNGColorMode* %236, i8 zeroext %243, i8 zeroext %250, i8 zeroext %257, i8 zeroext %264)
  store i32 %265, i32* %error, align 4
  %266 = load i32* %error, align 4
  %267 = icmp ne i32 %266, 0
  br i1 %267, label %268, label %269

; <label>:268                                     ; preds = %235
  br label %273

; <label>:269                                     ; preds = %235
  br label %270

; <label>:270                                     ; preds = %269
  %271 = load i32* %i, align 4
  %272 = add i32 %271, 1
  store i32 %272, i32* %i, align 4
  br label %230

; <label>:273                                     ; preds = %268, %230
  %274 = load %struct.LodePNGColorMode** %2, align 8
  %275 = getelementptr inbounds %struct.LodePNGColorMode* %274, i32 0, i32 0
  store i32 3, i32* %275, align 4
  %276 = load i32* %palettebits, align 4
  %277 = load %struct.LodePNGColorMode** %2, align 8
  %278 = getelementptr inbounds %struct.LodePNGColorMode* %277, i32 0, i32 1
  store i32 %276, i32* %278, align 4
  br label %279

; <label>:279                                     ; preds = %273, %225
  br label %321

; <label>:280                                     ; preds = %190
  %281 = load %struct.LodePNGColorMode** %2, align 8
  %282 = getelementptr inbounds %struct.LodePNGColorMode* %281, i32 0, i32 1
  store i32 8, i32* %282, align 4
  %283 = getelementptr inbounds %struct.ColorProfile* %profile, i32 0, i32 8
  %284 = load i8* %283, align 1
  %285 = icmp ne i8 %284, 0
  br i1 %285, label %286, label %294

; <label>:286                                     ; preds = %280
  %287 = getelementptr inbounds %struct.ColorProfile* %profile, i32 0, i32 2
  %288 = load i8* %287, align 1
  %289 = zext i8 %288 to i32
  %290 = icmp ne i32 %289, 0
  %291 = select i1 %290, i32 6, i32 4
  %292 = load %struct.LodePNGColorMode** %2, align 8
  %293 = getelementptr inbounds %struct.LodePNGColorMode* %292, i32 0, i32 0
  store i32 %291, i32* %293, align 4
  br label %320

; <label>:294                                     ; preds = %280
  %295 = getelementptr inbounds %struct.ColorProfile* %profile, i32 0, i32 2
  %296 = load i8* %295, align 1
  %297 = zext i8 %296 to i32
  %298 = icmp ne i32 %297, 0
  %299 = select i1 %298, i32 2, i32 0
  %300 = load %struct.LodePNGColorMode** %2, align 8
  %301 = getelementptr inbounds %struct.LodePNGColorMode* %300, i32 0, i32 0
  store i32 %299, i32* %301, align 4
  %302 = getelementptr inbounds %struct.ColorProfile* %profile, i32 0, i32 4
  %303 = load i8* %302, align 1
  %304 = icmp ne i8 %303, 0
  br i1 %304, label %305, label %319

; <label>:305                                     ; preds = %294
  %306 = load %struct.LodePNGColorMode** %2, align 8
  %307 = getelementptr inbounds %struct.ColorProfile* %profile, i32 0, i32 5
  %308 = load i16* %307, align 2
  %309 = zext i16 %308 to i32
  %310 = getelementptr inbounds %struct.ColorProfile* %profile, i32 0, i32 6
  %311 = load i16* %310, align 2
  %312 = zext i16 %311 to i32
  %313 = getelementptr inbounds %struct.ColorProfile* %profile, i32 0, i32 7
  %314 = load i16* %313, align 2
  %315 = zext i16 %314 to i32
  %316 = load %struct.LodePNGColorMode** %2, align 8
  %317 = getelementptr inbounds %struct.LodePNGColorMode* %316, i32 0, i32 1
  %318 = load i32* %317, align 4
  call void @setColorKeyFrom16bit(%struct.LodePNGColorMode* %306, i32 %309, i32 %312, i32 %315, i32 %318)
  br label %319

; <label>:319                                     ; preds = %305, %294
  br label %320

; <label>:320                                     ; preds = %319, %286
  br label %321

; <label>:321                                     ; preds = %320, %279
  br label %322

; <label>:322                                     ; preds = %321, %143
  br label %323

; <label>:323                                     ; preds = %322, %94, %91
  br label %324

; <label>:324                                     ; preds = %323, %90
  call void @color_profile_cleanup(%struct.ColorProfile* %profile)
  %325 = load %struct.LodePNGColorMode** %2, align 8
  %326 = getelementptr inbounds %struct.LodePNGColorMode* %325, i32 0, i32 0
  %327 = load i32* %326, align 4
  %328 = icmp eq i32 %327, 3
  br i1 %328, label %329, label %361

; <label>:329                                     ; preds = %324
  %330 = load %struct.LodePNGColorMode** %6, align 8
  %331 = getelementptr inbounds %struct.LodePNGColorMode* %330, i32 0, i32 3
  %332 = load i64* %331, align 8
  %333 = load %struct.LodePNGColorMode** %2, align 8
  %334 = getelementptr inbounds %struct.LodePNGColorMode* %333, i32 0, i32 3
  %335 = load i64* %334, align 8
  %336 = icmp eq i64 %332, %335
  br i1 %336, label %337, label %361

; <label>:337                                     ; preds = %329
  store i64 0, i64* %i1, align 8
  br label %338

; <label>:338                                     ; preds = %357, %337
  %339 = load i64* %i1, align 8
  %340 = load %struct.LodePNGColorMode** %6, align 8
  %341 = getelementptr inbounds %struct.LodePNGColorMode* %340, i32 0, i32 3
  %342 = load i64* %341, align 8
  %343 = mul i64 %342, 4
  %344 = icmp ult i64 %339, %343
  br i1 %344, label %345, label %360

; <label>:345                                     ; preds = %338
  %346 = load i64* %i1, align 8
  %347 = load %struct.LodePNGColorMode** %6, align 8
  %348 = getelementptr inbounds %struct.LodePNGColorMode* %347, i32 0, i32 2
  %349 = load i8** %348, align 8
  %350 = getelementptr inbounds i8* %349, i64 %346
  %351 = load i8* %350, align 1
  %352 = load i64* %i1, align 8
  %353 = load %struct.LodePNGColorMode** %2, align 8
  %354 = getelementptr inbounds %struct.LodePNGColorMode* %353, i32 0, i32 2
  %355 = load i8** %354, align 8
  %356 = getelementptr inbounds i8* %355, i64 %352
  store i8 %351, i8* %356, align 1
  br label %357

; <label>:357                                     ; preds = %345
  %358 = load i64* %i1, align 8
  %359 = add i64 %358, 1
  store i64 %359, i64* %i1, align 8
  br label %338

; <label>:360                                     ; preds = %338
  br label %361

; <label>:361                                     ; preds = %360, %329, %324
  %362 = load i32* %no_nibbles, align 4
  %363 = icmp ne i32 %362, 0
  br i1 %363, label %364, label %372

; <label>:364                                     ; preds = %361
  %365 = load %struct.LodePNGColorMode** %2, align 8
  %366 = getelementptr inbounds %struct.LodePNGColorMode* %365, i32 0, i32 1
  %367 = load i32* %366, align 4
  %368 = icmp ult i32 %367, 8
  br i1 %368, label %369, label %372

; <label>:369                                     ; preds = %364
  %370 = load %struct.LodePNGColorMode** %2, align 8
  %371 = getelementptr inbounds %struct.LodePNGColorMode* %370, i32 0, i32 1
  store i32 8, i32* %371, align 4
  br label %372

; <label>:372                                     ; preds = %369, %364, %361
  %373 = load i32* %error, align 4
  store i32 %373, i32* %1
  br label %374

; <label>:374                                     ; preds = %372, %36
  %375 = load i32* %1
  ret i32 %375
}

; Function Attrs: nounwind uwtable
define internal void @color_profile_init(%struct.ColorProfile* %profile, %struct.LodePNGColorMode* %mode) #0 {
  %1 = alloca %struct.ColorProfile*, align 8
  %2 = alloca %struct.LodePNGColorMode*, align 8
  %bpp = alloca i32, align 4
  store %struct.ColorProfile* %profile, %struct.ColorProfile** %1, align 8
  store %struct.LodePNGColorMode* %mode, %struct.LodePNGColorMode** %2, align 8
  %3 = load %struct.ColorProfile** %1, align 8
  %4 = getelementptr inbounds %struct.ColorProfile* %3, i32 0, i32 0
  store i8 0, i8* %4, align 1
  %5 = load %struct.LodePNGColorMode** %2, align 8
  %6 = getelementptr inbounds %struct.LodePNGColorMode* %5, i32 0, i32 1
  %7 = load i32* %6, align 4
  %8 = icmp eq i32 %7, 16
  %9 = select i1 %8, i32 0, i32 1
  %10 = trunc i32 %9 to i8
  %11 = load %struct.ColorProfile** %1, align 8
  %12 = getelementptr inbounds %struct.ColorProfile* %11, i32 0, i32 1
  store i8 %10, i8* %12, align 1
  %13 = load %struct.ColorProfile** %1, align 8
  %14 = getelementptr inbounds %struct.ColorProfile* %13, i32 0, i32 2
  store i8 0, i8* %14, align 1
  %15 = load %struct.LodePNGColorMode** %2, align 8
  %16 = call i32 @lodepng_is_greyscale_type(%struct.LodePNGColorMode* %15)
  %17 = icmp ne i32 %16, 0
  %18 = select i1 %17, i32 1, i32 0
  %19 = trunc i32 %18 to i8
  %20 = load %struct.ColorProfile** %1, align 8
  %21 = getelementptr inbounds %struct.ColorProfile* %20, i32 0, i32 3
  store i8 %19, i8* %21, align 1
  %22 = load %struct.ColorProfile** %1, align 8
  %23 = getelementptr inbounds %struct.ColorProfile* %22, i32 0, i32 4
  store i8 0, i8* %23, align 1
  %24 = load %struct.ColorProfile** %1, align 8
  %25 = getelementptr inbounds %struct.ColorProfile* %24, i32 0, i32 8
  store i8 0, i8* %25, align 1
  %26 = load %struct.LodePNGColorMode** %2, align 8
  %27 = call i32 @lodepng_can_have_alpha(%struct.LodePNGColorMode* %26)
  %28 = icmp ne i32 %27, 0
  %29 = select i1 %28, i32 0, i32 1
  %30 = trunc i32 %29 to i8
  %31 = load %struct.ColorProfile** %1, align 8
  %32 = getelementptr inbounds %struct.ColorProfile* %31, i32 0, i32 9
  store i8 %30, i8* %32, align 1
  %33 = load %struct.ColorProfile** %1, align 8
  %34 = getelementptr inbounds %struct.ColorProfile* %33, i32 0, i32 10
  store i32 0, i32* %34, align 4
  %35 = load %struct.ColorProfile** %1, align 8
  %36 = getelementptr inbounds %struct.ColorProfile* %35, i32 0, i32 11
  call void @color_tree_init(%struct.ColorTree* %36)
  %37 = call i8* @lodepng_malloc(i64 1024)
  %38 = load %struct.ColorProfile** %1, align 8
  %39 = getelementptr inbounds %struct.ColorProfile* %38, i32 0, i32 12
  store i8* %37, i8** %39, align 8
  %40 = load %struct.ColorProfile** %1, align 8
  %41 = getelementptr inbounds %struct.ColorProfile* %40, i32 0, i32 13
  store i32 257, i32* %41, align 4
  %42 = load %struct.LodePNGColorMode** %2, align 8
  %43 = call i32 @lodepng_get_bpp(%struct.LodePNGColorMode* %42)
  %44 = icmp ule i32 %43, 8
  br i1 %44, label %45, label %65

; <label>:45                                      ; preds = %0
  %46 = load %struct.LodePNGColorMode** %2, align 8
  %47 = call i32 @lodepng_get_bpp(%struct.LodePNGColorMode* %46)
  store i32 %47, i32* %bpp, align 4
  %48 = load i32* %bpp, align 4
  %49 = icmp eq i32 %48, 1
  br i1 %49, label %50, label %51

; <label>:50                                      ; preds = %45
  br label %61

; <label>:51                                      ; preds = %45
  %52 = load i32* %bpp, align 4
  %53 = icmp eq i32 %52, 2
  br i1 %53, label %54, label %55

; <label>:54                                      ; preds = %51
  br label %59

; <label>:55                                      ; preds = %51
  %56 = load i32* %bpp, align 4
  %57 = icmp eq i32 %56, 4
  %58 = select i1 %57, i32 16, i32 256
  br label %59

; <label>:59                                      ; preds = %55, %54
  %60 = phi i32 [ 4, %54 ], [ %58, %55 ]
  br label %61

; <label>:61                                      ; preds = %59, %50
  %62 = phi i32 [ 2, %50 ], [ %60, %59 ]
  %63 = load %struct.ColorProfile** %1, align 8
  %64 = getelementptr inbounds %struct.ColorProfile* %63, i32 0, i32 13
  store i32 %62, i32* %64, align 4
  br label %65

; <label>:65                                      ; preds = %61, %0
  %66 = load %struct.ColorProfile** %1, align 8
  %67 = getelementptr inbounds %struct.ColorProfile* %66, i32 0, i32 14
  store i8 0, i8* %67, align 1
  %68 = load %struct.ColorProfile** %1, align 8
  %69 = getelementptr inbounds %struct.ColorProfile* %68, i32 0, i32 15
  store i32 1, i32* %69, align 4
  %70 = load %struct.LodePNGColorMode** %2, align 8
  %71 = call i32 @lodepng_get_bpp(%struct.LodePNGColorMode* %70)
  %72 = icmp eq i32 %71, 1
  %73 = select i1 %72, i32 1, i32 0
  %74 = trunc i32 %73 to i8
  %75 = load %struct.ColorProfile** %1, align 8
  %76 = getelementptr inbounds %struct.ColorProfile* %75, i32 0, i32 16
  store i8 %74, i8* %76, align 1
  ret void
}

; Function Attrs: nounwind uwtable
define internal i32 @get_color_profile(%struct.ColorProfile* %profile, i8* %in, i64 %numpixels, %struct.LodePNGColorMode* %mode, i32 %fix_png) #0 {
  %1 = alloca %struct.ColorProfile*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i64, align 8
  %4 = alloca %struct.LodePNGColorMode*, align 8
  %5 = alloca i32, align 4
  %error = alloca i32, align 4
  %i = alloca i64, align 8
  %r = alloca i16, align 2
  %g = alloca i16, align 2
  %b = alloca i16, align 2
  %a = alloca i16, align 2
  %bits = alloca i32, align 4
  %p = alloca i8*, align 8
  %i1 = alloca i32, align 4
  %r2 = alloca i8, align 1
  %g3 = alloca i8, align 1
  %b4 = alloca i8, align 1
  %a5 = alloca i8, align 1
  %bits6 = alloca i32, align 4
  %p7 = alloca i8*, align 8
  %i8 = alloca i32, align 4
  store %struct.ColorProfile* %profile, %struct.ColorProfile** %1, align 8
  store i8* %in, i8** %2, align 8
  store i64 %numpixels, i64* %3, align 8
  store %struct.LodePNGColorMode* %mode, %struct.LodePNGColorMode** %4, align 8
  store i32 %fix_png, i32* %5, align 4
  store i32 0, i32* %error, align 4
  %6 = load %struct.LodePNGColorMode** %4, align 8
  %7 = getelementptr inbounds %struct.LodePNGColorMode* %6, i32 0, i32 1
  %8 = load i32* %7, align 4
  %9 = icmp eq i32 %8, 16
  br i1 %9, label %10, label %365

; <label>:10                                      ; preds = %0
  store i64 0, i64* %i, align 8
  br label %11

; <label>:11                                      ; preds = %361, %10
  %12 = load i64* %i, align 8
  %13 = load i64* %3, align 8
  %14 = icmp ult i64 %12, %13
  br i1 %14, label %15, label %364

; <label>:15                                      ; preds = %11
  %16 = load i8** %2, align 8
  %17 = load i64* %i, align 8
  %18 = load %struct.LodePNGColorMode** %4, align 8
  %19 = call i32 @getPixelColorRGBA16(i16* %r, i16* %g, i16* %b, i16* %a, i8* %16, i64 %17, %struct.LodePNGColorMode* %18)
  store i32 %19, i32* %error, align 4
  %20 = load i32* %error, align 4
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %23

; <label>:22                                      ; preds = %15
  br label %364

; <label>:23                                      ; preds = %15
  %24 = load %struct.ColorProfile** %1, align 8
  %25 = getelementptr inbounds %struct.ColorProfile* %24, i32 0, i32 1
  %26 = load i8* %25, align 1
  %27 = icmp ne i8 %26, 0
  br i1 %27, label %64, label %28

; <label>:28                                      ; preds = %23
  %29 = load i16* %r, align 2
  %30 = zext i16 %29 to i32
  %31 = and i32 %30, 255
  %32 = load i16* %r, align 2
  %33 = zext i16 %32 to i32
  %34 = ashr i32 %33, 8
  %35 = and i32 %34, 255
  %36 = icmp ne i32 %31, %35
  br i1 %36, label %55, label %37

; <label>:37                                      ; preds = %28
  %38 = load i16* %g, align 2
  %39 = zext i16 %38 to i32
  %40 = and i32 %39, 255
  %41 = load i16* %g, align 2
  %42 = zext i16 %41 to i32
  %43 = ashr i32 %42, 8
  %44 = and i32 %43, 255
  %45 = icmp ne i32 %40, %44
  br i1 %45, label %55, label %46

; <label>:46                                      ; preds = %37
  %47 = load i16* %b, align 2
  %48 = zext i16 %47 to i32
  %49 = and i32 %48, 255
  %50 = load i16* %b, align 2
  %51 = zext i16 %50 to i32
  %52 = ashr i32 %51, 8
  %53 = and i32 %52, 255
  %54 = icmp ne i32 %49, %53
  br i1 %54, label %55, label %64

; <label>:55                                      ; preds = %46, %37, %28
  %56 = load %struct.ColorProfile** %1, align 8
  %57 = getelementptr inbounds %struct.ColorProfile* %56, i32 0, i32 0
  store i8 1, i8* %57, align 1
  %58 = load %struct.ColorProfile** %1, align 8
  %59 = getelementptr inbounds %struct.ColorProfile* %58, i32 0, i32 1
  store i8 1, i8* %59, align 1
  %60 = load %struct.ColorProfile** %1, align 8
  %61 = getelementptr inbounds %struct.ColorProfile* %60, i32 0, i32 16
  store i8 1, i8* %61, align 1
  %62 = load %struct.ColorProfile** %1, align 8
  %63 = getelementptr inbounds %struct.ColorProfile* %62, i32 0, i32 14
  store i8 1, i8* %63, align 1
  br label %64

; <label>:64                                      ; preds = %55, %46, %23
  %65 = load %struct.ColorProfile** %1, align 8
  %66 = getelementptr inbounds %struct.ColorProfile* %65, i32 0, i32 3
  %67 = load i8* %66, align 1
  %68 = icmp ne i8 %67, 0
  br i1 %68, label %88, label %69

; <label>:69                                      ; preds = %64
  %70 = load i16* %r, align 2
  %71 = zext i16 %70 to i32
  %72 = load i16* %g, align 2
  %73 = zext i16 %72 to i32
  %74 = icmp ne i32 %71, %73
  br i1 %74, label %81, label %75

; <label>:75                                      ; preds = %69
  %76 = load i16* %r, align 2
  %77 = zext i16 %76 to i32
  %78 = load i16* %b, align 2
  %79 = zext i16 %78 to i32
  %80 = icmp ne i32 %77, %79
  br i1 %80, label %81, label %88

; <label>:81                                      ; preds = %75, %69
  %82 = load %struct.ColorProfile** %1, align 8
  %83 = getelementptr inbounds %struct.ColorProfile* %82, i32 0, i32 2
  store i8 1, i8* %83, align 1
  %84 = load %struct.ColorProfile** %1, align 8
  %85 = getelementptr inbounds %struct.ColorProfile* %84, i32 0, i32 3
  store i8 1, i8* %85, align 1
  %86 = load %struct.ColorProfile** %1, align 8
  %87 = getelementptr inbounds %struct.ColorProfile* %86, i32 0, i32 16
  store i8 1, i8* %87, align 1
  br label %88

; <label>:88                                      ; preds = %81, %75, %64
  %89 = load %struct.ColorProfile** %1, align 8
  %90 = getelementptr inbounds %struct.ColorProfile* %89, i32 0, i32 9
  %91 = load i8* %90, align 1
  %92 = icmp ne i8 %91, 0
  br i1 %92, label %165, label %93

; <label>:93                                      ; preds = %88
  %94 = load i16* %a, align 2
  %95 = zext i16 %94 to i32
  %96 = icmp ne i32 %95, 65535
  br i1 %96, label %97, label %165

; <label>:97                                      ; preds = %93
  %98 = load i16* %a, align 2
  %99 = zext i16 %98 to i32
  %100 = icmp eq i32 %99, 0
  br i1 %100, label %101, label %157

; <label>:101                                     ; preds = %97
  %102 = load i64* %3, align 8
  %103 = icmp ugt i64 %102, 16
  br i1 %103, label %104, label %157

; <label>:104                                     ; preds = %101
  %105 = load %struct.ColorProfile** %1, align 8
  %106 = getelementptr inbounds %struct.ColorProfile* %105, i32 0, i32 4
  %107 = load i8* %106, align 1
  %108 = zext i8 %107 to i32
  %109 = icmp ne i32 %108, 0
  br i1 %109, label %110, label %134

; <label>:110                                     ; preds = %104
  %111 = load i16* %r, align 2
  %112 = zext i16 %111 to i32
  %113 = load %struct.ColorProfile** %1, align 8
  %114 = getelementptr inbounds %struct.ColorProfile* %113, i32 0, i32 5
  %115 = load i16* %114, align 2
  %116 = zext i16 %115 to i32
  %117 = icmp ne i32 %112, %116
  br i1 %117, label %157, label %118

; <label>:118                                     ; preds = %110
  %119 = load i16* %g, align 2
  %120 = zext i16 %119 to i32
  %121 = load %struct.ColorProfile** %1, align 8
  %122 = getelementptr inbounds %struct.ColorProfile* %121, i32 0, i32 6
  %123 = load i16* %122, align 2
  %124 = zext i16 %123 to i32
  %125 = icmp ne i32 %120, %124
  br i1 %125, label %157, label %126

; <label>:126                                     ; preds = %118
  %127 = load i16* %b, align 2
  %128 = zext i16 %127 to i32
  %129 = load %struct.ColorProfile** %1, align 8
  %130 = getelementptr inbounds %struct.ColorProfile* %129, i32 0, i32 7
  %131 = load i16* %130, align 2
  %132 = zext i16 %131 to i32
  %133 = icmp ne i32 %128, %132
  br i1 %133, label %157, label %134

; <label>:134                                     ; preds = %126, %104
  %135 = load %struct.ColorProfile** %1, align 8
  %136 = getelementptr inbounds %struct.ColorProfile* %135, i32 0, i32 8
  %137 = load i8* %136, align 1
  %138 = icmp ne i8 %137, 0
  br i1 %138, label %156, label %139

; <label>:139                                     ; preds = %134
  %140 = load %struct.ColorProfile** %1, align 8
  %141 = getelementptr inbounds %struct.ColorProfile* %140, i32 0, i32 4
  %142 = load i8* %141, align 1
  %143 = icmp ne i8 %142, 0
  br i1 %143, label %156, label %144

; <label>:144                                     ; preds = %139
  %145 = load %struct.ColorProfile** %1, align 8
  %146 = getelementptr inbounds %struct.ColorProfile* %145, i32 0, i32 4
  store i8 1, i8* %146, align 1
  %147 = load i16* %r, align 2
  %148 = load %struct.ColorProfile** %1, align 8
  %149 = getelementptr inbounds %struct.ColorProfile* %148, i32 0, i32 5
  store i16 %147, i16* %149, align 2
  %150 = load i16* %g, align 2
  %151 = load %struct.ColorProfile** %1, align 8
  %152 = getelementptr inbounds %struct.ColorProfile* %151, i32 0, i32 6
  store i16 %150, i16* %152, align 2
  %153 = load i16* %b, align 2
  %154 = load %struct.ColorProfile** %1, align 8
  %155 = getelementptr inbounds %struct.ColorProfile* %154, i32 0, i32 7
  store i16 %153, i16* %155, align 2
  br label %156

; <label>:156                                     ; preds = %144, %139, %134
  br label %164

; <label>:157                                     ; preds = %126, %118, %110, %101, %97
  %158 = load %struct.ColorProfile** %1, align 8
  %159 = getelementptr inbounds %struct.ColorProfile* %158, i32 0, i32 8
  store i8 1, i8* %159, align 1
  %160 = load %struct.ColorProfile** %1, align 8
  %161 = getelementptr inbounds %struct.ColorProfile* %160, i32 0, i32 9
  store i8 1, i8* %161, align 1
  %162 = load %struct.ColorProfile** %1, align 8
  %163 = getelementptr inbounds %struct.ColorProfile* %162, i32 0, i32 16
  store i8 1, i8* %163, align 1
  br label %164

; <label>:164                                     ; preds = %157, %156
  br label %165

; <label>:165                                     ; preds = %164, %93, %88
  %166 = load %struct.ColorProfile** %1, align 8
  %167 = getelementptr inbounds %struct.ColorProfile* %166, i32 0, i32 9
  %168 = load i8* %167, align 1
  %169 = icmp ne i8 %168, 0
  br i1 %169, label %211, label %170

; <label>:170                                     ; preds = %165
  %171 = load i16* %a, align 2
  %172 = zext i16 %171 to i32
  %173 = icmp eq i32 %172, 65535
  br i1 %173, label %174, label %211

; <label>:174                                     ; preds = %170
  %175 = load %struct.ColorProfile** %1, align 8
  %176 = getelementptr inbounds %struct.ColorProfile* %175, i32 0, i32 4
  %177 = load i8* %176, align 1
  %178 = zext i8 %177 to i32
  %179 = icmp ne i32 %178, 0
  br i1 %179, label %180, label %211

; <label>:180                                     ; preds = %174
  %181 = load i16* %r, align 2
  %182 = zext i16 %181 to i32
  %183 = load %struct.ColorProfile** %1, align 8
  %184 = getelementptr inbounds %struct.ColorProfile* %183, i32 0, i32 5
  %185 = load i16* %184, align 2
  %186 = zext i16 %185 to i32
  %187 = icmp eq i32 %182, %186
  br i1 %187, label %188, label %211

; <label>:188                                     ; preds = %180
  %189 = load i16* %g, align 2
  %190 = zext i16 %189 to i32
  %191 = load %struct.ColorProfile** %1, align 8
  %192 = getelementptr inbounds %struct.ColorProfile* %191, i32 0, i32 6
  %193 = load i16* %192, align 2
  %194 = zext i16 %193 to i32
  %195 = icmp eq i32 %190, %194
  br i1 %195, label %196, label %211

; <label>:196                                     ; preds = %188
  %197 = load i16* %b, align 2
  %198 = zext i16 %197 to i32
  %199 = load %struct.ColorProfile** %1, align 8
  %200 = getelementptr inbounds %struct.ColorProfile* %199, i32 0, i32 7
  %201 = load i16* %200, align 2
  %202 = zext i16 %201 to i32
  %203 = icmp eq i32 %198, %202
  br i1 %203, label %204, label %211

; <label>:204                                     ; preds = %196
  %205 = load %struct.ColorProfile** %1, align 8
  %206 = getelementptr inbounds %struct.ColorProfile* %205, i32 0, i32 8
  store i8 1, i8* %206, align 1
  %207 = load %struct.ColorProfile** %1, align 8
  %208 = getelementptr inbounds %struct.ColorProfile* %207, i32 0, i32 9
  store i8 1, i8* %208, align 1
  %209 = load %struct.ColorProfile** %1, align 8
  %210 = getelementptr inbounds %struct.ColorProfile* %209, i32 0, i32 16
  store i8 1, i8* %210, align 1
  br label %211

; <label>:211                                     ; preds = %204, %196, %188, %180, %174, %170, %165
  %212 = load %struct.ColorProfile** %1, align 8
  %213 = getelementptr inbounds %struct.ColorProfile* %212, i32 0, i32 16
  %214 = load i8* %213, align 1
  %215 = icmp ne i8 %214, 0
  br i1 %215, label %237, label %216

; <label>:216                                     ; preds = %211
  %217 = load i16* %r, align 2
  %218 = call i32 @getValueRequiredBits(i16 zeroext %217)
  store i32 %218, i32* %bits, align 4
  %219 = load i32* %bits, align 4
  %220 = load %struct.ColorProfile** %1, align 8
  %221 = getelementptr inbounds %struct.ColorProfile* %220, i32 0, i32 15
  %222 = load i32* %221, align 4
  %223 = icmp ugt i32 %219, %222
  br i1 %223, label %224, label %228

; <label>:224                                     ; preds = %216
  %225 = load i32* %bits, align 4
  %226 = load %struct.ColorProfile** %1, align 8
  %227 = getelementptr inbounds %struct.ColorProfile* %226, i32 0, i32 15
  store i32 %225, i32* %227, align 4
  br label %228

; <label>:228                                     ; preds = %224, %216
  %229 = load %struct.ColorProfile** %1, align 8
  %230 = getelementptr inbounds %struct.ColorProfile* %229, i32 0, i32 15
  %231 = load i32* %230, align 4
  %232 = icmp uge i32 %231, 8
  br i1 %232, label %233, label %236

; <label>:233                                     ; preds = %228
  %234 = load %struct.ColorProfile** %1, align 8
  %235 = getelementptr inbounds %struct.ColorProfile* %234, i32 0, i32 16
  store i8 1, i8* %235, align 1
  br label %236

; <label>:236                                     ; preds = %233, %228
  br label %237

; <label>:237                                     ; preds = %236, %211
  %238 = load %struct.ColorProfile** %1, align 8
  %239 = getelementptr inbounds %struct.ColorProfile* %238, i32 0, i32 14
  %240 = load i8* %239, align 1
  %241 = icmp ne i8 %240, 0
  br i1 %241, label %329, label %242

; <label>:242                                     ; preds = %237
  %243 = load %struct.ColorProfile** %1, align 8
  %244 = getelementptr inbounds %struct.ColorProfile* %243, i32 0, i32 11
  %245 = load i16* %r, align 2
  %246 = trunc i16 %245 to i8
  %247 = load i16* %g, align 2
  %248 = trunc i16 %247 to i8
  %249 = load i16* %b, align 2
  %250 = trunc i16 %249 to i8
  %251 = load i16* %a, align 2
  %252 = trunc i16 %251 to i8
  %253 = call i32 @color_tree_has(%struct.ColorTree* %244, i8 zeroext %246, i8 zeroext %248, i8 zeroext %250, i8 zeroext %252)
  %254 = icmp ne i32 %253, 0
  br i1 %254, label %328, label %255

; <label>:255                                     ; preds = %242
  %256 = load %struct.ColorProfile** %1, align 8
  %257 = getelementptr inbounds %struct.ColorProfile* %256, i32 0, i32 11
  %258 = load i16* %r, align 2
  %259 = trunc i16 %258 to i8
  %260 = load i16* %g, align 2
  %261 = trunc i16 %260 to i8
  %262 = load i16* %b, align 2
  %263 = trunc i16 %262 to i8
  %264 = load i16* %a, align 2
  %265 = trunc i16 %264 to i8
  %266 = load %struct.ColorProfile** %1, align 8
  %267 = getelementptr inbounds %struct.ColorProfile* %266, i32 0, i32 10
  %268 = load i32* %267, align 4
  call void @color_tree_add(%struct.ColorTree* %257, i8 zeroext %259, i8 zeroext %261, i8 zeroext %263, i8 zeroext %265, i32 %268)
  %269 = load %struct.ColorProfile** %1, align 8
  %270 = getelementptr inbounds %struct.ColorProfile* %269, i32 0, i32 10
  %271 = load i32* %270, align 4
  %272 = icmp ult i32 %271, 256
  br i1 %272, label %273, label %312

; <label>:273                                     ; preds = %255
  %274 = load %struct.ColorProfile** %1, align 8
  %275 = getelementptr inbounds %struct.ColorProfile* %274, i32 0, i32 12
  %276 = load i8** %275, align 8
  store i8* %276, i8** %p, align 8
  %277 = load %struct.ColorProfile** %1, align 8
  %278 = getelementptr inbounds %struct.ColorProfile* %277, i32 0, i32 10
  %279 = load i32* %278, align 4
  store i32 %279, i32* %i1, align 4
  %280 = load i16* %r, align 2
  %281 = trunc i16 %280 to i8
  %282 = load i32* %i1, align 4
  %283 = mul i32 %282, 4
  %284 = add i32 %283, 0
  %285 = zext i32 %284 to i64
  %286 = load i8** %p, align 8
  %287 = getelementptr inbounds i8* %286, i64 %285
  store i8 %281, i8* %287, align 1
  %288 = load i16* %g, align 2
  %289 = trunc i16 %288 to i8
  %290 = load i32* %i1, align 4
  %291 = mul i32 %290, 4
  %292 = add i32 %291, 1
  %293 = zext i32 %292 to i64
  %294 = load i8** %p, align 8
  %295 = getelementptr inbounds i8* %294, i64 %293
  store i8 %289, i8* %295, align 1
  %296 = load i16* %b, align 2
  %297 = trunc i16 %296 to i8
  %298 = load i32* %i1, align 4
  %299 = mul i32 %298, 4
  %300 = add i32 %299, 2
  %301 = zext i32 %300 to i64
  %302 = load i8** %p, align 8
  %303 = getelementptr inbounds i8* %302, i64 %301
  store i8 %297, i8* %303, align 1
  %304 = load i16* %a, align 2
  %305 = trunc i16 %304 to i8
  %306 = load i32* %i1, align 4
  %307 = mul i32 %306, 4
  %308 = add i32 %307, 3
  %309 = zext i32 %308 to i64
  %310 = load i8** %p, align 8
  %311 = getelementptr inbounds i8* %310, i64 %309
  store i8 %305, i8* %311, align 1
  br label %312

; <label>:312                                     ; preds = %273, %255
  %313 = load %struct.ColorProfile** %1, align 8
  %314 = getelementptr inbounds %struct.ColorProfile* %313, i32 0, i32 10
  %315 = load i32* %314, align 4
  %316 = add i32 %315, 1
  store i32 %316, i32* %314, align 4
  %317 = load %struct.ColorProfile** %1, align 8
  %318 = getelementptr inbounds %struct.ColorProfile* %317, i32 0, i32 10
  %319 = load i32* %318, align 4
  %320 = load %struct.ColorProfile** %1, align 8
  %321 = getelementptr inbounds %struct.ColorProfile* %320, i32 0, i32 13
  %322 = load i32* %321, align 4
  %323 = icmp uge i32 %319, %322
  br i1 %323, label %324, label %327

; <label>:324                                     ; preds = %312
  %325 = load %struct.ColorProfile** %1, align 8
  %326 = getelementptr inbounds %struct.ColorProfile* %325, i32 0, i32 14
  store i8 1, i8* %326, align 1
  br label %327

; <label>:327                                     ; preds = %324, %312
  br label %328

; <label>:328                                     ; preds = %327, %242
  br label %329

; <label>:329                                     ; preds = %328, %237
  %330 = load %struct.ColorProfile** %1, align 8
  %331 = getelementptr inbounds %struct.ColorProfile* %330, i32 0, i32 9
  %332 = load i8* %331, align 1
  %333 = zext i8 %332 to i32
  %334 = icmp ne i32 %333, 0
  br i1 %334, label %335, label %360

; <label>:335                                     ; preds = %329
  %336 = load %struct.ColorProfile** %1, align 8
  %337 = getelementptr inbounds %struct.ColorProfile* %336, i32 0, i32 14
  %338 = load i8* %337, align 1
  %339 = zext i8 %338 to i32
  %340 = icmp ne i32 %339, 0
  br i1 %340, label %341, label %360

; <label>:341                                     ; preds = %335
  %342 = load %struct.ColorProfile** %1, align 8
  %343 = getelementptr inbounds %struct.ColorProfile* %342, i32 0, i32 3
  %344 = load i8* %343, align 1
  %345 = zext i8 %344 to i32
  %346 = icmp ne i32 %345, 0
  br i1 %346, label %347, label %360

; <label>:347                                     ; preds = %341
  %348 = load %struct.ColorProfile** %1, align 8
  %349 = getelementptr inbounds %struct.ColorProfile* %348, i32 0, i32 1
  %350 = load i8* %349, align 1
  %351 = zext i8 %350 to i32
  %352 = icmp ne i32 %351, 0
  br i1 %352, label %353, label %360

; <label>:353                                     ; preds = %347
  %354 = load %struct.ColorProfile** %1, align 8
  %355 = getelementptr inbounds %struct.ColorProfile* %354, i32 0, i32 16
  %356 = load i8* %355, align 1
  %357 = zext i8 %356 to i32
  %358 = icmp ne i32 %357, 0
  br i1 %358, label %359, label %360

; <label>:359                                     ; preds = %353
  br label %364

; <label>:360                                     ; preds = %353, %347, %341, %335, %329
  br label %361

; <label>:361                                     ; preds = %360
  %362 = load i64* %i, align 8
  %363 = add i64 %362, 1
  store i64 %363, i64* %i, align 8
  br label %11

; <label>:364                                     ; preds = %359, %22, %11
  br label %658

; <label>:365                                     ; preds = %0
  store i64 0, i64* %i, align 8
  br label %366

; <label>:366                                     ; preds = %654, %365
  %367 = load i64* %i, align 8
  %368 = load i64* %3, align 8
  %369 = icmp ult i64 %367, %368
  br i1 %369, label %370, label %657

; <label>:370                                     ; preds = %366
  store i8 0, i8* %r2, align 1
  store i8 0, i8* %g3, align 1
  store i8 0, i8* %b4, align 1
  store i8 0, i8* %a5, align 1
  %371 = load i8** %2, align 8
  %372 = load i64* %i, align 8
  %373 = load %struct.LodePNGColorMode** %4, align 8
  %374 = load i32* %5, align 4
  %375 = call i32 @getPixelColorRGBA8(i8* %r2, i8* %g3, i8* %b4, i8* %a5, i8* %371, i64 %372, %struct.LodePNGColorMode* %373, i32 %374)
  store i32 %375, i32* %error, align 4
  %376 = load i32* %error, align 4
  %377 = icmp ne i32 %376, 0
  br i1 %377, label %378, label %379

; <label>:378                                     ; preds = %370
  br label %657

; <label>:379                                     ; preds = %370
  %380 = load %struct.ColorProfile** %1, align 8
  %381 = getelementptr inbounds %struct.ColorProfile* %380, i32 0, i32 3
  %382 = load i8* %381, align 1
  %383 = icmp ne i8 %382, 0
  br i1 %383, label %403, label %384

; <label>:384                                     ; preds = %379
  %385 = load i8* %r2, align 1
  %386 = zext i8 %385 to i32
  %387 = load i8* %g3, align 1
  %388 = zext i8 %387 to i32
  %389 = icmp ne i32 %386, %388
  br i1 %389, label %396, label %390

; <label>:390                                     ; preds = %384
  %391 = load i8* %r2, align 1
  %392 = zext i8 %391 to i32
  %393 = load i8* %b4, align 1
  %394 = zext i8 %393 to i32
  %395 = icmp ne i32 %392, %394
  br i1 %395, label %396, label %403

; <label>:396                                     ; preds = %390, %384
  %397 = load %struct.ColorProfile** %1, align 8
  %398 = getelementptr inbounds %struct.ColorProfile* %397, i32 0, i32 2
  store i8 1, i8* %398, align 1
  %399 = load %struct.ColorProfile** %1, align 8
  %400 = getelementptr inbounds %struct.ColorProfile* %399, i32 0, i32 3
  store i8 1, i8* %400, align 1
  %401 = load %struct.ColorProfile** %1, align 8
  %402 = getelementptr inbounds %struct.ColorProfile* %401, i32 0, i32 16
  store i8 1, i8* %402, align 1
  br label %403

; <label>:403                                     ; preds = %396, %390, %379
  %404 = load %struct.ColorProfile** %1, align 8
  %405 = getelementptr inbounds %struct.ColorProfile* %404, i32 0, i32 9
  %406 = load i8* %405, align 1
  %407 = icmp ne i8 %406, 0
  br i1 %407, label %475, label %408

; <label>:408                                     ; preds = %403
  %409 = load i8* %a5, align 1
  %410 = zext i8 %409 to i32
  %411 = icmp ne i32 %410, 255
  br i1 %411, label %412, label %475

; <label>:412                                     ; preds = %408
  %413 = load i8* %a5, align 1
  %414 = zext i8 %413 to i32
  %415 = icmp eq i32 %414, 0
  br i1 %415, label %416, label %467

; <label>:416                                     ; preds = %412
  %417 = load %struct.ColorProfile** %1, align 8
  %418 = getelementptr inbounds %struct.ColorProfile* %417, i32 0, i32 4
  %419 = load i8* %418, align 1
  %420 = zext i8 %419 to i32
  %421 = icmp ne i32 %420, 0
  br i1 %421, label %422, label %446

; <label>:422                                     ; preds = %416
  %423 = load i8* %r2, align 1
  %424 = zext i8 %423 to i32
  %425 = load %struct.ColorProfile** %1, align 8
  %426 = getelementptr inbounds %struct.ColorProfile* %425, i32 0, i32 5
  %427 = load i16* %426, align 2
  %428 = zext i16 %427 to i32
  %429 = icmp ne i32 %424, %428
  br i1 %429, label %467, label %430

; <label>:430                                     ; preds = %422
  %431 = load i8* %g3, align 1
  %432 = zext i8 %431 to i32
  %433 = load %struct.ColorProfile** %1, align 8
  %434 = getelementptr inbounds %struct.ColorProfile* %433, i32 0, i32 6
  %435 = load i16* %434, align 2
  %436 = zext i16 %435 to i32
  %437 = icmp ne i32 %432, %436
  br i1 %437, label %467, label %438

; <label>:438                                     ; preds = %430
  %439 = load i8* %b4, align 1
  %440 = zext i8 %439 to i32
  %441 = load %struct.ColorProfile** %1, align 8
  %442 = getelementptr inbounds %struct.ColorProfile* %441, i32 0, i32 7
  %443 = load i16* %442, align 2
  %444 = zext i16 %443 to i32
  %445 = icmp ne i32 %440, %444
  br i1 %445, label %467, label %446

; <label>:446                                     ; preds = %438, %416
  %447 = load %struct.ColorProfile** %1, align 8
  %448 = getelementptr inbounds %struct.ColorProfile* %447, i32 0, i32 4
  %449 = load i8* %448, align 1
  %450 = icmp ne i8 %449, 0
  br i1 %450, label %466, label %451

; <label>:451                                     ; preds = %446
  %452 = load %struct.ColorProfile** %1, align 8
  %453 = getelementptr inbounds %struct.ColorProfile* %452, i32 0, i32 4
  store i8 1, i8* %453, align 1
  %454 = load i8* %r2, align 1
  %455 = zext i8 %454 to i16
  %456 = load %struct.ColorProfile** %1, align 8
  %457 = getelementptr inbounds %struct.ColorProfile* %456, i32 0, i32 5
  store i16 %455, i16* %457, align 2
  %458 = load i8* %g3, align 1
  %459 = zext i8 %458 to i16
  %460 = load %struct.ColorProfile** %1, align 8
  %461 = getelementptr inbounds %struct.ColorProfile* %460, i32 0, i32 6
  store i16 %459, i16* %461, align 2
  %462 = load i8* %b4, align 1
  %463 = zext i8 %462 to i16
  %464 = load %struct.ColorProfile** %1, align 8
  %465 = getelementptr inbounds %struct.ColorProfile* %464, i32 0, i32 7
  store i16 %463, i16* %465, align 2
  br label %466

; <label>:466                                     ; preds = %451, %446
  br label %474

; <label>:467                                     ; preds = %438, %430, %422, %412
  %468 = load %struct.ColorProfile** %1, align 8
  %469 = getelementptr inbounds %struct.ColorProfile* %468, i32 0, i32 8
  store i8 1, i8* %469, align 1
  %470 = load %struct.ColorProfile** %1, align 8
  %471 = getelementptr inbounds %struct.ColorProfile* %470, i32 0, i32 9
  store i8 1, i8* %471, align 1
  %472 = load %struct.ColorProfile** %1, align 8
  %473 = getelementptr inbounds %struct.ColorProfile* %472, i32 0, i32 16
  store i8 1, i8* %473, align 1
  br label %474

; <label>:474                                     ; preds = %467, %466
  br label %475

; <label>:475                                     ; preds = %474, %408, %403
  %476 = load %struct.ColorProfile** %1, align 8
  %477 = getelementptr inbounds %struct.ColorProfile* %476, i32 0, i32 9
  %478 = load i8* %477, align 1
  %479 = icmp ne i8 %478, 0
  br i1 %479, label %521, label %480

; <label>:480                                     ; preds = %475
  %481 = load i8* %a5, align 1
  %482 = zext i8 %481 to i32
  %483 = icmp eq i32 %482, 255
  br i1 %483, label %484, label %521

; <label>:484                                     ; preds = %480
  %485 = load %struct.ColorProfile** %1, align 8
  %486 = getelementptr inbounds %struct.ColorProfile* %485, i32 0, i32 4
  %487 = load i8* %486, align 1
  %488 = zext i8 %487 to i32
  %489 = icmp ne i32 %488, 0
  br i1 %489, label %490, label %521

; <label>:490                                     ; preds = %484
  %491 = load i8* %r2, align 1
  %492 = zext i8 %491 to i32
  %493 = load %struct.ColorProfile** %1, align 8
  %494 = getelementptr inbounds %struct.ColorProfile* %493, i32 0, i32 5
  %495 = load i16* %494, align 2
  %496 = zext i16 %495 to i32
  %497 = icmp eq i32 %492, %496
  br i1 %497, label %498, label %521

; <label>:498                                     ; preds = %490
  %499 = load i8* %g3, align 1
  %500 = zext i8 %499 to i32
  %501 = load %struct.ColorProfile** %1, align 8
  %502 = getelementptr inbounds %struct.ColorProfile* %501, i32 0, i32 6
  %503 = load i16* %502, align 2
  %504 = zext i16 %503 to i32
  %505 = icmp eq i32 %500, %504
  br i1 %505, label %506, label %521

; <label>:506                                     ; preds = %498
  %507 = load i8* %b4, align 1
  %508 = zext i8 %507 to i32
  %509 = load %struct.ColorProfile** %1, align 8
  %510 = getelementptr inbounds %struct.ColorProfile* %509, i32 0, i32 7
  %511 = load i16* %510, align 2
  %512 = zext i16 %511 to i32
  %513 = icmp eq i32 %508, %512
  br i1 %513, label %514, label %521

; <label>:514                                     ; preds = %506
  %515 = load %struct.ColorProfile** %1, align 8
  %516 = getelementptr inbounds %struct.ColorProfile* %515, i32 0, i32 8
  store i8 1, i8* %516, align 1
  %517 = load %struct.ColorProfile** %1, align 8
  %518 = getelementptr inbounds %struct.ColorProfile* %517, i32 0, i32 9
  store i8 1, i8* %518, align 1
  %519 = load %struct.ColorProfile** %1, align 8
  %520 = getelementptr inbounds %struct.ColorProfile* %519, i32 0, i32 16
  store i8 1, i8* %520, align 1
  br label %521

; <label>:521                                     ; preds = %514, %506, %498, %490, %484, %480, %475
  %522 = load %struct.ColorProfile** %1, align 8
  %523 = getelementptr inbounds %struct.ColorProfile* %522, i32 0, i32 16
  %524 = load i8* %523, align 1
  %525 = icmp ne i8 %524, 0
  br i1 %525, label %548, label %526

; <label>:526                                     ; preds = %521
  %527 = load i8* %r2, align 1
  %528 = zext i8 %527 to i16
  %529 = call i32 @getValueRequiredBits(i16 zeroext %528)
  store i32 %529, i32* %bits6, align 4
  %530 = load i32* %bits6, align 4
  %531 = load %struct.ColorProfile** %1, align 8
  %532 = getelementptr inbounds %struct.ColorProfile* %531, i32 0, i32 15
  %533 = load i32* %532, align 4
  %534 = icmp ugt i32 %530, %533
  br i1 %534, label %535, label %539

; <label>:535                                     ; preds = %526
  %536 = load i32* %bits6, align 4
  %537 = load %struct.ColorProfile** %1, align 8
  %538 = getelementptr inbounds %struct.ColorProfile* %537, i32 0, i32 15
  store i32 %536, i32* %538, align 4
  br label %539

; <label>:539                                     ; preds = %535, %526
  %540 = load %struct.ColorProfile** %1, align 8
  %541 = getelementptr inbounds %struct.ColorProfile* %540, i32 0, i32 15
  %542 = load i32* %541, align 4
  %543 = icmp uge i32 %542, 8
  br i1 %543, label %544, label %547

; <label>:544                                     ; preds = %539
  %545 = load %struct.ColorProfile** %1, align 8
  %546 = getelementptr inbounds %struct.ColorProfile* %545, i32 0, i32 16
  store i8 1, i8* %546, align 1
  br label %547

; <label>:547                                     ; preds = %544, %539
  br label %548

; <label>:548                                     ; preds = %547, %521
  %549 = load %struct.ColorProfile** %1, align 8
  %550 = getelementptr inbounds %struct.ColorProfile* %549, i32 0, i32 14
  %551 = load i8* %550, align 1
  %552 = icmp ne i8 %551, 0
  br i1 %552, label %628, label %553

; <label>:553                                     ; preds = %548
  %554 = load %struct.ColorProfile** %1, align 8
  %555 = getelementptr inbounds %struct.ColorProfile* %554, i32 0, i32 11
  %556 = load i8* %r2, align 1
  %557 = load i8* %g3, align 1
  %558 = load i8* %b4, align 1
  %559 = load i8* %a5, align 1
  %560 = call i32 @color_tree_has(%struct.ColorTree* %555, i8 zeroext %556, i8 zeroext %557, i8 zeroext %558, i8 zeroext %559)
  %561 = icmp ne i32 %560, 0
  br i1 %561, label %627, label %562

; <label>:562                                     ; preds = %553
  %563 = load %struct.ColorProfile** %1, align 8
  %564 = getelementptr inbounds %struct.ColorProfile* %563, i32 0, i32 11
  %565 = load i8* %r2, align 1
  %566 = load i8* %g3, align 1
  %567 = load i8* %b4, align 1
  %568 = load i8* %a5, align 1
  %569 = load %struct.ColorProfile** %1, align 8
  %570 = getelementptr inbounds %struct.ColorProfile* %569, i32 0, i32 10
  %571 = load i32* %570, align 4
  call void @color_tree_add(%struct.ColorTree* %564, i8 zeroext %565, i8 zeroext %566, i8 zeroext %567, i8 zeroext %568, i32 %571)
  %572 = load %struct.ColorProfile** %1, align 8
  %573 = getelementptr inbounds %struct.ColorProfile* %572, i32 0, i32 10
  %574 = load i32* %573, align 4
  %575 = icmp ult i32 %574, 256
  br i1 %575, label %576, label %611

; <label>:576                                     ; preds = %562
  %577 = load %struct.ColorProfile** %1, align 8
  %578 = getelementptr inbounds %struct.ColorProfile* %577, i32 0, i32 12
  %579 = load i8** %578, align 8
  store i8* %579, i8** %p7, align 8
  %580 = load %struct.ColorProfile** %1, align 8
  %581 = getelementptr inbounds %struct.ColorProfile* %580, i32 0, i32 10
  %582 = load i32* %581, align 4
  store i32 %582, i32* %i8, align 4
  %583 = load i8* %r2, align 1
  %584 = load i32* %i8, align 4
  %585 = mul i32 %584, 4
  %586 = add i32 %585, 0
  %587 = zext i32 %586 to i64
  %588 = load i8** %p7, align 8
  %589 = getelementptr inbounds i8* %588, i64 %587
  store i8 %583, i8* %589, align 1
  %590 = load i8* %g3, align 1
  %591 = load i32* %i8, align 4
  %592 = mul i32 %591, 4
  %593 = add i32 %592, 1
  %594 = zext i32 %593 to i64
  %595 = load i8** %p7, align 8
  %596 = getelementptr inbounds i8* %595, i64 %594
  store i8 %590, i8* %596, align 1
  %597 = load i8* %b4, align 1
  %598 = load i32* %i8, align 4
  %599 = mul i32 %598, 4
  %600 = add i32 %599, 2
  %601 = zext i32 %600 to i64
  %602 = load i8** %p7, align 8
  %603 = getelementptr inbounds i8* %602, i64 %601
  store i8 %597, i8* %603, align 1
  %604 = load i8* %a5, align 1
  %605 = load i32* %i8, align 4
  %606 = mul i32 %605, 4
  %607 = add i32 %606, 3
  %608 = zext i32 %607 to i64
  %609 = load i8** %p7, align 8
  %610 = getelementptr inbounds i8* %609, i64 %608
  store i8 %604, i8* %610, align 1
  br label %611

; <label>:611                                     ; preds = %576, %562
  %612 = load %struct.ColorProfile** %1, align 8
  %613 = getelementptr inbounds %struct.ColorProfile* %612, i32 0, i32 10
  %614 = load i32* %613, align 4
  %615 = add i32 %614, 1
  store i32 %615, i32* %613, align 4
  %616 = load %struct.ColorProfile** %1, align 8
  %617 = getelementptr inbounds %struct.ColorProfile* %616, i32 0, i32 10
  %618 = load i32* %617, align 4
  %619 = load %struct.ColorProfile** %1, align 8
  %620 = getelementptr inbounds %struct.ColorProfile* %619, i32 0, i32 13
  %621 = load i32* %620, align 4
  %622 = icmp uge i32 %618, %621
  br i1 %622, label %623, label %626

; <label>:623                                     ; preds = %611
  %624 = load %struct.ColorProfile** %1, align 8
  %625 = getelementptr inbounds %struct.ColorProfile* %624, i32 0, i32 14
  store i8 1, i8* %625, align 1
  br label %626

; <label>:626                                     ; preds = %623, %611
  br label %627

; <label>:627                                     ; preds = %626, %553
  br label %628

; <label>:628                                     ; preds = %627, %548
  %629 = load %struct.ColorProfile** %1, align 8
  %630 = getelementptr inbounds %struct.ColorProfile* %629, i32 0, i32 9
  %631 = load i8* %630, align 1
  %632 = zext i8 %631 to i32
  %633 = icmp ne i32 %632, 0
  br i1 %633, label %634, label %653

; <label>:634                                     ; preds = %628
  %635 = load %struct.ColorProfile** %1, align 8
  %636 = getelementptr inbounds %struct.ColorProfile* %635, i32 0, i32 14
  %637 = load i8* %636, align 1
  %638 = zext i8 %637 to i32
  %639 = icmp ne i32 %638, 0
  br i1 %639, label %640, label %653

; <label>:640                                     ; preds = %634
  %641 = load %struct.ColorProfile** %1, align 8
  %642 = getelementptr inbounds %struct.ColorProfile* %641, i32 0, i32 3
  %643 = load i8* %642, align 1
  %644 = zext i8 %643 to i32
  %645 = icmp ne i32 %644, 0
  br i1 %645, label %646, label %653

; <label>:646                                     ; preds = %640
  %647 = load %struct.ColorProfile** %1, align 8
  %648 = getelementptr inbounds %struct.ColorProfile* %647, i32 0, i32 16
  %649 = load i8* %648, align 1
  %650 = zext i8 %649 to i32
  %651 = icmp ne i32 %650, 0
  br i1 %651, label %652, label %653

; <label>:652                                     ; preds = %646
  br label %657

; <label>:653                                     ; preds = %646, %640, %634, %628
  br label %654

; <label>:654                                     ; preds = %653
  %655 = load i64* %i, align 8
  %656 = add i64 %655, 1
  store i64 %656, i64* %i, align 8
  br label %366

; <label>:657                                     ; preds = %652, %378, %366
  br label %658

; <label>:658                                     ; preds = %657, %364
  %659 = load %struct.LodePNGColorMode** %4, align 8
  %660 = getelementptr inbounds %struct.LodePNGColorMode* %659, i32 0, i32 1
  %661 = load i32* %660, align 4
  %662 = icmp ult i32 %661, 16
  br i1 %662, label %663, label %682

; <label>:663                                     ; preds = %658
  %664 = load %struct.ColorProfile** %1, align 8
  %665 = getelementptr inbounds %struct.ColorProfile* %664, i32 0, i32 5
  %666 = load i16* %665, align 2
  %667 = zext i16 %666 to i32
  %668 = mul nsw i32 %667, 257
  %669 = trunc i32 %668 to i16
  store i16 %669, i16* %665, align 2
  %670 = load %struct.ColorProfile** %1, align 8
  %671 = getelementptr inbounds %struct.ColorProfile* %670, i32 0, i32 6
  %672 = load i16* %671, align 2
  %673 = zext i16 %672 to i32
  %674 = mul nsw i32 %673, 257
  %675 = trunc i32 %674 to i16
  store i16 %675, i16* %671, align 2
  %676 = load %struct.ColorProfile** %1, align 8
  %677 = getelementptr inbounds %struct.ColorProfile* %676, i32 0, i32 7
  %678 = load i16* %677, align 2
  %679 = zext i16 %678 to i32
  %680 = mul nsw i32 %679, 257
  %681 = trunc i32 %680 to i16
  store i16 %681, i16* %677, align 2
  br label %682

; <label>:682                                     ; preds = %663, %658
  %683 = load i32* %error, align 4
  ret i32 %683
}

; Function Attrs: nounwind uwtable
define internal void @setColorKeyFrom16bit(%struct.LodePNGColorMode* %mode_out, i32 %r, i32 %g, i32 %b, i32 %bitdepth) #0 {
  %1 = alloca %struct.LodePNGColorMode*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %mask = alloca i32, align 4
  store %struct.LodePNGColorMode* %mode_out, %struct.LodePNGColorMode** %1, align 8
  store i32 %r, i32* %2, align 4
  store i32 %g, i32* %3, align 4
  store i32 %b, i32* %4, align 4
  store i32 %bitdepth, i32* %5, align 4
  %6 = load i32* %5, align 4
  %7 = shl i32 1, %6
  %8 = sub nsw i32 %7, 1
  store i32 %8, i32* %mask, align 4
  %9 = load %struct.LodePNGColorMode** %1, align 8
  %10 = getelementptr inbounds %struct.LodePNGColorMode* %9, i32 0, i32 4
  store i32 1, i32* %10, align 4
  %11 = load i32* %2, align 4
  %12 = load i32* %mask, align 4
  %13 = and i32 %11, %12
  %14 = load %struct.LodePNGColorMode** %1, align 8
  %15 = getelementptr inbounds %struct.LodePNGColorMode* %14, i32 0, i32 5
  store i32 %13, i32* %15, align 4
  %16 = load i32* %3, align 4
  %17 = load i32* %mask, align 4
  %18 = and i32 %16, %17
  %19 = load %struct.LodePNGColorMode** %1, align 8
  %20 = getelementptr inbounds %struct.LodePNGColorMode* %19, i32 0, i32 6
  store i32 %18, i32* %20, align 4
  %21 = load i32* %4, align 4
  %22 = load i32* %mask, align 4
  %23 = and i32 %21, %22
  %24 = load %struct.LodePNGColorMode** %1, align 8
  %25 = getelementptr inbounds %struct.LodePNGColorMode* %24, i32 0, i32 7
  store i32 %23, i32* %25, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @color_profile_cleanup(%struct.ColorProfile* %profile) #0 {
  %1 = alloca %struct.ColorProfile*, align 8
  store %struct.ColorProfile* %profile, %struct.ColorProfile** %1, align 8
  %2 = load %struct.ColorProfile** %1, align 8
  %3 = getelementptr inbounds %struct.ColorProfile* %2, i32 0, i32 11
  call void @color_tree_cleanup(%struct.ColorTree* %3)
  %4 = load %struct.ColorProfile** %1, align 8
  %5 = getelementptr inbounds %struct.ColorProfile* %4, i32 0, i32 12
  %6 = load i8** %5, align 8
  call void @lodepng_free(i8* %6)
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @lodepng_inspect(i32* %w, i32* %h, %struct.LodePNGState* %state, i8* %in, i64 %insize) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32*, align 8
  %3 = alloca i32*, align 8
  %4 = alloca %struct.LodePNGState*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i64, align 8
  %info = alloca %struct.LodePNGInfo*, align 8
  %CRC = alloca i32, align 4
  %checksum = alloca i32, align 4
  store i32* %w, i32** %2, align 8
  store i32* %h, i32** %3, align 8
  store %struct.LodePNGState* %state, %struct.LodePNGState** %4, align 8
  store i8* %in, i8** %5, align 8
  store i64 %insize, i64* %6, align 8
  %7 = load %struct.LodePNGState** %4, align 8
  %8 = getelementptr inbounds %struct.LodePNGState* %7, i32 0, i32 3
  store %struct.LodePNGInfo* %8, %struct.LodePNGInfo** %info, align 8
  %9 = load i64* %6, align 8
  %10 = icmp eq i64 %9, 0
  br i1 %10, label %14, label %11

; <label>:11                                      ; preds = %0
  %12 = load i8** %5, align 8
  %13 = icmp eq i8* %12, null
  br i1 %13, label %14, label %17

; <label>:14                                      ; preds = %11, %0
  %15 = load %struct.LodePNGState** %4, align 8
  %16 = getelementptr inbounds %struct.LodePNGState* %15, i32 0, i32 4
  store i32 48, i32* %16, align 4
  store i32 48, i32* %1
  br label %202

; <label>:17                                      ; preds = %11
  %18 = load i64* %6, align 8
  %19 = icmp ult i64 %18, 29
  br i1 %19, label %20, label %23

; <label>:20                                      ; preds = %17
  %21 = load %struct.LodePNGState** %4, align 8
  %22 = getelementptr inbounds %struct.LodePNGState* %21, i32 0, i32 4
  store i32 27, i32* %22, align 4
  store i32 27, i32* %1
  br label %202

; <label>:23                                      ; preds = %17
  %24 = load %struct.LodePNGInfo** %info, align 8
  call void @lodepng_info_cleanup(%struct.LodePNGInfo* %24)
  %25 = load %struct.LodePNGInfo** %info, align 8
  call void @lodepng_info_init(%struct.LodePNGInfo* %25)
  %26 = load i8** %5, align 8
  %27 = getelementptr inbounds i8* %26, i64 0
  %28 = load i8* %27, align 1
  %29 = zext i8 %28 to i32
  %30 = icmp ne i32 %29, 137
  br i1 %30, label %73, label %31

; <label>:31                                      ; preds = %23
  %32 = load i8** %5, align 8
  %33 = getelementptr inbounds i8* %32, i64 1
  %34 = load i8* %33, align 1
  %35 = zext i8 %34 to i32
  %36 = icmp ne i32 %35, 80
  br i1 %36, label %73, label %37

; <label>:37                                      ; preds = %31
  %38 = load i8** %5, align 8
  %39 = getelementptr inbounds i8* %38, i64 2
  %40 = load i8* %39, align 1
  %41 = zext i8 %40 to i32
  %42 = icmp ne i32 %41, 78
  br i1 %42, label %73, label %43

; <label>:43                                      ; preds = %37
  %44 = load i8** %5, align 8
  %45 = getelementptr inbounds i8* %44, i64 3
  %46 = load i8* %45, align 1
  %47 = zext i8 %46 to i32
  %48 = icmp ne i32 %47, 71
  br i1 %48, label %73, label %49

; <label>:49                                      ; preds = %43
  %50 = load i8** %5, align 8
  %51 = getelementptr inbounds i8* %50, i64 4
  %52 = load i8* %51, align 1
  %53 = zext i8 %52 to i32
  %54 = icmp ne i32 %53, 13
  br i1 %54, label %73, label %55

; <label>:55                                      ; preds = %49
  %56 = load i8** %5, align 8
  %57 = getelementptr inbounds i8* %56, i64 5
  %58 = load i8* %57, align 1
  %59 = zext i8 %58 to i32
  %60 = icmp ne i32 %59, 10
  br i1 %60, label %73, label %61

; <label>:61                                      ; preds = %55
  %62 = load i8** %5, align 8
  %63 = getelementptr inbounds i8* %62, i64 6
  %64 = load i8* %63, align 1
  %65 = zext i8 %64 to i32
  %66 = icmp ne i32 %65, 26
  br i1 %66, label %73, label %67

; <label>:67                                      ; preds = %61
  %68 = load i8** %5, align 8
  %69 = getelementptr inbounds i8* %68, i64 7
  %70 = load i8* %69, align 1
  %71 = zext i8 %70 to i32
  %72 = icmp ne i32 %71, 10
  br i1 %72, label %73, label %76

; <label>:73                                      ; preds = %67, %61, %55, %49, %43, %37, %31, %23
  %74 = load %struct.LodePNGState** %4, align 8
  %75 = getelementptr inbounds %struct.LodePNGState* %74, i32 0, i32 4
  store i32 28, i32* %75, align 4
  store i32 28, i32* %1
  br label %202

; <label>:76                                      ; preds = %67
  %77 = load i8** %5, align 8
  %78 = getelementptr inbounds i8* %77, i64 12
  %79 = load i8* %78, align 1
  %80 = zext i8 %79 to i32
  %81 = icmp ne i32 %80, 73
  br i1 %81, label %100, label %82

; <label>:82                                      ; preds = %76
  %83 = load i8** %5, align 8
  %84 = getelementptr inbounds i8* %83, i64 13
  %85 = load i8* %84, align 1
  %86 = zext i8 %85 to i32
  %87 = icmp ne i32 %86, 72
  br i1 %87, label %100, label %88

; <label>:88                                      ; preds = %82
  %89 = load i8** %5, align 8
  %90 = getelementptr inbounds i8* %89, i64 14
  %91 = load i8* %90, align 1
  %92 = zext i8 %91 to i32
  %93 = icmp ne i32 %92, 68
  br i1 %93, label %100, label %94

; <label>:94                                      ; preds = %88
  %95 = load i8** %5, align 8
  %96 = getelementptr inbounds i8* %95, i64 15
  %97 = load i8* %96, align 1
  %98 = zext i8 %97 to i32
  %99 = icmp ne i32 %98, 82
  br i1 %99, label %100, label %103

; <label>:100                                     ; preds = %94, %88, %82, %76
  %101 = load %struct.LodePNGState** %4, align 8
  %102 = getelementptr inbounds %struct.LodePNGState* %101, i32 0, i32 4
  store i32 29, i32* %102, align 4
  store i32 29, i32* %1
  br label %202

; <label>:103                                     ; preds = %94
  %104 = load i8** %5, align 8
  %105 = getelementptr inbounds i8* %104, i64 16
  %106 = call i32 @lodepng_read32bitInt(i8* %105)
  %107 = load i32** %2, align 8
  store i32 %106, i32* %107, align 4
  %108 = load i8** %5, align 8
  %109 = getelementptr inbounds i8* %108, i64 20
  %110 = call i32 @lodepng_read32bitInt(i8* %109)
  %111 = load i32** %3, align 8
  store i32 %110, i32* %111, align 4
  %112 = load i8** %5, align 8
  %113 = getelementptr inbounds i8* %112, i64 24
  %114 = load i8* %113, align 1
  %115 = zext i8 %114 to i32
  %116 = load %struct.LodePNGInfo** %info, align 8
  %117 = getelementptr inbounds %struct.LodePNGInfo* %116, i32 0, i32 3
  %118 = getelementptr inbounds %struct.LodePNGColorMode* %117, i32 0, i32 1
  store i32 %115, i32* %118, align 4
  %119 = load i8** %5, align 8
  %120 = getelementptr inbounds i8* %119, i64 25
  %121 = load i8* %120, align 1
  %122 = zext i8 %121 to i32
  %123 = load %struct.LodePNGInfo** %info, align 8
  %124 = getelementptr inbounds %struct.LodePNGInfo* %123, i32 0, i32 3
  %125 = getelementptr inbounds %struct.LodePNGColorMode* %124, i32 0, i32 0
  store i32 %122, i32* %125, align 4
  %126 = load i8** %5, align 8
  %127 = getelementptr inbounds i8* %126, i64 26
  %128 = load i8* %127, align 1
  %129 = zext i8 %128 to i32
  %130 = load %struct.LodePNGInfo** %info, align 8
  %131 = getelementptr inbounds %struct.LodePNGInfo* %130, i32 0, i32 0
  store i32 %129, i32* %131, align 4
  %132 = load i8** %5, align 8
  %133 = getelementptr inbounds i8* %132, i64 27
  %134 = load i8* %133, align 1
  %135 = zext i8 %134 to i32
  %136 = load %struct.LodePNGInfo** %info, align 8
  %137 = getelementptr inbounds %struct.LodePNGInfo* %136, i32 0, i32 1
  store i32 %135, i32* %137, align 4
  %138 = load i8** %5, align 8
  %139 = getelementptr inbounds i8* %138, i64 28
  %140 = load i8* %139, align 1
  %141 = zext i8 %140 to i32
  %142 = load %struct.LodePNGInfo** %info, align 8
  %143 = getelementptr inbounds %struct.LodePNGInfo* %142, i32 0, i32 2
  store i32 %141, i32* %143, align 4
  %144 = load %struct.LodePNGState** %4, align 8
  %145 = getelementptr inbounds %struct.LodePNGState* %144, i32 0, i32 0
  %146 = getelementptr inbounds %struct.LodePNGDecoderSettings* %145, i32 0, i32 1
  %147 = load i32* %146, align 4
  %148 = icmp ne i32 %147, 0
  br i1 %148, label %163, label %149

; <label>:149                                     ; preds = %103
  %150 = load i8** %5, align 8
  %151 = getelementptr inbounds i8* %150, i64 29
  %152 = call i32 @lodepng_read32bitInt(i8* %151)
  store i32 %152, i32* %CRC, align 4
  %153 = load i8** %5, align 8
  %154 = getelementptr inbounds i8* %153, i64 12
  %155 = call i32 @lodepng_crc32(i8* %154, i64 17)
  store i32 %155, i32* %checksum, align 4
  %156 = load i32* %CRC, align 4
  %157 = load i32* %checksum, align 4
  %158 = icmp ne i32 %156, %157
  br i1 %158, label %159, label %162

; <label>:159                                     ; preds = %149
  %160 = load %struct.LodePNGState** %4, align 8
  %161 = getelementptr inbounds %struct.LodePNGState* %160, i32 0, i32 4
  store i32 57, i32* %161, align 4
  store i32 57, i32* %1
  br label %202

; <label>:162                                     ; preds = %149
  br label %163

; <label>:163                                     ; preds = %162, %103
  %164 = load %struct.LodePNGInfo** %info, align 8
  %165 = getelementptr inbounds %struct.LodePNGInfo* %164, i32 0, i32 0
  %166 = load i32* %165, align 4
  %167 = icmp ne i32 %166, 0
  br i1 %167, label %168, label %171

; <label>:168                                     ; preds = %163
  %169 = load %struct.LodePNGState** %4, align 8
  %170 = getelementptr inbounds %struct.LodePNGState* %169, i32 0, i32 4
  store i32 32, i32* %170, align 4
  store i32 32, i32* %1
  br label %202

; <label>:171                                     ; preds = %163
  %172 = load %struct.LodePNGInfo** %info, align 8
  %173 = getelementptr inbounds %struct.LodePNGInfo* %172, i32 0, i32 1
  %174 = load i32* %173, align 4
  %175 = icmp ne i32 %174, 0
  br i1 %175, label %176, label %179

; <label>:176                                     ; preds = %171
  %177 = load %struct.LodePNGState** %4, align 8
  %178 = getelementptr inbounds %struct.LodePNGState* %177, i32 0, i32 4
  store i32 33, i32* %178, align 4
  store i32 33, i32* %1
  br label %202

; <label>:179                                     ; preds = %171
  %180 = load %struct.LodePNGInfo** %info, align 8
  %181 = getelementptr inbounds %struct.LodePNGInfo* %180, i32 0, i32 2
  %182 = load i32* %181, align 4
  %183 = icmp ugt i32 %182, 1
  br i1 %183, label %184, label %187

; <label>:184                                     ; preds = %179
  %185 = load %struct.LodePNGState** %4, align 8
  %186 = getelementptr inbounds %struct.LodePNGState* %185, i32 0, i32 4
  store i32 34, i32* %186, align 4
  store i32 34, i32* %1
  br label %202

; <label>:187                                     ; preds = %179
  %188 = load %struct.LodePNGInfo** %info, align 8
  %189 = getelementptr inbounds %struct.LodePNGInfo* %188, i32 0, i32 3
  %190 = getelementptr inbounds %struct.LodePNGColorMode* %189, i32 0, i32 0
  %191 = load i32* %190, align 4
  %192 = load %struct.LodePNGInfo** %info, align 8
  %193 = getelementptr inbounds %struct.LodePNGInfo* %192, i32 0, i32 3
  %194 = getelementptr inbounds %struct.LodePNGColorMode* %193, i32 0, i32 1
  %195 = load i32* %194, align 4
  %196 = call i32 @checkColorValidity(i32 %191, i32 %195)
  %197 = load %struct.LodePNGState** %4, align 8
  %198 = getelementptr inbounds %struct.LodePNGState* %197, i32 0, i32 4
  store i32 %196, i32* %198, align 4
  %199 = load %struct.LodePNGState** %4, align 8
  %200 = getelementptr inbounds %struct.LodePNGState* %199, i32 0, i32 4
  %201 = load i32* %200, align 4
  store i32 %201, i32* %1
  br label %202

; <label>:202                                     ; preds = %187, %184, %176, %168, %159, %100, %73, %20, %14
  %203 = load i32* %1
  ret i32 %203
}

; Function Attrs: nounwind uwtable
define internal i32 @checkColorValidity(i32 %colortype, i32 %bd) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %colortype, i32* %2, align 4
  store i32 %bd, i32* %3, align 4
  %4 = load i32* %2, align 4
  switch i32 %4, label %60 [
    i32 0, label %5
    i32 2, label %22
    i32 3, label %30
    i32 4, label %44
    i32 6, label %52
  ]

; <label>:5                                       ; preds = %0
  %6 = load i32* %3, align 4
  %7 = icmp eq i32 %6, 1
  br i1 %7, label %21, label %8

; <label>:8                                       ; preds = %5
  %9 = load i32* %3, align 4
  %10 = icmp eq i32 %9, 2
  br i1 %10, label %21, label %11

; <label>:11                                      ; preds = %8
  %12 = load i32* %3, align 4
  %13 = icmp eq i32 %12, 4
  br i1 %13, label %21, label %14

; <label>:14                                      ; preds = %11
  %15 = load i32* %3, align 4
  %16 = icmp eq i32 %15, 8
  br i1 %16, label %21, label %17

; <label>:17                                      ; preds = %14
  %18 = load i32* %3, align 4
  %19 = icmp eq i32 %18, 16
  br i1 %19, label %21, label %20

; <label>:20                                      ; preds = %17
  store i32 37, i32* %1
  br label %62

; <label>:21                                      ; preds = %17, %14, %11, %8, %5
  br label %61

; <label>:22                                      ; preds = %0
  %23 = load i32* %3, align 4
  %24 = icmp eq i32 %23, 8
  br i1 %24, label %29, label %25

; <label>:25                                      ; preds = %22
  %26 = load i32* %3, align 4
  %27 = icmp eq i32 %26, 16
  br i1 %27, label %29, label %28

; <label>:28                                      ; preds = %25
  store i32 37, i32* %1
  br label %62

; <label>:29                                      ; preds = %25, %22
  br label %61

; <label>:30                                      ; preds = %0
  %31 = load i32* %3, align 4
  %32 = icmp eq i32 %31, 1
  br i1 %32, label %43, label %33

; <label>:33                                      ; preds = %30
  %34 = load i32* %3, align 4
  %35 = icmp eq i32 %34, 2
  br i1 %35, label %43, label %36

; <label>:36                                      ; preds = %33
  %37 = load i32* %3, align 4
  %38 = icmp eq i32 %37, 4
  br i1 %38, label %43, label %39

; <label>:39                                      ; preds = %36
  %40 = load i32* %3, align 4
  %41 = icmp eq i32 %40, 8
  br i1 %41, label %43, label %42

; <label>:42                                      ; preds = %39
  store i32 37, i32* %1
  br label %62

; <label>:43                                      ; preds = %39, %36, %33, %30
  br label %61

; <label>:44                                      ; preds = %0
  %45 = load i32* %3, align 4
  %46 = icmp eq i32 %45, 8
  br i1 %46, label %51, label %47

; <label>:47                                      ; preds = %44
  %48 = load i32* %3, align 4
  %49 = icmp eq i32 %48, 16
  br i1 %49, label %51, label %50

; <label>:50                                      ; preds = %47
  store i32 37, i32* %1
  br label %62

; <label>:51                                      ; preds = %47, %44
  br label %61

; <label>:52                                      ; preds = %0
  %53 = load i32* %3, align 4
  %54 = icmp eq i32 %53, 8
  br i1 %54, label %59, label %55

; <label>:55                                      ; preds = %52
  %56 = load i32* %3, align 4
  %57 = icmp eq i32 %56, 16
  br i1 %57, label %59, label %58

; <label>:58                                      ; preds = %55
  store i32 37, i32* %1
  br label %62

; <label>:59                                      ; preds = %55, %52
  br label %61

; <label>:60                                      ; preds = %0
  store i32 31, i32* %1
  br label %62

; <label>:61                                      ; preds = %59, %51, %43, %29, %21
  store i32 0, i32* %1
  br label %62

; <label>:62                                      ; preds = %61, %60, %58, %50, %42, %28, %20
  %63 = load i32* %1
  ret i32 %63
}

; Function Attrs: nounwind uwtable
define i32 @lodepng_decode(i8** %out, i32* %w, i32* %h, %struct.LodePNGState* %state, i8* %in, i64 %insize) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8**, align 8
  %3 = alloca i32*, align 8
  %4 = alloca i32*, align 8
  %5 = alloca %struct.LodePNGState*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i64, align 8
  %data = alloca i8*, align 8
  %outsize = alloca i64, align 8
  store i8** %out, i8*** %2, align 8
  store i32* %w, i32** %3, align 8
  store i32* %h, i32** %4, align 8
  store %struct.LodePNGState* %state, %struct.LodePNGState** %5, align 8
  store i8* %in, i8** %6, align 8
  store i64 %insize, i64* %7, align 8
  %8 = load i8*** %2, align 8
  store i8* null, i8** %8, align 8
  %9 = load i8*** %2, align 8
  %10 = load i32** %3, align 8
  %11 = load i32** %4, align 8
  %12 = load %struct.LodePNGState** %5, align 8
  %13 = load i8** %6, align 8
  %14 = load i64* %7, align 8
  call void @decodeGeneric(i8** %9, i32* %10, i32* %11, %struct.LodePNGState* %12, i8* %13, i64 %14)
  %15 = load %struct.LodePNGState** %5, align 8
  %16 = getelementptr inbounds %struct.LodePNGState* %15, i32 0, i32 4
  %17 = load i32* %16, align 4
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %19, label %23

; <label>:19                                      ; preds = %0
  %20 = load %struct.LodePNGState** %5, align 8
  %21 = getelementptr inbounds %struct.LodePNGState* %20, i32 0, i32 4
  %22 = load i32* %21, align 4
  store i32 %22, i32* %1
  br label %126

; <label>:23                                      ; preds = %0
  %24 = load %struct.LodePNGState** %5, align 8
  %25 = getelementptr inbounds %struct.LodePNGState* %24, i32 0, i32 0
  %26 = getelementptr inbounds %struct.LodePNGDecoderSettings* %25, i32 0, i32 3
  %27 = load i32* %26, align 4
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %29, label %37

; <label>:29                                      ; preds = %23
  %30 = load %struct.LodePNGState** %5, align 8
  %31 = getelementptr inbounds %struct.LodePNGState* %30, i32 0, i32 2
  %32 = load %struct.LodePNGState** %5, align 8
  %33 = getelementptr inbounds %struct.LodePNGState* %32, i32 0, i32 3
  %34 = getelementptr inbounds %struct.LodePNGInfo* %33, i32 0, i32 3
  %35 = call i32 @lodepng_color_mode_equal(%struct.LodePNGColorMode* %31, %struct.LodePNGColorMode* %34)
  %36 = icmp ne i32 %35, 0
  br i1 %36, label %37, label %62

; <label>:37                                      ; preds = %29, %23
  %38 = load %struct.LodePNGState** %5, align 8
  %39 = getelementptr inbounds %struct.LodePNGState* %38, i32 0, i32 0
  %40 = getelementptr inbounds %struct.LodePNGDecoderSettings* %39, i32 0, i32 3
  %41 = load i32* %40, align 4
  %42 = icmp ne i32 %41, 0
  br i1 %42, label %61, label %43

; <label>:43                                      ; preds = %37
  %44 = load %struct.LodePNGState** %5, align 8
  %45 = getelementptr inbounds %struct.LodePNGState* %44, i32 0, i32 2
  %46 = load %struct.LodePNGState** %5, align 8
  %47 = getelementptr inbounds %struct.LodePNGState* %46, i32 0, i32 3
  %48 = getelementptr inbounds %struct.LodePNGInfo* %47, i32 0, i32 3
  %49 = call i32 @lodepng_color_mode_copy(%struct.LodePNGColorMode* %45, %struct.LodePNGColorMode* %48)
  %50 = load %struct.LodePNGState** %5, align 8
  %51 = getelementptr inbounds %struct.LodePNGState* %50, i32 0, i32 4
  store i32 %49, i32* %51, align 4
  %52 = load %struct.LodePNGState** %5, align 8
  %53 = getelementptr inbounds %struct.LodePNGState* %52, i32 0, i32 4
  %54 = load i32* %53, align 4
  %55 = icmp ne i32 %54, 0
  br i1 %55, label %56, label %60

; <label>:56                                      ; preds = %43
  %57 = load %struct.LodePNGState** %5, align 8
  %58 = getelementptr inbounds %struct.LodePNGState* %57, i32 0, i32 4
  %59 = load i32* %58, align 4
  store i32 %59, i32* %1
  br label %126

; <label>:60                                      ; preds = %43
  br label %61

; <label>:61                                      ; preds = %60, %37
  br label %122

; <label>:62                                      ; preds = %29
  %63 = load i8*** %2, align 8
  %64 = load i8** %63, align 8
  store i8* %64, i8** %data, align 8
  %65 = load %struct.LodePNGState** %5, align 8
  %66 = getelementptr inbounds %struct.LodePNGState* %65, i32 0, i32 2
  %67 = getelementptr inbounds %struct.LodePNGColorMode* %66, i32 0, i32 0
  %68 = load i32* %67, align 4
  %69 = icmp eq i32 %68, 2
  br i1 %69, label %83, label %70

; <label>:70                                      ; preds = %62
  %71 = load %struct.LodePNGState** %5, align 8
  %72 = getelementptr inbounds %struct.LodePNGState* %71, i32 0, i32 2
  %73 = getelementptr inbounds %struct.LodePNGColorMode* %72, i32 0, i32 0
  %74 = load i32* %73, align 4
  %75 = icmp eq i32 %74, 6
  br i1 %75, label %83, label %76

; <label>:76                                      ; preds = %70
  %77 = load %struct.LodePNGState** %5, align 8
  %78 = getelementptr inbounds %struct.LodePNGState* %77, i32 0, i32 2
  %79 = getelementptr inbounds %struct.LodePNGColorMode* %78, i32 0, i32 1
  %80 = load i32* %79, align 4
  %81 = icmp eq i32 %80, 8
  br i1 %81, label %83, label %82

; <label>:82                                      ; preds = %76
  store i32 56, i32* %1
  br label %126

; <label>:83                                      ; preds = %76, %70, %62
  %84 = load i32** %3, align 8
  %85 = load i32* %84, align 4
  %86 = load i32** %4, align 8
  %87 = load i32* %86, align 4
  %88 = load %struct.LodePNGState** %5, align 8
  %89 = getelementptr inbounds %struct.LodePNGState* %88, i32 0, i32 2
  %90 = call i64 @lodepng_get_raw_size(i32 %85, i32 %87, %struct.LodePNGColorMode* %89)
  store i64 %90, i64* %outsize, align 8
  %91 = load i64* %outsize, align 8
  %92 = call i8* @lodepng_malloc(i64 %91)
  %93 = load i8*** %2, align 8
  store i8* %92, i8** %93, align 8
  %94 = load i8*** %2, align 8
  %95 = load i8** %94, align 8
  %96 = icmp ne i8* %95, null
  br i1 %96, label %100, label %97

; <label>:97                                      ; preds = %83
  %98 = load %struct.LodePNGState** %5, align 8
  %99 = getelementptr inbounds %struct.LodePNGState* %98, i32 0, i32 4
  store i32 83, i32* %99, align 4
  br label %120

; <label>:100                                     ; preds = %83
  %101 = load i8*** %2, align 8
  %102 = load i8** %101, align 8
  %103 = load i8** %data, align 8
  %104 = load %struct.LodePNGState** %5, align 8
  %105 = getelementptr inbounds %struct.LodePNGState* %104, i32 0, i32 2
  %106 = load %struct.LodePNGState** %5, align 8
  %107 = getelementptr inbounds %struct.LodePNGState* %106, i32 0, i32 3
  %108 = getelementptr inbounds %struct.LodePNGInfo* %107, i32 0, i32 3
  %109 = load i32** %3, align 8
  %110 = load i32* %109, align 4
  %111 = load i32** %4, align 8
  %112 = load i32* %111, align 4
  %113 = load %struct.LodePNGState** %5, align 8
  %114 = getelementptr inbounds %struct.LodePNGState* %113, i32 0, i32 0
  %115 = getelementptr inbounds %struct.LodePNGDecoderSettings* %114, i32 0, i32 2
  %116 = load i32* %115, align 4
  %117 = call i32 @lodepng_convert(i8* %102, i8* %103, %struct.LodePNGColorMode* %105, %struct.LodePNGColorMode* %108, i32 %110, i32 %112, i32 %116)
  %118 = load %struct.LodePNGState** %5, align 8
  %119 = getelementptr inbounds %struct.LodePNGState* %118, i32 0, i32 4
  store i32 %117, i32* %119, align 4
  br label %120

; <label>:120                                     ; preds = %100, %97
  %121 = load i8** %data, align 8
  call void @lodepng_free(i8* %121)
  br label %122

; <label>:122                                     ; preds = %120, %61
  %123 = load %struct.LodePNGState** %5, align 8
  %124 = getelementptr inbounds %struct.LodePNGState* %123, i32 0, i32 4
  %125 = load i32* %124, align 4
  store i32 %125, i32* %1
  br label %126

; <label>:126                                     ; preds = %122, %82, %56, %19
  %127 = load i32* %1
  ret i32 %127
}

; Function Attrs: nounwind uwtable
define internal void @decodeGeneric(i8** %out, i32* %w, i32* %h, %struct.LodePNGState* %state, i8* %in, i64 %insize) #0 {
  %1 = alloca i8**, align 8
  %2 = alloca i32*, align 8
  %3 = alloca i32*, align 8
  %4 = alloca %struct.LodePNGState*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i64, align 8
  %IEND = alloca i8, align 1
  %chunk = alloca i8*, align 8
  %i = alloca i64, align 8
  %idat = alloca %struct.ucvector, align 8
  %scanlines = alloca %struct.ucvector, align 8
  %unknown = alloca i32, align 4
  %critical_pos = alloca i32, align 4
  %chunkLength = alloca i32, align 4
  %data = alloca i8*, align 8
  %oldsize = alloca i64, align 8
  %outv = alloca %struct.ucvector, align 8
  store i8** %out, i8*** %1, align 8
  store i32* %w, i32** %2, align 8
  store i32* %h, i32** %3, align 8
  store %struct.LodePNGState* %state, %struct.LodePNGState** %4, align 8
  store i8* %in, i8** %5, align 8
  store i64 %insize, i64* %6, align 8
  store i8 0, i8* %IEND, align 1
  store i32 0, i32* %unknown, align 4
  store i32 1, i32* %critical_pos, align 4
  %7 = load i8*** %1, align 8
  store i8* null, i8** %7, align 8
  %8 = load i32** %2, align 8
  %9 = load i32** %3, align 8
  %10 = load %struct.LodePNGState** %4, align 8
  %11 = load i8** %5, align 8
  %12 = load i64* %6, align 8
  %13 = call i32 @lodepng_inspect(i32* %8, i32* %9, %struct.LodePNGState* %10, i8* %11, i64 %12)
  %14 = load %struct.LodePNGState** %4, align 8
  %15 = getelementptr inbounds %struct.LodePNGState* %14, i32 0, i32 4
  store i32 %13, i32* %15, align 4
  %16 = load %struct.LodePNGState** %4, align 8
  %17 = getelementptr inbounds %struct.LodePNGState* %16, i32 0, i32 4
  %18 = load i32* %17, align 4
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %20, label %21

; <label>:20                                      ; preds = %0
  br label %466

; <label>:21                                      ; preds = %0
  call void @ucvector_init(%struct.ucvector* %idat)
  %22 = load i8** %5, align 8
  %23 = getelementptr inbounds i8* %22, i64 33
  store i8* %23, i8** %chunk, align 8
  br label %24

; <label>:24                                      ; preds = %378, %21
  %25 = load i8* %IEND, align 1
  %26 = icmp ne i8 %25, 0
  br i1 %26, label %33, label %27

; <label>:27                                      ; preds = %24
  %28 = load %struct.LodePNGState** %4, align 8
  %29 = getelementptr inbounds %struct.LodePNGState* %28, i32 0, i32 4
  %30 = load i32* %29, align 4
  %31 = icmp ne i32 %30, 0
  %32 = xor i1 %31, true
  br label %33

; <label>:33                                      ; preds = %27, %24
  %34 = phi i1 [ false, %24 ], [ %32, %27 ]
  br i1 %34, label %35, label %379

; <label>:35                                      ; preds = %33
  %36 = load i8** %chunk, align 8
  %37 = load i8** %5, align 8
  %38 = ptrtoint i8* %36 to i64
  %39 = ptrtoint i8* %37 to i64
  %40 = sub i64 %38, %39
  %41 = add nsw i64 %40, 12
  %42 = load i64* %6, align 8
  %43 = icmp ugt i64 %41, %42
  br i1 %43, label %48, label %44

; <label>:44                                      ; preds = %35
  %45 = load i8** %chunk, align 8
  %46 = load i8** %5, align 8
  %47 = icmp ult i8* %45, %46
  br i1 %47, label %48, label %51

; <label>:48                                      ; preds = %44, %35
  %49 = load %struct.LodePNGState** %4, align 8
  %50 = getelementptr inbounds %struct.LodePNGState* %49, i32 0, i32 4
  store i32 30, i32* %50, align 4
  br label %379

; <label>:51                                      ; preds = %44
  %52 = load i8** %chunk, align 8
  %53 = call i32 @lodepng_chunk_length(i8* %52)
  store i32 %53, i32* %chunkLength, align 4
  %54 = load i32* %chunkLength, align 4
  %55 = icmp ugt i32 %54, 2147483647
  br i1 %55, label %56, label %59

; <label>:56                                      ; preds = %51
  %57 = load %struct.LodePNGState** %4, align 8
  %58 = getelementptr inbounds %struct.LodePNGState* %57, i32 0, i32 4
  store i32 63, i32* %58, align 4
  br label %379

; <label>:59                                      ; preds = %51
  %60 = load i8** %chunk, align 8
  %61 = load i8** %5, align 8
  %62 = ptrtoint i8* %60 to i64
  %63 = ptrtoint i8* %61 to i64
  %64 = sub i64 %62, %63
  %65 = load i32* %chunkLength, align 4
  %66 = zext i32 %65 to i64
  %67 = add nsw i64 %64, %66
  %68 = add nsw i64 %67, 12
  %69 = load i64* %6, align 8
  %70 = icmp ugt i64 %68, %69
  br i1 %70, label %79, label %71

; <label>:71                                      ; preds = %59
  %72 = load i8** %chunk, align 8
  %73 = load i32* %chunkLength, align 4
  %74 = zext i32 %73 to i64
  %75 = getelementptr inbounds i8* %72, i64 %74
  %76 = getelementptr inbounds i8* %75, i64 12
  %77 = load i8** %5, align 8
  %78 = icmp ult i8* %76, %77
  br i1 %78, label %79, label %82

; <label>:79                                      ; preds = %71, %59
  %80 = load %struct.LodePNGState** %4, align 8
  %81 = getelementptr inbounds %struct.LodePNGState* %80, i32 0, i32 4
  store i32 64, i32* %81, align 4
  br label %379

; <label>:82                                      ; preds = %71
  %83 = load i8** %chunk, align 8
  %84 = call i8* @lodepng_chunk_data_const(i8* %83)
  store i8* %84, i8** %data, align 8
  %85 = load i8** %chunk, align 8
  %86 = call zeroext i8 @lodepng_chunk_type_equals(i8* %85, i8* getelementptr inbounds ([5 x i8]* @.str85, i32 0, i32 0))
  %87 = icmp ne i8 %86, 0
  br i1 %87, label %88, label %121

; <label>:88                                      ; preds = %82
  %89 = getelementptr inbounds %struct.ucvector* %idat, i32 0, i32 1
  %90 = load i64* %89, align 8
  store i64 %90, i64* %oldsize, align 8
  %91 = load i64* %oldsize, align 8
  %92 = load i32* %chunkLength, align 4
  %93 = zext i32 %92 to i64
  %94 = add i64 %91, %93
  %95 = call i32 @ucvector_resize(%struct.ucvector* %idat, i64 %94)
  %96 = icmp ne i32 %95, 0
  br i1 %96, label %100, label %97

; <label>:97                                      ; preds = %88
  %98 = load %struct.LodePNGState** %4, align 8
  %99 = getelementptr inbounds %struct.LodePNGState* %98, i32 0, i32 4
  store i32 83, i32* %99, align 4
  br label %379

; <label>:100                                     ; preds = %88
  store i64 0, i64* %i, align 8
  br label %101

; <label>:101                                     ; preds = %117, %100
  %102 = load i64* %i, align 8
  %103 = load i32* %chunkLength, align 4
  %104 = zext i32 %103 to i64
  %105 = icmp ult i64 %102, %104
  br i1 %105, label %106, label %120

; <label>:106                                     ; preds = %101
  %107 = load i64* %i, align 8
  %108 = load i8** %data, align 8
  %109 = getelementptr inbounds i8* %108, i64 %107
  %110 = load i8* %109, align 1
  %111 = load i64* %oldsize, align 8
  %112 = load i64* %i, align 8
  %113 = add i64 %111, %112
  %114 = getelementptr inbounds %struct.ucvector* %idat, i32 0, i32 0
  %115 = load i8** %114, align 8
  %116 = getelementptr inbounds i8* %115, i64 %113
  store i8 %110, i8* %116, align 1
  br label %117

; <label>:117                                     ; preds = %106
  %118 = load i64* %i, align 8
  %119 = add i64 %118, 1
  store i64 %119, i64* %i, align 8
  br label %101

; <label>:120                                     ; preds = %101
  store i32 3, i32* %critical_pos, align 4
  br label %355

; <label>:121                                     ; preds = %82
  %122 = load i8** %chunk, align 8
  %123 = call zeroext i8 @lodepng_chunk_type_equals(i8* %122, i8* getelementptr inbounds ([5 x i8]* @.str80, i32 0, i32 0))
  %124 = icmp ne i8 %123, 0
  br i1 %124, label %125, label %126

; <label>:125                                     ; preds = %121
  store i8 1, i8* %IEND, align 1
  br label %354

; <label>:126                                     ; preds = %121
  %127 = load i8** %chunk, align 8
  %128 = call zeroext i8 @lodepng_chunk_type_equals(i8* %127, i8* getelementptr inbounds ([5 x i8]* @.str89, i32 0, i32 0))
  %129 = icmp ne i8 %128, 0
  br i1 %129, label %130, label %146

; <label>:130                                     ; preds = %126
  %131 = load %struct.LodePNGState** %4, align 8
  %132 = getelementptr inbounds %struct.LodePNGState* %131, i32 0, i32 3
  %133 = getelementptr inbounds %struct.LodePNGInfo* %132, i32 0, i32 3
  %134 = load i8** %data, align 8
  %135 = load i32* %chunkLength, align 4
  %136 = zext i32 %135 to i64
  %137 = call i32 @readChunk_PLTE(%struct.LodePNGColorMode* %133, i8* %134, i64 %136)
  %138 = load %struct.LodePNGState** %4, align 8
  %139 = getelementptr inbounds %struct.LodePNGState* %138, i32 0, i32 4
  store i32 %137, i32* %139, align 4
  %140 = load %struct.LodePNGState** %4, align 8
  %141 = getelementptr inbounds %struct.LodePNGState* %140, i32 0, i32 4
  %142 = load i32* %141, align 4
  %143 = icmp ne i32 %142, 0
  br i1 %143, label %144, label %145

; <label>:144                                     ; preds = %130
  br label %379

; <label>:145                                     ; preds = %130
  store i32 2, i32* %critical_pos, align 4
  br label %353

; <label>:146                                     ; preds = %126
  %147 = load i8** %chunk, align 8
  %148 = call zeroext i8 @lodepng_chunk_type_equals(i8* %147, i8* getelementptr inbounds ([5 x i8]* @.str88, i32 0, i32 0))
  %149 = icmp ne i8 %148, 0
  br i1 %149, label %150, label %166

; <label>:150                                     ; preds = %146
  %151 = load %struct.LodePNGState** %4, align 8
  %152 = getelementptr inbounds %struct.LodePNGState* %151, i32 0, i32 3
  %153 = getelementptr inbounds %struct.LodePNGInfo* %152, i32 0, i32 3
  %154 = load i8** %data, align 8
  %155 = load i32* %chunkLength, align 4
  %156 = zext i32 %155 to i64
  %157 = call i32 @readChunk_tRNS(%struct.LodePNGColorMode* %153, i8* %154, i64 %156)
  %158 = load %struct.LodePNGState** %4, align 8
  %159 = getelementptr inbounds %struct.LodePNGState* %158, i32 0, i32 4
  store i32 %157, i32* %159, align 4
  %160 = load %struct.LodePNGState** %4, align 8
  %161 = getelementptr inbounds %struct.LodePNGState* %160, i32 0, i32 4
  %162 = load i32* %161, align 4
  %163 = icmp ne i32 %162, 0
  br i1 %163, label %164, label %165

; <label>:164                                     ; preds = %150
  br label %379

; <label>:165                                     ; preds = %150
  br label %352

; <label>:166                                     ; preds = %146
  %167 = load i8** %chunk, align 8
  %168 = call zeroext i8 @lodepng_chunk_type_equals(i8* %167, i8* getelementptr inbounds ([5 x i8]* @.str87, i32 0, i32 0))
  %169 = icmp ne i8 %168, 0
  br i1 %169, label %170, label %185

; <label>:170                                     ; preds = %166
  %171 = load %struct.LodePNGState** %4, align 8
  %172 = getelementptr inbounds %struct.LodePNGState* %171, i32 0, i32 3
  %173 = load i8** %data, align 8
  %174 = load i32* %chunkLength, align 4
  %175 = zext i32 %174 to i64
  %176 = call i32 @readChunk_bKGD(%struct.LodePNGInfo* %172, i8* %173, i64 %175)
  %177 = load %struct.LodePNGState** %4, align 8
  %178 = getelementptr inbounds %struct.LodePNGState* %177, i32 0, i32 4
  store i32 %176, i32* %178, align 4
  %179 = load %struct.LodePNGState** %4, align 8
  %180 = getelementptr inbounds %struct.LodePNGState* %179, i32 0, i32 4
  %181 = load i32* %180, align 4
  %182 = icmp ne i32 %181, 0
  br i1 %182, label %183, label %184

; <label>:183                                     ; preds = %170
  br label %379

; <label>:184                                     ; preds = %170
  br label %351

; <label>:185                                     ; preds = %166
  %186 = load i8** %chunk, align 8
  %187 = call zeroext i8 @lodepng_chunk_type_equals(i8* %186, i8* getelementptr inbounds ([5 x i8]* @.str82, i32 0, i32 0))
  %188 = icmp ne i8 %187, 0
  br i1 %188, label %189, label %211

; <label>:189                                     ; preds = %185
  %190 = load %struct.LodePNGState** %4, align 8
  %191 = getelementptr inbounds %struct.LodePNGState* %190, i32 0, i32 0
  %192 = getelementptr inbounds %struct.LodePNGDecoderSettings* %191, i32 0, i32 4
  %193 = load i32* %192, align 4
  %194 = icmp ne i32 %193, 0
  br i1 %194, label %195, label %210

; <label>:195                                     ; preds = %189
  %196 = load %struct.LodePNGState** %4, align 8
  %197 = getelementptr inbounds %struct.LodePNGState* %196, i32 0, i32 3
  %198 = load i8** %data, align 8
  %199 = load i32* %chunkLength, align 4
  %200 = zext i32 %199 to i64
  %201 = call i32 @readChunk_tEXt(%struct.LodePNGInfo* %197, i8* %198, i64 %200)
  %202 = load %struct.LodePNGState** %4, align 8
  %203 = getelementptr inbounds %struct.LodePNGState* %202, i32 0, i32 4
  store i32 %201, i32* %203, align 4
  %204 = load %struct.LodePNGState** %4, align 8
  %205 = getelementptr inbounds %struct.LodePNGState* %204, i32 0, i32 4
  %206 = load i32* %205, align 4
  %207 = icmp ne i32 %206, 0
  br i1 %207, label %208, label %209

; <label>:208                                     ; preds = %195
  br label %379

; <label>:209                                     ; preds = %195
  br label %210

; <label>:210                                     ; preds = %209, %189
  br label %350

; <label>:211                                     ; preds = %185
  %212 = load i8** %chunk, align 8
  %213 = call zeroext i8 @lodepng_chunk_type_equals(i8* %212, i8* getelementptr inbounds ([5 x i8]* @.str83, i32 0, i32 0))
  %214 = icmp ne i8 %213, 0
  br i1 %214, label %215, label %240

; <label>:215                                     ; preds = %211
  %216 = load %struct.LodePNGState** %4, align 8
  %217 = getelementptr inbounds %struct.LodePNGState* %216, i32 0, i32 0
  %218 = getelementptr inbounds %struct.LodePNGDecoderSettings* %217, i32 0, i32 4
  %219 = load i32* %218, align 4
  %220 = icmp ne i32 %219, 0
  br i1 %220, label %221, label %239

; <label>:221                                     ; preds = %215
  %222 = load %struct.LodePNGState** %4, align 8
  %223 = getelementptr inbounds %struct.LodePNGState* %222, i32 0, i32 3
  %224 = load %struct.LodePNGState** %4, align 8
  %225 = getelementptr inbounds %struct.LodePNGState* %224, i32 0, i32 0
  %226 = getelementptr inbounds %struct.LodePNGDecoderSettings* %225, i32 0, i32 0
  %227 = load i8** %data, align 8
  %228 = load i32* %chunkLength, align 4
  %229 = zext i32 %228 to i64
  %230 = call i32 @readChunk_zTXt(%struct.LodePNGInfo* %223, %struct.LodePNGDecompressSettings* %226, i8* %227, i64 %229)
  %231 = load %struct.LodePNGState** %4, align 8
  %232 = getelementptr inbounds %struct.LodePNGState* %231, i32 0, i32 4
  store i32 %230, i32* %232, align 4
  %233 = load %struct.LodePNGState** %4, align 8
  %234 = getelementptr inbounds %struct.LodePNGState* %233, i32 0, i32 4
  %235 = load i32* %234, align 4
  %236 = icmp ne i32 %235, 0
  br i1 %236, label %237, label %238

; <label>:237                                     ; preds = %221
  br label %379

; <label>:238                                     ; preds = %221
  br label %239

; <label>:239                                     ; preds = %238, %215
  br label %349

; <label>:240                                     ; preds = %211
  %241 = load i8** %chunk, align 8
  %242 = call zeroext i8 @lodepng_chunk_type_equals(i8* %241, i8* getelementptr inbounds ([5 x i8]* @.str81, i32 0, i32 0))
  %243 = icmp ne i8 %242, 0
  br i1 %243, label %244, label %269

; <label>:244                                     ; preds = %240
  %245 = load %struct.LodePNGState** %4, align 8
  %246 = getelementptr inbounds %struct.LodePNGState* %245, i32 0, i32 0
  %247 = getelementptr inbounds %struct.LodePNGDecoderSettings* %246, i32 0, i32 4
  %248 = load i32* %247, align 4
  %249 = icmp ne i32 %248, 0
  br i1 %249, label %250, label %268

; <label>:250                                     ; preds = %244
  %251 = load %struct.LodePNGState** %4, align 8
  %252 = getelementptr inbounds %struct.LodePNGState* %251, i32 0, i32 3
  %253 = load %struct.LodePNGState** %4, align 8
  %254 = getelementptr inbounds %struct.LodePNGState* %253, i32 0, i32 0
  %255 = getelementptr inbounds %struct.LodePNGDecoderSettings* %254, i32 0, i32 0
  %256 = load i8** %data, align 8
  %257 = load i32* %chunkLength, align 4
  %258 = zext i32 %257 to i64
  %259 = call i32 @readChunk_iTXt(%struct.LodePNGInfo* %252, %struct.LodePNGDecompressSettings* %255, i8* %256, i64 %258)
  %260 = load %struct.LodePNGState** %4, align 8
  %261 = getelementptr inbounds %struct.LodePNGState* %260, i32 0, i32 4
  store i32 %259, i32* %261, align 4
  %262 = load %struct.LodePNGState** %4, align 8
  %263 = getelementptr inbounds %struct.LodePNGState* %262, i32 0, i32 4
  %264 = load i32* %263, align 4
  %265 = icmp ne i32 %264, 0
  br i1 %265, label %266, label %267

; <label>:266                                     ; preds = %250
  br label %379

; <label>:267                                     ; preds = %250
  br label %268

; <label>:268                                     ; preds = %267, %244
  br label %348

; <label>:269                                     ; preds = %240
  %270 = load i8** %chunk, align 8
  %271 = call zeroext i8 @lodepng_chunk_type_equals(i8* %270, i8* getelementptr inbounds ([5 x i8]* @.str84, i32 0, i32 0))
  %272 = icmp ne i8 %271, 0
  br i1 %272, label %273, label %288

; <label>:273                                     ; preds = %269
  %274 = load %struct.LodePNGState** %4, align 8
  %275 = getelementptr inbounds %struct.LodePNGState* %274, i32 0, i32 3
  %276 = load i8** %data, align 8
  %277 = load i32* %chunkLength, align 4
  %278 = zext i32 %277 to i64
  %279 = call i32 @readChunk_tIME(%struct.LodePNGInfo* %275, i8* %276, i64 %278)
  %280 = load %struct.LodePNGState** %4, align 8
  %281 = getelementptr inbounds %struct.LodePNGState* %280, i32 0, i32 4
  store i32 %279, i32* %281, align 4
  %282 = load %struct.LodePNGState** %4, align 8
  %283 = getelementptr inbounds %struct.LodePNGState* %282, i32 0, i32 4
  %284 = load i32* %283, align 4
  %285 = icmp ne i32 %284, 0
  br i1 %285, label %286, label %287

; <label>:286                                     ; preds = %273
  br label %379

; <label>:287                                     ; preds = %273
  br label %347

; <label>:288                                     ; preds = %269
  %289 = load i8** %chunk, align 8
  %290 = call zeroext i8 @lodepng_chunk_type_equals(i8* %289, i8* getelementptr inbounds ([5 x i8]* @.str86, i32 0, i32 0))
  %291 = icmp ne i8 %290, 0
  br i1 %291, label %292, label %307

; <label>:292                                     ; preds = %288
  %293 = load %struct.LodePNGState** %4, align 8
  %294 = getelementptr inbounds %struct.LodePNGState* %293, i32 0, i32 3
  %295 = load i8** %data, align 8
  %296 = load i32* %chunkLength, align 4
  %297 = zext i32 %296 to i64
  %298 = call i32 @readChunk_pHYs(%struct.LodePNGInfo* %294, i8* %295, i64 %297)
  %299 = load %struct.LodePNGState** %4, align 8
  %300 = getelementptr inbounds %struct.LodePNGState* %299, i32 0, i32 4
  store i32 %298, i32* %300, align 4
  %301 = load %struct.LodePNGState** %4, align 8
  %302 = getelementptr inbounds %struct.LodePNGState* %301, i32 0, i32 4
  %303 = load i32* %302, align 4
  %304 = icmp ne i32 %303, 0
  br i1 %304, label %305, label %306

; <label>:305                                     ; preds = %292
  br label %379

; <label>:306                                     ; preds = %292
  br label %346

; <label>:307                                     ; preds = %288
  %308 = load i8** %chunk, align 8
  %309 = call zeroext i8 @lodepng_chunk_ancillary(i8* %308)
  %310 = icmp ne i8 %309, 0
  br i1 %310, label %314, label %311

; <label>:311                                     ; preds = %307
  %312 = load %struct.LodePNGState** %4, align 8
  %313 = getelementptr inbounds %struct.LodePNGState* %312, i32 0, i32 4
  store i32 69, i32* %313, align 4
  br label %379

; <label>:314                                     ; preds = %307
  store i32 1, i32* %unknown, align 4
  %315 = load %struct.LodePNGState** %4, align 8
  %316 = getelementptr inbounds %struct.LodePNGState* %315, i32 0, i32 0
  %317 = getelementptr inbounds %struct.LodePNGDecoderSettings* %316, i32 0, i32 5
  %318 = load i32* %317, align 4
  %319 = icmp ne i32 %318, 0
  br i1 %319, label %320, label %345

; <label>:320                                     ; preds = %314
  %321 = load i32* %critical_pos, align 4
  %322 = sub i32 %321, 1
  %323 = zext i32 %322 to i64
  %324 = load %struct.LodePNGState** %4, align 8
  %325 = getelementptr inbounds %struct.LodePNGState* %324, i32 0, i32 3
  %326 = getelementptr inbounds %struct.LodePNGInfo* %325, i32 0, i32 22
  %327 = getelementptr inbounds [3 x i8*]* %326, i32 0, i64 %323
  %328 = load i32* %critical_pos, align 4
  %329 = sub i32 %328, 1
  %330 = zext i32 %329 to i64
  %331 = load %struct.LodePNGState** %4, align 8
  %332 = getelementptr inbounds %struct.LodePNGState* %331, i32 0, i32 3
  %333 = getelementptr inbounds %struct.LodePNGInfo* %332, i32 0, i32 23
  %334 = getelementptr inbounds [3 x i64]* %333, i32 0, i64 %330
  %335 = load i8** %chunk, align 8
  %336 = call i32 @lodepng_chunk_append(i8** %327, i64* %334, i8* %335)
  %337 = load %struct.LodePNGState** %4, align 8
  %338 = getelementptr inbounds %struct.LodePNGState* %337, i32 0, i32 4
  store i32 %336, i32* %338, align 4
  %339 = load %struct.LodePNGState** %4, align 8
  %340 = getelementptr inbounds %struct.LodePNGState* %339, i32 0, i32 4
  %341 = load i32* %340, align 4
  %342 = icmp ne i32 %341, 0
  br i1 %342, label %343, label %344

; <label>:343                                     ; preds = %320
  br label %379

; <label>:344                                     ; preds = %320
  br label %345

; <label>:345                                     ; preds = %344, %314
  br label %346

; <label>:346                                     ; preds = %345, %306
  br label %347

; <label>:347                                     ; preds = %346, %287
  br label %348

; <label>:348                                     ; preds = %347, %268
  br label %349

; <label>:349                                     ; preds = %348, %239
  br label %350

; <label>:350                                     ; preds = %349, %210
  br label %351

; <label>:351                                     ; preds = %350, %184
  br label %352

; <label>:352                                     ; preds = %351, %165
  br label %353

; <label>:353                                     ; preds = %352, %145
  br label %354

; <label>:354                                     ; preds = %353, %125
  br label %355

; <label>:355                                     ; preds = %354, %120
  %356 = load %struct.LodePNGState** %4, align 8
  %357 = getelementptr inbounds %struct.LodePNGState* %356, i32 0, i32 0
  %358 = getelementptr inbounds %struct.LodePNGDecoderSettings* %357, i32 0, i32 1
  %359 = load i32* %358, align 4
  %360 = icmp ne i32 %359, 0
  br i1 %360, label %372, label %361

; <label>:361                                     ; preds = %355
  %362 = load i32* %unknown, align 4
  %363 = icmp ne i32 %362, 0
  br i1 %363, label %372, label %364

; <label>:364                                     ; preds = %361
  %365 = load i8** %chunk, align 8
  %366 = call i32 @lodepng_chunk_check_crc(i8* %365)
  %367 = icmp ne i32 %366, 0
  br i1 %367, label %368, label %371

; <label>:368                                     ; preds = %364
  %369 = load %struct.LodePNGState** %4, align 8
  %370 = getelementptr inbounds %struct.LodePNGState* %369, i32 0, i32 4
  store i32 57, i32* %370, align 4
  br label %379

; <label>:371                                     ; preds = %364
  br label %372

; <label>:372                                     ; preds = %371, %361, %355
  %373 = load i8* %IEND, align 1
  %374 = icmp ne i8 %373, 0
  br i1 %374, label %378, label %375

; <label>:375                                     ; preds = %372
  %376 = load i8** %chunk, align 8
  %377 = call i8* @lodepng_chunk_next_const(i8* %376)
  store i8* %377, i8** %chunk, align 8
  br label %378

; <label>:378                                     ; preds = %375, %372
  br label %24

; <label>:379                                     ; preds = %368, %343, %311, %305, %286, %266, %237, %208, %183, %164, %144, %97, %79, %56, %48, %33
  call void @ucvector_init(%struct.ucvector* %scanlines)
  %380 = load %struct.LodePNGState** %4, align 8
  %381 = getelementptr inbounds %struct.LodePNGState* %380, i32 0, i32 4
  %382 = load i32* %381, align 4
  %383 = icmp ne i32 %382, 0
  br i1 %383, label %403, label %384

; <label>:384                                     ; preds = %379
  %385 = load i32** %2, align 8
  %386 = load i32* %385, align 4
  %387 = load i32** %3, align 8
  %388 = load i32* %387, align 4
  %389 = load %struct.LodePNGState** %4, align 8
  %390 = getelementptr inbounds %struct.LodePNGState* %389, i32 0, i32 3
  %391 = getelementptr inbounds %struct.LodePNGInfo* %390, i32 0, i32 3
  %392 = call i64 @lodepng_get_raw_size(i32 %386, i32 %388, %struct.LodePNGColorMode* %391)
  %393 = load i32** %3, align 8
  %394 = load i32* %393, align 4
  %395 = zext i32 %394 to i64
  %396 = add i64 %392, %395
  %397 = call i32 @ucvector_resize(%struct.ucvector* %scanlines, i64 %396)
  %398 = icmp ne i32 %397, 0
  br i1 %398, label %402, label %399

; <label>:399                                     ; preds = %384
  %400 = load %struct.LodePNGState** %4, align 8
  %401 = getelementptr inbounds %struct.LodePNGState* %400, i32 0, i32 4
  store i32 83, i32* %401, align 4
  br label %402

; <label>:402                                     ; preds = %399, %384
  br label %403

; <label>:403                                     ; preds = %402, %379
  %404 = load %struct.LodePNGState** %4, align 8
  %405 = getelementptr inbounds %struct.LodePNGState* %404, i32 0, i32 4
  %406 = load i32* %405, align 4
  %407 = icmp ne i32 %406, 0
  br i1 %407, label %421, label %408

; <label>:408                                     ; preds = %403
  %409 = getelementptr inbounds %struct.ucvector* %scanlines, i32 0, i32 0
  %410 = getelementptr inbounds %struct.ucvector* %scanlines, i32 0, i32 1
  %411 = getelementptr inbounds %struct.ucvector* %idat, i32 0, i32 0
  %412 = load i8** %411, align 8
  %413 = getelementptr inbounds %struct.ucvector* %idat, i32 0, i32 1
  %414 = load i64* %413, align 8
  %415 = load %struct.LodePNGState** %4, align 8
  %416 = getelementptr inbounds %struct.LodePNGState* %415, i32 0, i32 0
  %417 = getelementptr inbounds %struct.LodePNGDecoderSettings* %416, i32 0, i32 0
  %418 = call i32 @zlib_decompress(i8** %409, i64* %410, i8* %412, i64 %414, %struct.LodePNGDecompressSettings* %417)
  %419 = load %struct.LodePNGState** %4, align 8
  %420 = getelementptr inbounds %struct.LodePNGState* %419, i32 0, i32 4
  store i32 %418, i32* %420, align 4
  br label %421

; <label>:421                                     ; preds = %408, %403
  %422 = bitcast %struct.ucvector* %idat to i8*
  call void @ucvector_cleanup(i8* %422)
  %423 = load %struct.LodePNGState** %4, align 8
  %424 = getelementptr inbounds %struct.LodePNGState* %423, i32 0, i32 4
  %425 = load i32* %424, align 4
  %426 = icmp ne i32 %425, 0
  br i1 %426, label %464, label %427

; <label>:427                                     ; preds = %421
  call void @ucvector_init(%struct.ucvector* %outv)
  %428 = load i32** %2, align 8
  %429 = load i32* %428, align 4
  %430 = load i32** %3, align 8
  %431 = load i32* %430, align 4
  %432 = load %struct.LodePNGState** %4, align 8
  %433 = getelementptr inbounds %struct.LodePNGState* %432, i32 0, i32 3
  %434 = getelementptr inbounds %struct.LodePNGInfo* %433, i32 0, i32 3
  %435 = call i64 @lodepng_get_raw_size(i32 %429, i32 %431, %struct.LodePNGColorMode* %434)
  %436 = call i32 @ucvector_resizev(%struct.ucvector* %outv, i64 %435, i8 zeroext 0)
  %437 = icmp ne i32 %436, 0
  br i1 %437, label %441, label %438

; <label>:438                                     ; preds = %427
  %439 = load %struct.LodePNGState** %4, align 8
  %440 = getelementptr inbounds %struct.LodePNGState* %439, i32 0, i32 4
  store i32 83, i32* %440, align 4
  br label %441

; <label>:441                                     ; preds = %438, %427
  %442 = load %struct.LodePNGState** %4, align 8
  %443 = getelementptr inbounds %struct.LodePNGState* %442, i32 0, i32 4
  %444 = load i32* %443, align 4
  %445 = icmp ne i32 %444, 0
  br i1 %445, label %460, label %446

; <label>:446                                     ; preds = %441
  %447 = getelementptr inbounds %struct.ucvector* %outv, i32 0, i32 0
  %448 = load i8** %447, align 8
  %449 = getelementptr inbounds %struct.ucvector* %scanlines, i32 0, i32 0
  %450 = load i8** %449, align 8
  %451 = load i32** %2, align 8
  %452 = load i32* %451, align 4
  %453 = load i32** %3, align 8
  %454 = load i32* %453, align 4
  %455 = load %struct.LodePNGState** %4, align 8
  %456 = getelementptr inbounds %struct.LodePNGState* %455, i32 0, i32 3
  %457 = call i32 @postProcessScanlines(i8* %448, i8* %450, i32 %452, i32 %454, %struct.LodePNGInfo* %456)
  %458 = load %struct.LodePNGState** %4, align 8
  %459 = getelementptr inbounds %struct.LodePNGState* %458, i32 0, i32 4
  store i32 %457, i32* %459, align 4
  br label %460

; <label>:460                                     ; preds = %446, %441
  %461 = getelementptr inbounds %struct.ucvector* %outv, i32 0, i32 0
  %462 = load i8** %461, align 8
  %463 = load i8*** %1, align 8
  store i8* %462, i8** %463, align 8
  br label %464

; <label>:464                                     ; preds = %460, %421
  %465 = bitcast %struct.ucvector* %scanlines to i8*
  call void @ucvector_cleanup(i8* %465)
  br label %466

; <label>:466                                     ; preds = %464, %20
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @lodepng_decode_memory(i8** %out, i32* %w, i32* %h, i8* %in, i64 %insize, i32 %colortype, i32 %bitdepth) #0 {
  %1 = alloca i8**, align 8
  %2 = alloca i32*, align 8
  %3 = alloca i32*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i64, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %error = alloca i32, align 4
  %state = alloca %struct.LodePNGState, align 8
  store i8** %out, i8*** %1, align 8
  store i32* %w, i32** %2, align 8
  store i32* %h, i32** %3, align 8
  store i8* %in, i8** %4, align 8
  store i64 %insize, i64* %5, align 8
  store i32 %colortype, i32* %6, align 4
  store i32 %bitdepth, i32* %7, align 4
  call void @lodepng_state_init(%struct.LodePNGState* %state)
  %8 = load i32* %6, align 4
  %9 = getelementptr inbounds %struct.LodePNGState* %state, i32 0, i32 2
  %10 = getelementptr inbounds %struct.LodePNGColorMode* %9, i32 0, i32 0
  store i32 %8, i32* %10, align 4
  %11 = load i32* %7, align 4
  %12 = getelementptr inbounds %struct.LodePNGState* %state, i32 0, i32 2
  %13 = getelementptr inbounds %struct.LodePNGColorMode* %12, i32 0, i32 1
  store i32 %11, i32* %13, align 4
  %14 = load i8*** %1, align 8
  %15 = load i32** %2, align 8
  %16 = load i32** %3, align 8
  %17 = load i8** %4, align 8
  %18 = load i64* %5, align 8
  %19 = call i32 @lodepng_decode(i8** %14, i32* %15, i32* %16, %struct.LodePNGState* %state, i8* %17, i64 %18)
  store i32 %19, i32* %error, align 4
  call void @lodepng_state_cleanup(%struct.LodePNGState* %state)
  %20 = load i32* %error, align 4
  ret i32 %20
}

; Function Attrs: nounwind uwtable
define void @lodepng_state_init(%struct.LodePNGState* %state) #0 {
  %1 = alloca %struct.LodePNGState*, align 8
  store %struct.LodePNGState* %state, %struct.LodePNGState** %1, align 8
  %2 = load %struct.LodePNGState** %1, align 8
  %3 = getelementptr inbounds %struct.LodePNGState* %2, i32 0, i32 0
  call void @lodepng_decoder_settings_init(%struct.LodePNGDecoderSettings* %3)
  %4 = load %struct.LodePNGState** %1, align 8
  %5 = getelementptr inbounds %struct.LodePNGState* %4, i32 0, i32 1
  call void @lodepng_encoder_settings_init(%struct.LodePNGEncoderSettings* %5)
  %6 = load %struct.LodePNGState** %1, align 8
  %7 = getelementptr inbounds %struct.LodePNGState* %6, i32 0, i32 2
  call void @lodepng_color_mode_init(%struct.LodePNGColorMode* %7)
  %8 = load %struct.LodePNGState** %1, align 8
  %9 = getelementptr inbounds %struct.LodePNGState* %8, i32 0, i32 3
  call void @lodepng_info_init(%struct.LodePNGInfo* %9)
  %10 = load %struct.LodePNGState** %1, align 8
  %11 = getelementptr inbounds %struct.LodePNGState* %10, i32 0, i32 4
  store i32 1, i32* %11, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @lodepng_state_cleanup(%struct.LodePNGState* %state) #0 {
  %1 = alloca %struct.LodePNGState*, align 8
  store %struct.LodePNGState* %state, %struct.LodePNGState** %1, align 8
  %2 = load %struct.LodePNGState** %1, align 8
  %3 = getelementptr inbounds %struct.LodePNGState* %2, i32 0, i32 2
  call void @lodepng_color_mode_cleanup(%struct.LodePNGColorMode* %3)
  %4 = load %struct.LodePNGState** %1, align 8
  %5 = getelementptr inbounds %struct.LodePNGState* %4, i32 0, i32 3
  call void @lodepng_info_cleanup(%struct.LodePNGInfo* %5)
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @lodepng_decode32(i8** %out, i32* %w, i32* %h, i8* %in, i64 %insize) #0 {
  %1 = alloca i8**, align 8
  %2 = alloca i32*, align 8
  %3 = alloca i32*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i64, align 8
  store i8** %out, i8*** %1, align 8
  store i32* %w, i32** %2, align 8
  store i32* %h, i32** %3, align 8
  store i8* %in, i8** %4, align 8
  store i64 %insize, i64* %5, align 8
  %6 = load i8*** %1, align 8
  %7 = load i32** %2, align 8
  %8 = load i32** %3, align 8
  %9 = load i8** %4, align 8
  %10 = load i64* %5, align 8
  %11 = call i32 @lodepng_decode_memory(i8** %6, i32* %7, i32* %8, i8* %9, i64 %10, i32 6, i32 8)
  ret i32 %11
}

; Function Attrs: nounwind uwtable
define i32 @lodepng_decode24(i8** %out, i32* %w, i32* %h, i8* %in, i64 %insize) #0 {
  %1 = alloca i8**, align 8
  %2 = alloca i32*, align 8
  %3 = alloca i32*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i64, align 8
  store i8** %out, i8*** %1, align 8
  store i32* %w, i32** %2, align 8
  store i32* %h, i32** %3, align 8
  store i8* %in, i8** %4, align 8
  store i64 %insize, i64* %5, align 8
  %6 = load i8*** %1, align 8
  %7 = load i32** %2, align 8
  %8 = load i32** %3, align 8
  %9 = load i8** %4, align 8
  %10 = load i64* %5, align 8
  %11 = call i32 @lodepng_decode_memory(i8** %6, i32* %7, i32* %8, i8* %9, i64 %10, i32 2, i32 8)
  ret i32 %11
}

; Function Attrs: nounwind uwtable
define i32 @lodepng_decode_file(i8** %out, i32* %w, i32* %h, i8* %filename, i32 %colortype, i32 %bitdepth) #0 {
  %1 = alloca i8**, align 8
  %2 = alloca i32*, align 8
  %3 = alloca i32*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %buffer = alloca i8*, align 8
  %buffersize = alloca i64, align 8
  %error = alloca i32, align 4
  store i8** %out, i8*** %1, align 8
  store i32* %w, i32** %2, align 8
  store i32* %h, i32** %3, align 8
  store i8* %filename, i8** %4, align 8
  store i32 %colortype, i32* %5, align 4
  store i32 %bitdepth, i32* %6, align 4
  %7 = load i8** %4, align 8
  %8 = call i32 @lodepng_load_file(i8** %buffer, i64* %buffersize, i8* %7)
  store i32 %8, i32* %error, align 4
  %9 = load i32* %error, align 4
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %20, label %11

; <label>:11                                      ; preds = %0
  %12 = load i8*** %1, align 8
  %13 = load i32** %2, align 8
  %14 = load i32** %3, align 8
  %15 = load i8** %buffer, align 8
  %16 = load i64* %buffersize, align 8
  %17 = load i32* %5, align 4
  %18 = load i32* %6, align 4
  %19 = call i32 @lodepng_decode_memory(i8** %12, i32* %13, i32* %14, i8* %15, i64 %16, i32 %17, i32 %18)
  store i32 %19, i32* %error, align 4
  br label %20

; <label>:20                                      ; preds = %11, %0
  %21 = load i8** %buffer, align 8
  call void @lodepng_free(i8* %21)
  %22 = load i32* %error, align 4
  ret i32 %22
}

; Function Attrs: nounwind uwtable
define i32 @lodepng_decode32_file(i8** %out, i32* %w, i32* %h, i8* %filename) #0 {
  %1 = alloca i8**, align 8
  %2 = alloca i32*, align 8
  %3 = alloca i32*, align 8
  %4 = alloca i8*, align 8
  store i8** %out, i8*** %1, align 8
  store i32* %w, i32** %2, align 8
  store i32* %h, i32** %3, align 8
  store i8* %filename, i8** %4, align 8
  %5 = load i8*** %1, align 8
  %6 = load i32** %2, align 8
  %7 = load i32** %3, align 8
  %8 = load i8** %4, align 8
  %9 = call i32 @lodepng_decode_file(i8** %5, i32* %6, i32* %7, i8* %8, i32 6, i32 8)
  ret i32 %9
}

; Function Attrs: nounwind uwtable
define i32 @lodepng_decode24_file(i8** %out, i32* %w, i32* %h, i8* %filename) #0 {
  %1 = alloca i8**, align 8
  %2 = alloca i32*, align 8
  %3 = alloca i32*, align 8
  %4 = alloca i8*, align 8
  store i8** %out, i8*** %1, align 8
  store i32* %w, i32** %2, align 8
  store i32* %h, i32** %3, align 8
  store i8* %filename, i8** %4, align 8
  %5 = load i8*** %1, align 8
  %6 = load i32** %2, align 8
  %7 = load i32** %3, align 8
  %8 = load i8** %4, align 8
  %9 = call i32 @lodepng_decode_file(i8** %5, i32* %6, i32* %7, i8* %8, i32 2, i32 8)
  ret i32 %9
}

; Function Attrs: nounwind uwtable
define void @lodepng_decoder_settings_init(%struct.LodePNGDecoderSettings* %settings) #0 {
  %1 = alloca %struct.LodePNGDecoderSettings*, align 8
  store %struct.LodePNGDecoderSettings* %settings, %struct.LodePNGDecoderSettings** %1, align 8
  %2 = load %struct.LodePNGDecoderSettings** %1, align 8
  %3 = getelementptr inbounds %struct.LodePNGDecoderSettings* %2, i32 0, i32 3
  store i32 1, i32* %3, align 4
  %4 = load %struct.LodePNGDecoderSettings** %1, align 8
  %5 = getelementptr inbounds %struct.LodePNGDecoderSettings* %4, i32 0, i32 4
  store i32 1, i32* %5, align 4
  %6 = load %struct.LodePNGDecoderSettings** %1, align 8
  %7 = getelementptr inbounds %struct.LodePNGDecoderSettings* %6, i32 0, i32 5
  store i32 0, i32* %7, align 4
  %8 = load %struct.LodePNGDecoderSettings** %1, align 8
  %9 = getelementptr inbounds %struct.LodePNGDecoderSettings* %8, i32 0, i32 1
  store i32 0, i32* %9, align 4
  %10 = load %struct.LodePNGDecoderSettings** %1, align 8
  %11 = getelementptr inbounds %struct.LodePNGDecoderSettings* %10, i32 0, i32 2
  store i32 0, i32* %11, align 4
  %12 = load %struct.LodePNGDecoderSettings** %1, align 8
  %13 = getelementptr inbounds %struct.LodePNGDecoderSettings* %12, i32 0, i32 0
  call void @lodepng_decompress_settings_init(%struct.LodePNGDecompressSettings* %13)
  ret void
}

; Function Attrs: nounwind uwtable
define void @lodepng_encoder_settings_init(%struct.LodePNGEncoderSettings* %settings) #0 {
  %1 = alloca %struct.LodePNGEncoderSettings*, align 8
  store %struct.LodePNGEncoderSettings* %settings, %struct.LodePNGEncoderSettings** %1, align 8
  %2 = load %struct.LodePNGEncoderSettings** %1, align 8
  %3 = getelementptr inbounds %struct.LodePNGEncoderSettings* %2, i32 0, i32 0
  call void @lodepng_compress_settings_init(%struct.LodePNGCompressSettings* %3)
  %4 = load %struct.LodePNGEncoderSettings** %1, align 8
  %5 = getelementptr inbounds %struct.LodePNGEncoderSettings* %4, i32 0, i32 2
  store i32 1, i32* %5, align 4
  %6 = load %struct.LodePNGEncoderSettings** %1, align 8
  %7 = getelementptr inbounds %struct.LodePNGEncoderSettings* %6, i32 0, i32 3
  store i32 1, i32* %7, align 4
  %8 = load %struct.LodePNGEncoderSettings** %1, align 8
  %9 = getelementptr inbounds %struct.LodePNGEncoderSettings* %8, i32 0, i32 1
  store i32 2, i32* %9, align 4
  %10 = load %struct.LodePNGEncoderSettings** %1, align 8
  %11 = getelementptr inbounds %struct.LodePNGEncoderSettings* %10, i32 0, i32 5
  store i32 0, i32* %11, align 4
  %12 = load %struct.LodePNGEncoderSettings** %1, align 8
  %13 = getelementptr inbounds %struct.LodePNGEncoderSettings* %12, i32 0, i32 4
  store i8* null, i8** %13, align 8
  %14 = load %struct.LodePNGEncoderSettings** %1, align 8
  %15 = getelementptr inbounds %struct.LodePNGEncoderSettings* %14, i32 0, i32 6
  store i32 0, i32* %15, align 4
  %16 = load %struct.LodePNGEncoderSettings** %1, align 8
  %17 = getelementptr inbounds %struct.LodePNGEncoderSettings* %16, i32 0, i32 7
  store i32 1, i32* %17, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @lodepng_state_copy(%struct.LodePNGState* %dest, %struct.LodePNGState* %source) #0 {
  %1 = alloca %struct.LodePNGState*, align 8
  %2 = alloca %struct.LodePNGState*, align 8
  store %struct.LodePNGState* %dest, %struct.LodePNGState** %1, align 8
  store %struct.LodePNGState* %source, %struct.LodePNGState** %2, align 8
  %3 = load %struct.LodePNGState** %1, align 8
  call void @lodepng_state_cleanup(%struct.LodePNGState* %3)
  %4 = load %struct.LodePNGState** %1, align 8
  %5 = load %struct.LodePNGState** %2, align 8
  %6 = bitcast %struct.LodePNGState* %4 to i8*
  %7 = bitcast %struct.LodePNGState* %5 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %6, i8* %7, i64 424, i32 8, i1 false)
  %8 = load %struct.LodePNGState** %1, align 8
  %9 = getelementptr inbounds %struct.LodePNGState* %8, i32 0, i32 2
  call void @lodepng_color_mode_init(%struct.LodePNGColorMode* %9)
  %10 = load %struct.LodePNGState** %1, align 8
  %11 = getelementptr inbounds %struct.LodePNGState* %10, i32 0, i32 3
  call void @lodepng_info_init(%struct.LodePNGInfo* %11)
  %12 = load %struct.LodePNGState** %1, align 8
  %13 = getelementptr inbounds %struct.LodePNGState* %12, i32 0, i32 2
  %14 = load %struct.LodePNGState** %2, align 8
  %15 = getelementptr inbounds %struct.LodePNGState* %14, i32 0, i32 2
  %16 = call i32 @lodepng_color_mode_copy(%struct.LodePNGColorMode* %13, %struct.LodePNGColorMode* %15)
  %17 = load %struct.LodePNGState** %1, align 8
  %18 = getelementptr inbounds %struct.LodePNGState* %17, i32 0, i32 4
  store i32 %16, i32* %18, align 4
  %19 = load %struct.LodePNGState** %1, align 8
  %20 = getelementptr inbounds %struct.LodePNGState* %19, i32 0, i32 4
  %21 = load i32* %20, align 4
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %23, label %24

; <label>:23                                      ; preds = %0
  br label %37

; <label>:24                                      ; preds = %0
  %25 = load %struct.LodePNGState** %1, align 8
  %26 = getelementptr inbounds %struct.LodePNGState* %25, i32 0, i32 3
  %27 = load %struct.LodePNGState** %2, align 8
  %28 = getelementptr inbounds %struct.LodePNGState* %27, i32 0, i32 3
  %29 = call i32 @lodepng_info_copy(%struct.LodePNGInfo* %26, %struct.LodePNGInfo* %28)
  %30 = load %struct.LodePNGState** %1, align 8
  %31 = getelementptr inbounds %struct.LodePNGState* %30, i32 0, i32 4
  store i32 %29, i32* %31, align 4
  %32 = load %struct.LodePNGState** %1, align 8
  %33 = getelementptr inbounds %struct.LodePNGState* %32, i32 0, i32 4
  %34 = load i32* %33, align 4
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %36, label %37

; <label>:36                                      ; preds = %24
  br label %37

; <label>:37                                      ; preds = %23, %36, %24
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @lodepng_encode(i8** %out, i64* %outsize, i8* %image, i32 %w, i32 %h, %struct.LodePNGState* %state) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8**, align 8
  %3 = alloca i64*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca %struct.LodePNGState*, align 8
  %info = alloca %struct.LodePNGInfo, align 8
  %outv = alloca %struct.ucvector, align 8
  %data = alloca i8*, align 8
  %datasize = alloca i64, align 8
  %converted = alloca i8*, align 8
  %size = alloca i64, align 8
  %i = alloca i64, align 8
  %alread_added_id_text = alloca i32, align 4
  store i8** %out, i8*** %2, align 8
  store i64* %outsize, i64** %3, align 8
  store i8* %image, i8** %4, align 8
  store i32 %w, i32* %5, align 4
  store i32 %h, i32* %6, align 4
  store %struct.LodePNGState* %state, %struct.LodePNGState** %7, align 8
  store i8* null, i8** %data, align 8
  store i64 0, i64* %datasize, align 8
  %8 = load i8*** %2, align 8
  store i8* null, i8** %8, align 8
  %9 = load i64** %3, align 8
  store i64 0, i64* %9, align 8
  %10 = load %struct.LodePNGState** %7, align 8
  %11 = getelementptr inbounds %struct.LodePNGState* %10, i32 0, i32 4
  store i32 0, i32* %11, align 4
  call void @lodepng_info_init(%struct.LodePNGInfo* %info)
  %12 = load %struct.LodePNGState** %7, align 8
  %13 = getelementptr inbounds %struct.LodePNGState* %12, i32 0, i32 3
  %14 = call i32 @lodepng_info_copy(%struct.LodePNGInfo* %info, %struct.LodePNGInfo* %13)
  %15 = getelementptr inbounds %struct.LodePNGInfo* %info, i32 0, i32 3
  %16 = getelementptr inbounds %struct.LodePNGColorMode* %15, i32 0, i32 0
  %17 = load i32* %16, align 4
  %18 = icmp eq i32 %17, 3
  br i1 %18, label %25, label %19

; <label>:19                                      ; preds = %0
  %20 = load %struct.LodePNGState** %7, align 8
  %21 = getelementptr inbounds %struct.LodePNGState* %20, i32 0, i32 1
  %22 = getelementptr inbounds %struct.LodePNGEncoderSettings* %21, i32 0, i32 5
  %23 = load i32* %22, align 4
  %24 = icmp ne i32 %23, 0
  br i1 %24, label %25, label %41

; <label>:25                                      ; preds = %19, %0
  %26 = getelementptr inbounds %struct.LodePNGInfo* %info, i32 0, i32 3
  %27 = getelementptr inbounds %struct.LodePNGColorMode* %26, i32 0, i32 3
  %28 = load i64* %27, align 8
  %29 = icmp eq i64 %28, 0
  br i1 %29, label %35, label %30

; <label>:30                                      ; preds = %25
  %31 = getelementptr inbounds %struct.LodePNGInfo* %info, i32 0, i32 3
  %32 = getelementptr inbounds %struct.LodePNGColorMode* %31, i32 0, i32 3
  %33 = load i64* %32, align 8
  %34 = icmp ugt i64 %33, 256
  br i1 %34, label %35, label %41

; <label>:35                                      ; preds = %30, %25
  %36 = load %struct.LodePNGState** %7, align 8
  %37 = getelementptr inbounds %struct.LodePNGState* %36, i32 0, i32 4
  store i32 68, i32* %37, align 4
  %38 = load %struct.LodePNGState** %7, align 8
  %39 = getelementptr inbounds %struct.LodePNGState* %38, i32 0, i32 4
  %40 = load i32* %39, align 4
  store i32 %40, i32* %1
  br label %535

; <label>:41                                      ; preds = %30, %19
  %42 = load %struct.LodePNGState** %7, align 8
  %43 = getelementptr inbounds %struct.LodePNGState* %42, i32 0, i32 1
  %44 = getelementptr inbounds %struct.LodePNGEncoderSettings* %43, i32 0, i32 1
  %45 = load i32* %44, align 4
  %46 = icmp ne i32 %45, 0
  br i1 %46, label %47, label %61

; <label>:47                                      ; preds = %41
  %48 = getelementptr inbounds %struct.LodePNGInfo* %info, i32 0, i32 3
  %49 = load i8** %4, align 8
  %50 = load i32* %5, align 4
  %51 = load i32* %6, align 4
  %52 = load %struct.LodePNGState** %7, align 8
  %53 = getelementptr inbounds %struct.LodePNGState* %52, i32 0, i32 2
  %54 = load %struct.LodePNGState** %7, align 8
  %55 = getelementptr inbounds %struct.LodePNGState* %54, i32 0, i32 1
  %56 = getelementptr inbounds %struct.LodePNGEncoderSettings* %55, i32 0, i32 1
  %57 = load i32* %56, align 4
  %58 = call i32 @lodepng_auto_choose_color(%struct.LodePNGColorMode* %48, i8* %49, i32 %50, i32 %51, %struct.LodePNGColorMode* %53, i32 %57)
  %59 = load %struct.LodePNGState** %7, align 8
  %60 = getelementptr inbounds %struct.LodePNGState* %59, i32 0, i32 4
  store i32 %58, i32* %60, align 4
  br label %61

; <label>:61                                      ; preds = %47, %41
  %62 = load %struct.LodePNGState** %7, align 8
  %63 = getelementptr inbounds %struct.LodePNGState* %62, i32 0, i32 4
  %64 = load i32* %63, align 4
  %65 = icmp ne i32 %64, 0
  br i1 %65, label %66, label %70

; <label>:66                                      ; preds = %61
  %67 = load %struct.LodePNGState** %7, align 8
  %68 = getelementptr inbounds %struct.LodePNGState* %67, i32 0, i32 4
  %69 = load i32* %68, align 4
  store i32 %69, i32* %1
  br label %535

; <label>:70                                      ; preds = %61
  %71 = load %struct.LodePNGState** %7, align 8
  %72 = getelementptr inbounds %struct.LodePNGState* %71, i32 0, i32 1
  %73 = getelementptr inbounds %struct.LodePNGEncoderSettings* %72, i32 0, i32 0
  %74 = getelementptr inbounds %struct.LodePNGCompressSettings* %73, i32 0, i32 0
  %75 = load i32* %74, align 4
  %76 = icmp ugt i32 %75, 2
  br i1 %76, label %77, label %80

; <label>:77                                      ; preds = %70
  %78 = load %struct.LodePNGState** %7, align 8
  %79 = getelementptr inbounds %struct.LodePNGState* %78, i32 0, i32 4
  store i32 61, i32* %79, align 4
  store i32 61, i32* %1
  br label %535

; <label>:80                                      ; preds = %70
  %81 = load %struct.LodePNGState** %7, align 8
  %82 = getelementptr inbounds %struct.LodePNGState* %81, i32 0, i32 3
  %83 = getelementptr inbounds %struct.LodePNGInfo* %82, i32 0, i32 2
  %84 = load i32* %83, align 4
  %85 = icmp ugt i32 %84, 1
  br i1 %85, label %86, label %89

; <label>:86                                      ; preds = %80
  %87 = load %struct.LodePNGState** %7, align 8
  %88 = getelementptr inbounds %struct.LodePNGState* %87, i32 0, i32 4
  store i32 71, i32* %88, align 4
  store i32 71, i32* %1
  br label %535

; <label>:89                                      ; preds = %80
  %90 = getelementptr inbounds %struct.LodePNGInfo* %info, i32 0, i32 3
  %91 = getelementptr inbounds %struct.LodePNGColorMode* %90, i32 0, i32 0
  %92 = load i32* %91, align 4
  %93 = getelementptr inbounds %struct.LodePNGInfo* %info, i32 0, i32 3
  %94 = getelementptr inbounds %struct.LodePNGColorMode* %93, i32 0, i32 1
  %95 = load i32* %94, align 4
  %96 = call i32 @checkColorValidity(i32 %92, i32 %95)
  %97 = load %struct.LodePNGState** %7, align 8
  %98 = getelementptr inbounds %struct.LodePNGState* %97, i32 0, i32 4
  store i32 %96, i32* %98, align 4
  %99 = load %struct.LodePNGState** %7, align 8
  %100 = getelementptr inbounds %struct.LodePNGState* %99, i32 0, i32 4
  %101 = load i32* %100, align 4
  %102 = icmp ne i32 %101, 0
  br i1 %102, label %103, label %107

; <label>:103                                     ; preds = %89
  %104 = load %struct.LodePNGState** %7, align 8
  %105 = getelementptr inbounds %struct.LodePNGState* %104, i32 0, i32 4
  %106 = load i32* %105, align 4
  store i32 %106, i32* %1
  br label %535

; <label>:107                                     ; preds = %89
  %108 = load %struct.LodePNGState** %7, align 8
  %109 = getelementptr inbounds %struct.LodePNGState* %108, i32 0, i32 2
  %110 = getelementptr inbounds %struct.LodePNGColorMode* %109, i32 0, i32 0
  %111 = load i32* %110, align 4
  %112 = load %struct.LodePNGState** %7, align 8
  %113 = getelementptr inbounds %struct.LodePNGState* %112, i32 0, i32 2
  %114 = getelementptr inbounds %struct.LodePNGColorMode* %113, i32 0, i32 1
  %115 = load i32* %114, align 4
  %116 = call i32 @checkColorValidity(i32 %111, i32 %115)
  %117 = load %struct.LodePNGState** %7, align 8
  %118 = getelementptr inbounds %struct.LodePNGState* %117, i32 0, i32 4
  store i32 %116, i32* %118, align 4
  %119 = load %struct.LodePNGState** %7, align 8
  %120 = getelementptr inbounds %struct.LodePNGState* %119, i32 0, i32 4
  %121 = load i32* %120, align 4
  %122 = icmp ne i32 %121, 0
  br i1 %122, label %123, label %127

; <label>:123                                     ; preds = %107
  %124 = load %struct.LodePNGState** %7, align 8
  %125 = getelementptr inbounds %struct.LodePNGState* %124, i32 0, i32 4
  %126 = load i32* %125, align 4
  store i32 %126, i32* %1
  br label %535

; <label>:127                                     ; preds = %107
  %128 = load %struct.LodePNGState** %7, align 8
  %129 = getelementptr inbounds %struct.LodePNGState* %128, i32 0, i32 2
  %130 = getelementptr inbounds %struct.LodePNGInfo* %info, i32 0, i32 3
  %131 = call i32 @lodepng_color_mode_equal(%struct.LodePNGColorMode* %129, %struct.LodePNGColorMode* %130)
  %132 = icmp ne i32 %131, 0
  br i1 %132, label %183, label %133

; <label>:133                                     ; preds = %127
  %134 = load i32* %5, align 4
  %135 = load i32* %6, align 4
  %136 = mul i32 %134, %135
  %137 = getelementptr inbounds %struct.LodePNGInfo* %info, i32 0, i32 3
  %138 = call i32 @lodepng_get_bpp(%struct.LodePNGColorMode* %137)
  %139 = mul i32 %136, %138
  %140 = add i32 %139, 7
  %141 = udiv i32 %140, 8
  %142 = zext i32 %141 to i64
  store i64 %142, i64* %size, align 8
  %143 = load i64* %size, align 8
  %144 = call i8* @lodepng_malloc(i64 %143)
  store i8* %144, i8** %converted, align 8
  %145 = load i8** %converted, align 8
  %146 = icmp ne i8* %145, null
  br i1 %146, label %153, label %147

; <label>:147                                     ; preds = %133
  %148 = load i64* %size, align 8
  %149 = icmp ne i64 %148, 0
  br i1 %149, label %150, label %153

; <label>:150                                     ; preds = %147
  %151 = load %struct.LodePNGState** %7, align 8
  %152 = getelementptr inbounds %struct.LodePNGState* %151, i32 0, i32 4
  store i32 83, i32* %152, align 4
  br label %153

; <label>:153                                     ; preds = %150, %147, %133
  %154 = load %struct.LodePNGState** %7, align 8
  %155 = getelementptr inbounds %struct.LodePNGState* %154, i32 0, i32 4
  %156 = load i32* %155, align 4
  %157 = icmp ne i32 %156, 0
  br i1 %157, label %169, label %158

; <label>:158                                     ; preds = %153
  %159 = load i8** %converted, align 8
  %160 = load i8** %4, align 8
  %161 = getelementptr inbounds %struct.LodePNGInfo* %info, i32 0, i32 3
  %162 = load %struct.LodePNGState** %7, align 8
  %163 = getelementptr inbounds %struct.LodePNGState* %162, i32 0, i32 2
  %164 = load i32* %5, align 4
  %165 = load i32* %6, align 4
  %166 = call i32 @lodepng_convert(i8* %159, i8* %160, %struct.LodePNGColorMode* %161, %struct.LodePNGColorMode* %163, i32 %164, i32 %165, i32 0)
  %167 = load %struct.LodePNGState** %7, align 8
  %168 = getelementptr inbounds %struct.LodePNGState* %167, i32 0, i32 4
  store i32 %166, i32* %168, align 4
  br label %169

; <label>:169                                     ; preds = %158, %153
  %170 = load %struct.LodePNGState** %7, align 8
  %171 = getelementptr inbounds %struct.LodePNGState* %170, i32 0, i32 4
  %172 = load i32* %171, align 4
  %173 = icmp ne i32 %172, 0
  br i1 %173, label %181, label %174

; <label>:174                                     ; preds = %169
  %175 = load i8** %converted, align 8
  %176 = load i32* %5, align 4
  %177 = load i32* %6, align 4
  %178 = load %struct.LodePNGState** %7, align 8
  %179 = getelementptr inbounds %struct.LodePNGState* %178, i32 0, i32 1
  %180 = call i32 @preProcessScanlines(i8** %data, i64* %datasize, i8* %175, i32 %176, i32 %177, %struct.LodePNGInfo* %info, %struct.LodePNGEncoderSettings* %179)
  br label %181

; <label>:181                                     ; preds = %174, %169
  %182 = load i8** %converted, align 8
  call void @lodepng_free(i8* %182)
  br label %190

; <label>:183                                     ; preds = %127
  %184 = load i8** %4, align 8
  %185 = load i32* %5, align 4
  %186 = load i32* %6, align 4
  %187 = load %struct.LodePNGState** %7, align 8
  %188 = getelementptr inbounds %struct.LodePNGState* %187, i32 0, i32 1
  %189 = call i32 @preProcessScanlines(i8** %data, i64* %datasize, i8* %184, i32 %185, i32 %186, %struct.LodePNGInfo* %info, %struct.LodePNGEncoderSettings* %188)
  br label %190

; <label>:190                                     ; preds = %183, %181
  call void @ucvector_init(%struct.ucvector* %outv)
  br label %191

; <label>:191                                     ; preds = %190
  %192 = load %struct.LodePNGState** %7, align 8
  %193 = getelementptr inbounds %struct.LodePNGState* %192, i32 0, i32 4
  %194 = load i32* %193, align 4
  %195 = icmp ne i32 %194, 0
  %196 = xor i1 %195, true
  br i1 %196, label %197, label %524

; <label>:197                                     ; preds = %191
  call void @writeSignature(%struct.ucvector* %outv)
  %198 = load i32* %5, align 4
  %199 = load i32* %6, align 4
  %200 = getelementptr inbounds %struct.LodePNGInfo* %info, i32 0, i32 3
  %201 = getelementptr inbounds %struct.LodePNGColorMode* %200, i32 0, i32 0
  %202 = load i32* %201, align 4
  %203 = getelementptr inbounds %struct.LodePNGInfo* %info, i32 0, i32 3
  %204 = getelementptr inbounds %struct.LodePNGColorMode* %203, i32 0, i32 1
  %205 = load i32* %204, align 4
  %206 = getelementptr inbounds %struct.LodePNGInfo* %info, i32 0, i32 2
  %207 = load i32* %206, align 4
  %208 = call i32 @addChunk_IHDR(%struct.ucvector* %outv, i32 %198, i32 %199, i32 %202, i32 %205, i32 %207)
  %209 = getelementptr inbounds %struct.LodePNGInfo* %info, i32 0, i32 22
  %210 = getelementptr inbounds [3 x i8*]* %209, i32 0, i64 0
  %211 = load i8** %210, align 8
  %212 = icmp ne i8* %211, null
  br i1 %212, label %213, label %229

; <label>:213                                     ; preds = %197
  %214 = getelementptr inbounds %struct.LodePNGInfo* %info, i32 0, i32 22
  %215 = getelementptr inbounds [3 x i8*]* %214, i32 0, i64 0
  %216 = load i8** %215, align 8
  %217 = getelementptr inbounds %struct.LodePNGInfo* %info, i32 0, i32 23
  %218 = getelementptr inbounds [3 x i64]* %217, i32 0, i64 0
  %219 = load i64* %218, align 8
  %220 = call i32 @addUnknownChunks(%struct.ucvector* %outv, i8* %216, i64 %219)
  %221 = load %struct.LodePNGState** %7, align 8
  %222 = getelementptr inbounds %struct.LodePNGState* %221, i32 0, i32 4
  store i32 %220, i32* %222, align 4
  %223 = load %struct.LodePNGState** %7, align 8
  %224 = getelementptr inbounds %struct.LodePNGState* %223, i32 0, i32 4
  %225 = load i32* %224, align 4
  %226 = icmp ne i32 %225, 0
  br i1 %226, label %227, label %228

; <label>:227                                     ; preds = %213
  br label %524

; <label>:228                                     ; preds = %213
  br label %229

; <label>:229                                     ; preds = %228, %197
  %230 = getelementptr inbounds %struct.LodePNGInfo* %info, i32 0, i32 3
  %231 = getelementptr inbounds %struct.LodePNGColorMode* %230, i32 0, i32 0
  %232 = load i32* %231, align 4
  %233 = icmp eq i32 %232, 3
  br i1 %233, label %234, label %237

; <label>:234                                     ; preds = %229
  %235 = getelementptr inbounds %struct.LodePNGInfo* %info, i32 0, i32 3
  %236 = call i32 @addChunk_PLTE(%struct.ucvector* %outv, %struct.LodePNGColorMode* %235)
  br label %237

; <label>:237                                     ; preds = %234, %229
  %238 = load %struct.LodePNGState** %7, align 8
  %239 = getelementptr inbounds %struct.LodePNGState* %238, i32 0, i32 1
  %240 = getelementptr inbounds %struct.LodePNGEncoderSettings* %239, i32 0, i32 5
  %241 = load i32* %240, align 4
  %242 = icmp ne i32 %241, 0
  br i1 %242, label %243, label %256

; <label>:243                                     ; preds = %237
  %244 = getelementptr inbounds %struct.LodePNGInfo* %info, i32 0, i32 3
  %245 = getelementptr inbounds %struct.LodePNGColorMode* %244, i32 0, i32 0
  %246 = load i32* %245, align 4
  %247 = icmp eq i32 %246, 2
  br i1 %247, label %253, label %248

; <label>:248                                     ; preds = %243
  %249 = getelementptr inbounds %struct.LodePNGInfo* %info, i32 0, i32 3
  %250 = getelementptr inbounds %struct.LodePNGColorMode* %249, i32 0, i32 0
  %251 = load i32* %250, align 4
  %252 = icmp eq i32 %251, 6
  br i1 %252, label %253, label %256

; <label>:253                                     ; preds = %248, %243
  %254 = getelementptr inbounds %struct.LodePNGInfo* %info, i32 0, i32 3
  %255 = call i32 @addChunk_PLTE(%struct.ucvector* %outv, %struct.LodePNGColorMode* %254)
  br label %256

; <label>:256                                     ; preds = %253, %248, %237
  %257 = getelementptr inbounds %struct.LodePNGInfo* %info, i32 0, i32 3
  %258 = getelementptr inbounds %struct.LodePNGColorMode* %257, i32 0, i32 0
  %259 = load i32* %258, align 4
  %260 = icmp eq i32 %259, 3
  br i1 %260, label %261, label %273

; <label>:261                                     ; preds = %256
  %262 = getelementptr inbounds %struct.LodePNGInfo* %info, i32 0, i32 3
  %263 = getelementptr inbounds %struct.LodePNGColorMode* %262, i32 0, i32 2
  %264 = load i8** %263, align 8
  %265 = getelementptr inbounds %struct.LodePNGInfo* %info, i32 0, i32 3
  %266 = getelementptr inbounds %struct.LodePNGColorMode* %265, i32 0, i32 3
  %267 = load i64* %266, align 8
  %268 = call i32 @getPaletteTranslucency(i8* %264, i64 %267)
  %269 = icmp ne i32 %268, 0
  br i1 %269, label %270, label %273

; <label>:270                                     ; preds = %261
  %271 = getelementptr inbounds %struct.LodePNGInfo* %info, i32 0, i32 3
  %272 = call i32 @addChunk_tRNS(%struct.ucvector* %outv, %struct.LodePNGColorMode* %271)
  br label %273

; <label>:273                                     ; preds = %270, %261, %256
  %274 = getelementptr inbounds %struct.LodePNGInfo* %info, i32 0, i32 3
  %275 = getelementptr inbounds %struct.LodePNGColorMode* %274, i32 0, i32 0
  %276 = load i32* %275, align 4
  %277 = icmp eq i32 %276, 0
  br i1 %277, label %283, label %278

; <label>:278                                     ; preds = %273
  %279 = getelementptr inbounds %struct.LodePNGInfo* %info, i32 0, i32 3
  %280 = getelementptr inbounds %struct.LodePNGColorMode* %279, i32 0, i32 0
  %281 = load i32* %280, align 4
  %282 = icmp eq i32 %281, 2
  br i1 %282, label %283, label %291

; <label>:283                                     ; preds = %278, %273
  %284 = getelementptr inbounds %struct.LodePNGInfo* %info, i32 0, i32 3
  %285 = getelementptr inbounds %struct.LodePNGColorMode* %284, i32 0, i32 4
  %286 = load i32* %285, align 4
  %287 = icmp ne i32 %286, 0
  br i1 %287, label %288, label %291

; <label>:288                                     ; preds = %283
  %289 = getelementptr inbounds %struct.LodePNGInfo* %info, i32 0, i32 3
  %290 = call i32 @addChunk_tRNS(%struct.ucvector* %outv, %struct.LodePNGColorMode* %289)
  br label %291

; <label>:291                                     ; preds = %288, %283, %278
  %292 = getelementptr inbounds %struct.LodePNGInfo* %info, i32 0, i32 4
  %293 = load i32* %292, align 4
  %294 = icmp ne i32 %293, 0
  br i1 %294, label %295, label %297

; <label>:295                                     ; preds = %291
  %296 = call i32 @addChunk_bKGD(%struct.ucvector* %outv, %struct.LodePNGInfo* %info)
  br label %297

; <label>:297                                     ; preds = %295, %291
  %298 = getelementptr inbounds %struct.LodePNGInfo* %info, i32 0, i32 18
  %299 = load i32* %298, align 4
  %300 = icmp ne i32 %299, 0
  br i1 %300, label %301, label %303

; <label>:301                                     ; preds = %297
  %302 = call i32 @addChunk_pHYs(%struct.ucvector* %outv, %struct.LodePNGInfo* %info)
  br label %303

; <label>:303                                     ; preds = %301, %297
  %304 = getelementptr inbounds %struct.LodePNGInfo* %info, i32 0, i32 22
  %305 = getelementptr inbounds [3 x i8*]* %304, i32 0, i64 1
  %306 = load i8** %305, align 8
  %307 = icmp ne i8* %306, null
  br i1 %307, label %308, label %324

; <label>:308                                     ; preds = %303
  %309 = getelementptr inbounds %struct.LodePNGInfo* %info, i32 0, i32 22
  %310 = getelementptr inbounds [3 x i8*]* %309, i32 0, i64 1
  %311 = load i8** %310, align 8
  %312 = getelementptr inbounds %struct.LodePNGInfo* %info, i32 0, i32 23
  %313 = getelementptr inbounds [3 x i64]* %312, i32 0, i64 1
  %314 = load i64* %313, align 8
  %315 = call i32 @addUnknownChunks(%struct.ucvector* %outv, i8* %311, i64 %314)
  %316 = load %struct.LodePNGState** %7, align 8
  %317 = getelementptr inbounds %struct.LodePNGState* %316, i32 0, i32 4
  store i32 %315, i32* %317, align 4
  %318 = load %struct.LodePNGState** %7, align 8
  %319 = getelementptr inbounds %struct.LodePNGState* %318, i32 0, i32 4
  %320 = load i32* %319, align 4
  %321 = icmp ne i32 %320, 0
  br i1 %321, label %322, label %323

; <label>:322                                     ; preds = %308
  br label %524

; <label>:323                                     ; preds = %308
  br label %324

; <label>:324                                     ; preds = %323, %303
  %325 = load i8** %data, align 8
  %326 = load i64* %datasize, align 8
  %327 = load %struct.LodePNGState** %7, align 8
  %328 = getelementptr inbounds %struct.LodePNGState* %327, i32 0, i32 1
  %329 = getelementptr inbounds %struct.LodePNGEncoderSettings* %328, i32 0, i32 0
  %330 = call i32 @addChunk_IDAT(%struct.ucvector* %outv, i8* %325, i64 %326, %struct.LodePNGCompressSettings* %329)
  %331 = load %struct.LodePNGState** %7, align 8
  %332 = getelementptr inbounds %struct.LodePNGState* %331, i32 0, i32 4
  store i32 %330, i32* %332, align 4
  %333 = load %struct.LodePNGState** %7, align 8
  %334 = getelementptr inbounds %struct.LodePNGState* %333, i32 0, i32 4
  %335 = load i32* %334, align 4
  %336 = icmp ne i32 %335, 0
  br i1 %336, label %337, label %338

; <label>:337                                     ; preds = %324
  br label %524

; <label>:338                                     ; preds = %324
  %339 = getelementptr inbounds %struct.LodePNGInfo* %info, i32 0, i32 16
  %340 = load i32* %339, align 4
  %341 = icmp ne i32 %340, 0
  br i1 %341, label %342, label %345

; <label>:342                                     ; preds = %338
  %343 = getelementptr inbounds %struct.LodePNGInfo* %info, i32 0, i32 17
  %344 = call i32 @addChunk_tIME(%struct.ucvector* %outv, %struct.LodePNGTime* %343)
  br label %345

; <label>:345                                     ; preds = %342, %338
  store i64 0, i64* %i, align 8
  br label %346

; <label>:346                                     ; preds = %407, %345
  %347 = load i64* %i, align 8
  %348 = getelementptr inbounds %struct.LodePNGInfo* %info, i32 0, i32 8
  %349 = load i64* %348, align 8
  %350 = icmp ult i64 %347, %349
  br i1 %350, label %351, label %410

; <label>:351                                     ; preds = %346
  %352 = load i64* %i, align 8
  %353 = getelementptr inbounds %struct.LodePNGInfo* %info, i32 0, i32 9
  %354 = load i8*** %353, align 8
  %355 = getelementptr inbounds i8** %354, i64 %352
  %356 = load i8** %355, align 8
  %357 = call i64 @strlen(i8* %356) #6
  %358 = icmp ugt i64 %357, 79
  br i1 %358, label %359, label %362

; <label>:359                                     ; preds = %351
  %360 = load %struct.LodePNGState** %7, align 8
  %361 = getelementptr inbounds %struct.LodePNGState* %360, i32 0, i32 4
  store i32 66, i32* %361, align 4
  br label %410

; <label>:362                                     ; preds = %351
  %363 = load i64* %i, align 8
  %364 = getelementptr inbounds %struct.LodePNGInfo* %info, i32 0, i32 9
  %365 = load i8*** %364, align 8
  %366 = getelementptr inbounds i8** %365, i64 %363
  %367 = load i8** %366, align 8
  %368 = call i64 @strlen(i8* %367) #6
  %369 = icmp ult i64 %368, 1
  br i1 %369, label %370, label %373

; <label>:370                                     ; preds = %362
  %371 = load %struct.LodePNGState** %7, align 8
  %372 = getelementptr inbounds %struct.LodePNGState* %371, i32 0, i32 4
  store i32 67, i32* %372, align 4
  br label %410

; <label>:373                                     ; preds = %362
  %374 = load %struct.LodePNGState** %7, align 8
  %375 = getelementptr inbounds %struct.LodePNGState* %374, i32 0, i32 1
  %376 = getelementptr inbounds %struct.LodePNGEncoderSettings* %375, i32 0, i32 7
  %377 = load i32* %376, align 4
  %378 = icmp ne i32 %377, 0
  br i1 %378, label %379, label %394

; <label>:379                                     ; preds = %373
  %380 = load i64* %i, align 8
  %381 = getelementptr inbounds %struct.LodePNGInfo* %info, i32 0, i32 9
  %382 = load i8*** %381, align 8
  %383 = getelementptr inbounds i8** %382, i64 %380
  %384 = load i8** %383, align 8
  %385 = load i64* %i, align 8
  %386 = getelementptr inbounds %struct.LodePNGInfo* %info, i32 0, i32 10
  %387 = load i8*** %386, align 8
  %388 = getelementptr inbounds i8** %387, i64 %385
  %389 = load i8** %388, align 8
  %390 = load %struct.LodePNGState** %7, align 8
  %391 = getelementptr inbounds %struct.LodePNGState* %390, i32 0, i32 1
  %392 = getelementptr inbounds %struct.LodePNGEncoderSettings* %391, i32 0, i32 0
  %393 = call i32 @addChunk_zTXt(%struct.ucvector* %outv, i8* %384, i8* %389, %struct.LodePNGCompressSettings* %392)
  br label %406

; <label>:394                                     ; preds = %373
  %395 = load i64* %i, align 8
  %396 = getelementptr inbounds %struct.LodePNGInfo* %info, i32 0, i32 9
  %397 = load i8*** %396, align 8
  %398 = getelementptr inbounds i8** %397, i64 %395
  %399 = load i8** %398, align 8
  %400 = load i64* %i, align 8
  %401 = getelementptr inbounds %struct.LodePNGInfo* %info, i32 0, i32 10
  %402 = load i8*** %401, align 8
  %403 = getelementptr inbounds i8** %402, i64 %400
  %404 = load i8** %403, align 8
  %405 = call i32 @addChunk_tEXt(%struct.ucvector* %outv, i8* %399, i8* %404)
  br label %406

; <label>:406                                     ; preds = %394, %379
  br label %407

; <label>:407                                     ; preds = %406
  %408 = load i64* %i, align 8
  %409 = add i64 %408, 1
  store i64 %409, i64* %i, align 8
  br label %346

; <label>:410                                     ; preds = %370, %359, %346
  %411 = load %struct.LodePNGState** %7, align 8
  %412 = getelementptr inbounds %struct.LodePNGState* %411, i32 0, i32 1
  %413 = getelementptr inbounds %struct.LodePNGEncoderSettings* %412, i32 0, i32 6
  %414 = load i32* %413, align 4
  %415 = icmp ne i32 %414, 0
  br i1 %415, label %416, label %441

; <label>:416                                     ; preds = %410
  store i32 0, i32* %alread_added_id_text, align 4
  store i64 0, i64* %i, align 8
  br label %417

; <label>:417                                     ; preds = %432, %416
  %418 = load i64* %i, align 8
  %419 = getelementptr inbounds %struct.LodePNGInfo* %info, i32 0, i32 8
  %420 = load i64* %419, align 8
  %421 = icmp ult i64 %418, %420
  br i1 %421, label %422, label %435

; <label>:422                                     ; preds = %417
  %423 = load i64* %i, align 8
  %424 = getelementptr inbounds %struct.LodePNGInfo* %info, i32 0, i32 9
  %425 = load i8*** %424, align 8
  %426 = getelementptr inbounds i8** %425, i64 %423
  %427 = load i8** %426, align 8
  %428 = call i32 @strcmp(i8* %427, i8* getelementptr inbounds ([8 x i8]* @.str2, i32 0, i32 0)) #6
  %429 = icmp ne i32 %428, 0
  br i1 %429, label %431, label %430

; <label>:430                                     ; preds = %422
  store i32 1, i32* %alread_added_id_text, align 4
  br label %435

; <label>:431                                     ; preds = %422
  br label %432

; <label>:432                                     ; preds = %431
  %433 = load i64* %i, align 8
  %434 = add i64 %433, 1
  store i64 %434, i64* %i, align 8
  br label %417

; <label>:435                                     ; preds = %430, %417
  %436 = load i32* %alread_added_id_text, align 4
  %437 = icmp eq i32 %436, 0
  br i1 %437, label %438, label %440

; <label>:438                                     ; preds = %435
  %439 = call i32 @addChunk_tEXt(%struct.ucvector* %outv, i8* getelementptr inbounds ([8 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8]* @.str3, i32 0, i32 0))
  br label %440

; <label>:440                                     ; preds = %438, %435
  br label %441

; <label>:441                                     ; preds = %440, %410
  store i64 0, i64* %i, align 8
  br label %442

; <label>:442                                     ; preds = %498, %441
  %443 = load i64* %i, align 8
  %444 = getelementptr inbounds %struct.LodePNGInfo* %info, i32 0, i32 11
  %445 = load i64* %444, align 8
  %446 = icmp ult i64 %443, %445
  br i1 %446, label %447, label %501

; <label>:447                                     ; preds = %442
  %448 = load i64* %i, align 8
  %449 = getelementptr inbounds %struct.LodePNGInfo* %info, i32 0, i32 12
  %450 = load i8*** %449, align 8
  %451 = getelementptr inbounds i8** %450, i64 %448
  %452 = load i8** %451, align 8
  %453 = call i64 @strlen(i8* %452) #6
  %454 = icmp ugt i64 %453, 79
  br i1 %454, label %455, label %458

; <label>:455                                     ; preds = %447
  %456 = load %struct.LodePNGState** %7, align 8
  %457 = getelementptr inbounds %struct.LodePNGState* %456, i32 0, i32 4
  store i32 66, i32* %457, align 4
  br label %501

; <label>:458                                     ; preds = %447
  %459 = load i64* %i, align 8
  %460 = getelementptr inbounds %struct.LodePNGInfo* %info, i32 0, i32 12
  %461 = load i8*** %460, align 8
  %462 = getelementptr inbounds i8** %461, i64 %459
  %463 = load i8** %462, align 8
  %464 = call i64 @strlen(i8* %463) #6
  %465 = icmp ult i64 %464, 1
  br i1 %465, label %466, label %469

; <label>:466                                     ; preds = %458
  %467 = load %struct.LodePNGState** %7, align 8
  %468 = getelementptr inbounds %struct.LodePNGState* %467, i32 0, i32 4
  store i32 67, i32* %468, align 4
  br label %501

; <label>:469                                     ; preds = %458
  %470 = load %struct.LodePNGState** %7, align 8
  %471 = getelementptr inbounds %struct.LodePNGState* %470, i32 0, i32 1
  %472 = getelementptr inbounds %struct.LodePNGEncoderSettings* %471, i32 0, i32 7
  %473 = load i32* %472, align 4
  %474 = load i64* %i, align 8
  %475 = getelementptr inbounds %struct.LodePNGInfo* %info, i32 0, i32 12
  %476 = load i8*** %475, align 8
  %477 = getelementptr inbounds i8** %476, i64 %474
  %478 = load i8** %477, align 8
  %479 = load i64* %i, align 8
  %480 = getelementptr inbounds %struct.LodePNGInfo* %info, i32 0, i32 13
  %481 = load i8*** %480, align 8
  %482 = getelementptr inbounds i8** %481, i64 %479
  %483 = load i8** %482, align 8
  %484 = load i64* %i, align 8
  %485 = getelementptr inbounds %struct.LodePNGInfo* %info, i32 0, i32 14
  %486 = load i8*** %485, align 8
  %487 = getelementptr inbounds i8** %486, i64 %484
  %488 = load i8** %487, align 8
  %489 = load i64* %i, align 8
  %490 = getelementptr inbounds %struct.LodePNGInfo* %info, i32 0, i32 15
  %491 = load i8*** %490, align 8
  %492 = getelementptr inbounds i8** %491, i64 %489
  %493 = load i8** %492, align 8
  %494 = load %struct.LodePNGState** %7, align 8
  %495 = getelementptr inbounds %struct.LodePNGState* %494, i32 0, i32 1
  %496 = getelementptr inbounds %struct.LodePNGEncoderSettings* %495, i32 0, i32 0
  %497 = call i32 @addChunk_iTXt(%struct.ucvector* %outv, i32 %473, i8* %478, i8* %483, i8* %488, i8* %493, %struct.LodePNGCompressSettings* %496)
  br label %498

; <label>:498                                     ; preds = %469
  %499 = load i64* %i, align 8
  %500 = add i64 %499, 1
  store i64 %500, i64* %i, align 8
  br label %442

; <label>:501                                     ; preds = %466, %455, %442
  %502 = getelementptr inbounds %struct.LodePNGInfo* %info, i32 0, i32 22
  %503 = getelementptr inbounds [3 x i8*]* %502, i32 0, i64 2
  %504 = load i8** %503, align 8
  %505 = icmp ne i8* %504, null
  br i1 %505, label %506, label %522

; <label>:506                                     ; preds = %501
  %507 = getelementptr inbounds %struct.LodePNGInfo* %info, i32 0, i32 22
  %508 = getelementptr inbounds [3 x i8*]* %507, i32 0, i64 2
  %509 = load i8** %508, align 8
  %510 = getelementptr inbounds %struct.LodePNGInfo* %info, i32 0, i32 23
  %511 = getelementptr inbounds [3 x i64]* %510, i32 0, i64 2
  %512 = load i64* %511, align 8
  %513 = call i32 @addUnknownChunks(%struct.ucvector* %outv, i8* %509, i64 %512)
  %514 = load %struct.LodePNGState** %7, align 8
  %515 = getelementptr inbounds %struct.LodePNGState* %514, i32 0, i32 4
  store i32 %513, i32* %515, align 4
  %516 = load %struct.LodePNGState** %7, align 8
  %517 = getelementptr inbounds %struct.LodePNGState* %516, i32 0, i32 4
  %518 = load i32* %517, align 4
  %519 = icmp ne i32 %518, 0
  br i1 %519, label %520, label %521

; <label>:520                                     ; preds = %506
  br label %524

; <label>:521                                     ; preds = %506
  br label %522

; <label>:522                                     ; preds = %521, %501
  %523 = call i32 @addChunk_IEND(%struct.ucvector* %outv)
  br label %524

; <label>:524                                     ; preds = %522, %520, %337, %322, %227, %191
  call void @lodepng_info_cleanup(%struct.LodePNGInfo* %info)
  %525 = load i8** %data, align 8
  call void @lodepng_free(i8* %525)
  %526 = getelementptr inbounds %struct.ucvector* %outv, i32 0, i32 0
  %527 = load i8** %526, align 8
  %528 = load i8*** %2, align 8
  store i8* %527, i8** %528, align 8
  %529 = getelementptr inbounds %struct.ucvector* %outv, i32 0, i32 1
  %530 = load i64* %529, align 8
  %531 = load i64** %3, align 8
  store i64 %530, i64* %531, align 8
  %532 = load %struct.LodePNGState** %7, align 8
  %533 = getelementptr inbounds %struct.LodePNGState* %532, i32 0, i32 4
  %534 = load i32* %533, align 4
  store i32 %534, i32* %1
  br label %535

; <label>:535                                     ; preds = %524, %123, %103, %86, %77, %66, %35
  %536 = load i32* %1
  ret i32 %536
}

; Function Attrs: nounwind uwtable
define internal i32 @preProcessScanlines(i8** %out, i64* %outsize, i8* %in, i32 %w, i32 %h, %struct.LodePNGInfo* %info_png, %struct.LodePNGEncoderSettings* %settings) #0 {
  %1 = alloca i8**, align 8
  %2 = alloca i64*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca %struct.LodePNGInfo*, align 8
  %7 = alloca %struct.LodePNGEncoderSettings*, align 8
  %bpp = alloca i32, align 4
  %error = alloca i32, align 4
  %padded = alloca i8*, align 8
  %passw = alloca [7 x i32], align 16
  %passh = alloca [7 x i32], align 16
  %filter_passstart = alloca [8 x i64], align 16
  %padded_passstart = alloca [8 x i64], align 16
  %passstart = alloca [8 x i64], align 16
  %adam7 = alloca i8*, align 8
  %i = alloca i32, align 4
  %padded1 = alloca i8*, align 8
  store i8** %out, i8*** %1, align 8
  store i64* %outsize, i64** %2, align 8
  store i8* %in, i8** %3, align 8
  store i32 %w, i32* %4, align 4
  store i32 %h, i32* %5, align 4
  store %struct.LodePNGInfo* %info_png, %struct.LodePNGInfo** %6, align 8
  store %struct.LodePNGEncoderSettings* %settings, %struct.LodePNGEncoderSettings** %7, align 8
  %8 = load %struct.LodePNGInfo** %6, align 8
  %9 = getelementptr inbounds %struct.LodePNGInfo* %8, i32 0, i32 3
  %10 = call i32 @lodepng_get_bpp(%struct.LodePNGColorMode* %9)
  store i32 %10, i32* %bpp, align 4
  store i32 0, i32* %error, align 4
  %11 = load %struct.LodePNGInfo** %6, align 8
  %12 = getelementptr inbounds %struct.LodePNGInfo* %11, i32 0, i32 2
  %13 = load i32* %12, align 4
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %110

; <label>:15                                      ; preds = %0
  %16 = load i32* %5, align 4
  %17 = load i32* %5, align 4
  %18 = load i32* %4, align 4
  %19 = load i32* %bpp, align 4
  %20 = mul i32 %18, %19
  %21 = add i32 %20, 7
  %22 = udiv i32 %21, 8
  %23 = mul i32 %17, %22
  %24 = add i32 %16, %23
  %25 = zext i32 %24 to i64
  %26 = load i64** %2, align 8
  store i64 %25, i64* %26, align 8
  %27 = load i64** %2, align 8
  %28 = load i64* %27, align 8
  %29 = call i8* @lodepng_malloc(i64 %28)
  %30 = load i8*** %1, align 8
  store i8* %29, i8** %30, align 8
  %31 = load i8*** %1, align 8
  %32 = load i8** %31, align 8
  %33 = icmp ne i8* %32, null
  br i1 %33, label %39, label %34

; <label>:34                                      ; preds = %15
  %35 = load i64** %2, align 8
  %36 = load i64* %35, align 8
  %37 = icmp ne i64 %36, 0
  br i1 %37, label %38, label %39

; <label>:38                                      ; preds = %34
  store i32 83, i32* %error, align 4
  br label %39

; <label>:39                                      ; preds = %38, %34, %15
  %40 = load i32* %error, align 4
  %41 = icmp ne i32 %40, 0
  br i1 %41, label %109, label %42

; <label>:42                                      ; preds = %39
  %43 = load i32* %bpp, align 4
  %44 = icmp ult i32 %43, 8
  br i1 %44, label %45, label %98

; <label>:45                                      ; preds = %42
  %46 = load i32* %4, align 4
  %47 = load i32* %bpp, align 4
  %48 = mul i32 %46, %47
  %49 = load i32* %4, align 4
  %50 = load i32* %bpp, align 4
  %51 = mul i32 %49, %50
  %52 = add i32 %51, 7
  %53 = udiv i32 %52, 8
  %54 = mul i32 %53, 8
  %55 = icmp ne i32 %48, %54
  br i1 %55, label %56, label %98

; <label>:56                                      ; preds = %45
  %57 = load i32* %5, align 4
  %58 = load i32* %4, align 4
  %59 = load i32* %bpp, align 4
  %60 = mul i32 %58, %59
  %61 = add i32 %60, 7
  %62 = udiv i32 %61, 8
  %63 = mul i32 %57, %62
  %64 = zext i32 %63 to i64
  %65 = call i8* @lodepng_malloc(i64 %64)
  store i8* %65, i8** %padded, align 8
  %66 = load i8** %padded, align 8
  %67 = icmp ne i8* %66, null
  br i1 %67, label %69, label %68

; <label>:68                                      ; preds = %56
  store i32 83, i32* %error, align 4
  br label %69

; <label>:69                                      ; preds = %68, %56
  %70 = load i32* %error, align 4
  %71 = icmp ne i32 %70, 0
  br i1 %71, label %96, label %72

; <label>:72                                      ; preds = %69
  %73 = load i8** %padded, align 8
  %74 = load i8** %3, align 8
  %75 = load i32* %4, align 4
  %76 = load i32* %bpp, align 4
  %77 = mul i32 %75, %76
  %78 = add i32 %77, 7
  %79 = udiv i32 %78, 8
  %80 = mul i32 %79, 8
  %81 = zext i32 %80 to i64
  %82 = load i32* %4, align 4
  %83 = load i32* %bpp, align 4
  %84 = mul i32 %82, %83
  %85 = zext i32 %84 to i64
  %86 = load i32* %5, align 4
  call void @addPaddingBits(i8* %73, i8* %74, i64 %81, i64 %85, i32 %86)
  %87 = load i8*** %1, align 8
  %88 = load i8** %87, align 8
  %89 = load i8** %padded, align 8
  %90 = load i32* %4, align 4
  %91 = load i32* %5, align 4
  %92 = load %struct.LodePNGInfo** %6, align 8
  %93 = getelementptr inbounds %struct.LodePNGInfo* %92, i32 0, i32 3
  %94 = load %struct.LodePNGEncoderSettings** %7, align 8
  %95 = call i32 @filter(i8* %88, i8* %89, i32 %90, i32 %91, %struct.LodePNGColorMode* %93, %struct.LodePNGEncoderSettings* %94)
  store i32 %95, i32* %error, align 4
  br label %96

; <label>:96                                      ; preds = %72, %69
  %97 = load i8** %padded, align 8
  call void @lodepng_free(i8* %97)
  br label %108

; <label>:98                                      ; preds = %45, %42
  %99 = load i8*** %1, align 8
  %100 = load i8** %99, align 8
  %101 = load i8** %3, align 8
  %102 = load i32* %4, align 4
  %103 = load i32* %5, align 4
  %104 = load %struct.LodePNGInfo** %6, align 8
  %105 = getelementptr inbounds %struct.LodePNGInfo* %104, i32 0, i32 3
  %106 = load %struct.LodePNGEncoderSettings** %7, align 8
  %107 = call i32 @filter(i8* %100, i8* %101, i32 %102, i32 %103, %struct.LodePNGColorMode* %105, %struct.LodePNGEncoderSettings* %106)
  store i32 %107, i32* %error, align 4
  br label %108

; <label>:108                                     ; preds = %98, %96
  br label %109

; <label>:109                                     ; preds = %108, %39
  br label %258

; <label>:110                                     ; preds = %0
  %111 = getelementptr inbounds [7 x i32]* %passw, i32 0, i32 0
  %112 = getelementptr inbounds [7 x i32]* %passh, i32 0, i32 0
  %113 = getelementptr inbounds [8 x i64]* %filter_passstart, i32 0, i32 0
  %114 = getelementptr inbounds [8 x i64]* %padded_passstart, i32 0, i32 0
  %115 = getelementptr inbounds [8 x i64]* %passstart, i32 0, i32 0
  %116 = load i32* %4, align 4
  %117 = load i32* %5, align 4
  %118 = load i32* %bpp, align 4
  call void @Adam7_getpassvalues(i32* %111, i32* %112, i64* %113, i64* %114, i64* %115, i32 %116, i32 %117, i32 %118)
  %119 = getelementptr inbounds [8 x i64]* %filter_passstart, i32 0, i64 7
  %120 = load i64* %119, align 8
  %121 = load i64** %2, align 8
  store i64 %120, i64* %121, align 8
  %122 = load i64** %2, align 8
  %123 = load i64* %122, align 8
  %124 = call i8* @lodepng_malloc(i64 %123)
  %125 = load i8*** %1, align 8
  store i8* %124, i8** %125, align 8
  %126 = load i8*** %1, align 8
  %127 = load i8** %126, align 8
  %128 = icmp ne i8* %127, null
  br i1 %128, label %130, label %129

; <label>:129                                     ; preds = %110
  store i32 83, i32* %error, align 4
  br label %130

; <label>:130                                     ; preds = %129, %110
  %131 = getelementptr inbounds [8 x i64]* %passstart, i32 0, i64 7
  %132 = load i64* %131, align 8
  %133 = call i8* @lodepng_malloc(i64 %132)
  store i8* %133, i8** %adam7, align 8
  %134 = load i8** %adam7, align 8
  %135 = icmp ne i8* %134, null
  br i1 %135, label %141, label %136

; <label>:136                                     ; preds = %130
  %137 = getelementptr inbounds [8 x i64]* %passstart, i32 0, i64 7
  %138 = load i64* %137, align 8
  %139 = icmp ne i64 %138, 0
  br i1 %139, label %140, label %141

; <label>:140                                     ; preds = %136
  store i32 83, i32* %error, align 4
  br label %141

; <label>:141                                     ; preds = %140, %136, %130
  %142 = load i32* %error, align 4
  %143 = icmp ne i32 %142, 0
  br i1 %143, label %256, label %144

; <label>:144                                     ; preds = %141
  %145 = load i8** %adam7, align 8
  %146 = load i8** %3, align 8
  %147 = load i32* %4, align 4
  %148 = load i32* %5, align 4
  %149 = load i32* %bpp, align 4
  call void @Adam7_interlace(i8* %145, i8* %146, i32 %147, i32 %148, i32 %149)
  store i32 0, i32* %i, align 4
  br label %150

; <label>:150                                     ; preds = %252, %144
  %151 = load i32* %i, align 4
  %152 = icmp ult i32 %151, 7
  br i1 %152, label %153, label %255

; <label>:153                                     ; preds = %150
  %154 = load i32* %bpp, align 4
  %155 = icmp ult i32 %154, 8
  br i1 %155, label %156, label %221

; <label>:156                                     ; preds = %153
  %157 = load i32* %i, align 4
  %158 = add i32 %157, 1
  %159 = zext i32 %158 to i64
  %160 = getelementptr inbounds [8 x i64]* %padded_passstart, i32 0, i64 %159
  %161 = load i64* %160, align 8
  %162 = load i32* %i, align 4
  %163 = zext i32 %162 to i64
  %164 = getelementptr inbounds [8 x i64]* %padded_passstart, i32 0, i64 %163
  %165 = load i64* %164, align 8
  %166 = sub i64 %161, %165
  %167 = call i8* @lodepng_malloc(i64 %166)
  store i8* %167, i8** %padded1, align 8
  %168 = load i8** %padded1, align 8
  %169 = icmp ne i8* %168, null
  br i1 %169, label %171, label %170

; <label>:170                                     ; preds = %156
  store i32 83, i32* %error, align 4
  br label %255

; <label>:171                                     ; preds = %156
  %172 = load i8** %padded1, align 8
  %173 = load i32* %i, align 4
  %174 = zext i32 %173 to i64
  %175 = getelementptr inbounds [8 x i64]* %passstart, i32 0, i64 %174
  %176 = load i64* %175, align 8
  %177 = load i8** %adam7, align 8
  %178 = getelementptr inbounds i8* %177, i64 %176
  %179 = load i32* %i, align 4
  %180 = zext i32 %179 to i64
  %181 = getelementptr inbounds [7 x i32]* %passw, i32 0, i64 %180
  %182 = load i32* %181, align 4
  %183 = load i32* %bpp, align 4
  %184 = mul i32 %182, %183
  %185 = add i32 %184, 7
  %186 = udiv i32 %185, 8
  %187 = mul i32 %186, 8
  %188 = zext i32 %187 to i64
  %189 = load i32* %i, align 4
  %190 = zext i32 %189 to i64
  %191 = getelementptr inbounds [7 x i32]* %passw, i32 0, i64 %190
  %192 = load i32* %191, align 4
  %193 = load i32* %bpp, align 4
  %194 = mul i32 %192, %193
  %195 = zext i32 %194 to i64
  %196 = load i32* %i, align 4
  %197 = zext i32 %196 to i64
  %198 = getelementptr inbounds [7 x i32]* %passh, i32 0, i64 %197
  %199 = load i32* %198, align 4
  call void @addPaddingBits(i8* %172, i8* %178, i64 %188, i64 %195, i32 %199)
  %200 = load i32* %i, align 4
  %201 = zext i32 %200 to i64
  %202 = getelementptr inbounds [8 x i64]* %filter_passstart, i32 0, i64 %201
  %203 = load i64* %202, align 8
  %204 = load i8*** %1, align 8
  %205 = load i8** %204, align 8
  %206 = getelementptr inbounds i8* %205, i64 %203
  %207 = load i8** %padded1, align 8
  %208 = load i32* %i, align 4
  %209 = zext i32 %208 to i64
  %210 = getelementptr inbounds [7 x i32]* %passw, i32 0, i64 %209
  %211 = load i32* %210, align 4
  %212 = load i32* %i, align 4
  %213 = zext i32 %212 to i64
  %214 = getelementptr inbounds [7 x i32]* %passh, i32 0, i64 %213
  %215 = load i32* %214, align 4
  %216 = load %struct.LodePNGInfo** %6, align 8
  %217 = getelementptr inbounds %struct.LodePNGInfo* %216, i32 0, i32 3
  %218 = load %struct.LodePNGEncoderSettings** %7, align 8
  %219 = call i32 @filter(i8* %206, i8* %207, i32 %211, i32 %215, %struct.LodePNGColorMode* %217, %struct.LodePNGEncoderSettings* %218)
  store i32 %219, i32* %error, align 4
  %220 = load i8** %padded1, align 8
  call void @lodepng_free(i8* %220)
  br label %247

; <label>:221                                     ; preds = %153
  %222 = load i32* %i, align 4
  %223 = zext i32 %222 to i64
  %224 = getelementptr inbounds [8 x i64]* %filter_passstart, i32 0, i64 %223
  %225 = load i64* %224, align 8
  %226 = load i8*** %1, align 8
  %227 = load i8** %226, align 8
  %228 = getelementptr inbounds i8* %227, i64 %225
  %229 = load i32* %i, align 4
  %230 = zext i32 %229 to i64
  %231 = getelementptr inbounds [8 x i64]* %padded_passstart, i32 0, i64 %230
  %232 = load i64* %231, align 8
  %233 = load i8** %adam7, align 8
  %234 = getelementptr inbounds i8* %233, i64 %232
  %235 = load i32* %i, align 4
  %236 = zext i32 %235 to i64
  %237 = getelementptr inbounds [7 x i32]* %passw, i32 0, i64 %236
  %238 = load i32* %237, align 4
  %239 = load i32* %i, align 4
  %240 = zext i32 %239 to i64
  %241 = getelementptr inbounds [7 x i32]* %passh, i32 0, i64 %240
  %242 = load i32* %241, align 4
  %243 = load %struct.LodePNGInfo** %6, align 8
  %244 = getelementptr inbounds %struct.LodePNGInfo* %243, i32 0, i32 3
  %245 = load %struct.LodePNGEncoderSettings** %7, align 8
  %246 = call i32 @filter(i8* %228, i8* %234, i32 %238, i32 %242, %struct.LodePNGColorMode* %244, %struct.LodePNGEncoderSettings* %245)
  store i32 %246, i32* %error, align 4
  br label %247

; <label>:247                                     ; preds = %221, %171
  %248 = load i32* %error, align 4
  %249 = icmp ne i32 %248, 0
  br i1 %249, label %250, label %251

; <label>:250                                     ; preds = %247
  br label %255

; <label>:251                                     ; preds = %247
  br label %252

; <label>:252                                     ; preds = %251
  %253 = load i32* %i, align 4
  %254 = add i32 %253, 1
  store i32 %254, i32* %i, align 4
  br label %150

; <label>:255                                     ; preds = %250, %170, %150
  br label %256

; <label>:256                                     ; preds = %255, %141
  %257 = load i8** %adam7, align 8
  call void @lodepng_free(i8* %257)
  br label %258

; <label>:258                                     ; preds = %256, %109
  %259 = load i32* %error, align 4
  ret i32 %259
}

; Function Attrs: nounwind uwtable
define internal void @ucvector_init(%struct.ucvector* %p) #0 {
  %1 = alloca %struct.ucvector*, align 8
  store %struct.ucvector* %p, %struct.ucvector** %1, align 8
  %2 = load %struct.ucvector** %1, align 8
  %3 = getelementptr inbounds %struct.ucvector* %2, i32 0, i32 0
  store i8* null, i8** %3, align 8
  %4 = load %struct.ucvector** %1, align 8
  %5 = getelementptr inbounds %struct.ucvector* %4, i32 0, i32 2
  store i64 0, i64* %5, align 8
  %6 = load %struct.ucvector** %1, align 8
  %7 = getelementptr inbounds %struct.ucvector* %6, i32 0, i32 1
  store i64 0, i64* %7, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @writeSignature(%struct.ucvector* %out) #0 {
  %1 = alloca %struct.ucvector*, align 8
  store %struct.ucvector* %out, %struct.ucvector** %1, align 8
  %2 = load %struct.ucvector** %1, align 8
  %3 = call i32 @ucvector_push_back(%struct.ucvector* %2, i8 zeroext -119)
  %4 = load %struct.ucvector** %1, align 8
  %5 = call i32 @ucvector_push_back(%struct.ucvector* %4, i8 zeroext 80)
  %6 = load %struct.ucvector** %1, align 8
  %7 = call i32 @ucvector_push_back(%struct.ucvector* %6, i8 zeroext 78)
  %8 = load %struct.ucvector** %1, align 8
  %9 = call i32 @ucvector_push_back(%struct.ucvector* %8, i8 zeroext 71)
  %10 = load %struct.ucvector** %1, align 8
  %11 = call i32 @ucvector_push_back(%struct.ucvector* %10, i8 zeroext 13)
  %12 = load %struct.ucvector** %1, align 8
  %13 = call i32 @ucvector_push_back(%struct.ucvector* %12, i8 zeroext 10)
  %14 = load %struct.ucvector** %1, align 8
  %15 = call i32 @ucvector_push_back(%struct.ucvector* %14, i8 zeroext 26)
  %16 = load %struct.ucvector** %1, align 8
  %17 = call i32 @ucvector_push_back(%struct.ucvector* %16, i8 zeroext 10)
  ret void
}

; Function Attrs: nounwind uwtable
define internal i32 @addChunk_IHDR(%struct.ucvector* %out, i32 %w, i32 %h, i32 %colortype, i32 %bitdepth, i32 %interlace_method) #0 {
  %1 = alloca %struct.ucvector*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %error = alloca i32, align 4
  %header = alloca %struct.ucvector, align 8
  store %struct.ucvector* %out, %struct.ucvector** %1, align 8
  store i32 %w, i32* %2, align 4
  store i32 %h, i32* %3, align 4
  store i32 %colortype, i32* %4, align 4
  store i32 %bitdepth, i32* %5, align 4
  store i32 %interlace_method, i32* %6, align 4
  store i32 0, i32* %error, align 4
  call void @ucvector_init(%struct.ucvector* %header)
  %7 = load i32* %2, align 4
  call void @lodepng_add32bitInt(%struct.ucvector* %header, i32 %7)
  %8 = load i32* %3, align 4
  call void @lodepng_add32bitInt(%struct.ucvector* %header, i32 %8)
  %9 = load i32* %5, align 4
  %10 = trunc i32 %9 to i8
  %11 = call i32 @ucvector_push_back(%struct.ucvector* %header, i8 zeroext %10)
  %12 = load i32* %4, align 4
  %13 = trunc i32 %12 to i8
  %14 = call i32 @ucvector_push_back(%struct.ucvector* %header, i8 zeroext %13)
  %15 = call i32 @ucvector_push_back(%struct.ucvector* %header, i8 zeroext 0)
  %16 = call i32 @ucvector_push_back(%struct.ucvector* %header, i8 zeroext 0)
  %17 = load i32* %6, align 4
  %18 = trunc i32 %17 to i8
  %19 = call i32 @ucvector_push_back(%struct.ucvector* %header, i8 zeroext %18)
  %20 = load %struct.ucvector** %1, align 8
  %21 = getelementptr inbounds %struct.ucvector* %header, i32 0, i32 0
  %22 = load i8** %21, align 8
  %23 = getelementptr inbounds %struct.ucvector* %header, i32 0, i32 1
  %24 = load i64* %23, align 8
  %25 = call i32 @addChunk(%struct.ucvector* %20, i8* getelementptr inbounds ([5 x i8]* @.str90, i32 0, i32 0), i8* %22, i64 %24)
  store i32 %25, i32* %error, align 4
  %26 = bitcast %struct.ucvector* %header to i8*
  call void @ucvector_cleanup(i8* %26)
  %27 = load i32* %error, align 4
  ret i32 %27
}

; Function Attrs: nounwind uwtable
define internal i32 @addUnknownChunks(%struct.ucvector* %out, i8* %data, i64 %datasize) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.ucvector*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i64, align 8
  %inchunk = alloca i8*, align 8
  %error = alloca i32, align 4
  store %struct.ucvector* %out, %struct.ucvector** %2, align 8
  store i8* %data, i8** %3, align 8
  store i64 %datasize, i64* %4, align 8
  %5 = load i8** %3, align 8
  store i8* %5, i8** %inchunk, align 8
  br label %6

; <label>:6                                       ; preds = %25, %0
  %7 = load i8** %inchunk, align 8
  %8 = load i8** %3, align 8
  %9 = ptrtoint i8* %7 to i64
  %10 = ptrtoint i8* %8 to i64
  %11 = sub i64 %9, %10
  %12 = load i64* %4, align 8
  %13 = icmp ult i64 %11, %12
  br i1 %13, label %14, label %33

; <label>:14                                      ; preds = %6
  %15 = load %struct.ucvector** %2, align 8
  %16 = getelementptr inbounds %struct.ucvector* %15, i32 0, i32 0
  %17 = load %struct.ucvector** %2, align 8
  %18 = getelementptr inbounds %struct.ucvector* %17, i32 0, i32 1
  %19 = load i8** %inchunk, align 8
  %20 = call i32 @lodepng_chunk_append(i8** %16, i64* %18, i8* %19)
  store i32 %20, i32* %error, align 4
  %21 = load i32* %error, align 4
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %23, label %25

; <label>:23                                      ; preds = %14
  %24 = load i32* %error, align 4
  store i32 %24, i32* %1
  br label %34

; <label>:25                                      ; preds = %14
  %26 = load %struct.ucvector** %2, align 8
  %27 = getelementptr inbounds %struct.ucvector* %26, i32 0, i32 1
  %28 = load i64* %27, align 8
  %29 = load %struct.ucvector** %2, align 8
  %30 = getelementptr inbounds %struct.ucvector* %29, i32 0, i32 2
  store i64 %28, i64* %30, align 8
  %31 = load i8** %inchunk, align 8
  %32 = call i8* @lodepng_chunk_next(i8* %31)
  store i8* %32, i8** %inchunk, align 8
  br label %6

; <label>:33                                      ; preds = %6
  store i32 0, i32* %1
  br label %34

; <label>:34                                      ; preds = %33, %23
  %35 = load i32* %1
  ret i32 %35
}

; Function Attrs: nounwind uwtable
define internal i32 @addChunk_PLTE(%struct.ucvector* %out, %struct.LodePNGColorMode* %info) #0 {
  %1 = alloca %struct.ucvector*, align 8
  %2 = alloca %struct.LodePNGColorMode*, align 8
  %error = alloca i32, align 4
  %i = alloca i64, align 8
  %PLTE = alloca %struct.ucvector, align 8
  store %struct.ucvector* %out, %struct.ucvector** %1, align 8
  store %struct.LodePNGColorMode* %info, %struct.LodePNGColorMode** %2, align 8
  store i32 0, i32* %error, align 4
  call void @ucvector_init(%struct.ucvector* %PLTE)
  store i64 0, i64* %i, align 8
  br label %3

; <label>:3                                       ; preds = %23, %0
  %4 = load i64* %i, align 8
  %5 = load %struct.LodePNGColorMode** %2, align 8
  %6 = getelementptr inbounds %struct.LodePNGColorMode* %5, i32 0, i32 3
  %7 = load i64* %6, align 8
  %8 = mul i64 %7, 4
  %9 = icmp ult i64 %4, %8
  br i1 %9, label %10, label %26

; <label>:10                                      ; preds = %3
  %11 = load i64* %i, align 8
  %12 = urem i64 %11, 4
  %13 = icmp ne i64 %12, 3
  br i1 %13, label %14, label %22

; <label>:14                                      ; preds = %10
  %15 = load i64* %i, align 8
  %16 = load %struct.LodePNGColorMode** %2, align 8
  %17 = getelementptr inbounds %struct.LodePNGColorMode* %16, i32 0, i32 2
  %18 = load i8** %17, align 8
  %19 = getelementptr inbounds i8* %18, i64 %15
  %20 = load i8* %19, align 1
  %21 = call i32 @ucvector_push_back(%struct.ucvector* %PLTE, i8 zeroext %20)
  br label %22

; <label>:22                                      ; preds = %14, %10
  br label %23

; <label>:23                                      ; preds = %22
  %24 = load i64* %i, align 8
  %25 = add i64 %24, 1
  store i64 %25, i64* %i, align 8
  br label %3

; <label>:26                                      ; preds = %3
  %27 = load %struct.ucvector** %1, align 8
  %28 = getelementptr inbounds %struct.ucvector* %PLTE, i32 0, i32 0
  %29 = load i8** %28, align 8
  %30 = getelementptr inbounds %struct.ucvector* %PLTE, i32 0, i32 1
  %31 = load i64* %30, align 8
  %32 = call i32 @addChunk(%struct.ucvector* %27, i8* getelementptr inbounds ([5 x i8]* @.str89, i32 0, i32 0), i8* %29, i64 %31)
  store i32 %32, i32* %error, align 4
  %33 = bitcast %struct.ucvector* %PLTE to i8*
  call void @ucvector_cleanup(i8* %33)
  %34 = load i32* %error, align 4
  ret i32 %34
}

; Function Attrs: nounwind uwtable
define internal i32 @getPaletteTranslucency(i8* %palette, i64 %palettesize) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8*, align 8
  %3 = alloca i64, align 8
  %i = alloca i64, align 8
  %key = alloca i64, align 8
  %r = alloca i32, align 4
  %g = alloca i32, align 4
  %b = alloca i32, align 4
  store i8* %palette, i8** %2, align 8
  store i64 %palettesize, i64* %3, align 8
  store i64 0, i64* %key, align 8
  store i32 0, i32* %r, align 4
  store i32 0, i32* %g, align 4
  store i32 0, i32* %b, align 4
  store i64 0, i64* %i, align 8
  br label %4

; <label>:4                                       ; preds = %89, %0
  %5 = load i64* %i, align 8
  %6 = load i64* %3, align 8
  %7 = icmp ult i64 %5, %6
  br i1 %7, label %8, label %92

; <label>:8                                       ; preds = %4
  %9 = load i64* %key, align 8
  %10 = icmp ne i64 %9, 0
  br i1 %10, label %42, label %11

; <label>:11                                      ; preds = %8
  %12 = load i64* %i, align 8
  %13 = mul i64 4, %12
  %14 = add i64 %13, 3
  %15 = load i8** %2, align 8
  %16 = getelementptr inbounds i8* %15, i64 %14
  %17 = load i8* %16, align 1
  %18 = zext i8 %17 to i32
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %42

; <label>:20                                      ; preds = %11
  %21 = load i64* %i, align 8
  %22 = mul i64 4, %21
  %23 = add i64 %22, 0
  %24 = load i8** %2, align 8
  %25 = getelementptr inbounds i8* %24, i64 %23
  %26 = load i8* %25, align 1
  %27 = zext i8 %26 to i32
  store i32 %27, i32* %r, align 4
  %28 = load i64* %i, align 8
  %29 = mul i64 4, %28
  %30 = add i64 %29, 1
  %31 = load i8** %2, align 8
  %32 = getelementptr inbounds i8* %31, i64 %30
  %33 = load i8* %32, align 1
  %34 = zext i8 %33 to i32
  store i32 %34, i32* %g, align 4
  %35 = load i64* %i, align 8
  %36 = mul i64 4, %35
  %37 = add i64 %36, 2
  %38 = load i8** %2, align 8
  %39 = getelementptr inbounds i8* %38, i64 %37
  %40 = load i8* %39, align 1
  %41 = zext i8 %40 to i32
  store i32 %41, i32* %b, align 4
  store i64 1, i64* %key, align 8
  store i64 -1, i64* %i, align 8
  br label %88

; <label>:42                                      ; preds = %11, %8
  %43 = load i64* %i, align 8
  %44 = mul i64 4, %43
  %45 = add i64 %44, 3
  %46 = load i8** %2, align 8
  %47 = getelementptr inbounds i8* %46, i64 %45
  %48 = load i8* %47, align 1
  %49 = zext i8 %48 to i32
  %50 = icmp ne i32 %49, 255
  br i1 %50, label %51, label %52

; <label>:51                                      ; preds = %42
  store i32 2, i32* %1
  br label %95

; <label>:52                                      ; preds = %42
  %53 = load i64* %key, align 8
  %54 = icmp ne i64 %53, 0
  br i1 %54, label %55, label %86

; <label>:55                                      ; preds = %52
  %56 = load i32* %r, align 4
  %57 = load i64* %i, align 8
  %58 = mul i64 %57, 4
  %59 = add i64 %58, 0
  %60 = load i8** %2, align 8
  %61 = getelementptr inbounds i8* %60, i64 %59
  %62 = load i8* %61, align 1
  %63 = zext i8 %62 to i32
  %64 = icmp eq i32 %56, %63
  br i1 %64, label %65, label %86

; <label>:65                                      ; preds = %55
  %66 = load i32* %g, align 4
  %67 = load i64* %i, align 8
  %68 = mul i64 %67, 4
  %69 = add i64 %68, 1
  %70 = load i8** %2, align 8
  %71 = getelementptr inbounds i8* %70, i64 %69
  %72 = load i8* %71, align 1
  %73 = zext i8 %72 to i32
  %74 = icmp eq i32 %66, %73
  br i1 %74, label %75, label %86

; <label>:75                                      ; preds = %65
  %76 = load i32* %b, align 4
  %77 = load i64* %i, align 8
  %78 = mul i64 %77, 4
  %79 = add i64 %78, 2
  %80 = load i8** %2, align 8
  %81 = getelementptr inbounds i8* %80, i64 %79
  %82 = load i8* %81, align 1
  %83 = zext i8 %82 to i32
  %84 = icmp eq i32 %76, %83
  br i1 %84, label %85, label %86

; <label>:85                                      ; preds = %75
  store i32 2, i32* %1
  br label %95

; <label>:86                                      ; preds = %75, %65, %55, %52
  br label %87

; <label>:87                                      ; preds = %86
  br label %88

; <label>:88                                      ; preds = %87, %20
  br label %89

; <label>:89                                      ; preds = %88
  %90 = load i64* %i, align 8
  %91 = add i64 %90, 1
  store i64 %91, i64* %i, align 8
  br label %4

; <label>:92                                      ; preds = %4
  %93 = load i64* %key, align 8
  %94 = trunc i64 %93 to i32
  store i32 %94, i32* %1
  br label %95

; <label>:95                                      ; preds = %92, %85, %51
  %96 = load i32* %1
  ret i32 %96
}

; Function Attrs: nounwind uwtable
define internal i32 @addChunk_tRNS(%struct.ucvector* %out, %struct.LodePNGColorMode* %info) #0 {
  %1 = alloca %struct.ucvector*, align 8
  %2 = alloca %struct.LodePNGColorMode*, align 8
  %error = alloca i32, align 4
  %i = alloca i64, align 8
  %tRNS = alloca %struct.ucvector, align 8
  %amount = alloca i64, align 8
  store %struct.ucvector* %out, %struct.ucvector** %1, align 8
  store %struct.LodePNGColorMode* %info, %struct.LodePNGColorMode** %2, align 8
  store i32 0, i32* %error, align 4
  call void @ucvector_init(%struct.ucvector* %tRNS)
  %3 = load %struct.LodePNGColorMode** %2, align 8
  %4 = getelementptr inbounds %struct.LodePNGColorMode* %3, i32 0, i32 0
  %5 = load i32* %4, align 4
  %6 = icmp eq i32 %5, 3
  br i1 %6, label %7, label %56

; <label>:7                                       ; preds = %0
  %8 = load %struct.LodePNGColorMode** %2, align 8
  %9 = getelementptr inbounds %struct.LodePNGColorMode* %8, i32 0, i32 3
  %10 = load i64* %9, align 8
  store i64 %10, i64* %amount, align 8
  %11 = load %struct.LodePNGColorMode** %2, align 8
  %12 = getelementptr inbounds %struct.LodePNGColorMode* %11, i32 0, i32 3
  %13 = load i64* %12, align 8
  store i64 %13, i64* %i, align 8
  br label %14

; <label>:14                                      ; preds = %34, %7
  %15 = load i64* %i, align 8
  %16 = icmp ugt i64 %15, 0
  br i1 %16, label %17, label %37

; <label>:17                                      ; preds = %14
  %18 = load i64* %i, align 8
  %19 = sub i64 %18, 1
  %20 = mul i64 4, %19
  %21 = add i64 %20, 3
  %22 = load %struct.LodePNGColorMode** %2, align 8
  %23 = getelementptr inbounds %struct.LodePNGColorMode* %22, i32 0, i32 2
  %24 = load i8** %23, align 8
  %25 = getelementptr inbounds i8* %24, i64 %21
  %26 = load i8* %25, align 1
  %27 = zext i8 %26 to i32
  %28 = icmp eq i32 %27, 255
  br i1 %28, label %29, label %32

; <label>:29                                      ; preds = %17
  %30 = load i64* %amount, align 8
  %31 = add i64 %30, -1
  store i64 %31, i64* %amount, align 8
  br label %33

; <label>:32                                      ; preds = %17
  br label %37

; <label>:33                                      ; preds = %29
  br label %34

; <label>:34                                      ; preds = %33
  %35 = load i64* %i, align 8
  %36 = add i64 %35, -1
  store i64 %36, i64* %i, align 8
  br label %14

; <label>:37                                      ; preds = %32, %14
  store i64 0, i64* %i, align 8
  br label %38

; <label>:38                                      ; preds = %52, %37
  %39 = load i64* %i, align 8
  %40 = load i64* %amount, align 8
  %41 = icmp ult i64 %39, %40
  br i1 %41, label %42, label %55

; <label>:42                                      ; preds = %38
  %43 = load i64* %i, align 8
  %44 = mul i64 4, %43
  %45 = add i64 %44, 3
  %46 = load %struct.LodePNGColorMode** %2, align 8
  %47 = getelementptr inbounds %struct.LodePNGColorMode* %46, i32 0, i32 2
  %48 = load i8** %47, align 8
  %49 = getelementptr inbounds i8* %48, i64 %45
  %50 = load i8* %49, align 1
  %51 = call i32 @ucvector_push_back(%struct.ucvector* %tRNS, i8 zeroext %50)
  br label %52

; <label>:52                                      ; preds = %42
  %53 = load i64* %i, align 8
  %54 = add i64 %53, 1
  store i64 %54, i64* %i, align 8
  br label %38

; <label>:55                                      ; preds = %38
  br label %130

; <label>:56                                      ; preds = %0
  %57 = load %struct.LodePNGColorMode** %2, align 8
  %58 = getelementptr inbounds %struct.LodePNGColorMode* %57, i32 0, i32 0
  %59 = load i32* %58, align 4
  %60 = icmp eq i32 %59, 0
  br i1 %60, label %61, label %80

; <label>:61                                      ; preds = %56
  %62 = load %struct.LodePNGColorMode** %2, align 8
  %63 = getelementptr inbounds %struct.LodePNGColorMode* %62, i32 0, i32 4
  %64 = load i32* %63, align 4
  %65 = icmp ne i32 %64, 0
  br i1 %65, label %66, label %79

; <label>:66                                      ; preds = %61
  %67 = load %struct.LodePNGColorMode** %2, align 8
  %68 = getelementptr inbounds %struct.LodePNGColorMode* %67, i32 0, i32 5
  %69 = load i32* %68, align 4
  %70 = udiv i32 %69, 256
  %71 = trunc i32 %70 to i8
  %72 = call i32 @ucvector_push_back(%struct.ucvector* %tRNS, i8 zeroext %71)
  %73 = load %struct.LodePNGColorMode** %2, align 8
  %74 = getelementptr inbounds %struct.LodePNGColorMode* %73, i32 0, i32 5
  %75 = load i32* %74, align 4
  %76 = urem i32 %75, 256
  %77 = trunc i32 %76 to i8
  %78 = call i32 @ucvector_push_back(%struct.ucvector* %tRNS, i8 zeroext %77)
  br label %79

; <label>:79                                      ; preds = %66, %61
  br label %129

; <label>:80                                      ; preds = %56
  %81 = load %struct.LodePNGColorMode** %2, align 8
  %82 = getelementptr inbounds %struct.LodePNGColorMode* %81, i32 0, i32 0
  %83 = load i32* %82, align 4
  %84 = icmp eq i32 %83, 2
  br i1 %84, label %85, label %128

; <label>:85                                      ; preds = %80
  %86 = load %struct.LodePNGColorMode** %2, align 8
  %87 = getelementptr inbounds %struct.LodePNGColorMode* %86, i32 0, i32 4
  %88 = load i32* %87, align 4
  %89 = icmp ne i32 %88, 0
  br i1 %89, label %90, label %127

; <label>:90                                      ; preds = %85
  %91 = load %struct.LodePNGColorMode** %2, align 8
  %92 = getelementptr inbounds %struct.LodePNGColorMode* %91, i32 0, i32 5
  %93 = load i32* %92, align 4
  %94 = udiv i32 %93, 256
  %95 = trunc i32 %94 to i8
  %96 = call i32 @ucvector_push_back(%struct.ucvector* %tRNS, i8 zeroext %95)
  %97 = load %struct.LodePNGColorMode** %2, align 8
  %98 = getelementptr inbounds %struct.LodePNGColorMode* %97, i32 0, i32 5
  %99 = load i32* %98, align 4
  %100 = urem i32 %99, 256
  %101 = trunc i32 %100 to i8
  %102 = call i32 @ucvector_push_back(%struct.ucvector* %tRNS, i8 zeroext %101)
  %103 = load %struct.LodePNGColorMode** %2, align 8
  %104 = getelementptr inbounds %struct.LodePNGColorMode* %103, i32 0, i32 6
  %105 = load i32* %104, align 4
  %106 = udiv i32 %105, 256
  %107 = trunc i32 %106 to i8
  %108 = call i32 @ucvector_push_back(%struct.ucvector* %tRNS, i8 zeroext %107)
  %109 = load %struct.LodePNGColorMode** %2, align 8
  %110 = getelementptr inbounds %struct.LodePNGColorMode* %109, i32 0, i32 6
  %111 = load i32* %110, align 4
  %112 = urem i32 %111, 256
  %113 = trunc i32 %112 to i8
  %114 = call i32 @ucvector_push_back(%struct.ucvector* %tRNS, i8 zeroext %113)
  %115 = load %struct.LodePNGColorMode** %2, align 8
  %116 = getelementptr inbounds %struct.LodePNGColorMode* %115, i32 0, i32 7
  %117 = load i32* %116, align 4
  %118 = udiv i32 %117, 256
  %119 = trunc i32 %118 to i8
  %120 = call i32 @ucvector_push_back(%struct.ucvector* %tRNS, i8 zeroext %119)
  %121 = load %struct.LodePNGColorMode** %2, align 8
  %122 = getelementptr inbounds %struct.LodePNGColorMode* %121, i32 0, i32 7
  %123 = load i32* %122, align 4
  %124 = urem i32 %123, 256
  %125 = trunc i32 %124 to i8
  %126 = call i32 @ucvector_push_back(%struct.ucvector* %tRNS, i8 zeroext %125)
  br label %127

; <label>:127                                     ; preds = %90, %85
  br label %128

; <label>:128                                     ; preds = %127, %80
  br label %129

; <label>:129                                     ; preds = %128, %79
  br label %130

; <label>:130                                     ; preds = %129, %55
  %131 = load %struct.ucvector** %1, align 8
  %132 = getelementptr inbounds %struct.ucvector* %tRNS, i32 0, i32 0
  %133 = load i8** %132, align 8
  %134 = getelementptr inbounds %struct.ucvector* %tRNS, i32 0, i32 1
  %135 = load i64* %134, align 8
  %136 = call i32 @addChunk(%struct.ucvector* %131, i8* getelementptr inbounds ([5 x i8]* @.str88, i32 0, i32 0), i8* %133, i64 %135)
  store i32 %136, i32* %error, align 4
  %137 = bitcast %struct.ucvector* %tRNS to i8*
  call void @ucvector_cleanup(i8* %137)
  %138 = load i32* %error, align 4
  ret i32 %138
}

; Function Attrs: nounwind uwtable
define internal i32 @addChunk_bKGD(%struct.ucvector* %out, %struct.LodePNGInfo* %info) #0 {
  %1 = alloca %struct.ucvector*, align 8
  %2 = alloca %struct.LodePNGInfo*, align 8
  %error = alloca i32, align 4
  %bKGD = alloca %struct.ucvector, align 8
  store %struct.ucvector* %out, %struct.ucvector** %1, align 8
  store %struct.LodePNGInfo* %info, %struct.LodePNGInfo** %2, align 8
  store i32 0, i32* %error, align 4
  call void @ucvector_init(%struct.ucvector* %bKGD)
  %3 = load %struct.LodePNGInfo** %2, align 8
  %4 = getelementptr inbounds %struct.LodePNGInfo* %3, i32 0, i32 3
  %5 = getelementptr inbounds %struct.LodePNGColorMode* %4, i32 0, i32 0
  %6 = load i32* %5, align 4
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %14, label %8

; <label>:8                                       ; preds = %0
  %9 = load %struct.LodePNGInfo** %2, align 8
  %10 = getelementptr inbounds %struct.LodePNGInfo* %9, i32 0, i32 3
  %11 = getelementptr inbounds %struct.LodePNGColorMode* %10, i32 0, i32 0
  %12 = load i32* %11, align 4
  %13 = icmp eq i32 %12, 4
  br i1 %13, label %14, label %27

; <label>:14                                      ; preds = %8, %0
  %15 = load %struct.LodePNGInfo** %2, align 8
  %16 = getelementptr inbounds %struct.LodePNGInfo* %15, i32 0, i32 5
  %17 = load i32* %16, align 4
  %18 = udiv i32 %17, 256
  %19 = trunc i32 %18 to i8
  %20 = call i32 @ucvector_push_back(%struct.ucvector* %bKGD, i8 zeroext %19)
  %21 = load %struct.LodePNGInfo** %2, align 8
  %22 = getelementptr inbounds %struct.LodePNGInfo* %21, i32 0, i32 5
  %23 = load i32* %22, align 4
  %24 = urem i32 %23, 256
  %25 = trunc i32 %24 to i8
  %26 = call i32 @ucvector_push_back(%struct.ucvector* %bKGD, i8 zeroext %25)
  br label %91

; <label>:27                                      ; preds = %8
  %28 = load %struct.LodePNGInfo** %2, align 8
  %29 = getelementptr inbounds %struct.LodePNGInfo* %28, i32 0, i32 3
  %30 = getelementptr inbounds %struct.LodePNGColorMode* %29, i32 0, i32 0
  %31 = load i32* %30, align 4
  %32 = icmp eq i32 %31, 2
  br i1 %32, label %39, label %33

; <label>:33                                      ; preds = %27
  %34 = load %struct.LodePNGInfo** %2, align 8
  %35 = getelementptr inbounds %struct.LodePNGInfo* %34, i32 0, i32 3
  %36 = getelementptr inbounds %struct.LodePNGColorMode* %35, i32 0, i32 0
  %37 = load i32* %36, align 4
  %38 = icmp eq i32 %37, 6
  br i1 %38, label %39, label %76

; <label>:39                                      ; preds = %33, %27
  %40 = load %struct.LodePNGInfo** %2, align 8
  %41 = getelementptr inbounds %struct.LodePNGInfo* %40, i32 0, i32 5
  %42 = load i32* %41, align 4
  %43 = udiv i32 %42, 256
  %44 = trunc i32 %43 to i8
  %45 = call i32 @ucvector_push_back(%struct.ucvector* %bKGD, i8 zeroext %44)
  %46 = load %struct.LodePNGInfo** %2, align 8
  %47 = getelementptr inbounds %struct.LodePNGInfo* %46, i32 0, i32 5
  %48 = load i32* %47, align 4
  %49 = urem i32 %48, 256
  %50 = trunc i32 %49 to i8
  %51 = call i32 @ucvector_push_back(%struct.ucvector* %bKGD, i8 zeroext %50)
  %52 = load %struct.LodePNGInfo** %2, align 8
  %53 = getelementptr inbounds %struct.LodePNGInfo* %52, i32 0, i32 6
  %54 = load i32* %53, align 4
  %55 = udiv i32 %54, 256
  %56 = trunc i32 %55 to i8
  %57 = call i32 @ucvector_push_back(%struct.ucvector* %bKGD, i8 zeroext %56)
  %58 = load %struct.LodePNGInfo** %2, align 8
  %59 = getelementptr inbounds %struct.LodePNGInfo* %58, i32 0, i32 6
  %60 = load i32* %59, align 4
  %61 = urem i32 %60, 256
  %62 = trunc i32 %61 to i8
  %63 = call i32 @ucvector_push_back(%struct.ucvector* %bKGD, i8 zeroext %62)
  %64 = load %struct.LodePNGInfo** %2, align 8
  %65 = getelementptr inbounds %struct.LodePNGInfo* %64, i32 0, i32 7
  %66 = load i32* %65, align 4
  %67 = udiv i32 %66, 256
  %68 = trunc i32 %67 to i8
  %69 = call i32 @ucvector_push_back(%struct.ucvector* %bKGD, i8 zeroext %68)
  %70 = load %struct.LodePNGInfo** %2, align 8
  %71 = getelementptr inbounds %struct.LodePNGInfo* %70, i32 0, i32 7
  %72 = load i32* %71, align 4
  %73 = urem i32 %72, 256
  %74 = trunc i32 %73 to i8
  %75 = call i32 @ucvector_push_back(%struct.ucvector* %bKGD, i8 zeroext %74)
  br label %90

; <label>:76                                      ; preds = %33
  %77 = load %struct.LodePNGInfo** %2, align 8
  %78 = getelementptr inbounds %struct.LodePNGInfo* %77, i32 0, i32 3
  %79 = getelementptr inbounds %struct.LodePNGColorMode* %78, i32 0, i32 0
  %80 = load i32* %79, align 4
  %81 = icmp eq i32 %80, 3
  br i1 %81, label %82, label %89

; <label>:82                                      ; preds = %76
  %83 = load %struct.LodePNGInfo** %2, align 8
  %84 = getelementptr inbounds %struct.LodePNGInfo* %83, i32 0, i32 5
  %85 = load i32* %84, align 4
  %86 = urem i32 %85, 256
  %87 = trunc i32 %86 to i8
  %88 = call i32 @ucvector_push_back(%struct.ucvector* %bKGD, i8 zeroext %87)
  br label %89

; <label>:89                                      ; preds = %82, %76
  br label %90

; <label>:90                                      ; preds = %89, %39
  br label %91

; <label>:91                                      ; preds = %90, %14
  %92 = load %struct.ucvector** %1, align 8
  %93 = getelementptr inbounds %struct.ucvector* %bKGD, i32 0, i32 0
  %94 = load i8** %93, align 8
  %95 = getelementptr inbounds %struct.ucvector* %bKGD, i32 0, i32 1
  %96 = load i64* %95, align 8
  %97 = call i32 @addChunk(%struct.ucvector* %92, i8* getelementptr inbounds ([5 x i8]* @.str87, i32 0, i32 0), i8* %94, i64 %96)
  store i32 %97, i32* %error, align 4
  %98 = bitcast %struct.ucvector* %bKGD to i8*
  call void @ucvector_cleanup(i8* %98)
  %99 = load i32* %error, align 4
  ret i32 %99
}

; Function Attrs: nounwind uwtable
define internal i32 @addChunk_pHYs(%struct.ucvector* %out, %struct.LodePNGInfo* %info) #0 {
  %1 = alloca %struct.ucvector*, align 8
  %2 = alloca %struct.LodePNGInfo*, align 8
  %error = alloca i32, align 4
  %data = alloca %struct.ucvector, align 8
  store %struct.ucvector* %out, %struct.ucvector** %1, align 8
  store %struct.LodePNGInfo* %info, %struct.LodePNGInfo** %2, align 8
  store i32 0, i32* %error, align 4
  call void @ucvector_init(%struct.ucvector* %data)
  %3 = load %struct.LodePNGInfo** %2, align 8
  %4 = getelementptr inbounds %struct.LodePNGInfo* %3, i32 0, i32 19
  %5 = load i32* %4, align 4
  call void @lodepng_add32bitInt(%struct.ucvector* %data, i32 %5)
  %6 = load %struct.LodePNGInfo** %2, align 8
  %7 = getelementptr inbounds %struct.LodePNGInfo* %6, i32 0, i32 20
  %8 = load i32* %7, align 4
  call void @lodepng_add32bitInt(%struct.ucvector* %data, i32 %8)
  %9 = load %struct.LodePNGInfo** %2, align 8
  %10 = getelementptr inbounds %struct.LodePNGInfo* %9, i32 0, i32 21
  %11 = load i32* %10, align 4
  %12 = trunc i32 %11 to i8
  %13 = call i32 @ucvector_push_back(%struct.ucvector* %data, i8 zeroext %12)
  %14 = load %struct.ucvector** %1, align 8
  %15 = getelementptr inbounds %struct.ucvector* %data, i32 0, i32 0
  %16 = load i8** %15, align 8
  %17 = getelementptr inbounds %struct.ucvector* %data, i32 0, i32 1
  %18 = load i64* %17, align 8
  %19 = call i32 @addChunk(%struct.ucvector* %14, i8* getelementptr inbounds ([5 x i8]* @.str86, i32 0, i32 0), i8* %16, i64 %18)
  store i32 %19, i32* %error, align 4
  %20 = bitcast %struct.ucvector* %data to i8*
  call void @ucvector_cleanup(i8* %20)
  %21 = load i32* %error, align 4
  ret i32 %21
}

; Function Attrs: nounwind uwtable
define internal i32 @addChunk_IDAT(%struct.ucvector* %out, i8* %data, i64 %datasize, %struct.LodePNGCompressSettings* %zlibsettings) #0 {
  %1 = alloca %struct.ucvector*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i64, align 8
  %4 = alloca %struct.LodePNGCompressSettings*, align 8
  %zlibdata = alloca %struct.ucvector, align 8
  %error = alloca i32, align 4
  store %struct.ucvector* %out, %struct.ucvector** %1, align 8
  store i8* %data, i8** %2, align 8
  store i64 %datasize, i64* %3, align 8
  store %struct.LodePNGCompressSettings* %zlibsettings, %struct.LodePNGCompressSettings** %4, align 8
  store i32 0, i32* %error, align 4
  call void @ucvector_init(%struct.ucvector* %zlibdata)
  %5 = getelementptr inbounds %struct.ucvector* %zlibdata, i32 0, i32 0
  %6 = getelementptr inbounds %struct.ucvector* %zlibdata, i32 0, i32 1
  %7 = load i8** %2, align 8
  %8 = load i64* %3, align 8
  %9 = load %struct.LodePNGCompressSettings** %4, align 8
  %10 = call i32 @zlib_compress(i8** %5, i64* %6, i8* %7, i64 %8, %struct.LodePNGCompressSettings* %9)
  store i32 %10, i32* %error, align 4
  %11 = load i32* %error, align 4
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %20, label %13

; <label>:13                                      ; preds = %0
  %14 = load %struct.ucvector** %1, align 8
  %15 = getelementptr inbounds %struct.ucvector* %zlibdata, i32 0, i32 0
  %16 = load i8** %15, align 8
  %17 = getelementptr inbounds %struct.ucvector* %zlibdata, i32 0, i32 1
  %18 = load i64* %17, align 8
  %19 = call i32 @addChunk(%struct.ucvector* %14, i8* getelementptr inbounds ([5 x i8]* @.str85, i32 0, i32 0), i8* %16, i64 %18)
  store i32 %19, i32* %error, align 4
  br label %20

; <label>:20                                      ; preds = %13, %0
  %21 = bitcast %struct.ucvector* %zlibdata to i8*
  call void @ucvector_cleanup(i8* %21)
  %22 = load i32* %error, align 4
  ret i32 %22
}

; Function Attrs: nounwind uwtable
define internal i32 @addChunk_tIME(%struct.ucvector* %out, %struct.LodePNGTime* %time) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.ucvector*, align 8
  %3 = alloca %struct.LodePNGTime*, align 8
  %error = alloca i32, align 4
  %data = alloca i8*, align 8
  store %struct.ucvector* %out, %struct.ucvector** %2, align 8
  store %struct.LodePNGTime* %time, %struct.LodePNGTime** %3, align 8
  store i32 0, i32* %error, align 4
  %4 = call i8* @lodepng_malloc(i64 7)
  store i8* %4, i8** %data, align 8
  %5 = load i8** %data, align 8
  %6 = icmp ne i8* %5, null
  br i1 %6, label %8, label %7

; <label>:7                                       ; preds = %0
  store i32 83, i32* %1
  br label %58

; <label>:8                                       ; preds = %0
  %9 = load %struct.LodePNGTime** %3, align 8
  %10 = getelementptr inbounds %struct.LodePNGTime* %9, i32 0, i32 0
  %11 = load i32* %10, align 4
  %12 = udiv i32 %11, 256
  %13 = trunc i32 %12 to i8
  %14 = load i8** %data, align 8
  %15 = getelementptr inbounds i8* %14, i64 0
  store i8 %13, i8* %15, align 1
  %16 = load %struct.LodePNGTime** %3, align 8
  %17 = getelementptr inbounds %struct.LodePNGTime* %16, i32 0, i32 0
  %18 = load i32* %17, align 4
  %19 = urem i32 %18, 256
  %20 = trunc i32 %19 to i8
  %21 = load i8** %data, align 8
  %22 = getelementptr inbounds i8* %21, i64 1
  store i8 %20, i8* %22, align 1
  %23 = load %struct.LodePNGTime** %3, align 8
  %24 = getelementptr inbounds %struct.LodePNGTime* %23, i32 0, i32 1
  %25 = load i32* %24, align 4
  %26 = trunc i32 %25 to i8
  %27 = load i8** %data, align 8
  %28 = getelementptr inbounds i8* %27, i64 2
  store i8 %26, i8* %28, align 1
  %29 = load %struct.LodePNGTime** %3, align 8
  %30 = getelementptr inbounds %struct.LodePNGTime* %29, i32 0, i32 2
  %31 = load i32* %30, align 4
  %32 = trunc i32 %31 to i8
  %33 = load i8** %data, align 8
  %34 = getelementptr inbounds i8* %33, i64 3
  store i8 %32, i8* %34, align 1
  %35 = load %struct.LodePNGTime** %3, align 8
  %36 = getelementptr inbounds %struct.LodePNGTime* %35, i32 0, i32 3
  %37 = load i32* %36, align 4
  %38 = trunc i32 %37 to i8
  %39 = load i8** %data, align 8
  %40 = getelementptr inbounds i8* %39, i64 4
  store i8 %38, i8* %40, align 1
  %41 = load %struct.LodePNGTime** %3, align 8
  %42 = getelementptr inbounds %struct.LodePNGTime* %41, i32 0, i32 4
  %43 = load i32* %42, align 4
  %44 = trunc i32 %43 to i8
  %45 = load i8** %data, align 8
  %46 = getelementptr inbounds i8* %45, i64 5
  store i8 %44, i8* %46, align 1
  %47 = load %struct.LodePNGTime** %3, align 8
  %48 = getelementptr inbounds %struct.LodePNGTime* %47, i32 0, i32 5
  %49 = load i32* %48, align 4
  %50 = trunc i32 %49 to i8
  %51 = load i8** %data, align 8
  %52 = getelementptr inbounds i8* %51, i64 6
  store i8 %50, i8* %52, align 1
  %53 = load %struct.ucvector** %2, align 8
  %54 = load i8** %data, align 8
  %55 = call i32 @addChunk(%struct.ucvector* %53, i8* getelementptr inbounds ([5 x i8]* @.str84, i32 0, i32 0), i8* %54, i64 7)
  store i32 %55, i32* %error, align 4
  %56 = load i8** %data, align 8
  call void @lodepng_free(i8* %56)
  %57 = load i32* %error, align 4
  store i32 %57, i32* %1
  br label %58

; <label>:58                                      ; preds = %8, %7
  %59 = load i32* %1
  ret i32 %59
}

; Function Attrs: nounwind uwtable
define internal i32 @addChunk_zTXt(%struct.ucvector* %out, i8* %keyword, i8* %textstring, %struct.LodePNGCompressSettings* %zlibsettings) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.ucvector*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca %struct.LodePNGCompressSettings*, align 8
  %error = alloca i32, align 4
  %data = alloca %struct.ucvector, align 8
  %compressed = alloca %struct.ucvector, align 8
  %i = alloca i64, align 8
  %textsize = alloca i64, align 8
  store %struct.ucvector* %out, %struct.ucvector** %2, align 8
  store i8* %keyword, i8** %3, align 8
  store i8* %textstring, i8** %4, align 8
  store %struct.LodePNGCompressSettings* %zlibsettings, %struct.LodePNGCompressSettings** %5, align 8
  store i32 0, i32* %error, align 4
  %6 = load i8** %4, align 8
  %7 = call i64 @strlen(i8* %6) #6
  store i64 %7, i64* %textsize, align 8
  call void @ucvector_init(%struct.ucvector* %data)
  call void @ucvector_init(%struct.ucvector* %compressed)
  store i64 0, i64* %i, align 8
  br label %8

; <label>:8                                       ; preds = %21, %0
  %9 = load i64* %i, align 8
  %10 = load i8** %3, align 8
  %11 = getelementptr inbounds i8* %10, i64 %9
  %12 = load i8* %11, align 1
  %13 = sext i8 %12 to i32
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %15, label %24

; <label>:15                                      ; preds = %8
  %16 = load i64* %i, align 8
  %17 = load i8** %3, align 8
  %18 = getelementptr inbounds i8* %17, i64 %16
  %19 = load i8* %18, align 1
  %20 = call i32 @ucvector_push_back(%struct.ucvector* %data, i8 zeroext %19)
  br label %21

; <label>:21                                      ; preds = %15
  %22 = load i64* %i, align 8
  %23 = add i64 %22, 1
  store i64 %23, i64* %i, align 8
  br label %8

; <label>:24                                      ; preds = %8
  %25 = load i64* %i, align 8
  %26 = icmp ult i64 %25, 1
  br i1 %26, label %30, label %27

; <label>:27                                      ; preds = %24
  %28 = load i64* %i, align 8
  %29 = icmp ugt i64 %28, 79
  br i1 %29, label %30, label %31

; <label>:30                                      ; preds = %27, %24
  store i32 89, i32* %1
  br label %69

; <label>:31                                      ; preds = %27
  %32 = call i32 @ucvector_push_back(%struct.ucvector* %data, i8 zeroext 0)
  %33 = call i32 @ucvector_push_back(%struct.ucvector* %data, i8 zeroext 0)
  %34 = getelementptr inbounds %struct.ucvector* %compressed, i32 0, i32 0
  %35 = getelementptr inbounds %struct.ucvector* %compressed, i32 0, i32 1
  %36 = load i8** %4, align 8
  %37 = load i64* %textsize, align 8
  %38 = load %struct.LodePNGCompressSettings** %5, align 8
  %39 = call i32 @zlib_compress(i8** %34, i64* %35, i8* %36, i64 %37, %struct.LodePNGCompressSettings* %38)
  store i32 %39, i32* %error, align 4
  %40 = load i32* %error, align 4
  %41 = icmp ne i32 %40, 0
  br i1 %41, label %65, label %42

; <label>:42                                      ; preds = %31
  store i64 0, i64* %i, align 8
  br label %43

; <label>:43                                      ; preds = %55, %42
  %44 = load i64* %i, align 8
  %45 = getelementptr inbounds %struct.ucvector* %compressed, i32 0, i32 1
  %46 = load i64* %45, align 8
  %47 = icmp ult i64 %44, %46
  br i1 %47, label %48, label %58

; <label>:48                                      ; preds = %43
  %49 = load i64* %i, align 8
  %50 = getelementptr inbounds %struct.ucvector* %compressed, i32 0, i32 0
  %51 = load i8** %50, align 8
  %52 = getelementptr inbounds i8* %51, i64 %49
  %53 = load i8* %52, align 1
  %54 = call i32 @ucvector_push_back(%struct.ucvector* %data, i8 zeroext %53)
  br label %55

; <label>:55                                      ; preds = %48
  %56 = load i64* %i, align 8
  %57 = add i64 %56, 1
  store i64 %57, i64* %i, align 8
  br label %43

; <label>:58                                      ; preds = %43
  %59 = load %struct.ucvector** %2, align 8
  %60 = getelementptr inbounds %struct.ucvector* %data, i32 0, i32 0
  %61 = load i8** %60, align 8
  %62 = getelementptr inbounds %struct.ucvector* %data, i32 0, i32 1
  %63 = load i64* %62, align 8
  %64 = call i32 @addChunk(%struct.ucvector* %59, i8* getelementptr inbounds ([5 x i8]* @.str83, i32 0, i32 0), i8* %61, i64 %63)
  store i32 %64, i32* %error, align 4
  br label %65

; <label>:65                                      ; preds = %58, %31
  %66 = bitcast %struct.ucvector* %compressed to i8*
  call void @ucvector_cleanup(i8* %66)
  %67 = bitcast %struct.ucvector* %data to i8*
  call void @ucvector_cleanup(i8* %67)
  %68 = load i32* %error, align 4
  store i32 %68, i32* %1
  br label %69

; <label>:69                                      ; preds = %65, %30
  %70 = load i32* %1
  ret i32 %70
}

; Function Attrs: nounwind uwtable
define internal i32 @addChunk_tEXt(%struct.ucvector* %out, i8* %keyword, i8* %textstring) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.ucvector*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %error = alloca i32, align 4
  %i = alloca i64, align 8
  %text = alloca %struct.ucvector, align 8
  store %struct.ucvector* %out, %struct.ucvector** %2, align 8
  store i8* %keyword, i8** %3, align 8
  store i8* %textstring, i8** %4, align 8
  store i32 0, i32* %error, align 4
  call void @ucvector_init(%struct.ucvector* %text)
  store i64 0, i64* %i, align 8
  br label %5

; <label>:5                                       ; preds = %18, %0
  %6 = load i64* %i, align 8
  %7 = load i8** %3, align 8
  %8 = getelementptr inbounds i8* %7, i64 %6
  %9 = load i8* %8, align 1
  %10 = sext i8 %9 to i32
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %21

; <label>:12                                      ; preds = %5
  %13 = load i64* %i, align 8
  %14 = load i8** %3, align 8
  %15 = getelementptr inbounds i8* %14, i64 %13
  %16 = load i8* %15, align 1
  %17 = call i32 @ucvector_push_back(%struct.ucvector* %text, i8 zeroext %16)
  br label %18

; <label>:18                                      ; preds = %12
  %19 = load i64* %i, align 8
  %20 = add i64 %19, 1
  store i64 %20, i64* %i, align 8
  br label %5

; <label>:21                                      ; preds = %5
  %22 = load i64* %i, align 8
  %23 = icmp ult i64 %22, 1
  br i1 %23, label %27, label %24

; <label>:24                                      ; preds = %21
  %25 = load i64* %i, align 8
  %26 = icmp ugt i64 %25, 79
  br i1 %26, label %27, label %28

; <label>:27                                      ; preds = %24, %21
  store i32 89, i32* %1
  br label %55

; <label>:28                                      ; preds = %24
  %29 = call i32 @ucvector_push_back(%struct.ucvector* %text, i8 zeroext 0)
  store i64 0, i64* %i, align 8
  br label %30

; <label>:30                                      ; preds = %43, %28
  %31 = load i64* %i, align 8
  %32 = load i8** %4, align 8
  %33 = getelementptr inbounds i8* %32, i64 %31
  %34 = load i8* %33, align 1
  %35 = sext i8 %34 to i32
  %36 = icmp ne i32 %35, 0
  br i1 %36, label %37, label %46

; <label>:37                                      ; preds = %30
  %38 = load i64* %i, align 8
  %39 = load i8** %4, align 8
  %40 = getelementptr inbounds i8* %39, i64 %38
  %41 = load i8* %40, align 1
  %42 = call i32 @ucvector_push_back(%struct.ucvector* %text, i8 zeroext %41)
  br label %43

; <label>:43                                      ; preds = %37
  %44 = load i64* %i, align 8
  %45 = add i64 %44, 1
  store i64 %45, i64* %i, align 8
  br label %30

; <label>:46                                      ; preds = %30
  %47 = load %struct.ucvector** %2, align 8
  %48 = getelementptr inbounds %struct.ucvector* %text, i32 0, i32 0
  %49 = load i8** %48, align 8
  %50 = getelementptr inbounds %struct.ucvector* %text, i32 0, i32 1
  %51 = load i64* %50, align 8
  %52 = call i32 @addChunk(%struct.ucvector* %47, i8* getelementptr inbounds ([5 x i8]* @.str82, i32 0, i32 0), i8* %49, i64 %51)
  store i32 %52, i32* %error, align 4
  %53 = bitcast %struct.ucvector* %text to i8*
  call void @ucvector_cleanup(i8* %53)
  %54 = load i32* %error, align 4
  store i32 %54, i32* %1
  br label %55

; <label>:55                                      ; preds = %46, %27
  %56 = load i32* %1
  ret i32 %56
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: nounwind uwtable
define internal i32 @addChunk_iTXt(%struct.ucvector* %out, i32 %compressed, i8* %keyword, i8* %langtag, i8* %transkey, i8* %textstring, %struct.LodePNGCompressSettings* %zlibsettings) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.ucvector*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca %struct.LodePNGCompressSettings*, align 8
  %error = alloca i32, align 4
  %data = alloca %struct.ucvector, align 8
  %i = alloca i64, align 8
  %textsize = alloca i64, align 8
  %compressed_data = alloca %struct.ucvector, align 8
  store %struct.ucvector* %out, %struct.ucvector** %2, align 8
  store i32 %compressed, i32* %3, align 4
  store i8* %keyword, i8** %4, align 8
  store i8* %langtag, i8** %5, align 8
  store i8* %transkey, i8** %6, align 8
  store i8* %textstring, i8** %7, align 8
  store %struct.LodePNGCompressSettings* %zlibsettings, %struct.LodePNGCompressSettings** %8, align 8
  store i32 0, i32* %error, align 4
  %9 = load i8** %7, align 8
  %10 = call i64 @strlen(i8* %9) #6
  store i64 %10, i64* %textsize, align 8
  call void @ucvector_init(%struct.ucvector* %data)
  store i64 0, i64* %i, align 8
  br label %11

; <label>:11                                      ; preds = %24, %0
  %12 = load i64* %i, align 8
  %13 = load i8** %4, align 8
  %14 = getelementptr inbounds i8* %13, i64 %12
  %15 = load i8* %14, align 1
  %16 = sext i8 %15 to i32
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %18, label %27

; <label>:18                                      ; preds = %11
  %19 = load i64* %i, align 8
  %20 = load i8** %4, align 8
  %21 = getelementptr inbounds i8* %20, i64 %19
  %22 = load i8* %21, align 1
  %23 = call i32 @ucvector_push_back(%struct.ucvector* %data, i8 zeroext %22)
  br label %24

; <label>:24                                      ; preds = %18
  %25 = load i64* %i, align 8
  %26 = add i64 %25, 1
  store i64 %26, i64* %i, align 8
  br label %11

; <label>:27                                      ; preds = %11
  %28 = load i64* %i, align 8
  %29 = icmp ult i64 %28, 1
  br i1 %29, label %33, label %30

; <label>:30                                      ; preds = %27
  %31 = load i64* %i, align 8
  %32 = icmp ugt i64 %31, 79
  br i1 %32, label %33, label %34

; <label>:33                                      ; preds = %30, %27
  store i32 89, i32* %1
  br label %139

; <label>:34                                      ; preds = %30
  %35 = call i32 @ucvector_push_back(%struct.ucvector* %data, i8 zeroext 0)
  %36 = load i32* %3, align 4
  %37 = icmp ne i32 %36, 0
  %38 = select i1 %37, i32 1, i32 0
  %39 = trunc i32 %38 to i8
  %40 = call i32 @ucvector_push_back(%struct.ucvector* %data, i8 zeroext %39)
  %41 = call i32 @ucvector_push_back(%struct.ucvector* %data, i8 zeroext 0)
  store i64 0, i64* %i, align 8
  br label %42

; <label>:42                                      ; preds = %55, %34
  %43 = load i64* %i, align 8
  %44 = load i8** %5, align 8
  %45 = getelementptr inbounds i8* %44, i64 %43
  %46 = load i8* %45, align 1
  %47 = sext i8 %46 to i32
  %48 = icmp ne i32 %47, 0
  br i1 %48, label %49, label %58

; <label>:49                                      ; preds = %42
  %50 = load i64* %i, align 8
  %51 = load i8** %5, align 8
  %52 = getelementptr inbounds i8* %51, i64 %50
  %53 = load i8* %52, align 1
  %54 = call i32 @ucvector_push_back(%struct.ucvector* %data, i8 zeroext %53)
  br label %55

; <label>:55                                      ; preds = %49
  %56 = load i64* %i, align 8
  %57 = add i64 %56, 1
  store i64 %57, i64* %i, align 8
  br label %42

; <label>:58                                      ; preds = %42
  %59 = call i32 @ucvector_push_back(%struct.ucvector* %data, i8 zeroext 0)
  store i64 0, i64* %i, align 8
  br label %60

; <label>:60                                      ; preds = %73, %58
  %61 = load i64* %i, align 8
  %62 = load i8** %6, align 8
  %63 = getelementptr inbounds i8* %62, i64 %61
  %64 = load i8* %63, align 1
  %65 = sext i8 %64 to i32
  %66 = icmp ne i32 %65, 0
  br i1 %66, label %67, label %76

; <label>:67                                      ; preds = %60
  %68 = load i64* %i, align 8
  %69 = load i8** %6, align 8
  %70 = getelementptr inbounds i8* %69, i64 %68
  %71 = load i8* %70, align 1
  %72 = call i32 @ucvector_push_back(%struct.ucvector* %data, i8 zeroext %71)
  br label %73

; <label>:73                                      ; preds = %67
  %74 = load i64* %i, align 8
  %75 = add i64 %74, 1
  store i64 %75, i64* %i, align 8
  br label %60

; <label>:76                                      ; preds = %60
  %77 = call i32 @ucvector_push_back(%struct.ucvector* %data, i8 zeroext 0)
  %78 = load i32* %3, align 4
  %79 = icmp ne i32 %78, 0
  br i1 %79, label %80, label %108

; <label>:80                                      ; preds = %76
  call void @ucvector_init(%struct.ucvector* %compressed_data)
  %81 = getelementptr inbounds %struct.ucvector* %compressed_data, i32 0, i32 0
  %82 = getelementptr inbounds %struct.ucvector* %compressed_data, i32 0, i32 1
  %83 = load i8** %7, align 8
  %84 = load i64* %textsize, align 8
  %85 = load %struct.LodePNGCompressSettings** %8, align 8
  %86 = call i32 @zlib_compress(i8** %81, i64* %82, i8* %83, i64 %84, %struct.LodePNGCompressSettings* %85)
  store i32 %86, i32* %error, align 4
  %87 = load i32* %error, align 4
  %88 = icmp ne i32 %87, 0
  br i1 %88, label %106, label %89

; <label>:89                                      ; preds = %80
  store i64 0, i64* %i, align 8
  br label %90

; <label>:90                                      ; preds = %102, %89
  %91 = load i64* %i, align 8
  %92 = getelementptr inbounds %struct.ucvector* %compressed_data, i32 0, i32 1
  %93 = load i64* %92, align 8
  %94 = icmp ult i64 %91, %93
  br i1 %94, label %95, label %105

; <label>:95                                      ; preds = %90
  %96 = load i64* %i, align 8
  %97 = getelementptr inbounds %struct.ucvector* %compressed_data, i32 0, i32 0
  %98 = load i8** %97, align 8
  %99 = getelementptr inbounds i8* %98, i64 %96
  %100 = load i8* %99, align 1
  %101 = call i32 @ucvector_push_back(%struct.ucvector* %data, i8 zeroext %100)
  br label %102

; <label>:102                                     ; preds = %95
  %103 = load i64* %i, align 8
  %104 = add i64 %103, 1
  store i64 %104, i64* %i, align 8
  br label %90

; <label>:105                                     ; preds = %90
  br label %106

; <label>:106                                     ; preds = %105, %80
  %107 = bitcast %struct.ucvector* %compressed_data to i8*
  call void @ucvector_cleanup(i8* %107)
  br label %126

; <label>:108                                     ; preds = %76
  store i64 0, i64* %i, align 8
  br label %109

; <label>:109                                     ; preds = %122, %108
  %110 = load i64* %i, align 8
  %111 = load i8** %7, align 8
  %112 = getelementptr inbounds i8* %111, i64 %110
  %113 = load i8* %112, align 1
  %114 = sext i8 %113 to i32
  %115 = icmp ne i32 %114, 0
  br i1 %115, label %116, label %125

; <label>:116                                     ; preds = %109
  %117 = load i64* %i, align 8
  %118 = load i8** %7, align 8
  %119 = getelementptr inbounds i8* %118, i64 %117
  %120 = load i8* %119, align 1
  %121 = call i32 @ucvector_push_back(%struct.ucvector* %data, i8 zeroext %120)
  br label %122

; <label>:122                                     ; preds = %116
  %123 = load i64* %i, align 8
  %124 = add i64 %123, 1
  store i64 %124, i64* %i, align 8
  br label %109

; <label>:125                                     ; preds = %109
  br label %126

; <label>:126                                     ; preds = %125, %106
  %127 = load i32* %error, align 4
  %128 = icmp ne i32 %127, 0
  br i1 %128, label %136, label %129

; <label>:129                                     ; preds = %126
  %130 = load %struct.ucvector** %2, align 8
  %131 = getelementptr inbounds %struct.ucvector* %data, i32 0, i32 0
  %132 = load i8** %131, align 8
  %133 = getelementptr inbounds %struct.ucvector* %data, i32 0, i32 1
  %134 = load i64* %133, align 8
  %135 = call i32 @addChunk(%struct.ucvector* %130, i8* getelementptr inbounds ([5 x i8]* @.str81, i32 0, i32 0), i8* %132, i64 %134)
  store i32 %135, i32* %error, align 4
  br label %136

; <label>:136                                     ; preds = %129, %126
  %137 = bitcast %struct.ucvector* %data to i8*
  call void @ucvector_cleanup(i8* %137)
  %138 = load i32* %error, align 4
  store i32 %138, i32* %1
  br label %139

; <label>:139                                     ; preds = %136, %33
  %140 = load i32* %1
  ret i32 %140
}

; Function Attrs: nounwind uwtable
define internal i32 @addChunk_IEND(%struct.ucvector* %out) #0 {
  %1 = alloca %struct.ucvector*, align 8
  %error = alloca i32, align 4
  store %struct.ucvector* %out, %struct.ucvector** %1, align 8
  store i32 0, i32* %error, align 4
  %2 = load %struct.ucvector** %1, align 8
  %3 = call i32 @addChunk(%struct.ucvector* %2, i8* getelementptr inbounds ([5 x i8]* @.str80, i32 0, i32 0), i8* null, i64 0)
  store i32 %3, i32* %error, align 4
  %4 = load i32* %error, align 4
  ret i32 %4
}

; Function Attrs: nounwind uwtable
define i32 @lodepng_encode_memory(i8** %out, i64* %outsize, i8* %image, i32 %w, i32 %h, i32 %colortype, i32 %bitdepth) #0 {
  %1 = alloca i8**, align 8
  %2 = alloca i64*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %error = alloca i32, align 4
  %state = alloca %struct.LodePNGState, align 8
  store i8** %out, i8*** %1, align 8
  store i64* %outsize, i64** %2, align 8
  store i8* %image, i8** %3, align 8
  store i32 %w, i32* %4, align 4
  store i32 %h, i32* %5, align 4
  store i32 %colortype, i32* %6, align 4
  store i32 %bitdepth, i32* %7, align 4
  call void @lodepng_state_init(%struct.LodePNGState* %state)
  %8 = load i32* %6, align 4
  %9 = getelementptr inbounds %struct.LodePNGState* %state, i32 0, i32 2
  %10 = getelementptr inbounds %struct.LodePNGColorMode* %9, i32 0, i32 0
  store i32 %8, i32* %10, align 4
  %11 = load i32* %7, align 4
  %12 = getelementptr inbounds %struct.LodePNGState* %state, i32 0, i32 2
  %13 = getelementptr inbounds %struct.LodePNGColorMode* %12, i32 0, i32 1
  store i32 %11, i32* %13, align 4
  %14 = load i32* %6, align 4
  %15 = getelementptr inbounds %struct.LodePNGState* %state, i32 0, i32 3
  %16 = getelementptr inbounds %struct.LodePNGInfo* %15, i32 0, i32 3
  %17 = getelementptr inbounds %struct.LodePNGColorMode* %16, i32 0, i32 0
  store i32 %14, i32* %17, align 4
  %18 = load i32* %7, align 4
  %19 = getelementptr inbounds %struct.LodePNGState* %state, i32 0, i32 3
  %20 = getelementptr inbounds %struct.LodePNGInfo* %19, i32 0, i32 3
  %21 = getelementptr inbounds %struct.LodePNGColorMode* %20, i32 0, i32 1
  store i32 %18, i32* %21, align 4
  %22 = load i8*** %1, align 8
  %23 = load i64** %2, align 8
  %24 = load i8** %3, align 8
  %25 = load i32* %4, align 4
  %26 = load i32* %5, align 4
  %27 = call i32 @lodepng_encode(i8** %22, i64* %23, i8* %24, i32 %25, i32 %26, %struct.LodePNGState* %state)
  %28 = getelementptr inbounds %struct.LodePNGState* %state, i32 0, i32 4
  %29 = load i32* %28, align 4
  store i32 %29, i32* %error, align 4
  call void @lodepng_state_cleanup(%struct.LodePNGState* %state)
  %30 = load i32* %error, align 4
  ret i32 %30
}

; Function Attrs: nounwind uwtable
define i32 @lodepng_encode32(i8** %out, i64* %outsize, i8* %image, i32 %w, i32 %h) #0 {
  %1 = alloca i8**, align 8
  %2 = alloca i64*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i8** %out, i8*** %1, align 8
  store i64* %outsize, i64** %2, align 8
  store i8* %image, i8** %3, align 8
  store i32 %w, i32* %4, align 4
  store i32 %h, i32* %5, align 4
  %6 = load i8*** %1, align 8
  %7 = load i64** %2, align 8
  %8 = load i8** %3, align 8
  %9 = load i32* %4, align 4
  %10 = load i32* %5, align 4
  %11 = call i32 @lodepng_encode_memory(i8** %6, i64* %7, i8* %8, i32 %9, i32 %10, i32 6, i32 8)
  ret i32 %11
}

; Function Attrs: nounwind uwtable
define i32 @lodepng_encode24(i8** %out, i64* %outsize, i8* %image, i32 %w, i32 %h) #0 {
  %1 = alloca i8**, align 8
  %2 = alloca i64*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i8** %out, i8*** %1, align 8
  store i64* %outsize, i64** %2, align 8
  store i8* %image, i8** %3, align 8
  store i32 %w, i32* %4, align 4
  store i32 %h, i32* %5, align 4
  %6 = load i8*** %1, align 8
  %7 = load i64** %2, align 8
  %8 = load i8** %3, align 8
  %9 = load i32* %4, align 4
  %10 = load i32* %5, align 4
  %11 = call i32 @lodepng_encode_memory(i8** %6, i64* %7, i8* %8, i32 %9, i32 %10, i32 2, i32 8)
  ret i32 %11
}

; Function Attrs: nounwind uwtable
define i32 @lodepng_encode_file(i8* %filename, i8* %image, i32 %w, i32 %h, i32 %colortype, i32 %bitdepth) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %buffer = alloca i8*, align 8
  %buffersize = alloca i64, align 8
  %error = alloca i32, align 4
  store i8* %filename, i8** %1, align 8
  store i8* %image, i8** %2, align 8
  store i32 %w, i32* %3, align 4
  store i32 %h, i32* %4, align 4
  store i32 %colortype, i32* %5, align 4
  store i32 %bitdepth, i32* %6, align 4
  %7 = load i8** %2, align 8
  %8 = load i32* %3, align 4
  %9 = load i32* %4, align 4
  %10 = load i32* %5, align 4
  %11 = load i32* %6, align 4
  %12 = call i32 @lodepng_encode_memory(i8** %buffer, i64* %buffersize, i8* %7, i32 %8, i32 %9, i32 %10, i32 %11)
  store i32 %12, i32* %error, align 4
  %13 = load i32* %error, align 4
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %20, label %15

; <label>:15                                      ; preds = %0
  %16 = load i8** %buffer, align 8
  %17 = load i64* %buffersize, align 8
  %18 = load i8** %1, align 8
  %19 = call i32 @lodepng_save_file(i8* %16, i64 %17, i8* %18)
  store i32 %19, i32* %error, align 4
  br label %20

; <label>:20                                      ; preds = %15, %0
  %21 = load i8** %buffer, align 8
  call void @lodepng_free(i8* %21)
  %22 = load i32* %error, align 4
  ret i32 %22
}

; Function Attrs: nounwind uwtable
define i32 @lodepng_encode32_file(i8* %filename, i8* %image, i32 %w, i32 %h) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i8* %filename, i8** %1, align 8
  store i8* %image, i8** %2, align 8
  store i32 %w, i32* %3, align 4
  store i32 %h, i32* %4, align 4
  %5 = load i8** %1, align 8
  %6 = load i8** %2, align 8
  %7 = load i32* %3, align 4
  %8 = load i32* %4, align 4
  %9 = call i32 @lodepng_encode_file(i8* %5, i8* %6, i32 %7, i32 %8, i32 6, i32 8)
  ret i32 %9
}

; Function Attrs: nounwind uwtable
define i32 @lodepng_encode24_file(i8* %filename, i8* %image, i32 %w, i32 %h) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i8* %filename, i8** %1, align 8
  store i8* %image, i8** %2, align 8
  store i32 %w, i32* %3, align 4
  store i32 %h, i32* %4, align 4
  %5 = load i8** %1, align 8
  %6 = load i8** %2, align 8
  %7 = load i32* %3, align 4
  %8 = load i32* %4, align 4
  %9 = call i32 @lodepng_encode_file(i8* %5, i8* %6, i32 %7, i32 %8, i32 2, i32 8)
  ret i32 %9
}

; Function Attrs: nounwind uwtable
define i8* @lodepng_error_text(i32 %code) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i32, align 4
  store i32 %code, i32* %2, align 4
  %3 = load i32* %2, align 4
  switch i32 %3, label %84 [
    i32 0, label %4
    i32 1, label %5
    i32 10, label %6
    i32 11, label %7
    i32 13, label %8
    i32 14, label %9
    i32 15, label %10
    i32 16, label %11
    i32 17, label %12
    i32 18, label %13
    i32 19, label %14
    i32 20, label %15
    i32 21, label %16
    i32 22, label %17
    i32 23, label %18
    i32 24, label %19
    i32 25, label %20
    i32 26, label %21
    i32 27, label %22
    i32 28, label %23
    i32 29, label %24
    i32 30, label %25
    i32 31, label %26
    i32 32, label %27
    i32 33, label %28
    i32 34, label %29
    i32 35, label %30
    i32 36, label %31
    i32 37, label %32
    i32 38, label %33
    i32 39, label %34
    i32 40, label %35
    i32 41, label %36
    i32 42, label %37
    i32 43, label %38
    i32 44, label %39
    i32 45, label %40
    i32 46, label %41
    i32 47, label %42
    i32 48, label %43
    i32 49, label %44
    i32 50, label %45
    i32 51, label %46
    i32 52, label %47
    i32 53, label %48
    i32 54, label %49
    i32 55, label %50
    i32 56, label %51
    i32 57, label %52
    i32 58, label %53
    i32 59, label %54
    i32 60, label %55
    i32 61, label %56
    i32 62, label %57
    i32 63, label %58
    i32 64, label %59
    i32 66, label %60
    i32 67, label %61
    i32 68, label %62
    i32 69, label %63
    i32 71, label %64
    i32 72, label %65
    i32 73, label %66
    i32 74, label %67
    i32 75, label %68
    i32 76, label %69
    i32 77, label %70
    i32 78, label %71
    i32 79, label %72
    i32 80, label %73
    i32 81, label %74
    i32 82, label %75
    i32 83, label %76
    i32 84, label %77
    i32 85, label %78
    i32 86, label %79
    i32 87, label %80
    i32 88, label %81
    i32 89, label %82
    i32 90, label %83
  ]

; <label>:4                                       ; preds = %0
  store i8* getelementptr inbounds ([29 x i8]* @.str4, i32 0, i32 0), i8** %1
  br label %85

; <label>:5                                       ; preds = %0
  store i8* getelementptr inbounds ([17 x i8]* @.str5, i32 0, i32 0), i8** %1
  br label %85

; <label>:6                                       ; preds = %0
  store i8* getelementptr inbounds ([53 x i8]* @.str6, i32 0, i32 0), i8** %1
  br label %85

; <label>:7                                       ; preds = %0
  store i8* getelementptr inbounds ([56 x i8]* @.str7, i32 0, i32 0), i8** %1
  br label %85

; <label>:8                                       ; preds = %0
  store i8* getelementptr inbounds ([47 x i8]* @.str8, i32 0, i32 0), i8** %1
  br label %85

; <label>:9                                       ; preds = %0
  store i8* getelementptr inbounds ([47 x i8]* @.str8, i32 0, i32 0), i8** %1
  br label %85

; <label>:10                                      ; preds = %0
  store i8* getelementptr inbounds ([47 x i8]* @.str8, i32 0, i32 0), i8** %1
  br label %85

; <label>:11                                      ; preds = %0
  store i8* getelementptr inbounds ([55 x i8]* @.str9, i32 0, i32 0), i8** %1
  br label %85

; <label>:12                                      ; preds = %0
  store i8* getelementptr inbounds ([49 x i8]* @.str10, i32 0, i32 0), i8** %1
  br label %85

; <label>:13                                      ; preds = %0
  store i8* getelementptr inbounds ([38 x i8]* @.str11, i32 0, i32 0), i8** %1
  br label %85

; <label>:14                                      ; preds = %0
  store i8* getelementptr inbounds ([49 x i8]* @.str10, i32 0, i32 0), i8** %1
  br label %85

; <label>:15                                      ; preds = %0
  store i8* getelementptr inbounds ([55 x i8]* @.str12, i32 0, i32 0), i8** %1
  br label %85

; <label>:16                                      ; preds = %0
  store i8* getelementptr inbounds ([54 x i8]* @.str13, i32 0, i32 0), i8** %1
  br label %85

; <label>:17                                      ; preds = %0
  store i8* getelementptr inbounds ([49 x i8]* @.str10, i32 0, i32 0), i8** %1
  br label %85

; <label>:18                                      ; preds = %0
  store i8* getelementptr inbounds ([48 x i8]* @.str14, i32 0, i32 0), i8** %1
  br label %85

; <label>:19                                      ; preds = %0
  store i8* getelementptr inbounds ([30 x i8]* @.str15, i32 0, i32 0), i8** %1
  br label %85

; <label>:20                                      ; preds = %0
  store i8* getelementptr inbounds ([42 x i8]* @.str16, i32 0, i32 0), i8** %1
  br label %85

; <label>:21                                      ; preds = %0
  store i8* getelementptr inbounds ([61 x i8]* @.str17, i32 0, i32 0), i8** %1
  br label %85

; <label>:22                                      ; preds = %0
  store i8* getelementptr inbounds ([38 x i8]* @.str18, i32 0, i32 0), i8** %1
  br label %85

; <label>:23                                      ; preds = %0
  store i8* getelementptr inbounds ([50 x i8]* @.str19, i32 0, i32 0), i8** %1
  br label %85

; <label>:24                                      ; preds = %0
  store i8* getelementptr inbounds ([36 x i8]* @.str20, i32 0, i32 0), i8** %1
  br label %85

; <label>:25                                      ; preds = %0
  store i8* getelementptr inbounds ([56 x i8]* @.str21, i32 0, i32 0), i8** %1
  br label %85

; <label>:26                                      ; preds = %0
  store i8* getelementptr inbounds ([30 x i8]* @.str22, i32 0, i32 0), i8** %1
  br label %85

; <label>:27                                      ; preds = %0
  store i8* getelementptr inbounds ([31 x i8]* @.str23, i32 0, i32 0), i8** %1
  br label %85

; <label>:28                                      ; preds = %0
  store i8* getelementptr inbounds ([26 x i8]* @.str24, i32 0, i32 0), i8** %1
  br label %85

; <label>:29                                      ; preds = %0
  store i8* getelementptr inbounds ([29 x i8]* @.str25, i32 0, i32 0), i8** %1
  br label %85

; <label>:30                                      ; preds = %0
  store i8* getelementptr inbounds ([60 x i8]* @.str26, i32 0, i32 0), i8** %1
  br label %85

; <label>:31                                      ; preds = %0
  store i8* getelementptr inbounds ([36 x i8]* @.str27, i32 0, i32 0), i8** %1
  br label %85

; <label>:32                                      ; preds = %0
  store i8* getelementptr inbounds ([44 x i8]* @.str28, i32 0, i32 0), i8** %1
  br label %85

; <label>:33                                      ; preds = %0
  store i8* getelementptr inbounds ([23 x i8]* @.str29, i32 0, i32 0), i8** %1
  br label %85

; <label>:34                                      ; preds = %0
  store i8* getelementptr inbounds ([83 x i8]* @.str30, i32 0, i32 0), i8** %1
  br label %85

; <label>:35                                      ; preds = %0
  store i8* getelementptr inbounds ([46 x i8]* @.str31, i32 0, i32 0), i8** %1
  br label %85

; <label>:36                                      ; preds = %0
  store i8* getelementptr inbounds ([40 x i8]* @.str32, i32 0, i32 0), i8** %1
  br label %85

; <label>:37                                      ; preds = %0
  store i8* getelementptr inbounds ([65 x i8]* @.str33, i32 0, i32 0), i8** %1
  br label %85

; <label>:38                                      ; preds = %0
  store i8* getelementptr inbounds ([44 x i8]* @.str34, i32 0, i32 0), i8** %1
  br label %85

; <label>:39                                      ; preds = %0
  store i8* getelementptr inbounds ([46 x i8]* @.str35, i32 0, i32 0), i8** %1
  br label %85

; <label>:40                                      ; preds = %0
  store i8* getelementptr inbounds ([40 x i8]* @.str36, i32 0, i32 0), i8** %1
  br label %85

; <label>:41                                      ; preds = %0
  store i8* getelementptr inbounds ([72 x i8]* @.str37, i32 0, i32 0), i8** %1
  br label %85

; <label>:42                                      ; preds = %0
  store i8* getelementptr inbounds ([72 x i8]* @.str38, i32 0, i32 0), i8** %1
  br label %85

; <label>:43                                      ; preds = %0
  store i8* getelementptr inbounds ([34 x i8]* @.str39, i32 0, i32 0), i8** %1
  br label %85

; <label>:44                                      ; preds = %0
  store i8* getelementptr inbounds ([57 x i8]* @.str40, i32 0, i32 0), i8** %1
  br label %85

; <label>:45                                      ; preds = %0
  store i8* getelementptr inbounds ([57 x i8]* @.str40, i32 0, i32 0), i8** %1
  br label %85

; <label>:46                                      ; preds = %0
  store i8* getelementptr inbounds ([49 x i8]* @.str41, i32 0, i32 0), i8** %1
  br label %85

; <label>:47                                      ; preds = %0
  store i8* getelementptr inbounds ([35 x i8]* @.str42, i32 0, i32 0), i8** %1
  br label %85

; <label>:48                                      ; preds = %0
  store i8* getelementptr inbounds ([28 x i8]* @.str43, i32 0, i32 0), i8** %1
  br label %85

; <label>:49                                      ; preds = %0
  store i8* getelementptr inbounds ([58 x i8]* @.str44, i32 0, i32 0), i8** %1
  br label %85

; <label>:50                                      ; preds = %0
  store i8* getelementptr inbounds ([47 x i8]* @.str45, i32 0, i32 0), i8** %1
  br label %85

; <label>:51                                      ; preds = %0
  store i8* getelementptr inbounds ([76 x i8]* @.str46, i32 0, i32 0), i8** %1
  br label %85

; <label>:52                                      ; preds = %0
  store i8* getelementptr inbounds ([55 x i8]* @.str47, i32 0, i32 0), i8** %1
  br label %85

; <label>:53                                      ; preds = %0
  store i8* getelementptr inbounds ([63 x i8]* @.str48, i32 0, i32 0), i8** %1
  br label %85

; <label>:54                                      ; preds = %0
  store i8* getelementptr inbounds ([41 x i8]* @.str49, i32 0, i32 0), i8** %1
  br label %85

; <label>:55                                      ; preds = %0
  store i8* getelementptr inbounds ([75 x i8]* @.str50, i32 0, i32 0), i8** %1
  br label %85

; <label>:56                                      ; preds = %0
  store i8* getelementptr inbounds ([81 x i8]* @.str51, i32 0, i32 0), i8** %1
  br label %85

; <label>:57                                      ; preds = %0
  store i8* getelementptr inbounds ([49 x i8]* @.str52, i32 0, i32 0), i8** %1
  br label %85

; <label>:58                                      ; preds = %0
  store i8* getelementptr inbounds ([78 x i8]* @.str53, i32 0, i32 0), i8** %1
  br label %85

; <label>:59                                      ; preds = %0
  store i8* getelementptr inbounds ([58 x i8]* @.str54, i32 0, i32 0), i8** %1
  br label %85

; <label>:60                                      ; preds = %0
  store i8* getelementptr inbounds ([95 x i8]* @.str55, i32 0, i32 0), i8** %1
  br label %85

; <label>:61                                      ; preds = %0
  store i8* getelementptr inbounds ([94 x i8]* @.str56, i32 0, i32 0), i8** %1
  br label %85

; <label>:62                                      ; preds = %0
  store i8* getelementptr inbounds ([89 x i8]* @.str57, i32 0, i32 0), i8** %1
  br label %85

; <label>:63                                      ; preds = %0
  store i8* getelementptr inbounds ([67 x i8]* @.str58, i32 0, i32 0), i8** %1
  br label %85

; <label>:64                                      ; preds = %0
  store i8* getelementptr inbounds ([60 x i8]* @.str59, i32 0, i32 0), i8** %1
  br label %85

; <label>:65                                      ; preds = %0
  store i8* getelementptr inbounds ([96 x i8]* @.str60, i32 0, i32 0), i8** %1
  br label %85

; <label>:66                                      ; preds = %0
  store i8* getelementptr inbounds ([24 x i8]* @.str61, i32 0, i32 0), i8** %1
  br label %85

; <label>:67                                      ; preds = %0
  store i8* getelementptr inbounds ([24 x i8]* @.str62, i32 0, i32 0), i8** %1
  br label %85

; <label>:68                                      ; preds = %0
  store i8* getelementptr inbounds ([57 x i8]* @.str63, i32 0, i32 0), i8** %1
  br label %85

; <label>:69                                      ; preds = %0
  store i8* getelementptr inbounds ([47 x i8]* @.str64, i32 0, i32 0), i8** %1
  br label %85

; <label>:70                                      ; preds = %0
  store i8* getelementptr inbounds ([32 x i8]* @.str65, i32 0, i32 0), i8** %1
  br label %85

; <label>:71                                      ; preds = %0
  store i8* getelementptr inbounds ([32 x i8]* @.str66, i32 0, i32 0), i8** %1
  br label %85

; <label>:72                                      ; preds = %0
  store i8* getelementptr inbounds ([32 x i8]* @.str67, i32 0, i32 0), i8** %1
  br label %85

; <label>:73                                      ; preds = %0
  store i8* getelementptr inbounds ([35 x i8]* @.str68, i32 0, i32 0), i8** %1
  br label %85

; <label>:74                                      ; preds = %0
  store i8* getelementptr inbounds ([37 x i8]* @.str69, i32 0, i32 0), i8** %1
  br label %85

; <label>:75                                      ; preds = %0
  store i8* getelementptr inbounds ([69 x i8]* @.str70, i32 0, i32 0), i8** %1
  br label %85

; <label>:76                                      ; preds = %0
  store i8* getelementptr inbounds ([25 x i8]* @.str71, i32 0, i32 0), i8** %1
  br label %85

; <label>:77                                      ; preds = %0
  store i8* getelementptr inbounds ([58 x i8]* @.str72, i32 0, i32 0), i8** %1
  br label %85

; <label>:78                                      ; preds = %0
  store i8* getelementptr inbounds ([30 x i8]* @.str73, i32 0, i32 0), i8** %1
  br label %85

; <label>:79                                      ; preds = %0
  store i8* getelementptr inbounds ([50 x i8]* @.str74, i32 0, i32 0), i8** %1
  br label %85

; <label>:80                                      ; preds = %0
  store i8* getelementptr inbounds ([81 x i8]* @.str75, i32 0, i32 0), i8** %1
  br label %85

; <label>:81                                      ; preds = %0
  store i8* getelementptr inbounds ([73 x i8]* @.str76, i32 0, i32 0), i8** %1
  br label %85

; <label>:82                                      ; preds = %0
  store i8* getelementptr inbounds ([58 x i8]* @.str77, i32 0, i32 0), i8** %1
  br label %85

; <label>:83                                      ; preds = %0
  store i8* getelementptr inbounds ([34 x i8]* @.str78, i32 0, i32 0), i8** %1
  br label %85

; <label>:84                                      ; preds = %0
  store i8* getelementptr inbounds ([19 x i8]* @.str79, i32 0, i32 0), i8** %1
  br label %85

; <label>:85                                      ; preds = %84, %83, %82, %81, %80, %79, %78, %77, %76, %75, %74, %73, %72, %71, %70, %69, %68, %67, %66, %65, %64, %63, %62, %61, %60, %59, %58, %57, %56, %55, %54, %53, %52, %51, %50, %49, %48, %47, %46, %45, %44, %43, %42, %41, %40, %39, %38, %37, %36, %35, %34, %33, %32, %31, %30, %29, %28, %27, %26, %25, %24, %23, %22, %21, %20, %19, %18, %17, %16, %15, %14, %13, %12, %11, %10, %9, %8, %7, %6, %5, %4
  %86 = load i8** %1
  ret i8* %86
}

; Function Attrs: nounwind uwtable
define internal i32 @addChunk(%struct.ucvector* %out, i8* %chunkName, i8* %data, i64 %length) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.ucvector*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i64, align 8
  %error = alloca i32, align 4
  store %struct.ucvector* %out, %struct.ucvector** %2, align 8
  store i8* %chunkName, i8** %3, align 8
  store i8* %data, i8** %4, align 8
  store i64 %length, i64* %5, align 8
  %6 = load %struct.ucvector** %2, align 8
  %7 = getelementptr inbounds %struct.ucvector* %6, i32 0, i32 0
  %8 = load %struct.ucvector** %2, align 8
  %9 = getelementptr inbounds %struct.ucvector* %8, i32 0, i32 1
  %10 = load i64* %5, align 8
  %11 = trunc i64 %10 to i32
  %12 = load i8** %3, align 8
  %13 = load i8** %4, align 8
  %14 = call i32 @lodepng_chunk_create(i8** %7, i64* %9, i32 %11, i8* %12, i8* %13)
  store i32 %14, i32* %error, align 4
  %15 = load i32* %error, align 4
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %17, label %19

; <label>:17                                      ; preds = %0
  %18 = load i32* %error, align 4
  store i32 %18, i32* %1
  br label %25

; <label>:19                                      ; preds = %0
  %20 = load %struct.ucvector** %2, align 8
  %21 = getelementptr inbounds %struct.ucvector* %20, i32 0, i32 1
  %22 = load i64* %21, align 8
  %23 = load %struct.ucvector** %2, align 8
  %24 = getelementptr inbounds %struct.ucvector* %23, i32 0, i32 2
  store i64 %22, i64* %24, align 8
  store i32 0, i32* %1
  br label %25

; <label>:25                                      ; preds = %19, %17
  %26 = load i32* %1
  ret i32 %26
}

; Function Attrs: nounwind uwtable
define internal i32 @zlib_compress(i8** %out, i64* %outsize, i8* %in, i64 %insize, %struct.LodePNGCompressSettings* %settings) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8**, align 8
  %3 = alloca i64*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i64, align 8
  %6 = alloca %struct.LodePNGCompressSettings*, align 8
  store i8** %out, i8*** %2, align 8
  store i64* %outsize, i64** %3, align 8
  store i8* %in, i8** %4, align 8
  store i64 %insize, i64* %5, align 8
  store %struct.LodePNGCompressSettings* %settings, %struct.LodePNGCompressSettings** %6, align 8
  %7 = load %struct.LodePNGCompressSettings** %6, align 8
  %8 = getelementptr inbounds %struct.LodePNGCompressSettings* %7, i32 0, i32 6
  %9 = bitcast {}** %8 to i32 (i8**, i64*, i8*, i64, %struct.LodePNGCompressSettings*)**
  %10 = load i32 (i8**, i64*, i8*, i64, %struct.LodePNGCompressSettings*)** %9, align 8
  %11 = icmp ne i32 (i8**, i64*, i8*, i64, %struct.LodePNGCompressSettings*)* %10, null
  br i1 %11, label %12, label %23

; <label>:12                                      ; preds = %0
  %13 = load %struct.LodePNGCompressSettings** %6, align 8
  %14 = getelementptr inbounds %struct.LodePNGCompressSettings* %13, i32 0, i32 6
  %15 = bitcast {}** %14 to i32 (i8**, i64*, i8*, i64, %struct.LodePNGCompressSettings*)**
  %16 = load i32 (i8**, i64*, i8*, i64, %struct.LodePNGCompressSettings*)** %15, align 8
  %17 = load i8*** %2, align 8
  %18 = load i64** %3, align 8
  %19 = load i8** %4, align 8
  %20 = load i64* %5, align 8
  %21 = load %struct.LodePNGCompressSettings** %6, align 8
  %22 = call i32 %16(i8** %17, i64* %18, i8* %19, i64 %20, %struct.LodePNGCompressSettings* %21)
  store i32 %22, i32* %1
  br label %30

; <label>:23                                      ; preds = %0
  %24 = load i8*** %2, align 8
  %25 = load i64** %3, align 8
  %26 = load i8** %4, align 8
  %27 = load i64* %5, align 8
  %28 = load %struct.LodePNGCompressSettings** %6, align 8
  %29 = call i32 @lodepng_zlib_compress(i8** %24, i64* %25, i8* %26, i64 %27, %struct.LodePNGCompressSettings* %28)
  store i32 %29, i32* %1
  br label %30

; <label>:30                                      ; preds = %23, %12
  %31 = load i32* %1
  ret i32 %31
}

; Function Attrs: nounwind uwtable
define internal void @ucvector_cleanup(i8* %p) #0 {
  %1 = alloca i8*, align 8
  store i8* %p, i8** %1, align 8
  %2 = load i8** %1, align 8
  %3 = bitcast i8* %2 to %struct.ucvector*
  %4 = getelementptr inbounds %struct.ucvector* %3, i32 0, i32 2
  store i64 0, i64* %4, align 8
  %5 = load i8** %1, align 8
  %6 = bitcast i8* %5 to %struct.ucvector*
  %7 = getelementptr inbounds %struct.ucvector* %6, i32 0, i32 1
  store i64 0, i64* %7, align 8
  %8 = load i8** %1, align 8
  %9 = bitcast i8* %8 to %struct.ucvector*
  %10 = getelementptr inbounds %struct.ucvector* %9, i32 0, i32 0
  %11 = load i8** %10, align 8
  call void @lodepng_free(i8* %11)
  %12 = load i8** %1, align 8
  %13 = bitcast i8* %12 to %struct.ucvector*
  %14 = getelementptr inbounds %struct.ucvector* %13, i32 0, i32 0
  store i8* null, i8** %14, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @addPaddingBits(i8* %out, i8* %in, i64 %olinebits, i64 %ilinebits, i32 %h) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca i32, align 4
  %y = alloca i32, align 4
  %diff = alloca i64, align 8
  %obp = alloca i64, align 8
  %ibp = alloca i64, align 8
  %x = alloca i64, align 8
  %bit = alloca i8, align 1
  store i8* %out, i8** %1, align 8
  store i8* %in, i8** %2, align 8
  store i64 %olinebits, i64* %3, align 8
  store i64 %ilinebits, i64* %4, align 8
  store i32 %h, i32* %5, align 4
  %6 = load i64* %3, align 8
  %7 = load i64* %4, align 8
  %8 = sub i64 %6, %7
  store i64 %8, i64* %diff, align 8
  store i64 0, i64* %obp, align 8
  store i64 0, i64* %ibp, align 8
  store i32 0, i32* %y, align 4
  br label %9

; <label>:9                                       ; preds = %37, %0
  %10 = load i32* %y, align 4
  %11 = load i32* %5, align 4
  %12 = icmp ult i32 %10, %11
  br i1 %12, label %13, label %40

; <label>:13                                      ; preds = %9
  store i64 0, i64* %x, align 8
  br label %14

; <label>:14                                      ; preds = %23, %13
  %15 = load i64* %x, align 8
  %16 = load i64* %4, align 8
  %17 = icmp ult i64 %15, %16
  br i1 %17, label %18, label %26

; <label>:18                                      ; preds = %14
  %19 = load i8** %2, align 8
  %20 = call zeroext i8 @readBitFromReversedStream(i64* %ibp, i8* %19)
  store i8 %20, i8* %bit, align 1
  %21 = load i8** %1, align 8
  %22 = load i8* %bit, align 1
  call void @setBitOfReversedStream(i64* %obp, i8* %21, i8 zeroext %22)
  br label %23

; <label>:23                                      ; preds = %18
  %24 = load i64* %x, align 8
  %25 = add i64 %24, 1
  store i64 %25, i64* %x, align 8
  br label %14

; <label>:26                                      ; preds = %14
  store i64 0, i64* %x, align 8
  br label %27

; <label>:27                                      ; preds = %33, %26
  %28 = load i64* %x, align 8
  %29 = load i64* %diff, align 8
  %30 = icmp ult i64 %28, %29
  br i1 %30, label %31, label %36

; <label>:31                                      ; preds = %27
  %32 = load i8** %1, align 8
  call void @setBitOfReversedStream(i64* %obp, i8* %32, i8 zeroext 0)
  br label %33

; <label>:33                                      ; preds = %31
  %34 = load i64* %x, align 8
  %35 = add i64 %34, 1
  store i64 %35, i64* %x, align 8
  br label %27

; <label>:36                                      ; preds = %27
  br label %37

; <label>:37                                      ; preds = %36
  %38 = load i32* %y, align 4
  %39 = add i32 %38, 1
  store i32 %39, i32* %y, align 4
  br label %9

; <label>:40                                      ; preds = %9
  ret void
}

; Function Attrs: nounwind uwtable
define internal i32 @filter(i8* %out, i8* %in, i32 %w, i32 %h, %struct.LodePNGColorMode* %info, %struct.LodePNGEncoderSettings* %settings) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca %struct.LodePNGColorMode*, align 8
  %7 = alloca %struct.LodePNGEncoderSettings*, align 8
  %bpp = alloca i32, align 4
  %linebytes = alloca i64, align 8
  %bytewidth = alloca i64, align 8
  %prevline = alloca i8*, align 8
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %error = alloca i32, align 4
  %strategy = alloca i32, align 4
  %outindex = alloca i64, align 8
  %inindex = alloca i64, align 8
  %sum = alloca [5 x i64], align 16
  %attempt = alloca [5 x %struct.ucvector], align 16
  %smallest = alloca i64, align 8
  %type = alloca i32, align 4
  %bestType = alloca i32, align 4
  %s = alloca i8, align 1
  %sum1 = alloca [5 x float], align 16
  %attempt2 = alloca [5 x %struct.ucvector], align 16
  %smallest3 = alloca float, align 4
  %type4 = alloca i32, align 4
  %bestType5 = alloca i32, align 4
  %count = alloca [256 x i32], align 16
  %p = alloca float, align 4
  %outindex6 = alloca i64, align 8
  %inindex7 = alloca i64, align 8
  %type8 = alloca i32, align 4
  %size = alloca [5 x i64], align 16
  %attempt9 = alloca [5 x %struct.ucvector], align 16
  %smallest10 = alloca i64, align 8
  %type11 = alloca i32, align 4
  %bestType12 = alloca i32, align 4
  %dummy = alloca i8*, align 8
  %zlibsettings = alloca %struct.LodePNGCompressSettings, align 8
  %testsize = alloca i32, align 4
  store i8* %out, i8** %2, align 8
  store i8* %in, i8** %3, align 8
  store i32 %w, i32* %4, align 4
  store i32 %h, i32* %5, align 4
  store %struct.LodePNGColorMode* %info, %struct.LodePNGColorMode** %6, align 8
  store %struct.LodePNGEncoderSettings* %settings, %struct.LodePNGEncoderSettings** %7, align 8
  %8 = load %struct.LodePNGColorMode** %6, align 8
  %9 = call i32 @lodepng_get_bpp(%struct.LodePNGColorMode* %8)
  store i32 %9, i32* %bpp, align 4
  %10 = load i32* %4, align 4
  %11 = load i32* %bpp, align 4
  %12 = mul i32 %10, %11
  %13 = add i32 %12, 7
  %14 = udiv i32 %13, 8
  %15 = zext i32 %14 to i64
  store i64 %15, i64* %linebytes, align 8
  %16 = load i32* %bpp, align 4
  %17 = add i32 %16, 7
  %18 = udiv i32 %17, 8
  %19 = zext i32 %18 to i64
  store i64 %19, i64* %bytewidth, align 8
  store i8* null, i8** %prevline, align 8
  store i32 0, i32* %error, align 4
  %20 = load %struct.LodePNGEncoderSettings** %7, align 8
  %21 = getelementptr inbounds %struct.LodePNGEncoderSettings* %20, i32 0, i32 3
  %22 = load i32* %21, align 4
  store i32 %22, i32* %strategy, align 4
  %23 = load %struct.LodePNGEncoderSettings** %7, align 8
  %24 = getelementptr inbounds %struct.LodePNGEncoderSettings* %23, i32 0, i32 2
  %25 = load i32* %24, align 4
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %27, label %38

; <label>:27                                      ; preds = %0
  %28 = load %struct.LodePNGColorMode** %6, align 8
  %29 = getelementptr inbounds %struct.LodePNGColorMode* %28, i32 0, i32 0
  %30 = load i32* %29, align 4
  %31 = icmp eq i32 %30, 3
  br i1 %31, label %37, label %32

; <label>:32                                      ; preds = %27
  %33 = load %struct.LodePNGColorMode** %6, align 8
  %34 = getelementptr inbounds %struct.LodePNGColorMode* %33, i32 0, i32 1
  %35 = load i32* %34, align 4
  %36 = icmp ult i32 %35, 8
  br i1 %36, label %37, label %38

; <label>:37                                      ; preds = %32, %27
  store i32 0, i32* %strategy, align 4
  br label %38

; <label>:38                                      ; preds = %37, %32, %0
  %39 = load i32* %bpp, align 4
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %41, label %42

; <label>:41                                      ; preds = %38
  store i32 31, i32* %1
  br label %703

; <label>:42                                      ; preds = %38
  %43 = load i32* %strategy, align 4
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %45, label %80

; <label>:45                                      ; preds = %42
  store i32 0, i32* %y, align 4
  br label %46

; <label>:46                                      ; preds = %76, %45
  %47 = load i32* %y, align 4
  %48 = load i32* %5, align 4
  %49 = icmp ult i32 %47, %48
  br i1 %49, label %50, label %79

; <label>:50                                      ; preds = %46
  %51 = load i64* %linebytes, align 8
  %52 = add i64 1, %51
  %53 = load i32* %y, align 4
  %54 = zext i32 %53 to i64
  %55 = mul i64 %52, %54
  store i64 %55, i64* %outindex, align 8
  %56 = load i64* %linebytes, align 8
  %57 = load i32* %y, align 4
  %58 = zext i32 %57 to i64
  %59 = mul i64 %56, %58
  store i64 %59, i64* %inindex, align 8
  %60 = load i64* %outindex, align 8
  %61 = load i8** %2, align 8
  %62 = getelementptr inbounds i8* %61, i64 %60
  store i8 0, i8* %62, align 1
  %63 = load i64* %outindex, align 8
  %64 = add i64 %63, 1
  %65 = load i8** %2, align 8
  %66 = getelementptr inbounds i8* %65, i64 %64
  %67 = load i64* %inindex, align 8
  %68 = load i8** %3, align 8
  %69 = getelementptr inbounds i8* %68, i64 %67
  %70 = load i8** %prevline, align 8
  %71 = load i64* %linebytes, align 8
  %72 = load i64* %bytewidth, align 8
  call void @filterScanline(i8* %66, i8* %69, i8* %70, i64 %71, i64 %72, i8 zeroext 0)
  %73 = load i64* %inindex, align 8
  %74 = load i8** %3, align 8
  %75 = getelementptr inbounds i8* %74, i64 %73
  store i8* %75, i8** %prevline, align 8
  br label %76

; <label>:76                                      ; preds = %50
  %77 = load i32* %y, align 4
  %78 = add i32 %77, 1
  store i32 %78, i32* %y, align 4
  br label %46

; <label>:79                                      ; preds = %46
  br label %701

; <label>:80                                      ; preds = %42
  %81 = load i32* %strategy, align 4
  %82 = icmp eq i32 %81, 1
  br i1 %82, label %83, label %283

; <label>:83                                      ; preds = %80
  store i64 0, i64* %smallest, align 8
  store i32 0, i32* %bestType, align 4
  store i32 0, i32* %type, align 4
  br label %84

; <label>:84                                      ; preds = %99, %83
  %85 = load i32* %type, align 4
  %86 = icmp ult i32 %85, 5
  br i1 %86, label %87, label %102

; <label>:87                                      ; preds = %84
  %88 = load i32* %type, align 4
  %89 = zext i32 %88 to i64
  %90 = getelementptr inbounds [5 x %struct.ucvector]* %attempt, i32 0, i64 %89
  call void @ucvector_init(%struct.ucvector* %90)
  %91 = load i32* %type, align 4
  %92 = zext i32 %91 to i64
  %93 = getelementptr inbounds [5 x %struct.ucvector]* %attempt, i32 0, i64 %92
  %94 = load i64* %linebytes, align 8
  %95 = call i32 @ucvector_resize(%struct.ucvector* %93, i64 %94)
  %96 = icmp ne i32 %95, 0
  br i1 %96, label %98, label %97

; <label>:97                                      ; preds = %87
  store i32 83, i32* %1
  br label %703

; <label>:98                                      ; preds = %87
  br label %99

; <label>:99                                      ; preds = %98
  %100 = load i32* %type, align 4
  %101 = add i32 %100, 1
  store i32 %101, i32* %type, align 4
  br label %84

; <label>:102                                     ; preds = %84
  %103 = load i32* %error, align 4
  %104 = icmp ne i32 %103, 0
  br i1 %104, label %270, label %105

; <label>:105                                     ; preds = %102
  store i32 0, i32* %y, align 4
  br label %106

; <label>:106                                     ; preds = %266, %105
  %107 = load i32* %y, align 4
  %108 = load i32* %5, align 4
  %109 = icmp ult i32 %107, %108
  br i1 %109, label %110, label %269

; <label>:110                                     ; preds = %106
  store i32 0, i32* %type, align 4
  br label %111

; <label>:111                                     ; preds = %217, %110
  %112 = load i32* %type, align 4
  %113 = icmp ult i32 %112, 5
  br i1 %113, label %114, label %220

; <label>:114                                     ; preds = %111
  %115 = load i32* %type, align 4
  %116 = zext i32 %115 to i64
  %117 = getelementptr inbounds [5 x %struct.ucvector]* %attempt, i32 0, i64 %116
  %118 = getelementptr inbounds %struct.ucvector* %117, i32 0, i32 0
  %119 = load i8** %118, align 8
  %120 = load i32* %y, align 4
  %121 = zext i32 %120 to i64
  %122 = load i64* %linebytes, align 8
  %123 = mul i64 %121, %122
  %124 = load i8** %3, align 8
  %125 = getelementptr inbounds i8* %124, i64 %123
  %126 = load i8** %prevline, align 8
  %127 = load i64* %linebytes, align 8
  %128 = load i64* %bytewidth, align 8
  %129 = load i32* %type, align 4
  %130 = trunc i32 %129 to i8
  call void @filterScanline(i8* %119, i8* %125, i8* %126, i64 %127, i64 %128, i8 zeroext %130)
  %131 = load i32* %type, align 4
  %132 = zext i32 %131 to i64
  %133 = getelementptr inbounds [5 x i64]* %sum, i32 0, i64 %132
  store i64 0, i64* %133, align 8
  %134 = load i32* %type, align 4
  %135 = icmp eq i32 %134, 0
  br i1 %135, label %136, label %162

; <label>:136                                     ; preds = %114
  store i32 0, i32* %x, align 4
  br label %137

; <label>:137                                     ; preds = %158, %136
  %138 = load i32* %x, align 4
  %139 = zext i32 %138 to i64
  %140 = load i64* %linebytes, align 8
  %141 = icmp ult i64 %139, %140
  br i1 %141, label %142, label %161

; <label>:142                                     ; preds = %137
  %143 = load i32* %x, align 4
  %144 = zext i32 %143 to i64
  %145 = load i32* %type, align 4
  %146 = zext i32 %145 to i64
  %147 = getelementptr inbounds [5 x %struct.ucvector]* %attempt, i32 0, i64 %146
  %148 = getelementptr inbounds %struct.ucvector* %147, i32 0, i32 0
  %149 = load i8** %148, align 8
  %150 = getelementptr inbounds i8* %149, i64 %144
  %151 = load i8* %150, align 1
  %152 = zext i8 %151 to i64
  %153 = load i32* %type, align 4
  %154 = zext i32 %153 to i64
  %155 = getelementptr inbounds [5 x i64]* %sum, i32 0, i64 %154
  %156 = load i64* %155, align 8
  %157 = add i64 %156, %152
  store i64 %157, i64* %155, align 8
  br label %158

; <label>:158                                     ; preds = %142
  %159 = load i32* %x, align 4
  %160 = add i32 %159, 1
  store i32 %160, i32* %x, align 4
  br label %137

; <label>:161                                     ; preds = %137
  br label %200

; <label>:162                                     ; preds = %114
  store i32 0, i32* %x, align 4
  br label %163

; <label>:163                                     ; preds = %196, %162
  %164 = load i32* %x, align 4
  %165 = zext i32 %164 to i64
  %166 = load i64* %linebytes, align 8
  %167 = icmp ult i64 %165, %166
  br i1 %167, label %168, label %199

; <label>:168                                     ; preds = %163
  %169 = load i32* %x, align 4
  %170 = zext i32 %169 to i64
  %171 = load i32* %type, align 4
  %172 = zext i32 %171 to i64
  %173 = getelementptr inbounds [5 x %struct.ucvector]* %attempt, i32 0, i64 %172
  %174 = getelementptr inbounds %struct.ucvector* %173, i32 0, i32 0
  %175 = load i8** %174, align 8
  %176 = getelementptr inbounds i8* %175, i64 %170
  %177 = load i8* %176, align 1
  store i8 %177, i8* %s, align 1
  %178 = load i8* %s, align 1
  %179 = sext i8 %178 to i32
  %180 = icmp slt i32 %179, 0
  br i1 %180, label %181, label %185

; <label>:181                                     ; preds = %168
  %182 = load i8* %s, align 1
  %183 = sext i8 %182 to i32
  %184 = sub nsw i32 0, %183
  br label %188

; <label>:185                                     ; preds = %168
  %186 = load i8* %s, align 1
  %187 = sext i8 %186 to i32
  br label %188

; <label>:188                                     ; preds = %185, %181
  %189 = phi i32 [ %184, %181 ], [ %187, %185 ]
  %190 = sext i32 %189 to i64
  %191 = load i32* %type, align 4
  %192 = zext i32 %191 to i64
  %193 = getelementptr inbounds [5 x i64]* %sum, i32 0, i64 %192
  %194 = load i64* %193, align 8
  %195 = add i64 %194, %190
  store i64 %195, i64* %193, align 8
  br label %196

; <label>:196                                     ; preds = %188
  %197 = load i32* %x, align 4
  %198 = add i32 %197, 1
  store i32 %198, i32* %x, align 4
  br label %163

; <label>:199                                     ; preds = %163
  br label %200

; <label>:200                                     ; preds = %199, %161
  %201 = load i32* %type, align 4
  %202 = icmp eq i32 %201, 0
  br i1 %202, label %210, label %203

; <label>:203                                     ; preds = %200
  %204 = load i32* %type, align 4
  %205 = zext i32 %204 to i64
  %206 = getelementptr inbounds [5 x i64]* %sum, i32 0, i64 %205
  %207 = load i64* %206, align 8
  %208 = load i64* %smallest, align 8
  %209 = icmp ult i64 %207, %208
  br i1 %209, label %210, label %216

; <label>:210                                     ; preds = %203, %200
  %211 = load i32* %type, align 4
  store i32 %211, i32* %bestType, align 4
  %212 = load i32* %type, align 4
  %213 = zext i32 %212 to i64
  %214 = getelementptr inbounds [5 x i64]* %sum, i32 0, i64 %213
  %215 = load i64* %214, align 8
  store i64 %215, i64* %smallest, align 8
  br label %216

; <label>:216                                     ; preds = %210, %203
  br label %217

; <label>:217                                     ; preds = %216
  %218 = load i32* %type, align 4
  %219 = add i32 %218, 1
  store i32 %219, i32* %type, align 4
  br label %111

; <label>:220                                     ; preds = %111
  %221 = load i32* %y, align 4
  %222 = zext i32 %221 to i64
  %223 = load i64* %linebytes, align 8
  %224 = mul i64 %222, %223
  %225 = load i8** %3, align 8
  %226 = getelementptr inbounds i8* %225, i64 %224
  store i8* %226, i8** %prevline, align 8
  %227 = load i32* %bestType, align 4
  %228 = trunc i32 %227 to i8
  %229 = load i32* %y, align 4
  %230 = zext i32 %229 to i64
  %231 = load i64* %linebytes, align 8
  %232 = add i64 %231, 1
  %233 = mul i64 %230, %232
  %234 = load i8** %2, align 8
  %235 = getelementptr inbounds i8* %234, i64 %233
  store i8 %228, i8* %235, align 1
  store i32 0, i32* %x, align 4
  br label %236

; <label>:236                                     ; preds = %262, %220
  %237 = load i32* %x, align 4
  %238 = zext i32 %237 to i64
  %239 = load i64* %linebytes, align 8
  %240 = icmp ult i64 %238, %239
  br i1 %240, label %241, label %265

; <label>:241                                     ; preds = %236
  %242 = load i32* %x, align 4
  %243 = zext i32 %242 to i64
  %244 = load i32* %bestType, align 4
  %245 = zext i32 %244 to i64
  %246 = getelementptr inbounds [5 x %struct.ucvector]* %attempt, i32 0, i64 %245
  %247 = getelementptr inbounds %struct.ucvector* %246, i32 0, i32 0
  %248 = load i8** %247, align 8
  %249 = getelementptr inbounds i8* %248, i64 %243
  %250 = load i8* %249, align 1
  %251 = load i32* %y, align 4
  %252 = zext i32 %251 to i64
  %253 = load i64* %linebytes, align 8
  %254 = add i64 %253, 1
  %255 = mul i64 %252, %254
  %256 = add i64 %255, 1
  %257 = load i32* %x, align 4
  %258 = zext i32 %257 to i64
  %259 = add i64 %256, %258
  %260 = load i8** %2, align 8
  %261 = getelementptr inbounds i8* %260, i64 %259
  store i8 %250, i8* %261, align 1
  br label %262

; <label>:262                                     ; preds = %241
  %263 = load i32* %x, align 4
  %264 = add i32 %263, 1
  store i32 %264, i32* %x, align 4
  br label %236

; <label>:265                                     ; preds = %236
  br label %266

; <label>:266                                     ; preds = %265
  %267 = load i32* %y, align 4
  %268 = add i32 %267, 1
  store i32 %268, i32* %y, align 4
  br label %106

; <label>:269                                     ; preds = %106
  br label %270

; <label>:270                                     ; preds = %269, %102
  store i32 0, i32* %type, align 4
  br label %271

; <label>:271                                     ; preds = %279, %270
  %272 = load i32* %type, align 4
  %273 = icmp ult i32 %272, 5
  br i1 %273, label %274, label %282

; <label>:274                                     ; preds = %271
  %275 = load i32* %type, align 4
  %276 = zext i32 %275 to i64
  %277 = getelementptr inbounds [5 x %struct.ucvector]* %attempt, i32 0, i64 %276
  %278 = bitcast %struct.ucvector* %277 to i8*
  call void @ucvector_cleanup(i8* %278)
  br label %279

; <label>:279                                     ; preds = %274
  %280 = load i32* %type, align 4
  %281 = add i32 %280, 1
  store i32 %281, i32* %type, align 4
  br label %271

; <label>:282                                     ; preds = %271
  br label %700

; <label>:283                                     ; preds = %80
  %284 = load i32* %strategy, align 4
  %285 = icmp eq i32 %284, 2
  br i1 %285, label %286, label %490

; <label>:286                                     ; preds = %283
  store float 0.000000e+00, float* %smallest3, align 4
  store i32 0, i32* %bestType5, align 4
  store i32 0, i32* %type4, align 4
  br label %287

; <label>:287                                     ; preds = %302, %286
  %288 = load i32* %type4, align 4
  %289 = icmp ult i32 %288, 5
  br i1 %289, label %290, label %305

; <label>:290                                     ; preds = %287
  %291 = load i32* %type4, align 4
  %292 = zext i32 %291 to i64
  %293 = getelementptr inbounds [5 x %struct.ucvector]* %attempt2, i32 0, i64 %292
  call void @ucvector_init(%struct.ucvector* %293)
  %294 = load i32* %type4, align 4
  %295 = zext i32 %294 to i64
  %296 = getelementptr inbounds [5 x %struct.ucvector]* %attempt2, i32 0, i64 %295
  %297 = load i64* %linebytes, align 8
  %298 = call i32 @ucvector_resize(%struct.ucvector* %296, i64 %297)
  %299 = icmp ne i32 %298, 0
  br i1 %299, label %301, label %300

; <label>:300                                     ; preds = %290
  store i32 83, i32* %1
  br label %703

; <label>:301                                     ; preds = %290
  br label %302

; <label>:302                                     ; preds = %301
  %303 = load i32* %type4, align 4
  %304 = add i32 %303, 1
  store i32 %304, i32* %type4, align 4
  br label %287

; <label>:305                                     ; preds = %287
  store i32 0, i32* %y, align 4
  br label %306

; <label>:306                                     ; preds = %474, %305
  %307 = load i32* %y, align 4
  %308 = load i32* %5, align 4
  %309 = icmp ult i32 %307, %308
  br i1 %309, label %310, label %477

; <label>:310                                     ; preds = %306
  store i32 0, i32* %type4, align 4
  br label %311

; <label>:311                                     ; preds = %425, %310
  %312 = load i32* %type4, align 4
  %313 = icmp ult i32 %312, 5
  br i1 %313, label %314, label %428

; <label>:314                                     ; preds = %311
  %315 = load i32* %type4, align 4
  %316 = zext i32 %315 to i64
  %317 = getelementptr inbounds [5 x %struct.ucvector]* %attempt2, i32 0, i64 %316
  %318 = getelementptr inbounds %struct.ucvector* %317, i32 0, i32 0
  %319 = load i8** %318, align 8
  %320 = load i32* %y, align 4
  %321 = zext i32 %320 to i64
  %322 = load i64* %linebytes, align 8
  %323 = mul i64 %321, %322
  %324 = load i8** %3, align 8
  %325 = getelementptr inbounds i8* %324, i64 %323
  %326 = load i8** %prevline, align 8
  %327 = load i64* %linebytes, align 8
  %328 = load i64* %bytewidth, align 8
  %329 = load i32* %type4, align 4
  %330 = trunc i32 %329 to i8
  call void @filterScanline(i8* %319, i8* %325, i8* %326, i64 %327, i64 %328, i8 zeroext %330)
  store i32 0, i32* %x, align 4
  br label %331

; <label>:331                                     ; preds = %338, %314
  %332 = load i32* %x, align 4
  %333 = icmp ult i32 %332, 256
  br i1 %333, label %334, label %341

; <label>:334                                     ; preds = %331
  %335 = load i32* %x, align 4
  %336 = zext i32 %335 to i64
  %337 = getelementptr inbounds [256 x i32]* %count, i32 0, i64 %336
  store i32 0, i32* %337, align 4
  br label %338

; <label>:338                                     ; preds = %334
  %339 = load i32* %x, align 4
  %340 = add i32 %339, 1
  store i32 %340, i32* %x, align 4
  br label %331

; <label>:341                                     ; preds = %331
  store i32 0, i32* %x, align 4
  br label %342

; <label>:342                                     ; preds = %361, %341
  %343 = load i32* %x, align 4
  %344 = zext i32 %343 to i64
  %345 = load i64* %linebytes, align 8
  %346 = icmp ult i64 %344, %345
  br i1 %346, label %347, label %364

; <label>:347                                     ; preds = %342
  %348 = load i32* %x, align 4
  %349 = zext i32 %348 to i64
  %350 = load i32* %type4, align 4
  %351 = zext i32 %350 to i64
  %352 = getelementptr inbounds [5 x %struct.ucvector]* %attempt2, i32 0, i64 %351
  %353 = getelementptr inbounds %struct.ucvector* %352, i32 0, i32 0
  %354 = load i8** %353, align 8
  %355 = getelementptr inbounds i8* %354, i64 %349
  %356 = load i8* %355, align 1
  %357 = zext i8 %356 to i64
  %358 = getelementptr inbounds [256 x i32]* %count, i32 0, i64 %357
  %359 = load i32* %358, align 4
  %360 = add i32 %359, 1
  store i32 %360, i32* %358, align 4
  br label %361

; <label>:361                                     ; preds = %347
  %362 = load i32* %x, align 4
  %363 = add i32 %362, 1
  store i32 %363, i32* %x, align 4
  br label %342

; <label>:364                                     ; preds = %342
  %365 = load i32* %type4, align 4
  %366 = zext i32 %365 to i64
  %367 = getelementptr inbounds [256 x i32]* %count, i32 0, i64 %366
  %368 = load i32* %367, align 4
  %369 = add i32 %368, 1
  store i32 %369, i32* %367, align 4
  %370 = load i32* %type4, align 4
  %371 = zext i32 %370 to i64
  %372 = getelementptr inbounds [5 x float]* %sum1, i32 0, i64 %371
  store float 0.000000e+00, float* %372, align 4
  store i32 0, i32* %x, align 4
  br label %373

; <label>:373                                     ; preds = %405, %364
  %374 = load i32* %x, align 4
  %375 = icmp ult i32 %374, 256
  br i1 %375, label %376, label %408

; <label>:376                                     ; preds = %373
  %377 = load i32* %x, align 4
  %378 = zext i32 %377 to i64
  %379 = getelementptr inbounds [256 x i32]* %count, i32 0, i64 %378
  %380 = load i32* %379, align 4
  %381 = uitofp i32 %380 to float
  %382 = load i64* %linebytes, align 8
  %383 = add i64 %382, 1
  %384 = uitofp i64 %383 to float
  %385 = fdiv float %381, %384
  store float %385, float* %p, align 4
  %386 = load i32* %x, align 4
  %387 = zext i32 %386 to i64
  %388 = getelementptr inbounds [256 x i32]* %count, i32 0, i64 %387
  %389 = load i32* %388, align 4
  %390 = icmp eq i32 %389, 0
  br i1 %390, label %391, label %392

; <label>:391                                     ; preds = %376
  br label %398

; <label>:392                                     ; preds = %376
  %393 = load float* %p, align 4
  %394 = fdiv float 1.000000e+00, %393
  %395 = call float @flog2(float %394)
  %396 = load float* %p, align 4
  %397 = fmul float %395, %396
  br label %398

; <label>:398                                     ; preds = %392, %391
  %399 = phi float [ 0.000000e+00, %391 ], [ %397, %392 ]
  %400 = load i32* %type4, align 4
  %401 = zext i32 %400 to i64
  %402 = getelementptr inbounds [5 x float]* %sum1, i32 0, i64 %401
  %403 = load float* %402, align 4
  %404 = fadd float %403, %399
  store float %404, float* %402, align 4
  br label %405

; <label>:405                                     ; preds = %398
  %406 = load i32* %x, align 4
  %407 = add i32 %406, 1
  store i32 %407, i32* %x, align 4
  br label %373

; <label>:408                                     ; preds = %373
  %409 = load i32* %type4, align 4
  %410 = icmp eq i32 %409, 0
  br i1 %410, label %418, label %411

; <label>:411                                     ; preds = %408
  %412 = load i32* %type4, align 4
  %413 = zext i32 %412 to i64
  %414 = getelementptr inbounds [5 x float]* %sum1, i32 0, i64 %413
  %415 = load float* %414, align 4
  %416 = load float* %smallest3, align 4
  %417 = fcmp olt float %415, %416
  br i1 %417, label %418, label %424

; <label>:418                                     ; preds = %411, %408
  %419 = load i32* %type4, align 4
  store i32 %419, i32* %bestType5, align 4
  %420 = load i32* %type4, align 4
  %421 = zext i32 %420 to i64
  %422 = getelementptr inbounds [5 x float]* %sum1, i32 0, i64 %421
  %423 = load float* %422, align 4
  store float %423, float* %smallest3, align 4
  br label %424

; <label>:424                                     ; preds = %418, %411
  br label %425

; <label>:425                                     ; preds = %424
  %426 = load i32* %type4, align 4
  %427 = add i32 %426, 1
  store i32 %427, i32* %type4, align 4
  br label %311

; <label>:428                                     ; preds = %311
  %429 = load i32* %y, align 4
  %430 = zext i32 %429 to i64
  %431 = load i64* %linebytes, align 8
  %432 = mul i64 %430, %431
  %433 = load i8** %3, align 8
  %434 = getelementptr inbounds i8* %433, i64 %432
  store i8* %434, i8** %prevline, align 8
  %435 = load i32* %bestType5, align 4
  %436 = trunc i32 %435 to i8
  %437 = load i32* %y, align 4
  %438 = zext i32 %437 to i64
  %439 = load i64* %linebytes, align 8
  %440 = add i64 %439, 1
  %441 = mul i64 %438, %440
  %442 = load i8** %2, align 8
  %443 = getelementptr inbounds i8* %442, i64 %441
  store i8 %436, i8* %443, align 1
  store i32 0, i32* %x, align 4
  br label %444

; <label>:444                                     ; preds = %470, %428
  %445 = load i32* %x, align 4
  %446 = zext i32 %445 to i64
  %447 = load i64* %linebytes, align 8
  %448 = icmp ult i64 %446, %447
  br i1 %448, label %449, label %473

; <label>:449                                     ; preds = %444
  %450 = load i32* %x, align 4
  %451 = zext i32 %450 to i64
  %452 = load i32* %bestType5, align 4
  %453 = zext i32 %452 to i64
  %454 = getelementptr inbounds [5 x %struct.ucvector]* %attempt2, i32 0, i64 %453
  %455 = getelementptr inbounds %struct.ucvector* %454, i32 0, i32 0
  %456 = load i8** %455, align 8
  %457 = getelementptr inbounds i8* %456, i64 %451
  %458 = load i8* %457, align 1
  %459 = load i32* %y, align 4
  %460 = zext i32 %459 to i64
  %461 = load i64* %linebytes, align 8
  %462 = add i64 %461, 1
  %463 = mul i64 %460, %462
  %464 = add i64 %463, 1
  %465 = load i32* %x, align 4
  %466 = zext i32 %465 to i64
  %467 = add i64 %464, %466
  %468 = load i8** %2, align 8
  %469 = getelementptr inbounds i8* %468, i64 %467
  store i8 %458, i8* %469, align 1
  br label %470

; <label>:470                                     ; preds = %449
  %471 = load i32* %x, align 4
  %472 = add i32 %471, 1
  store i32 %472, i32* %x, align 4
  br label %444

; <label>:473                                     ; preds = %444
  br label %474

; <label>:474                                     ; preds = %473
  %475 = load i32* %y, align 4
  %476 = add i32 %475, 1
  store i32 %476, i32* %y, align 4
  br label %306

; <label>:477                                     ; preds = %306
  store i32 0, i32* %type4, align 4
  br label %478

; <label>:478                                     ; preds = %486, %477
  %479 = load i32* %type4, align 4
  %480 = icmp ult i32 %479, 5
  br i1 %480, label %481, label %489

; <label>:481                                     ; preds = %478
  %482 = load i32* %type4, align 4
  %483 = zext i32 %482 to i64
  %484 = getelementptr inbounds [5 x %struct.ucvector]* %attempt2, i32 0, i64 %483
  %485 = bitcast %struct.ucvector* %484 to i8*
  call void @ucvector_cleanup(i8* %485)
  br label %486

; <label>:486                                     ; preds = %481
  %487 = load i32* %type4, align 4
  %488 = add i32 %487, 1
  store i32 %488, i32* %type4, align 4
  br label %478

; <label>:489                                     ; preds = %478
  br label %699

; <label>:490                                     ; preds = %283
  %491 = load i32* %strategy, align 4
  %492 = icmp eq i32 %491, 4
  br i1 %492, label %493, label %540

; <label>:493                                     ; preds = %490
  store i32 0, i32* %y, align 4
  br label %494

; <label>:494                                     ; preds = %536, %493
  %495 = load i32* %y, align 4
  %496 = load i32* %5, align 4
  %497 = icmp ult i32 %495, %496
  br i1 %497, label %498, label %539

; <label>:498                                     ; preds = %494
  %499 = load i64* %linebytes, align 8
  %500 = add i64 1, %499
  %501 = load i32* %y, align 4
  %502 = zext i32 %501 to i64
  %503 = mul i64 %500, %502
  store i64 %503, i64* %outindex6, align 8
  %504 = load i64* %linebytes, align 8
  %505 = load i32* %y, align 4
  %506 = zext i32 %505 to i64
  %507 = mul i64 %504, %506
  store i64 %507, i64* %inindex7, align 8
  %508 = load i32* %y, align 4
  %509 = zext i32 %508 to i64
  %510 = load %struct.LodePNGEncoderSettings** %7, align 8
  %511 = getelementptr inbounds %struct.LodePNGEncoderSettings* %510, i32 0, i32 4
  %512 = load i8** %511, align 8
  %513 = getelementptr inbounds i8* %512, i64 %509
  %514 = load i8* %513, align 1
  %515 = zext i8 %514 to i32
  store i32 %515, i32* %type8, align 4
  %516 = load i32* %type8, align 4
  %517 = trunc i32 %516 to i8
  %518 = load i64* %outindex6, align 8
  %519 = load i8** %2, align 8
  %520 = getelementptr inbounds i8* %519, i64 %518
  store i8 %517, i8* %520, align 1
  %521 = load i64* %outindex6, align 8
  %522 = add i64 %521, 1
  %523 = load i8** %2, align 8
  %524 = getelementptr inbounds i8* %523, i64 %522
  %525 = load i64* %inindex7, align 8
  %526 = load i8** %3, align 8
  %527 = getelementptr inbounds i8* %526, i64 %525
  %528 = load i8** %prevline, align 8
  %529 = load i64* %linebytes, align 8
  %530 = load i64* %bytewidth, align 8
  %531 = load i32* %type8, align 4
  %532 = trunc i32 %531 to i8
  call void @filterScanline(i8* %524, i8* %527, i8* %528, i64 %529, i64 %530, i8 zeroext %532)
  %533 = load i64* %inindex7, align 8
  %534 = load i8** %3, align 8
  %535 = getelementptr inbounds i8* %534, i64 %533
  store i8* %535, i8** %prevline, align 8
  br label %536

; <label>:536                                     ; preds = %498
  %537 = load i32* %y, align 4
  %538 = add i32 %537, 1
  store i32 %538, i32* %y, align 4
  br label %494

; <label>:539                                     ; preds = %494
  br label %698

; <label>:540                                     ; preds = %490
  %541 = load i32* %strategy, align 4
  %542 = icmp eq i32 %541, 3
  br i1 %542, label %543, label %696

; <label>:543                                     ; preds = %540
  store i64 0, i64* %smallest10, align 8
  store i32 0, i32* %type11, align 4
  store i32 0, i32* %bestType12, align 4
  %544 = load %struct.LodePNGEncoderSettings** %7, align 8
  %545 = getelementptr inbounds %struct.LodePNGEncoderSettings* %544, i32 0, i32 0
  %546 = bitcast %struct.LodePNGCompressSettings* %zlibsettings to i8*
  %547 = bitcast %struct.LodePNGCompressSettings* %545 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %546, i8* %547, i64 48, i32 8, i1 false)
  %548 = getelementptr inbounds %struct.LodePNGCompressSettings* %zlibsettings, i32 0, i32 0
  store i32 1, i32* %548, align 4
  %549 = getelementptr inbounds %struct.LodePNGCompressSettings* %zlibsettings, i32 0, i32 6
  %550 = bitcast {}** %549 to i32 (i8**, i64*, i8*, i64, %struct.LodePNGCompressSettings*)**
  store i32 (i8**, i64*, i8*, i64, %struct.LodePNGCompressSettings*)* null, i32 (i8**, i64*, i8*, i64, %struct.LodePNGCompressSettings*)** %550, align 8
  %551 = getelementptr inbounds %struct.LodePNGCompressSettings* %zlibsettings, i32 0, i32 7
  %552 = bitcast {}** %551 to i32 (i8**, i64*, i8*, i64, %struct.LodePNGCompressSettings*)**
  store i32 (i8**, i64*, i8*, i64, %struct.LodePNGCompressSettings*)* null, i32 (i8**, i64*, i8*, i64, %struct.LodePNGCompressSettings*)** %552, align 8
  store i32 0, i32* %type11, align 4
  br label %553

; <label>:553                                     ; preds = %565, %543
  %554 = load i32* %type11, align 4
  %555 = icmp ult i32 %554, 5
  br i1 %555, label %556, label %568

; <label>:556                                     ; preds = %553
  %557 = load i32* %type11, align 4
  %558 = zext i32 %557 to i64
  %559 = getelementptr inbounds [5 x %struct.ucvector]* %attempt9, i32 0, i64 %558
  call void @ucvector_init(%struct.ucvector* %559)
  %560 = load i32* %type11, align 4
  %561 = zext i32 %560 to i64
  %562 = getelementptr inbounds [5 x %struct.ucvector]* %attempt9, i32 0, i64 %561
  %563 = load i64* %linebytes, align 8
  %564 = call i32 @ucvector_resize(%struct.ucvector* %562, i64 %563)
  br label %565

; <label>:565                                     ; preds = %556
  %566 = load i32* %type11, align 4
  %567 = add i32 %566, 1
  store i32 %567, i32* %type11, align 4
  br label %553

; <label>:568                                     ; preds = %553
  store i32 0, i32* %y, align 4
  br label %569

; <label>:569                                     ; preds = %680, %568
  %570 = load i32* %y, align 4
  %571 = load i32* %5, align 4
  %572 = icmp ult i32 %570, %571
  br i1 %572, label %573, label %683

; <label>:573                                     ; preds = %569
  store i32 0, i32* %type11, align 4
  br label %574

; <label>:574                                     ; preds = %631, %573
  %575 = load i32* %type11, align 4
  %576 = icmp ult i32 %575, 5
  br i1 %576, label %577, label %634

; <label>:577                                     ; preds = %574
  %578 = load i32* %type11, align 4
  %579 = zext i32 %578 to i64
  %580 = getelementptr inbounds [5 x %struct.ucvector]* %attempt9, i32 0, i64 %579
  %581 = getelementptr inbounds %struct.ucvector* %580, i32 0, i32 1
  %582 = load i64* %581, align 8
  %583 = trunc i64 %582 to i32
  store i32 %583, i32* %testsize, align 4
  %584 = load i32* %type11, align 4
  %585 = zext i32 %584 to i64
  %586 = getelementptr inbounds [5 x %struct.ucvector]* %attempt9, i32 0, i64 %585
  %587 = getelementptr inbounds %struct.ucvector* %586, i32 0, i32 0
  %588 = load i8** %587, align 8
  %589 = load i32* %y, align 4
  %590 = zext i32 %589 to i64
  %591 = load i64* %linebytes, align 8
  %592 = mul i64 %590, %591
  %593 = load i8** %3, align 8
  %594 = getelementptr inbounds i8* %593, i64 %592
  %595 = load i8** %prevline, align 8
  %596 = load i64* %linebytes, align 8
  %597 = load i64* %bytewidth, align 8
  %598 = load i32* %type11, align 4
  %599 = trunc i32 %598 to i8
  call void @filterScanline(i8* %588, i8* %594, i8* %595, i64 %596, i64 %597, i8 zeroext %599)
  %600 = load i32* %type11, align 4
  %601 = zext i32 %600 to i64
  %602 = getelementptr inbounds [5 x i64]* %size, i32 0, i64 %601
  store i64 0, i64* %602, align 8
  store i8* null, i8** %dummy, align 8
  %603 = load i32* %type11, align 4
  %604 = zext i32 %603 to i64
  %605 = getelementptr inbounds [5 x i64]* %size, i32 0, i64 %604
  %606 = load i32* %type11, align 4
  %607 = zext i32 %606 to i64
  %608 = getelementptr inbounds [5 x %struct.ucvector]* %attempt9, i32 0, i64 %607
  %609 = getelementptr inbounds %struct.ucvector* %608, i32 0, i32 0
  %610 = load i8** %609, align 8
  %611 = load i32* %testsize, align 4
  %612 = zext i32 %611 to i64
  %613 = call i32 @zlib_compress(i8** %dummy, i64* %605, i8* %610, i64 %612, %struct.LodePNGCompressSettings* %zlibsettings)
  %614 = load i8** %dummy, align 8
  call void @lodepng_free(i8* %614)
  %615 = load i32* %type11, align 4
  %616 = icmp eq i32 %615, 0
  br i1 %616, label %624, label %617

; <label>:617                                     ; preds = %577
  %618 = load i32* %type11, align 4
  %619 = zext i32 %618 to i64
  %620 = getelementptr inbounds [5 x i64]* %size, i32 0, i64 %619
  %621 = load i64* %620, align 8
  %622 = load i64* %smallest10, align 8
  %623 = icmp ult i64 %621, %622
  br i1 %623, label %624, label %630

; <label>:624                                     ; preds = %617, %577
  %625 = load i32* %type11, align 4
  store i32 %625, i32* %bestType12, align 4
  %626 = load i32* %type11, align 4
  %627 = zext i32 %626 to i64
  %628 = getelementptr inbounds [5 x i64]* %size, i32 0, i64 %627
  %629 = load i64* %628, align 8
  store i64 %629, i64* %smallest10, align 8
  br label %630

; <label>:630                                     ; preds = %624, %617
  br label %631

; <label>:631                                     ; preds = %630
  %632 = load i32* %type11, align 4
  %633 = add i32 %632, 1
  store i32 %633, i32* %type11, align 4
  br label %574

; <label>:634                                     ; preds = %574
  %635 = load i32* %y, align 4
  %636 = zext i32 %635 to i64
  %637 = load i64* %linebytes, align 8
  %638 = mul i64 %636, %637
  %639 = load i8** %3, align 8
  %640 = getelementptr inbounds i8* %639, i64 %638
  store i8* %640, i8** %prevline, align 8
  %641 = load i32* %bestType12, align 4
  %642 = trunc i32 %641 to i8
  %643 = load i32* %y, align 4
  %644 = zext i32 %643 to i64
  %645 = load i64* %linebytes, align 8
  %646 = add i64 %645, 1
  %647 = mul i64 %644, %646
  %648 = load i8** %2, align 8
  %649 = getelementptr inbounds i8* %648, i64 %647
  store i8 %642, i8* %649, align 1
  store i32 0, i32* %x, align 4
  br label %650

; <label>:650                                     ; preds = %676, %634
  %651 = load i32* %x, align 4
  %652 = zext i32 %651 to i64
  %653 = load i64* %linebytes, align 8
  %654 = icmp ult i64 %652, %653
  br i1 %654, label %655, label %679

; <label>:655                                     ; preds = %650
  %656 = load i32* %x, align 4
  %657 = zext i32 %656 to i64
  %658 = load i32* %bestType12, align 4
  %659 = zext i32 %658 to i64
  %660 = getelementptr inbounds [5 x %struct.ucvector]* %attempt9, i32 0, i64 %659
  %661 = getelementptr inbounds %struct.ucvector* %660, i32 0, i32 0
  %662 = load i8** %661, align 8
  %663 = getelementptr inbounds i8* %662, i64 %657
  %664 = load i8* %663, align 1
  %665 = load i32* %y, align 4
  %666 = zext i32 %665 to i64
  %667 = load i64* %linebytes, align 8
  %668 = add i64 %667, 1
  %669 = mul i64 %666, %668
  %670 = add i64 %669, 1
  %671 = load i32* %x, align 4
  %672 = zext i32 %671 to i64
  %673 = add i64 %670, %672
  %674 = load i8** %2, align 8
  %675 = getelementptr inbounds i8* %674, i64 %673
  store i8 %664, i8* %675, align 1
  br label %676

; <label>:676                                     ; preds = %655
  %677 = load i32* %x, align 4
  %678 = add i32 %677, 1
  store i32 %678, i32* %x, align 4
  br label %650

; <label>:679                                     ; preds = %650
  br label %680

; <label>:680                                     ; preds = %679
  %681 = load i32* %y, align 4
  %682 = add i32 %681, 1
  store i32 %682, i32* %y, align 4
  br label %569

; <label>:683                                     ; preds = %569
  store i32 0, i32* %type11, align 4
  br label %684

; <label>:684                                     ; preds = %692, %683
  %685 = load i32* %type11, align 4
  %686 = icmp ult i32 %685, 5
  br i1 %686, label %687, label %695

; <label>:687                                     ; preds = %684
  %688 = load i32* %type11, align 4
  %689 = zext i32 %688 to i64
  %690 = getelementptr inbounds [5 x %struct.ucvector]* %attempt9, i32 0, i64 %689
  %691 = bitcast %struct.ucvector* %690 to i8*
  call void @ucvector_cleanup(i8* %691)
  br label %692

; <label>:692                                     ; preds = %687
  %693 = load i32* %type11, align 4
  %694 = add i32 %693, 1
  store i32 %694, i32* %type11, align 4
  br label %684

; <label>:695                                     ; preds = %684
  br label %697

; <label>:696                                     ; preds = %540
  store i32 88, i32* %1
  br label %703

; <label>:697                                     ; preds = %695
  br label %698

; <label>:698                                     ; preds = %697, %539
  br label %699

; <label>:699                                     ; preds = %698, %489
  br label %700

; <label>:700                                     ; preds = %699, %282
  br label %701

; <label>:701                                     ; preds = %700, %79
  %702 = load i32* %error, align 4
  store i32 %702, i32* %1
  br label %703

; <label>:703                                     ; preds = %701, %696, %300, %97, %41
  %704 = load i32* %1
  ret i32 %704
}

; Function Attrs: nounwind uwtable
define internal void @Adam7_getpassvalues(i32* %passw, i32* %passh, i64* %filter_passstart, i64* %padded_passstart, i64* %passstart, i32 %w, i32 %h, i32 %bpp) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca i32*, align 8
  %3 = alloca i64*, align 8
  %4 = alloca i64*, align 8
  %5 = alloca i64*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %i = alloca i32, align 4
  store i32* %passw, i32** %1, align 8
  store i32* %passh, i32** %2, align 8
  store i64* %filter_passstart, i64** %3, align 8
  store i64* %padded_passstart, i64** %4, align 8
  store i64* %passstart, i64** %5, align 8
  store i32 %w, i32* %6, align 4
  store i32 %h, i32* %7, align 4
  store i32 %bpp, i32* %8, align 4
  store i32 0, i32* %i, align 4
  br label %9

; <label>:9                                       ; preds = %79, %0
  %10 = load i32* %i, align 4
  %11 = icmp ult i32 %10, 7
  br i1 %11, label %12, label %82

; <label>:12                                      ; preds = %9
  %13 = load i32* %6, align 4
  %14 = load i32* %i, align 4
  %15 = zext i32 %14 to i64
  %16 = getelementptr inbounds [7 x i32]* @ADAM7_DX, i32 0, i64 %15
  %17 = load i32* %16, align 4
  %18 = add i32 %13, %17
  %19 = load i32* %i, align 4
  %20 = zext i32 %19 to i64
  %21 = getelementptr inbounds [7 x i32]* @ADAM7_IX, i32 0, i64 %20
  %22 = load i32* %21, align 4
  %23 = sub i32 %18, %22
  %24 = sub i32 %23, 1
  %25 = load i32* %i, align 4
  %26 = zext i32 %25 to i64
  %27 = getelementptr inbounds [7 x i32]* @ADAM7_DX, i32 0, i64 %26
  %28 = load i32* %27, align 4
  %29 = udiv i32 %24, %28
  %30 = load i32* %i, align 4
  %31 = zext i32 %30 to i64
  %32 = load i32** %1, align 8
  %33 = getelementptr inbounds i32* %32, i64 %31
  store i32 %29, i32* %33, align 4
  %34 = load i32* %7, align 4
  %35 = load i32* %i, align 4
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds [7 x i32]* @ADAM7_DY, i32 0, i64 %36
  %38 = load i32* %37, align 4
  %39 = add i32 %34, %38
  %40 = load i32* %i, align 4
  %41 = zext i32 %40 to i64
  %42 = getelementptr inbounds [7 x i32]* @ADAM7_IY, i32 0, i64 %41
  %43 = load i32* %42, align 4
  %44 = sub i32 %39, %43
  %45 = sub i32 %44, 1
  %46 = load i32* %i, align 4
  %47 = zext i32 %46 to i64
  %48 = getelementptr inbounds [7 x i32]* @ADAM7_DY, i32 0, i64 %47
  %49 = load i32* %48, align 4
  %50 = udiv i32 %45, %49
  %51 = load i32* %i, align 4
  %52 = zext i32 %51 to i64
  %53 = load i32** %2, align 8
  %54 = getelementptr inbounds i32* %53, i64 %52
  store i32 %50, i32* %54, align 4
  %55 = load i32* %i, align 4
  %56 = zext i32 %55 to i64
  %57 = load i32** %1, align 8
  %58 = getelementptr inbounds i32* %57, i64 %56
  %59 = load i32* %58, align 4
  %60 = icmp eq i32 %59, 0
  br i1 %60, label %61, label %66

; <label>:61                                      ; preds = %12
  %62 = load i32* %i, align 4
  %63 = zext i32 %62 to i64
  %64 = load i32** %2, align 8
  %65 = getelementptr inbounds i32* %64, i64 %63
  store i32 0, i32* %65, align 4
  br label %66

; <label>:66                                      ; preds = %61, %12
  %67 = load i32* %i, align 4
  %68 = zext i32 %67 to i64
  %69 = load i32** %2, align 8
  %70 = getelementptr inbounds i32* %69, i64 %68
  %71 = load i32* %70, align 4
  %72 = icmp eq i32 %71, 0
  br i1 %72, label %73, label %78

; <label>:73                                      ; preds = %66
  %74 = load i32* %i, align 4
  %75 = zext i32 %74 to i64
  %76 = load i32** %1, align 8
  %77 = getelementptr inbounds i32* %76, i64 %75
  store i32 0, i32* %77, align 4
  br label %78

; <label>:78                                      ; preds = %73, %66
  br label %79

; <label>:79                                      ; preds = %78
  %80 = load i32* %i, align 4
  %81 = add i32 %80, 1
  store i32 %81, i32* %i, align 4
  br label %9

; <label>:82                                      ; preds = %9
  %83 = load i64** %5, align 8
  %84 = getelementptr inbounds i64* %83, i64 0
  store i64 0, i64* %84, align 8
  %85 = load i64** %4, align 8
  %86 = getelementptr inbounds i64* %85, i64 0
  store i64 0, i64* %86, align 8
  %87 = load i64** %3, align 8
  %88 = getelementptr inbounds i64* %87, i64 0
  store i64 0, i64* %88, align 8
  store i32 0, i32* %i, align 4
  br label %89

; <label>:89                                      ; preds = %192, %82
  %90 = load i32* %i, align 4
  %91 = icmp ult i32 %90, 7
  br i1 %91, label %92, label %195

; <label>:92                                      ; preds = %89
  %93 = load i32* %i, align 4
  %94 = zext i32 %93 to i64
  %95 = load i64** %3, align 8
  %96 = getelementptr inbounds i64* %95, i64 %94
  %97 = load i64* %96, align 8
  %98 = load i32* %i, align 4
  %99 = zext i32 %98 to i64
  %100 = load i32** %1, align 8
  %101 = getelementptr inbounds i32* %100, i64 %99
  %102 = load i32* %101, align 4
  %103 = icmp ne i32 %102, 0
  br i1 %103, label %104, label %128

; <label>:104                                     ; preds = %92
  %105 = load i32* %i, align 4
  %106 = zext i32 %105 to i64
  %107 = load i32** %2, align 8
  %108 = getelementptr inbounds i32* %107, i64 %106
  %109 = load i32* %108, align 4
  %110 = icmp ne i32 %109, 0
  br i1 %110, label %111, label %128

; <label>:111                                     ; preds = %104
  %112 = load i32* %i, align 4
  %113 = zext i32 %112 to i64
  %114 = load i32** %2, align 8
  %115 = getelementptr inbounds i32* %114, i64 %113
  %116 = load i32* %115, align 4
  %117 = load i32* %i, align 4
  %118 = zext i32 %117 to i64
  %119 = load i32** %1, align 8
  %120 = getelementptr inbounds i32* %119, i64 %118
  %121 = load i32* %120, align 4
  %122 = load i32* %8, align 4
  %123 = mul i32 %121, %122
  %124 = add i32 %123, 7
  %125 = udiv i32 %124, 8
  %126 = add i32 1, %125
  %127 = mul i32 %116, %126
  br label %129

; <label>:128                                     ; preds = %104, %92
  br label %129

; <label>:129                                     ; preds = %128, %111
  %130 = phi i32 [ %127, %111 ], [ 0, %128 ]
  %131 = zext i32 %130 to i64
  %132 = add i64 %97, %131
  %133 = load i32* %i, align 4
  %134 = add i32 %133, 1
  %135 = zext i32 %134 to i64
  %136 = load i64** %3, align 8
  %137 = getelementptr inbounds i64* %136, i64 %135
  store i64 %132, i64* %137, align 8
  %138 = load i32* %i, align 4
  %139 = zext i32 %138 to i64
  %140 = load i64** %4, align 8
  %141 = getelementptr inbounds i64* %140, i64 %139
  %142 = load i64* %141, align 8
  %143 = load i32* %i, align 4
  %144 = zext i32 %143 to i64
  %145 = load i32** %2, align 8
  %146 = getelementptr inbounds i32* %145, i64 %144
  %147 = load i32* %146, align 4
  %148 = load i32* %i, align 4
  %149 = zext i32 %148 to i64
  %150 = load i32** %1, align 8
  %151 = getelementptr inbounds i32* %150, i64 %149
  %152 = load i32* %151, align 4
  %153 = load i32* %8, align 4
  %154 = mul i32 %152, %153
  %155 = add i32 %154, 7
  %156 = udiv i32 %155, 8
  %157 = mul i32 %147, %156
  %158 = zext i32 %157 to i64
  %159 = add i64 %142, %158
  %160 = load i32* %i, align 4
  %161 = add i32 %160, 1
  %162 = zext i32 %161 to i64
  %163 = load i64** %4, align 8
  %164 = getelementptr inbounds i64* %163, i64 %162
  store i64 %159, i64* %164, align 8
  %165 = load i32* %i, align 4
  %166 = zext i32 %165 to i64
  %167 = load i64** %5, align 8
  %168 = getelementptr inbounds i64* %167, i64 %166
  %169 = load i64* %168, align 8
  %170 = load i32* %i, align 4
  %171 = zext i32 %170 to i64
  %172 = load i32** %2, align 8
  %173 = getelementptr inbounds i32* %172, i64 %171
  %174 = load i32* %173, align 4
  %175 = load i32* %i, align 4
  %176 = zext i32 %175 to i64
  %177 = load i32** %1, align 8
  %178 = getelementptr inbounds i32* %177, i64 %176
  %179 = load i32* %178, align 4
  %180 = mul i32 %174, %179
  %181 = load i32* %8, align 4
  %182 = mul i32 %180, %181
  %183 = add i32 %182, 7
  %184 = udiv i32 %183, 8
  %185 = zext i32 %184 to i64
  %186 = add i64 %169, %185
  %187 = load i32* %i, align 4
  %188 = add i32 %187, 1
  %189 = zext i32 %188 to i64
  %190 = load i64** %5, align 8
  %191 = getelementptr inbounds i64* %190, i64 %189
  store i64 %186, i64* %191, align 8
  br label %192

; <label>:192                                     ; preds = %129
  %193 = load i32* %i, align 4
  %194 = add i32 %193, 1
  store i32 %194, i32* %i, align 4
  br label %89

; <label>:195                                     ; preds = %89
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @Adam7_interlace(i8* %out, i8* %in, i32 %w, i32 %h, i32 %bpp) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %passw = alloca [7 x i32], align 16
  %passh = alloca [7 x i32], align 16
  %filter_passstart = alloca [8 x i64], align 16
  %padded_passstart = alloca [8 x i64], align 16
  %passstart = alloca [8 x i64], align 16
  %i = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %b = alloca i32, align 4
  %bytewidth = alloca i64, align 8
  %pixelinstart = alloca i64, align 8
  %pixeloutstart = alloca i64, align 8
  %x1 = alloca i32, align 4
  %y2 = alloca i32, align 4
  %b3 = alloca i32, align 4
  %ilinebits = alloca i32, align 4
  %olinebits = alloca i32, align 4
  %obp = alloca i64, align 8
  %ibp = alloca i64, align 8
  %bit = alloca i8, align 1
  store i8* %out, i8** %1, align 8
  store i8* %in, i8** %2, align 8
  store i32 %w, i32* %3, align 4
  store i32 %h, i32* %4, align 4
  store i32 %bpp, i32* %5, align 4
  %6 = getelementptr inbounds [7 x i32]* %passw, i32 0, i32 0
  %7 = getelementptr inbounds [7 x i32]* %passh, i32 0, i32 0
  %8 = getelementptr inbounds [8 x i64]* %filter_passstart, i32 0, i32 0
  %9 = getelementptr inbounds [8 x i64]* %padded_passstart, i32 0, i32 0
  %10 = getelementptr inbounds [8 x i64]* %passstart, i32 0, i32 0
  %11 = load i32* %3, align 4
  %12 = load i32* %4, align 4
  %13 = load i32* %5, align 4
  call void @Adam7_getpassvalues(i32* %6, i32* %7, i64* %8, i64* %9, i64* %10, i32 %11, i32 %12, i32 %13)
  %14 = load i32* %5, align 4
  %15 = icmp uge i32 %14, 8
  br i1 %15, label %16, label %119

; <label>:16                                      ; preds = %0
  store i32 0, i32* %i, align 4
  br label %17

; <label>:17                                      ; preds = %115, %16
  %18 = load i32* %i, align 4
  %19 = icmp ult i32 %18, 7
  br i1 %19, label %20, label %118

; <label>:20                                      ; preds = %17
  %21 = load i32* %5, align 4
  %22 = udiv i32 %21, 8
  %23 = zext i32 %22 to i64
  store i64 %23, i64* %bytewidth, align 8
  store i32 0, i32* %y, align 4
  br label %24

; <label>:24                                      ; preds = %111, %20
  %25 = load i32* %y, align 4
  %26 = load i32* %i, align 4
  %27 = zext i32 %26 to i64
  %28 = getelementptr inbounds [7 x i32]* %passh, i32 0, i64 %27
  %29 = load i32* %28, align 4
  %30 = icmp ult i32 %25, %29
  br i1 %30, label %31, label %114

; <label>:31                                      ; preds = %24
  store i32 0, i32* %x, align 4
  br label %32

; <label>:32                                      ; preds = %107, %31
  %33 = load i32* %x, align 4
  %34 = load i32* %i, align 4
  %35 = zext i32 %34 to i64
  %36 = getelementptr inbounds [7 x i32]* %passw, i32 0, i64 %35
  %37 = load i32* %36, align 4
  %38 = icmp ult i32 %33, %37
  br i1 %38, label %39, label %110

; <label>:39                                      ; preds = %32
  %40 = load i32* %i, align 4
  %41 = zext i32 %40 to i64
  %42 = getelementptr inbounds [7 x i32]* @ADAM7_IY, i32 0, i64 %41
  %43 = load i32* %42, align 4
  %44 = load i32* %y, align 4
  %45 = load i32* %i, align 4
  %46 = zext i32 %45 to i64
  %47 = getelementptr inbounds [7 x i32]* @ADAM7_DY, i32 0, i64 %46
  %48 = load i32* %47, align 4
  %49 = mul i32 %44, %48
  %50 = add i32 %43, %49
  %51 = load i32* %3, align 4
  %52 = mul i32 %50, %51
  %53 = load i32* %i, align 4
  %54 = zext i32 %53 to i64
  %55 = getelementptr inbounds [7 x i32]* @ADAM7_IX, i32 0, i64 %54
  %56 = load i32* %55, align 4
  %57 = add i32 %52, %56
  %58 = load i32* %x, align 4
  %59 = load i32* %i, align 4
  %60 = zext i32 %59 to i64
  %61 = getelementptr inbounds [7 x i32]* @ADAM7_DX, i32 0, i64 %60
  %62 = load i32* %61, align 4
  %63 = mul i32 %58, %62
  %64 = add i32 %57, %63
  %65 = zext i32 %64 to i64
  %66 = load i64* %bytewidth, align 8
  %67 = mul i64 %65, %66
  store i64 %67, i64* %pixelinstart, align 8
  %68 = load i32* %i, align 4
  %69 = zext i32 %68 to i64
  %70 = getelementptr inbounds [8 x i64]* %passstart, i32 0, i64 %69
  %71 = load i64* %70, align 8
  %72 = load i32* %y, align 4
  %73 = load i32* %i, align 4
  %74 = zext i32 %73 to i64
  %75 = getelementptr inbounds [7 x i32]* %passw, i32 0, i64 %74
  %76 = load i32* %75, align 4
  %77 = mul i32 %72, %76
  %78 = load i32* %x, align 4
  %79 = add i32 %77, %78
  %80 = zext i32 %79 to i64
  %81 = load i64* %bytewidth, align 8
  %82 = mul i64 %80, %81
  %83 = add i64 %71, %82
  store i64 %83, i64* %pixeloutstart, align 8
  store i32 0, i32* %b, align 4
  br label %84

; <label>:84                                      ; preds = %103, %39
  %85 = load i32* %b, align 4
  %86 = zext i32 %85 to i64
  %87 = load i64* %bytewidth, align 8
  %88 = icmp ult i64 %86, %87
  br i1 %88, label %89, label %106

; <label>:89                                      ; preds = %84
  %90 = load i64* %pixelinstart, align 8
  %91 = load i32* %b, align 4
  %92 = zext i32 %91 to i64
  %93 = add i64 %90, %92
  %94 = load i8** %2, align 8
  %95 = getelementptr inbounds i8* %94, i64 %93
  %96 = load i8* %95, align 1
  %97 = load i64* %pixeloutstart, align 8
  %98 = load i32* %b, align 4
  %99 = zext i32 %98 to i64
  %100 = add i64 %97, %99
  %101 = load i8** %1, align 8
  %102 = getelementptr inbounds i8* %101, i64 %100
  store i8 %96, i8* %102, align 1
  br label %103

; <label>:103                                     ; preds = %89
  %104 = load i32* %b, align 4
  %105 = add i32 %104, 1
  store i32 %105, i32* %b, align 4
  br label %84

; <label>:106                                     ; preds = %84
  br label %107

; <label>:107                                     ; preds = %106
  %108 = load i32* %x, align 4
  %109 = add i32 %108, 1
  store i32 %109, i32* %x, align 4
  br label %32

; <label>:110                                     ; preds = %32
  br label %111

; <label>:111                                     ; preds = %110
  %112 = load i32* %y, align 4
  %113 = add i32 %112, 1
  store i32 %113, i32* %y, align 4
  br label %24

; <label>:114                                     ; preds = %24
  br label %115

; <label>:115                                     ; preds = %114
  %116 = load i32* %i, align 4
  %117 = add i32 %116, 1
  store i32 %117, i32* %i, align 4
  br label %17

; <label>:118                                     ; preds = %17
  br label %216

; <label>:119                                     ; preds = %0
  store i32 0, i32* %i, align 4
  br label %120

; <label>:120                                     ; preds = %212, %119
  %121 = load i32* %i, align 4
  %122 = icmp ult i32 %121, 7
  br i1 %122, label %123, label %215

; <label>:123                                     ; preds = %120
  %124 = load i32* %5, align 4
  %125 = load i32* %i, align 4
  %126 = zext i32 %125 to i64
  %127 = getelementptr inbounds [7 x i32]* %passw, i32 0, i64 %126
  %128 = load i32* %127, align 4
  %129 = mul i32 %124, %128
  store i32 %129, i32* %ilinebits, align 4
  %130 = load i32* %5, align 4
  %131 = load i32* %3, align 4
  %132 = mul i32 %130, %131
  store i32 %132, i32* %olinebits, align 4
  store i32 0, i32* %y2, align 4
  br label %133

; <label>:133                                     ; preds = %208, %123
  %134 = load i32* %y2, align 4
  %135 = load i32* %i, align 4
  %136 = zext i32 %135 to i64
  %137 = getelementptr inbounds [7 x i32]* %passh, i32 0, i64 %136
  %138 = load i32* %137, align 4
  %139 = icmp ult i32 %134, %138
  br i1 %139, label %140, label %211

; <label>:140                                     ; preds = %133
  store i32 0, i32* %x1, align 4
  br label %141

; <label>:141                                     ; preds = %204, %140
  %142 = load i32* %x1, align 4
  %143 = load i32* %i, align 4
  %144 = zext i32 %143 to i64
  %145 = getelementptr inbounds [7 x i32]* %passw, i32 0, i64 %144
  %146 = load i32* %145, align 4
  %147 = icmp ult i32 %142, %146
  br i1 %147, label %148, label %207

; <label>:148                                     ; preds = %141
  %149 = load i32* %i, align 4
  %150 = zext i32 %149 to i64
  %151 = getelementptr inbounds [7 x i32]* @ADAM7_IY, i32 0, i64 %150
  %152 = load i32* %151, align 4
  %153 = load i32* %y2, align 4
  %154 = load i32* %i, align 4
  %155 = zext i32 %154 to i64
  %156 = getelementptr inbounds [7 x i32]* @ADAM7_DY, i32 0, i64 %155
  %157 = load i32* %156, align 4
  %158 = mul i32 %153, %157
  %159 = add i32 %152, %158
  %160 = load i32* %olinebits, align 4
  %161 = mul i32 %159, %160
  %162 = load i32* %i, align 4
  %163 = zext i32 %162 to i64
  %164 = getelementptr inbounds [7 x i32]* @ADAM7_IX, i32 0, i64 %163
  %165 = load i32* %164, align 4
  %166 = load i32* %x1, align 4
  %167 = load i32* %i, align 4
  %168 = zext i32 %167 to i64
  %169 = getelementptr inbounds [7 x i32]* @ADAM7_DX, i32 0, i64 %168
  %170 = load i32* %169, align 4
  %171 = mul i32 %166, %170
  %172 = add i32 %165, %171
  %173 = load i32* %5, align 4
  %174 = mul i32 %172, %173
  %175 = add i32 %161, %174
  %176 = zext i32 %175 to i64
  store i64 %176, i64* %ibp, align 8
  %177 = load i32* %i, align 4
  %178 = zext i32 %177 to i64
  %179 = getelementptr inbounds [8 x i64]* %passstart, i32 0, i64 %178
  %180 = load i64* %179, align 8
  %181 = mul i64 8, %180
  %182 = load i32* %y2, align 4
  %183 = load i32* %ilinebits, align 4
  %184 = mul i32 %182, %183
  %185 = load i32* %x1, align 4
  %186 = load i32* %5, align 4
  %187 = mul i32 %185, %186
  %188 = add i32 %184, %187
  %189 = zext i32 %188 to i64
  %190 = add i64 %181, %189
  store i64 %190, i64* %obp, align 8
  store i32 0, i32* %b3, align 4
  br label %191

; <label>:191                                     ; preds = %200, %148
  %192 = load i32* %b3, align 4
  %193 = load i32* %5, align 4
  %194 = icmp ult i32 %192, %193
  br i1 %194, label %195, label %203

; <label>:195                                     ; preds = %191
  %196 = load i8** %2, align 8
  %197 = call zeroext i8 @readBitFromReversedStream(i64* %ibp, i8* %196)
  store i8 %197, i8* %bit, align 1
  %198 = load i8** %1, align 8
  %199 = load i8* %bit, align 1
  call void @setBitOfReversedStream(i64* %obp, i8* %198, i8 zeroext %199)
  br label %200

; <label>:200                                     ; preds = %195
  %201 = load i32* %b3, align 4
  %202 = add i32 %201, 1
  store i32 %202, i32* %b3, align 4
  br label %191

; <label>:203                                     ; preds = %191
  br label %204

; <label>:204                                     ; preds = %203
  %205 = load i32* %x1, align 4
  %206 = add i32 %205, 1
  store i32 %206, i32* %x1, align 4
  br label %141

; <label>:207                                     ; preds = %141
  br label %208

; <label>:208                                     ; preds = %207
  %209 = load i32* %y2, align 4
  %210 = add i32 %209, 1
  store i32 %210, i32* %y2, align 4
  br label %133

; <label>:211                                     ; preds = %133
  br label %212

; <label>:212                                     ; preds = %211
  %213 = load i32* %i, align 4
  %214 = add i32 %213, 1
  store i32 %214, i32* %i, align 4
  br label %120

; <label>:215                                     ; preds = %120
  br label %216

; <label>:216                                     ; preds = %215, %118
  ret void
}

; Function Attrs: nounwind uwtable
define internal zeroext i8 @readBitFromReversedStream(i64* %bitpointer, i8* %bitstream) #0 {
  %1 = alloca i64*, align 8
  %2 = alloca i8*, align 8
  %result = alloca i8, align 1
  store i64* %bitpointer, i64** %1, align 8
  store i8* %bitstream, i8** %2, align 8
  %3 = load i64** %1, align 8
  %4 = load i64* %3, align 8
  %5 = lshr i64 %4, 3
  %6 = load i8** %2, align 8
  %7 = getelementptr inbounds i8* %6, i64 %5
  %8 = load i8* %7, align 1
  %9 = zext i8 %8 to i32
  %10 = load i64** %1, align 8
  %11 = load i64* %10, align 8
  %12 = and i64 %11, 7
  %13 = sub i64 7, %12
  %14 = trunc i64 %13 to i32
  %15 = ashr i32 %9, %14
  %16 = and i32 %15, 1
  %17 = trunc i32 %16 to i8
  store i8 %17, i8* %result, align 1
  %18 = load i64** %1, align 8
  %19 = load i64* %18, align 8
  %20 = add i64 %19, 1
  store i64 %20, i64* %18, align 8
  %21 = load i8* %result, align 1
  ret i8 %21
}

; Function Attrs: nounwind uwtable
define internal void @setBitOfReversedStream(i64* %bitpointer, i8* %bitstream, i8 zeroext %bit) #0 {
  %1 = alloca i64*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i8, align 1
  store i64* %bitpointer, i64** %1, align 8
  store i8* %bitstream, i8** %2, align 8
  store i8 %bit, i8* %3, align 1
  %4 = load i8* %3, align 1
  %5 = zext i8 %4 to i32
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %26

; <label>:7                                       ; preds = %0
  %8 = load i64** %1, align 8
  %9 = load i64* %8, align 8
  %10 = and i64 %9, 7
  %11 = sub i64 7, %10
  %12 = trunc i64 %11 to i32
  %13 = shl i32 1, %12
  %14 = xor i32 %13, -1
  %15 = trunc i32 %14 to i8
  %16 = zext i8 %15 to i32
  %17 = load i64** %1, align 8
  %18 = load i64* %17, align 8
  %19 = lshr i64 %18, 3
  %20 = load i8** %2, align 8
  %21 = getelementptr inbounds i8* %20, i64 %19
  %22 = load i8* %21, align 1
  %23 = zext i8 %22 to i32
  %24 = and i32 %23, %16
  %25 = trunc i32 %24 to i8
  store i8 %25, i8* %21, align 1
  br label %42

; <label>:26                                      ; preds = %0
  %27 = load i64** %1, align 8
  %28 = load i64* %27, align 8
  %29 = and i64 %28, 7
  %30 = sub i64 7, %29
  %31 = trunc i64 %30 to i32
  %32 = shl i32 1, %31
  %33 = load i64** %1, align 8
  %34 = load i64* %33, align 8
  %35 = lshr i64 %34, 3
  %36 = load i8** %2, align 8
  %37 = getelementptr inbounds i8* %36, i64 %35
  %38 = load i8* %37, align 1
  %39 = zext i8 %38 to i32
  %40 = or i32 %39, %32
  %41 = trunc i32 %40 to i8
  store i8 %41, i8* %37, align 1
  br label %42

; <label>:42                                      ; preds = %26, %7
  %43 = load i64** %1, align 8
  %44 = load i64* %43, align 8
  %45 = add i64 %44, 1
  store i64 %45, i64* %43, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @filterScanline(i8* %out, i8* %scanline, i8* %prevline, i64 %length, i64 %bytewidth, i8 zeroext %filterType) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i8, align 1
  %i = alloca i64, align 8
  store i8* %out, i8** %1, align 8
  store i8* %scanline, i8** %2, align 8
  store i8* %prevline, i8** %3, align 8
  store i64 %length, i64* %4, align 8
  store i64 %bytewidth, i64* %5, align 8
  store i8 %filterType, i8* %6, align 1
  %7 = load i8* %6, align 1
  %8 = zext i8 %7 to i32
  switch i32 %8, label %387 [
    i32 0, label %9
    i32 1, label %26
    i32 2, label %118
    i32 3, label %164
    i32 4, label %273
  ]

; <label>:9                                       ; preds = %0
  store i64 0, i64* %i, align 8
  br label %10

; <label>:10                                      ; preds = %22, %9
  %11 = load i64* %i, align 8
  %12 = load i64* %4, align 8
  %13 = icmp ult i64 %11, %12
  br i1 %13, label %14, label %25

; <label>:14                                      ; preds = %10
  %15 = load i64* %i, align 8
  %16 = load i8** %2, align 8
  %17 = getelementptr inbounds i8* %16, i64 %15
  %18 = load i8* %17, align 1
  %19 = load i64* %i, align 8
  %20 = load i8** %1, align 8
  %21 = getelementptr inbounds i8* %20, i64 %19
  store i8 %18, i8* %21, align 1
  br label %22

; <label>:22                                      ; preds = %14
  %23 = load i64* %i, align 8
  %24 = add i64 %23, 1
  store i64 %24, i64* %i, align 8
  br label %10

; <label>:25                                      ; preds = %10
  br label %388

; <label>:26                                      ; preds = %0
  %27 = load i8** %3, align 8
  %28 = icmp ne i8* %27, null
  br i1 %28, label %29, label %73

; <label>:29                                      ; preds = %26
  store i64 0, i64* %i, align 8
  br label %30

; <label>:30                                      ; preds = %42, %29
  %31 = load i64* %i, align 8
  %32 = load i64* %5, align 8
  %33 = icmp ult i64 %31, %32
  br i1 %33, label %34, label %45

; <label>:34                                      ; preds = %30
  %35 = load i64* %i, align 8
  %36 = load i8** %2, align 8
  %37 = getelementptr inbounds i8* %36, i64 %35
  %38 = load i8* %37, align 1
  %39 = load i64* %i, align 8
  %40 = load i8** %1, align 8
  %41 = getelementptr inbounds i8* %40, i64 %39
  store i8 %38, i8* %41, align 1
  br label %42

; <label>:42                                      ; preds = %34
  %43 = load i64* %i, align 8
  %44 = add i64 %43, 1
  store i64 %44, i64* %i, align 8
  br label %30

; <label>:45                                      ; preds = %30
  %46 = load i64* %5, align 8
  store i64 %46, i64* %i, align 8
  br label %47

; <label>:47                                      ; preds = %69, %45
  %48 = load i64* %i, align 8
  %49 = load i64* %4, align 8
  %50 = icmp ult i64 %48, %49
  br i1 %50, label %51, label %72

; <label>:51                                      ; preds = %47
  %52 = load i64* %i, align 8
  %53 = load i8** %2, align 8
  %54 = getelementptr inbounds i8* %53, i64 %52
  %55 = load i8* %54, align 1
  %56 = zext i8 %55 to i32
  %57 = load i64* %i, align 8
  %58 = load i64* %5, align 8
  %59 = sub i64 %57, %58
  %60 = load i8** %2, align 8
  %61 = getelementptr inbounds i8* %60, i64 %59
  %62 = load i8* %61, align 1
  %63 = zext i8 %62 to i32
  %64 = sub nsw i32 %56, %63
  %65 = trunc i32 %64 to i8
  %66 = load i64* %i, align 8
  %67 = load i8** %1, align 8
  %68 = getelementptr inbounds i8* %67, i64 %66
  store i8 %65, i8* %68, align 1
  br label %69

; <label>:69                                      ; preds = %51
  %70 = load i64* %i, align 8
  %71 = add i64 %70, 1
  store i64 %71, i64* %i, align 8
  br label %47

; <label>:72                                      ; preds = %47
  br label %117

; <label>:73                                      ; preds = %26
  store i64 0, i64* %i, align 8
  br label %74

; <label>:74                                      ; preds = %86, %73
  %75 = load i64* %i, align 8
  %76 = load i64* %5, align 8
  %77 = icmp ult i64 %75, %76
  br i1 %77, label %78, label %89

; <label>:78                                      ; preds = %74
  %79 = load i64* %i, align 8
  %80 = load i8** %2, align 8
  %81 = getelementptr inbounds i8* %80, i64 %79
  %82 = load i8* %81, align 1
  %83 = load i64* %i, align 8
  %84 = load i8** %1, align 8
  %85 = getelementptr inbounds i8* %84, i64 %83
  store i8 %82, i8* %85, align 1
  br label %86

; <label>:86                                      ; preds = %78
  %87 = load i64* %i, align 8
  %88 = add i64 %87, 1
  store i64 %88, i64* %i, align 8
  br label %74

; <label>:89                                      ; preds = %74
  %90 = load i64* %5, align 8
  store i64 %90, i64* %i, align 8
  br label %91

; <label>:91                                      ; preds = %113, %89
  %92 = load i64* %i, align 8
  %93 = load i64* %4, align 8
  %94 = icmp ult i64 %92, %93
  br i1 %94, label %95, label %116

; <label>:95                                      ; preds = %91
  %96 = load i64* %i, align 8
  %97 = load i8** %2, align 8
  %98 = getelementptr inbounds i8* %97, i64 %96
  %99 = load i8* %98, align 1
  %100 = zext i8 %99 to i32
  %101 = load i64* %i, align 8
  %102 = load i64* %5, align 8
  %103 = sub i64 %101, %102
  %104 = load i8** %2, align 8
  %105 = getelementptr inbounds i8* %104, i64 %103
  %106 = load i8* %105, align 1
  %107 = zext i8 %106 to i32
  %108 = sub nsw i32 %100, %107
  %109 = trunc i32 %108 to i8
  %110 = load i64* %i, align 8
  %111 = load i8** %1, align 8
  %112 = getelementptr inbounds i8* %111, i64 %110
  store i8 %109, i8* %112, align 1
  br label %113

; <label>:113                                     ; preds = %95
  %114 = load i64* %i, align 8
  %115 = add i64 %114, 1
  store i64 %115, i64* %i, align 8
  br label %91

; <label>:116                                     ; preds = %91
  br label %117

; <label>:117                                     ; preds = %116, %72
  br label %388

; <label>:118                                     ; preds = %0
  %119 = load i8** %3, align 8
  %120 = icmp ne i8* %119, null
  br i1 %120, label %121, label %146

; <label>:121                                     ; preds = %118
  store i64 0, i64* %i, align 8
  br label %122

; <label>:122                                     ; preds = %142, %121
  %123 = load i64* %i, align 8
  %124 = load i64* %4, align 8
  %125 = icmp ult i64 %123, %124
  br i1 %125, label %126, label %145

; <label>:126                                     ; preds = %122
  %127 = load i64* %i, align 8
  %128 = load i8** %2, align 8
  %129 = getelementptr inbounds i8* %128, i64 %127
  %130 = load i8* %129, align 1
  %131 = zext i8 %130 to i32
  %132 = load i64* %i, align 8
  %133 = load i8** %3, align 8
  %134 = getelementptr inbounds i8* %133, i64 %132
  %135 = load i8* %134, align 1
  %136 = zext i8 %135 to i32
  %137 = sub nsw i32 %131, %136
  %138 = trunc i32 %137 to i8
  %139 = load i64* %i, align 8
  %140 = load i8** %1, align 8
  %141 = getelementptr inbounds i8* %140, i64 %139
  store i8 %138, i8* %141, align 1
  br label %142

; <label>:142                                     ; preds = %126
  %143 = load i64* %i, align 8
  %144 = add i64 %143, 1
  store i64 %144, i64* %i, align 8
  br label %122

; <label>:145                                     ; preds = %122
  br label %163

; <label>:146                                     ; preds = %118
  store i64 0, i64* %i, align 8
  br label %147

; <label>:147                                     ; preds = %159, %146
  %148 = load i64* %i, align 8
  %149 = load i64* %4, align 8
  %150 = icmp ult i64 %148, %149
  br i1 %150, label %151, label %162

; <label>:151                                     ; preds = %147
  %152 = load i64* %i, align 8
  %153 = load i8** %2, align 8
  %154 = getelementptr inbounds i8* %153, i64 %152
  %155 = load i8* %154, align 1
  %156 = load i64* %i, align 8
  %157 = load i8** %1, align 8
  %158 = getelementptr inbounds i8* %157, i64 %156
  store i8 %155, i8* %158, align 1
  br label %159

; <label>:159                                     ; preds = %151
  %160 = load i64* %i, align 8
  %161 = add i64 %160, 1
  store i64 %161, i64* %i, align 8
  br label %147

; <label>:162                                     ; preds = %147
  br label %163

; <label>:163                                     ; preds = %162, %145
  br label %388

; <label>:164                                     ; preds = %0
  %165 = load i8** %3, align 8
  %166 = icmp ne i8* %165, null
  br i1 %166, label %167, label %227

; <label>:167                                     ; preds = %164
  store i64 0, i64* %i, align 8
  br label %168

; <label>:168                                     ; preds = %189, %167
  %169 = load i64* %i, align 8
  %170 = load i64* %5, align 8
  %171 = icmp ult i64 %169, %170
  br i1 %171, label %172, label %192

; <label>:172                                     ; preds = %168
  %173 = load i64* %i, align 8
  %174 = load i8** %2, align 8
  %175 = getelementptr inbounds i8* %174, i64 %173
  %176 = load i8* %175, align 1
  %177 = zext i8 %176 to i32
  %178 = load i64* %i, align 8
  %179 = load i8** %3, align 8
  %180 = getelementptr inbounds i8* %179, i64 %178
  %181 = load i8* %180, align 1
  %182 = zext i8 %181 to i32
  %183 = sdiv i32 %182, 2
  %184 = sub nsw i32 %177, %183
  %185 = trunc i32 %184 to i8
  %186 = load i64* %i, align 8
  %187 = load i8** %1, align 8
  %188 = getelementptr inbounds i8* %187, i64 %186
  store i8 %185, i8* %188, align 1
  br label %189

; <label>:189                                     ; preds = %172
  %190 = load i64* %i, align 8
  %191 = add i64 %190, 1
  store i64 %191, i64* %i, align 8
  br label %168

; <label>:192                                     ; preds = %168
  %193 = load i64* %5, align 8
  store i64 %193, i64* %i, align 8
  br label %194

; <label>:194                                     ; preds = %223, %192
  %195 = load i64* %i, align 8
  %196 = load i64* %4, align 8
  %197 = icmp ult i64 %195, %196
  br i1 %197, label %198, label %226

; <label>:198                                     ; preds = %194
  %199 = load i64* %i, align 8
  %200 = load i8** %2, align 8
  %201 = getelementptr inbounds i8* %200, i64 %199
  %202 = load i8* %201, align 1
  %203 = zext i8 %202 to i32
  %204 = load i64* %i, align 8
  %205 = load i64* %5, align 8
  %206 = sub i64 %204, %205
  %207 = load i8** %2, align 8
  %208 = getelementptr inbounds i8* %207, i64 %206
  %209 = load i8* %208, align 1
  %210 = zext i8 %209 to i32
  %211 = load i64* %i, align 8
  %212 = load i8** %3, align 8
  %213 = getelementptr inbounds i8* %212, i64 %211
  %214 = load i8* %213, align 1
  %215 = zext i8 %214 to i32
  %216 = add nsw i32 %210, %215
  %217 = sdiv i32 %216, 2
  %218 = sub nsw i32 %203, %217
  %219 = trunc i32 %218 to i8
  %220 = load i64* %i, align 8
  %221 = load i8** %1, align 8
  %222 = getelementptr inbounds i8* %221, i64 %220
  store i8 %219, i8* %222, align 1
  br label %223

; <label>:223                                     ; preds = %198
  %224 = load i64* %i, align 8
  %225 = add i64 %224, 1
  store i64 %225, i64* %i, align 8
  br label %194

; <label>:226                                     ; preds = %194
  br label %272

; <label>:227                                     ; preds = %164
  store i64 0, i64* %i, align 8
  br label %228

; <label>:228                                     ; preds = %240, %227
  %229 = load i64* %i, align 8
  %230 = load i64* %5, align 8
  %231 = icmp ult i64 %229, %230
  br i1 %231, label %232, label %243

; <label>:232                                     ; preds = %228
  %233 = load i64* %i, align 8
  %234 = load i8** %2, align 8
  %235 = getelementptr inbounds i8* %234, i64 %233
  %236 = load i8* %235, align 1
  %237 = load i64* %i, align 8
  %238 = load i8** %1, align 8
  %239 = getelementptr inbounds i8* %238, i64 %237
  store i8 %236, i8* %239, align 1
  br label %240

; <label>:240                                     ; preds = %232
  %241 = load i64* %i, align 8
  %242 = add i64 %241, 1
  store i64 %242, i64* %i, align 8
  br label %228

; <label>:243                                     ; preds = %228
  %244 = load i64* %5, align 8
  store i64 %244, i64* %i, align 8
  br label %245

; <label>:245                                     ; preds = %268, %243
  %246 = load i64* %i, align 8
  %247 = load i64* %4, align 8
  %248 = icmp ult i64 %246, %247
  br i1 %248, label %249, label %271

; <label>:249                                     ; preds = %245
  %250 = load i64* %i, align 8
  %251 = load i8** %2, align 8
  %252 = getelementptr inbounds i8* %251, i64 %250
  %253 = load i8* %252, align 1
  %254 = zext i8 %253 to i32
  %255 = load i64* %i, align 8
  %256 = load i64* %5, align 8
  %257 = sub i64 %255, %256
  %258 = load i8** %2, align 8
  %259 = getelementptr inbounds i8* %258, i64 %257
  %260 = load i8* %259, align 1
  %261 = zext i8 %260 to i32
  %262 = sdiv i32 %261, 2
  %263 = sub nsw i32 %254, %262
  %264 = trunc i32 %263 to i8
  %265 = load i64* %i, align 8
  %266 = load i8** %1, align 8
  %267 = getelementptr inbounds i8* %266, i64 %265
  store i8 %264, i8* %267, align 1
  br label %268

; <label>:268                                     ; preds = %249
  %269 = load i64* %i, align 8
  %270 = add i64 %269, 1
  store i64 %270, i64* %i, align 8
  br label %245

; <label>:271                                     ; preds = %245
  br label %272

; <label>:272                                     ; preds = %271, %226
  br label %388

; <label>:273                                     ; preds = %0
  %274 = load i8** %3, align 8
  %275 = icmp ne i8* %274, null
  br i1 %275, label %276, label %342

; <label>:276                                     ; preds = %273
  store i64 0, i64* %i, align 8
  br label %277

; <label>:277                                     ; preds = %297, %276
  %278 = load i64* %i, align 8
  %279 = load i64* %5, align 8
  %280 = icmp ult i64 %278, %279
  br i1 %280, label %281, label %300

; <label>:281                                     ; preds = %277
  %282 = load i64* %i, align 8
  %283 = load i8** %2, align 8
  %284 = getelementptr inbounds i8* %283, i64 %282
  %285 = load i8* %284, align 1
  %286 = zext i8 %285 to i32
  %287 = load i64* %i, align 8
  %288 = load i8** %3, align 8
  %289 = getelementptr inbounds i8* %288, i64 %287
  %290 = load i8* %289, align 1
  %291 = zext i8 %290 to i32
  %292 = sub nsw i32 %286, %291
  %293 = trunc i32 %292 to i8
  %294 = load i64* %i, align 8
  %295 = load i8** %1, align 8
  %296 = getelementptr inbounds i8* %295, i64 %294
  store i8 %293, i8* %296, align 1
  br label %297

; <label>:297                                     ; preds = %281
  %298 = load i64* %i, align 8
  %299 = add i64 %298, 1
  store i64 %299, i64* %i, align 8
  br label %277

; <label>:300                                     ; preds = %277
  %301 = load i64* %5, align 8
  store i64 %301, i64* %i, align 8
  br label %302

; <label>:302                                     ; preds = %338, %300
  %303 = load i64* %i, align 8
  %304 = load i64* %4, align 8
  %305 = icmp ult i64 %303, %304
  br i1 %305, label %306, label %341

; <label>:306                                     ; preds = %302
  %307 = load i64* %i, align 8
  %308 = load i8** %2, align 8
  %309 = getelementptr inbounds i8* %308, i64 %307
  %310 = load i8* %309, align 1
  %311 = zext i8 %310 to i32
  %312 = load i64* %i, align 8
  %313 = load i64* %5, align 8
  %314 = sub i64 %312, %313
  %315 = load i8** %2, align 8
  %316 = getelementptr inbounds i8* %315, i64 %314
  %317 = load i8* %316, align 1
  %318 = zext i8 %317 to i16
  %319 = load i64* %i, align 8
  %320 = load i8** %3, align 8
  %321 = getelementptr inbounds i8* %320, i64 %319
  %322 = load i8* %321, align 1
  %323 = zext i8 %322 to i16
  %324 = load i64* %i, align 8
  %325 = load i64* %5, align 8
  %326 = sub i64 %324, %325
  %327 = load i8** %3, align 8
  %328 = getelementptr inbounds i8* %327, i64 %326
  %329 = load i8* %328, align 1
  %330 = zext i8 %329 to i16
  %331 = call zeroext i8 @paethPredictor(i16 signext %318, i16 signext %323, i16 signext %330)
  %332 = zext i8 %331 to i32
  %333 = sub nsw i32 %311, %332
  %334 = trunc i32 %333 to i8
  %335 = load i64* %i, align 8
  %336 = load i8** %1, align 8
  %337 = getelementptr inbounds i8* %336, i64 %335
  store i8 %334, i8* %337, align 1
  br label %338

; <label>:338                                     ; preds = %306
  %339 = load i64* %i, align 8
  %340 = add i64 %339, 1
  store i64 %340, i64* %i, align 8
  br label %302

; <label>:341                                     ; preds = %302
  br label %386

; <label>:342                                     ; preds = %273
  store i64 0, i64* %i, align 8
  br label %343

; <label>:343                                     ; preds = %355, %342
  %344 = load i64* %i, align 8
  %345 = load i64* %5, align 8
  %346 = icmp ult i64 %344, %345
  br i1 %346, label %347, label %358

; <label>:347                                     ; preds = %343
  %348 = load i64* %i, align 8
  %349 = load i8** %2, align 8
  %350 = getelementptr inbounds i8* %349, i64 %348
  %351 = load i8* %350, align 1
  %352 = load i64* %i, align 8
  %353 = load i8** %1, align 8
  %354 = getelementptr inbounds i8* %353, i64 %352
  store i8 %351, i8* %354, align 1
  br label %355

; <label>:355                                     ; preds = %347
  %356 = load i64* %i, align 8
  %357 = add i64 %356, 1
  store i64 %357, i64* %i, align 8
  br label %343

; <label>:358                                     ; preds = %343
  %359 = load i64* %5, align 8
  store i64 %359, i64* %i, align 8
  br label %360

; <label>:360                                     ; preds = %382, %358
  %361 = load i64* %i, align 8
  %362 = load i64* %4, align 8
  %363 = icmp ult i64 %361, %362
  br i1 %363, label %364, label %385

; <label>:364                                     ; preds = %360
  %365 = load i64* %i, align 8
  %366 = load i8** %2, align 8
  %367 = getelementptr inbounds i8* %366, i64 %365
  %368 = load i8* %367, align 1
  %369 = zext i8 %368 to i32
  %370 = load i64* %i, align 8
  %371 = load i64* %5, align 8
  %372 = sub i64 %370, %371
  %373 = load i8** %2, align 8
  %374 = getelementptr inbounds i8* %373, i64 %372
  %375 = load i8* %374, align 1
  %376 = zext i8 %375 to i32
  %377 = sub nsw i32 %369, %376
  %378 = trunc i32 %377 to i8
  %379 = load i64* %i, align 8
  %380 = load i8** %1, align 8
  %381 = getelementptr inbounds i8* %380, i64 %379
  store i8 %378, i8* %381, align 1
  br label %382

; <label>:382                                     ; preds = %364
  %383 = load i64* %i, align 8
  %384 = add i64 %383, 1
  store i64 %384, i64* %i, align 8
  br label %360

; <label>:385                                     ; preds = %360
  br label %386

; <label>:386                                     ; preds = %385, %341
  br label %388

; <label>:387                                     ; preds = %0
  br label %388

; <label>:388                                     ; preds = %387, %386, %272, %163, %117, %25
  ret void
}

; Function Attrs: nounwind uwtable
define internal i32 @ucvector_resize(%struct.ucvector* %p, i64 %size) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.ucvector*, align 8
  %3 = alloca i64, align 8
  %newsize = alloca i64, align 8
  %data = alloca i8*, align 8
  store %struct.ucvector* %p, %struct.ucvector** %2, align 8
  store i64 %size, i64* %3, align 8
  %4 = load i64* %3, align 8
  %5 = mul i64 %4, 1
  %6 = load %struct.ucvector** %2, align 8
  %7 = getelementptr inbounds %struct.ucvector* %6, i32 0, i32 2
  %8 = load i64* %7, align 8
  %9 = icmp ugt i64 %5, %8
  br i1 %9, label %10, label %33

; <label>:10                                      ; preds = %0
  %11 = load i64* %3, align 8
  %12 = mul i64 %11, 1
  %13 = mul i64 %12, 2
  store i64 %13, i64* %newsize, align 8
  %14 = load %struct.ucvector** %2, align 8
  %15 = getelementptr inbounds %struct.ucvector* %14, i32 0, i32 0
  %16 = load i8** %15, align 8
  %17 = load i64* %newsize, align 8
  %18 = call i8* @lodepng_realloc(i8* %16, i64 %17)
  store i8* %18, i8** %data, align 8
  %19 = load i8** %data, align 8
  %20 = icmp ne i8* %19, null
  br i1 %20, label %21, label %31

; <label>:21                                      ; preds = %10
  %22 = load i64* %newsize, align 8
  %23 = load %struct.ucvector** %2, align 8
  %24 = getelementptr inbounds %struct.ucvector* %23, i32 0, i32 2
  store i64 %22, i64* %24, align 8
  %25 = load i8** %data, align 8
  %26 = load %struct.ucvector** %2, align 8
  %27 = getelementptr inbounds %struct.ucvector* %26, i32 0, i32 0
  store i8* %25, i8** %27, align 8
  %28 = load i64* %3, align 8
  %29 = load %struct.ucvector** %2, align 8
  %30 = getelementptr inbounds %struct.ucvector* %29, i32 0, i32 1
  store i64 %28, i64* %30, align 8
  br label %32

; <label>:31                                      ; preds = %10
  store i32 0, i32* %1
  br label %38

; <label>:32                                      ; preds = %21
  br label %37

; <label>:33                                      ; preds = %0
  %34 = load i64* %3, align 8
  %35 = load %struct.ucvector** %2, align 8
  %36 = getelementptr inbounds %struct.ucvector* %35, i32 0, i32 1
  store i64 %34, i64* %36, align 8
  br label %37

; <label>:37                                      ; preds = %33, %32
  store i32 1, i32* %1
  br label %38

; <label>:38                                      ; preds = %37, %31
  %39 = load i32* %1
  ret i32 %39
}

; Function Attrs: nounwind uwtable
define internal float @flog2(float %f) #0 {
  %1 = alloca float, align 4
  %result = alloca float, align 4
  store float %f, float* %1, align 4
  store float 0.000000e+00, float* %result, align 4
  br label %2

; <label>:2                                       ; preds = %5, %0
  %3 = load float* %1, align 4
  %4 = fcmp ogt float %3, 3.200000e+01
  br i1 %4, label %5, label %10

; <label>:5                                       ; preds = %2
  %6 = load float* %result, align 4
  %7 = fadd float %6, 4.000000e+00
  store float %7, float* %result, align 4
  %8 = load float* %1, align 4
  %9 = fdiv float %8, 1.600000e+01
  store float %9, float* %1, align 4
  br label %2

; <label>:10                                      ; preds = %2
  br label %11

; <label>:11                                      ; preds = %14, %10
  %12 = load float* %1, align 4
  %13 = fcmp ogt float %12, 2.000000e+00
  br i1 %13, label %14, label %19

; <label>:14                                      ; preds = %11
  %15 = load float* %result, align 4
  %16 = fadd float %15, 1.000000e+00
  store float %16, float* %result, align 4
  %17 = load float* %1, align 4
  %18 = fdiv float %17, 2.000000e+00
  store float %18, float* %1, align 4
  br label %11

; <label>:19                                      ; preds = %11
  %20 = load float* %result, align 4
  %21 = load float* %1, align 4
  %22 = load float* %1, align 4
  %23 = fmul float %21, %22
  %24 = load float* %1, align 4
  %25 = fmul float %23, %24
  %26 = fdiv float %25, 3.000000e+00
  %27 = load float* %1, align 4
  %28 = fmul float 3.000000e+00, %27
  %29 = load float* %1, align 4
  %30 = fmul float %28, %29
  %31 = fdiv float %30, 2.000000e+00
  %32 = fsub float %26, %31
  %33 = load float* %1, align 4
  %34 = fmul float 3.000000e+00, %33
  %35 = fadd float %32, %34
  %36 = fsub float %35, 0x3FFD5551E0000000
  %37 = fmul float 0x3FF7154760000000, %36
  %38 = fadd float %20, %37
  ret float %38
}

; Function Attrs: nounwind uwtable
define internal zeroext i8 @paethPredictor(i16 signext %a, i16 signext %b, i16 signext %c) #0 {
  %1 = alloca i8, align 1
  %2 = alloca i16, align 2
  %3 = alloca i16, align 2
  %4 = alloca i16, align 2
  %pa = alloca i16, align 2
  %pb = alloca i16, align 2
  %pc = alloca i16, align 2
  store i16 %a, i16* %2, align 2
  store i16 %b, i16* %3, align 2
  store i16 %c, i16* %4, align 2
  %5 = load i16* %3, align 2
  %6 = sext i16 %5 to i32
  %7 = load i16* %4, align 2
  %8 = sext i16 %7 to i32
  %9 = sub nsw i32 %6, %8
  %10 = call i32 @abs(i32 %9) #7
  %11 = trunc i32 %10 to i16
  store i16 %11, i16* %pa, align 2
  %12 = load i16* %2, align 2
  %13 = sext i16 %12 to i32
  %14 = load i16* %4, align 2
  %15 = sext i16 %14 to i32
  %16 = sub nsw i32 %13, %15
  %17 = call i32 @abs(i32 %16) #7
  %18 = trunc i32 %17 to i16
  store i16 %18, i16* %pb, align 2
  %19 = load i16* %2, align 2
  %20 = sext i16 %19 to i32
  %21 = load i16* %3, align 2
  %22 = sext i16 %21 to i32
  %23 = add nsw i32 %20, %22
  %24 = load i16* %4, align 2
  %25 = sext i16 %24 to i32
  %26 = sub nsw i32 %23, %25
  %27 = load i16* %4, align 2
  %28 = sext i16 %27 to i32
  %29 = sub nsw i32 %26, %28
  %30 = call i32 @abs(i32 %29) #7
  %31 = trunc i32 %30 to i16
  store i16 %31, i16* %pc, align 2
  %32 = load i16* %pc, align 2
  %33 = sext i16 %32 to i32
  %34 = load i16* %pa, align 2
  %35 = sext i16 %34 to i32
  %36 = icmp slt i32 %33, %35
  br i1 %36, label %37, label %46

; <label>:37                                      ; preds = %0
  %38 = load i16* %pc, align 2
  %39 = sext i16 %38 to i32
  %40 = load i16* %pb, align 2
  %41 = sext i16 %40 to i32
  %42 = icmp slt i32 %39, %41
  br i1 %42, label %43, label %46

; <label>:43                                      ; preds = %37
  %44 = load i16* %4, align 2
  %45 = trunc i16 %44 to i8
  store i8 %45, i8* %1
  br label %58

; <label>:46                                      ; preds = %37, %0
  %47 = load i16* %pb, align 2
  %48 = sext i16 %47 to i32
  %49 = load i16* %pa, align 2
  %50 = sext i16 %49 to i32
  %51 = icmp slt i32 %48, %50
  br i1 %51, label %52, label %55

; <label>:52                                      ; preds = %46
  %53 = load i16* %3, align 2
  %54 = trunc i16 %53 to i8
  store i8 %54, i8* %1
  br label %58

; <label>:55                                      ; preds = %46
  %56 = load i16* %2, align 2
  %57 = trunc i16 %56 to i8
  store i8 %57, i8* %1
  br label %58

; <label>:58                                      ; preds = %55, %52, %43
  %59 = load i8* %1
  ret i8 %59
}

; Function Attrs: nounwind readnone
declare i32 @abs(i32) #4

; Function Attrs: nounwind uwtable
define internal i32 @readChunk_PLTE(%struct.LodePNGColorMode* %color, i8* %data, i64 %chunkLength) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.LodePNGColorMode*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i64, align 8
  %pos = alloca i32, align 4
  %i = alloca i32, align 4
  store %struct.LodePNGColorMode* %color, %struct.LodePNGColorMode** %2, align 8
  store i8* %data, i8** %3, align 8
  store i64 %chunkLength, i64* %4, align 8
  store i32 0, i32* %pos, align 4
  %5 = load %struct.LodePNGColorMode** %2, align 8
  %6 = getelementptr inbounds %struct.LodePNGColorMode* %5, i32 0, i32 2
  %7 = load i8** %6, align 8
  %8 = icmp ne i8* %7, null
  br i1 %8, label %9, label %13

; <label>:9                                       ; preds = %0
  %10 = load %struct.LodePNGColorMode** %2, align 8
  %11 = getelementptr inbounds %struct.LodePNGColorMode* %10, i32 0, i32 2
  %12 = load i8** %11, align 8
  call void @lodepng_free(i8* %12)
  br label %13

; <label>:13                                      ; preds = %9, %0
  %14 = load i64* %4, align 8
  %15 = udiv i64 %14, 3
  %16 = load %struct.LodePNGColorMode** %2, align 8
  %17 = getelementptr inbounds %struct.LodePNGColorMode* %16, i32 0, i32 3
  store i64 %15, i64* %17, align 8
  %18 = load %struct.LodePNGColorMode** %2, align 8
  %19 = getelementptr inbounds %struct.LodePNGColorMode* %18, i32 0, i32 3
  %20 = load i64* %19, align 8
  %21 = mul i64 4, %20
  %22 = call i8* @lodepng_malloc(i64 %21)
  %23 = load %struct.LodePNGColorMode** %2, align 8
  %24 = getelementptr inbounds %struct.LodePNGColorMode* %23, i32 0, i32 2
  store i8* %22, i8** %24, align 8
  %25 = load %struct.LodePNGColorMode** %2, align 8
  %26 = getelementptr inbounds %struct.LodePNGColorMode* %25, i32 0, i32 2
  %27 = load i8** %26, align 8
  %28 = icmp ne i8* %27, null
  br i1 %28, label %37, label %29

; <label>:29                                      ; preds = %13
  %30 = load %struct.LodePNGColorMode** %2, align 8
  %31 = getelementptr inbounds %struct.LodePNGColorMode* %30, i32 0, i32 3
  %32 = load i64* %31, align 8
  %33 = icmp ne i64 %32, 0
  br i1 %33, label %34, label %37

; <label>:34                                      ; preds = %29
  %35 = load %struct.LodePNGColorMode** %2, align 8
  %36 = getelementptr inbounds %struct.LodePNGColorMode* %35, i32 0, i32 3
  store i64 0, i64* %36, align 8
  store i32 83, i32* %1
  br label %106

; <label>:37                                      ; preds = %29, %13
  %38 = load %struct.LodePNGColorMode** %2, align 8
  %39 = getelementptr inbounds %struct.LodePNGColorMode* %38, i32 0, i32 3
  %40 = load i64* %39, align 8
  %41 = icmp ugt i64 %40, 256
  br i1 %41, label %42, label %43

; <label>:42                                      ; preds = %37
  store i32 38, i32* %1
  br label %106

; <label>:43                                      ; preds = %37
  store i32 0, i32* %i, align 4
  br label %44

; <label>:44                                      ; preds = %102, %43
  %45 = load i32* %i, align 4
  %46 = zext i32 %45 to i64
  %47 = load %struct.LodePNGColorMode** %2, align 8
  %48 = getelementptr inbounds %struct.LodePNGColorMode* %47, i32 0, i32 3
  %49 = load i64* %48, align 8
  %50 = icmp ult i64 %46, %49
  br i1 %50, label %51, label %105

; <label>:51                                      ; preds = %44
  %52 = load i32* %pos, align 4
  %53 = add i32 %52, 1
  store i32 %53, i32* %pos, align 4
  %54 = zext i32 %52 to i64
  %55 = load i8** %3, align 8
  %56 = getelementptr inbounds i8* %55, i64 %54
  %57 = load i8* %56, align 1
  %58 = load i32* %i, align 4
  %59 = mul i32 4, %58
  %60 = add i32 %59, 0
  %61 = zext i32 %60 to i64
  %62 = load %struct.LodePNGColorMode** %2, align 8
  %63 = getelementptr inbounds %struct.LodePNGColorMode* %62, i32 0, i32 2
  %64 = load i8** %63, align 8
  %65 = getelementptr inbounds i8* %64, i64 %61
  store i8 %57, i8* %65, align 1
  %66 = load i32* %pos, align 4
  %67 = add i32 %66, 1
  store i32 %67, i32* %pos, align 4
  %68 = zext i32 %66 to i64
  %69 = load i8** %3, align 8
  %70 = getelementptr inbounds i8* %69, i64 %68
  %71 = load i8* %70, align 1
  %72 = load i32* %i, align 4
  %73 = mul i32 4, %72
  %74 = add i32 %73, 1
  %75 = zext i32 %74 to i64
  %76 = load %struct.LodePNGColorMode** %2, align 8
  %77 = getelementptr inbounds %struct.LodePNGColorMode* %76, i32 0, i32 2
  %78 = load i8** %77, align 8
  %79 = getelementptr inbounds i8* %78, i64 %75
  store i8 %71, i8* %79, align 1
  %80 = load i32* %pos, align 4
  %81 = add i32 %80, 1
  store i32 %81, i32* %pos, align 4
  %82 = zext i32 %80 to i64
  %83 = load i8** %3, align 8
  %84 = getelementptr inbounds i8* %83, i64 %82
  %85 = load i8* %84, align 1
  %86 = load i32* %i, align 4
  %87 = mul i32 4, %86
  %88 = add i32 %87, 2
  %89 = zext i32 %88 to i64
  %90 = load %struct.LodePNGColorMode** %2, align 8
  %91 = getelementptr inbounds %struct.LodePNGColorMode* %90, i32 0, i32 2
  %92 = load i8** %91, align 8
  %93 = getelementptr inbounds i8* %92, i64 %89
  store i8 %85, i8* %93, align 1
  %94 = load i32* %i, align 4
  %95 = mul i32 4, %94
  %96 = add i32 %95, 3
  %97 = zext i32 %96 to i64
  %98 = load %struct.LodePNGColorMode** %2, align 8
  %99 = getelementptr inbounds %struct.LodePNGColorMode* %98, i32 0, i32 2
  %100 = load i8** %99, align 8
  %101 = getelementptr inbounds i8* %100, i64 %97
  store i8 -1, i8* %101, align 1
  br label %102

; <label>:102                                     ; preds = %51
  %103 = load i32* %i, align 4
  %104 = add i32 %103, 1
  store i32 %104, i32* %i, align 4
  br label %44

; <label>:105                                     ; preds = %44
  store i32 0, i32* %1
  br label %106

; <label>:106                                     ; preds = %105, %42, %34
  %107 = load i32* %1
  ret i32 %107
}

; Function Attrs: nounwind uwtable
define internal i32 @readChunk_tRNS(%struct.LodePNGColorMode* %color, i8* %data, i64 %chunkLength) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.LodePNGColorMode*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i64, align 8
  %i = alloca i32, align 4
  store %struct.LodePNGColorMode* %color, %struct.LodePNGColorMode** %2, align 8
  store i8* %data, i8** %3, align 8
  store i64 %chunkLength, i64* %4, align 8
  %5 = load %struct.LodePNGColorMode** %2, align 8
  %6 = getelementptr inbounds %struct.LodePNGColorMode* %5, i32 0, i32 0
  %7 = load i32* %6, align 4
  %8 = icmp eq i32 %7, 3
  br i1 %8, label %9, label %40

; <label>:9                                       ; preds = %0
  %10 = load i64* %4, align 8
  %11 = load %struct.LodePNGColorMode** %2, align 8
  %12 = getelementptr inbounds %struct.LodePNGColorMode* %11, i32 0, i32 3
  %13 = load i64* %12, align 8
  %14 = icmp ugt i64 %10, %13
  br i1 %14, label %15, label %16

; <label>:15                                      ; preds = %9
  store i32 38, i32* %1
  br label %120

; <label>:16                                      ; preds = %9
  store i32 0, i32* %i, align 4
  br label %17

; <label>:17                                      ; preds = %36, %16
  %18 = load i32* %i, align 4
  %19 = zext i32 %18 to i64
  %20 = load i64* %4, align 8
  %21 = icmp ult i64 %19, %20
  br i1 %21, label %22, label %39

; <label>:22                                      ; preds = %17
  %23 = load i32* %i, align 4
  %24 = zext i32 %23 to i64
  %25 = load i8** %3, align 8
  %26 = getelementptr inbounds i8* %25, i64 %24
  %27 = load i8* %26, align 1
  %28 = load i32* %i, align 4
  %29 = mul i32 4, %28
  %30 = add i32 %29, 3
  %31 = zext i32 %30 to i64
  %32 = load %struct.LodePNGColorMode** %2, align 8
  %33 = getelementptr inbounds %struct.LodePNGColorMode* %32, i32 0, i32 2
  %34 = load i8** %33, align 8
  %35 = getelementptr inbounds i8* %34, i64 %31
  store i8 %27, i8* %35, align 1
  br label %36

; <label>:36                                      ; preds = %22
  %37 = load i32* %i, align 4
  %38 = add i32 %37, 1
  store i32 %38, i32* %i, align 4
  br label %17

; <label>:39                                      ; preds = %17
  br label %119

; <label>:40                                      ; preds = %0
  %41 = load %struct.LodePNGColorMode** %2, align 8
  %42 = getelementptr inbounds %struct.LodePNGColorMode* %41, i32 0, i32 0
  %43 = load i32* %42, align 4
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %45, label %68

; <label>:45                                      ; preds = %40
  %46 = load i64* %4, align 8
  %47 = icmp ne i64 %46, 2
  br i1 %47, label %48, label %49

; <label>:48                                      ; preds = %45
  store i32 30, i32* %1
  br label %120

; <label>:49                                      ; preds = %45
  %50 = load %struct.LodePNGColorMode** %2, align 8
  %51 = getelementptr inbounds %struct.LodePNGColorMode* %50, i32 0, i32 4
  store i32 1, i32* %51, align 4
  %52 = load i8** %3, align 8
  %53 = getelementptr inbounds i8* %52, i64 0
  %54 = load i8* %53, align 1
  %55 = zext i8 %54 to i32
  %56 = mul nsw i32 256, %55
  %57 = load i8** %3, align 8
  %58 = getelementptr inbounds i8* %57, i64 1
  %59 = load i8* %58, align 1
  %60 = zext i8 %59 to i32
  %61 = add nsw i32 %56, %60
  %62 = load %struct.LodePNGColorMode** %2, align 8
  %63 = getelementptr inbounds %struct.LodePNGColorMode* %62, i32 0, i32 7
  store i32 %61, i32* %63, align 4
  %64 = load %struct.LodePNGColorMode** %2, align 8
  %65 = getelementptr inbounds %struct.LodePNGColorMode* %64, i32 0, i32 6
  store i32 %61, i32* %65, align 4
  %66 = load %struct.LodePNGColorMode** %2, align 8
  %67 = getelementptr inbounds %struct.LodePNGColorMode* %66, i32 0, i32 5
  store i32 %61, i32* %67, align 4
  br label %118

; <label>:68                                      ; preds = %40
  %69 = load %struct.LodePNGColorMode** %2, align 8
  %70 = getelementptr inbounds %struct.LodePNGColorMode* %69, i32 0, i32 0
  %71 = load i32* %70, align 4
  %72 = icmp eq i32 %71, 2
  br i1 %72, label %73, label %116

; <label>:73                                      ; preds = %68
  %74 = load i64* %4, align 8
  %75 = icmp ne i64 %74, 6
  br i1 %75, label %76, label %77

; <label>:76                                      ; preds = %73
  store i32 41, i32* %1
  br label %120

; <label>:77                                      ; preds = %73
  %78 = load %struct.LodePNGColorMode** %2, align 8
  %79 = getelementptr inbounds %struct.LodePNGColorMode* %78, i32 0, i32 4
  store i32 1, i32* %79, align 4
  %80 = load i8** %3, align 8
  %81 = getelementptr inbounds i8* %80, i64 0
  %82 = load i8* %81, align 1
  %83 = zext i8 %82 to i32
  %84 = mul nsw i32 256, %83
  %85 = load i8** %3, align 8
  %86 = getelementptr inbounds i8* %85, i64 1
  %87 = load i8* %86, align 1
  %88 = zext i8 %87 to i32
  %89 = add nsw i32 %84, %88
  %90 = load %struct.LodePNGColorMode** %2, align 8
  %91 = getelementptr inbounds %struct.LodePNGColorMode* %90, i32 0, i32 5
  store i32 %89, i32* %91, align 4
  %92 = load i8** %3, align 8
  %93 = getelementptr inbounds i8* %92, i64 2
  %94 = load i8* %93, align 1
  %95 = zext i8 %94 to i32
  %96 = mul nsw i32 256, %95
  %97 = load i8** %3, align 8
  %98 = getelementptr inbounds i8* %97, i64 3
  %99 = load i8* %98, align 1
  %100 = zext i8 %99 to i32
  %101 = add nsw i32 %96, %100
  %102 = load %struct.LodePNGColorMode** %2, align 8
  %103 = getelementptr inbounds %struct.LodePNGColorMode* %102, i32 0, i32 6
  store i32 %101, i32* %103, align 4
  %104 = load i8** %3, align 8
  %105 = getelementptr inbounds i8* %104, i64 4
  %106 = load i8* %105, align 1
  %107 = zext i8 %106 to i32
  %108 = mul nsw i32 256, %107
  %109 = load i8** %3, align 8
  %110 = getelementptr inbounds i8* %109, i64 5
  %111 = load i8* %110, align 1
  %112 = zext i8 %111 to i32
  %113 = add nsw i32 %108, %112
  %114 = load %struct.LodePNGColorMode** %2, align 8
  %115 = getelementptr inbounds %struct.LodePNGColorMode* %114, i32 0, i32 7
  store i32 %113, i32* %115, align 4
  br label %117

; <label>:116                                     ; preds = %68
  store i32 42, i32* %1
  br label %120

; <label>:117                                     ; preds = %77
  br label %118

; <label>:118                                     ; preds = %117, %49
  br label %119

; <label>:119                                     ; preds = %118, %39
  store i32 0, i32* %1
  br label %120

; <label>:120                                     ; preds = %119, %116, %76, %48, %15
  %121 = load i32* %1
  ret i32 %121
}

; Function Attrs: nounwind uwtable
define internal i32 @readChunk_bKGD(%struct.LodePNGInfo* %info, i8* %data, i64 %chunkLength) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.LodePNGInfo*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i64, align 8
  store %struct.LodePNGInfo* %info, %struct.LodePNGInfo** %2, align 8
  store i8* %data, i8** %3, align 8
  store i64 %chunkLength, i64* %4, align 8
  %5 = load %struct.LodePNGInfo** %2, align 8
  %6 = getelementptr inbounds %struct.LodePNGInfo* %5, i32 0, i32 3
  %7 = getelementptr inbounds %struct.LodePNGColorMode* %6, i32 0, i32 0
  %8 = load i32* %7, align 4
  %9 = icmp eq i32 %8, 3
  br i1 %9, label %10, label %27

; <label>:10                                      ; preds = %0
  %11 = load i64* %4, align 8
  %12 = icmp ne i64 %11, 1
  br i1 %12, label %13, label %14

; <label>:13                                      ; preds = %10
  store i32 43, i32* %1
  br label %120

; <label>:14                                      ; preds = %10
  %15 = load %struct.LodePNGInfo** %2, align 8
  %16 = getelementptr inbounds %struct.LodePNGInfo* %15, i32 0, i32 4
  store i32 1, i32* %16, align 4
  %17 = load i8** %3, align 8
  %18 = getelementptr inbounds i8* %17, i64 0
  %19 = load i8* %18, align 1
  %20 = zext i8 %19 to i32
  %21 = load %struct.LodePNGInfo** %2, align 8
  %22 = getelementptr inbounds %struct.LodePNGInfo* %21, i32 0, i32 7
  store i32 %20, i32* %22, align 4
  %23 = load %struct.LodePNGInfo** %2, align 8
  %24 = getelementptr inbounds %struct.LodePNGInfo* %23, i32 0, i32 6
  store i32 %20, i32* %24, align 4
  %25 = load %struct.LodePNGInfo** %2, align 8
  %26 = getelementptr inbounds %struct.LodePNGInfo* %25, i32 0, i32 5
  store i32 %20, i32* %26, align 4
  br label %119

; <label>:27                                      ; preds = %0
  %28 = load %struct.LodePNGInfo** %2, align 8
  %29 = getelementptr inbounds %struct.LodePNGInfo* %28, i32 0, i32 3
  %30 = getelementptr inbounds %struct.LodePNGColorMode* %29, i32 0, i32 0
  %31 = load i32* %30, align 4
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %39, label %33

; <label>:33                                      ; preds = %27
  %34 = load %struct.LodePNGInfo** %2, align 8
  %35 = getelementptr inbounds %struct.LodePNGInfo* %34, i32 0, i32 3
  %36 = getelementptr inbounds %struct.LodePNGColorMode* %35, i32 0, i32 0
  %37 = load i32* %36, align 4
  %38 = icmp eq i32 %37, 4
  br i1 %38, label %39, label %62

; <label>:39                                      ; preds = %33, %27
  %40 = load i64* %4, align 8
  %41 = icmp ne i64 %40, 2
  br i1 %41, label %42, label %43

; <label>:42                                      ; preds = %39
  store i32 44, i32* %1
  br label %120

; <label>:43                                      ; preds = %39
  %44 = load %struct.LodePNGInfo** %2, align 8
  %45 = getelementptr inbounds %struct.LodePNGInfo* %44, i32 0, i32 4
  store i32 1, i32* %45, align 4
  %46 = load i8** %3, align 8
  %47 = getelementptr inbounds i8* %46, i64 0
  %48 = load i8* %47, align 1
  %49 = zext i8 %48 to i32
  %50 = mul nsw i32 256, %49
  %51 = load i8** %3, align 8
  %52 = getelementptr inbounds i8* %51, i64 1
  %53 = load i8* %52, align 1
  %54 = zext i8 %53 to i32
  %55 = add nsw i32 %50, %54
  %56 = load %struct.LodePNGInfo** %2, align 8
  %57 = getelementptr inbounds %struct.LodePNGInfo* %56, i32 0, i32 7
  store i32 %55, i32* %57, align 4
  %58 = load %struct.LodePNGInfo** %2, align 8
  %59 = getelementptr inbounds %struct.LodePNGInfo* %58, i32 0, i32 6
  store i32 %55, i32* %59, align 4
  %60 = load %struct.LodePNGInfo** %2, align 8
  %61 = getelementptr inbounds %struct.LodePNGInfo* %60, i32 0, i32 5
  store i32 %55, i32* %61, align 4
  br label %118

; <label>:62                                      ; preds = %33
  %63 = load %struct.LodePNGInfo** %2, align 8
  %64 = getelementptr inbounds %struct.LodePNGInfo* %63, i32 0, i32 3
  %65 = getelementptr inbounds %struct.LodePNGColorMode* %64, i32 0, i32 0
  %66 = load i32* %65, align 4
  %67 = icmp eq i32 %66, 2
  br i1 %67, label %74, label %68

; <label>:68                                      ; preds = %62
  %69 = load %struct.LodePNGInfo** %2, align 8
  %70 = getelementptr inbounds %struct.LodePNGInfo* %69, i32 0, i32 3
  %71 = getelementptr inbounds %struct.LodePNGColorMode* %70, i32 0, i32 0
  %72 = load i32* %71, align 4
  %73 = icmp eq i32 %72, 6
  br i1 %73, label %74, label %117

; <label>:74                                      ; preds = %68, %62
  %75 = load i64* %4, align 8
  %76 = icmp ne i64 %75, 6
  br i1 %76, label %77, label %78

; <label>:77                                      ; preds = %74
  store i32 45, i32* %1
  br label %120

; <label>:78                                      ; preds = %74
  %79 = load %struct.LodePNGInfo** %2, align 8
  %80 = getelementptr inbounds %struct.LodePNGInfo* %79, i32 0, i32 4
  store i32 1, i32* %80, align 4
  %81 = load i8** %3, align 8
  %82 = getelementptr inbounds i8* %81, i64 0
  %83 = load i8* %82, align 1
  %84 = zext i8 %83 to i32
  %85 = mul nsw i32 256, %84
  %86 = load i8** %3, align 8
  %87 = getelementptr inbounds i8* %86, i64 1
  %88 = load i8* %87, align 1
  %89 = zext i8 %88 to i32
  %90 = add nsw i32 %85, %89
  %91 = load %struct.LodePNGInfo** %2, align 8
  %92 = getelementptr inbounds %struct.LodePNGInfo* %91, i32 0, i32 5
  store i32 %90, i32* %92, align 4
  %93 = load i8** %3, align 8
  %94 = getelementptr inbounds i8* %93, i64 2
  %95 = load i8* %94, align 1
  %96 = zext i8 %95 to i32
  %97 = mul nsw i32 256, %96
  %98 = load i8** %3, align 8
  %99 = getelementptr inbounds i8* %98, i64 3
  %100 = load i8* %99, align 1
  %101 = zext i8 %100 to i32
  %102 = add nsw i32 %97, %101
  %103 = load %struct.LodePNGInfo** %2, align 8
  %104 = getelementptr inbounds %struct.LodePNGInfo* %103, i32 0, i32 6
  store i32 %102, i32* %104, align 4
  %105 = load i8** %3, align 8
  %106 = getelementptr inbounds i8* %105, i64 4
  %107 = load i8* %106, align 1
  %108 = zext i8 %107 to i32
  %109 = mul nsw i32 256, %108
  %110 = load i8** %3, align 8
  %111 = getelementptr inbounds i8* %110, i64 5
  %112 = load i8* %111, align 1
  %113 = zext i8 %112 to i32
  %114 = add nsw i32 %109, %113
  %115 = load %struct.LodePNGInfo** %2, align 8
  %116 = getelementptr inbounds %struct.LodePNGInfo* %115, i32 0, i32 7
  store i32 %114, i32* %116, align 4
  br label %117

; <label>:117                                     ; preds = %78, %68
  br label %118

; <label>:118                                     ; preds = %117, %43
  br label %119

; <label>:119                                     ; preds = %118, %14
  store i32 0, i32* %1
  br label %120

; <label>:120                                     ; preds = %119, %77, %42, %13
  %121 = load i32* %1
  ret i32 %121
}

; Function Attrs: nounwind uwtable
define internal i32 @readChunk_tEXt(%struct.LodePNGInfo* %info, i8* %data, i64 %chunkLength) #0 {
  %1 = alloca %struct.LodePNGInfo*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i64, align 8
  %error = alloca i32, align 4
  %key = alloca i8*, align 8
  %str = alloca i8*, align 8
  %i = alloca i32, align 4
  %length = alloca i32, align 4
  %string2_begin = alloca i32, align 4
  store %struct.LodePNGInfo* %info, %struct.LodePNGInfo** %1, align 8
  store i8* %data, i8** %2, align 8
  store i64 %chunkLength, i64* %3, align 8
  store i32 0, i32* %error, align 4
  store i8* null, i8** %key, align 8
  store i8* null, i8** %str, align 8
  br label %4

; <label>:4                                       ; preds = %0
  %5 = load i32* %error, align 4
  %6 = icmp ne i32 %5, 0
  %7 = xor i1 %6, true
  br i1 %7, label %8, label %116

; <label>:8                                       ; preds = %4
  store i32 0, i32* %length, align 4
  br label %9

; <label>:9                                       ; preds = %24, %8
  %10 = load i32* %length, align 4
  %11 = zext i32 %10 to i64
  %12 = load i64* %3, align 8
  %13 = icmp ult i64 %11, %12
  br i1 %13, label %14, label %22

; <label>:14                                      ; preds = %9
  %15 = load i32* %length, align 4
  %16 = zext i32 %15 to i64
  %17 = load i8** %2, align 8
  %18 = getelementptr inbounds i8* %17, i64 %16
  %19 = load i8* %18, align 1
  %20 = zext i8 %19 to i32
  %21 = icmp ne i32 %20, 0
  br label %22

; <label>:22                                      ; preds = %14, %9
  %23 = phi i1 [ false, %9 ], [ %21, %14 ]
  br i1 %23, label %24, label %27

; <label>:24                                      ; preds = %22
  %25 = load i32* %length, align 4
  %26 = add i32 %25, 1
  store i32 %26, i32* %length, align 4
  br label %9

; <label>:27                                      ; preds = %22
  %28 = load i32* %length, align 4
  %29 = icmp ult i32 %28, 1
  br i1 %29, label %33, label %30

; <label>:30                                      ; preds = %27
  %31 = load i32* %length, align 4
  %32 = icmp ugt i32 %31, 79
  br i1 %32, label %33, label %34

; <label>:33                                      ; preds = %30, %27
  store i32 89, i32* %error, align 4
  br label %116

; <label>:34                                      ; preds = %30
  %35 = load i32* %length, align 4
  %36 = add i32 %35, 1
  %37 = zext i32 %36 to i64
  %38 = call i8* @lodepng_malloc(i64 %37)
  store i8* %38, i8** %key, align 8
  %39 = load i8** %key, align 8
  %40 = icmp ne i8* %39, null
  br i1 %40, label %42, label %41

; <label>:41                                      ; preds = %34
  store i32 83, i32* %error, align 4
  br label %116

; <label>:42                                      ; preds = %34
  %43 = load i32* %length, align 4
  %44 = zext i32 %43 to i64
  %45 = load i8** %key, align 8
  %46 = getelementptr inbounds i8* %45, i64 %44
  store i8 0, i8* %46, align 1
  store i32 0, i32* %i, align 4
  br label %47

; <label>:47                                      ; preds = %61, %42
  %48 = load i32* %i, align 4
  %49 = load i32* %length, align 4
  %50 = icmp ult i32 %48, %49
  br i1 %50, label %51, label %64

; <label>:51                                      ; preds = %47
  %52 = load i32* %i, align 4
  %53 = zext i32 %52 to i64
  %54 = load i8** %2, align 8
  %55 = getelementptr inbounds i8* %54, i64 %53
  %56 = load i8* %55, align 1
  %57 = load i32* %i, align 4
  %58 = zext i32 %57 to i64
  %59 = load i8** %key, align 8
  %60 = getelementptr inbounds i8* %59, i64 %58
  store i8 %56, i8* %60, align 1
  br label %61

; <label>:61                                      ; preds = %51
  %62 = load i32* %i, align 4
  %63 = add i32 %62, 1
  store i32 %63, i32* %i, align 4
  br label %47

; <label>:64                                      ; preds = %47
  %65 = load i32* %length, align 4
  %66 = add i32 %65, 1
  store i32 %66, i32* %string2_begin, align 4
  %67 = load i64* %3, align 8
  %68 = load i32* %string2_begin, align 4
  %69 = zext i32 %68 to i64
  %70 = icmp ult i64 %67, %69
  br i1 %70, label %71, label %72

; <label>:71                                      ; preds = %64
  br label %77

; <label>:72                                      ; preds = %64
  %73 = load i64* %3, align 8
  %74 = load i32* %string2_begin, align 4
  %75 = zext i32 %74 to i64
  %76 = sub i64 %73, %75
  br label %77

; <label>:77                                      ; preds = %72, %71
  %78 = phi i64 [ 0, %71 ], [ %76, %72 ]
  %79 = trunc i64 %78 to i32
  store i32 %79, i32* %length, align 4
  %80 = load i32* %length, align 4
  %81 = add i32 %80, 1
  %82 = zext i32 %81 to i64
  %83 = call i8* @lodepng_malloc(i64 %82)
  store i8* %83, i8** %str, align 8
  %84 = load i8** %str, align 8
  %85 = icmp ne i8* %84, null
  br i1 %85, label %87, label %86

; <label>:86                                      ; preds = %77
  store i32 83, i32* %error, align 4
  br label %116

; <label>:87                                      ; preds = %77
  %88 = load i32* %length, align 4
  %89 = zext i32 %88 to i64
  %90 = load i8** %str, align 8
  %91 = getelementptr inbounds i8* %90, i64 %89
  store i8 0, i8* %91, align 1
  store i32 0, i32* %i, align 4
  br label %92

; <label>:92                                      ; preds = %108, %87
  %93 = load i32* %i, align 4
  %94 = load i32* %length, align 4
  %95 = icmp ult i32 %93, %94
  br i1 %95, label %96, label %111

; <label>:96                                      ; preds = %92
  %97 = load i32* %string2_begin, align 4
  %98 = load i32* %i, align 4
  %99 = add i32 %97, %98
  %100 = zext i32 %99 to i64
  %101 = load i8** %2, align 8
  %102 = getelementptr inbounds i8* %101, i64 %100
  %103 = load i8* %102, align 1
  %104 = load i32* %i, align 4
  %105 = zext i32 %104 to i64
  %106 = load i8** %str, align 8
  %107 = getelementptr inbounds i8* %106, i64 %105
  store i8 %103, i8* %107, align 1
  br label %108

; <label>:108                                     ; preds = %96
  %109 = load i32* %i, align 4
  %110 = add i32 %109, 1
  store i32 %110, i32* %i, align 4
  br label %92

; <label>:111                                     ; preds = %92
  %112 = load %struct.LodePNGInfo** %1, align 8
  %113 = load i8** %key, align 8
  %114 = load i8** %str, align 8
  %115 = call i32 @lodepng_add_text(%struct.LodePNGInfo* %112, i8* %113, i8* %114)
  store i32 %115, i32* %error, align 4
  br label %116

; <label>:116                                     ; preds = %111, %86, %41, %33, %4
  %117 = load i8** %key, align 8
  call void @lodepng_free(i8* %117)
  %118 = load i8** %str, align 8
  call void @lodepng_free(i8* %118)
  %119 = load i32* %error, align 4
  ret i32 %119
}

; Function Attrs: nounwind uwtable
define internal i32 @readChunk_zTXt(%struct.LodePNGInfo* %info, %struct.LodePNGDecompressSettings* %zlibsettings, i8* %data, i64 %chunkLength) #0 {
  %1 = alloca %struct.LodePNGInfo*, align 8
  %2 = alloca %struct.LodePNGDecompressSettings*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i64, align 8
  %error = alloca i32, align 4
  %i = alloca i32, align 4
  %length = alloca i32, align 4
  %string2_begin = alloca i32, align 4
  %key = alloca i8*, align 8
  %decoded = alloca %struct.ucvector, align 8
  store %struct.LodePNGInfo* %info, %struct.LodePNGInfo** %1, align 8
  store %struct.LodePNGDecompressSettings* %zlibsettings, %struct.LodePNGDecompressSettings** %2, align 8
  store i8* %data, i8** %3, align 8
  store i64 %chunkLength, i64* %4, align 8
  store i32 0, i32* %error, align 4
  store i8* null, i8** %key, align 8
  call void @ucvector_init(%struct.ucvector* %decoded)
  br label %5

; <label>:5                                       ; preds = %0
  %6 = load i32* %error, align 4
  %7 = icmp ne i32 %6, 0
  %8 = xor i1 %7, true
  br i1 %8, label %9, label %115

; <label>:9                                       ; preds = %5
  store i32 0, i32* %length, align 4
  br label %10

; <label>:10                                      ; preds = %24, %9
  %11 = load i32* %length, align 4
  %12 = zext i32 %11 to i64
  %13 = load i64* %4, align 8
  %14 = icmp ult i64 %12, %13
  br i1 %14, label %15, label %27

; <label>:15                                      ; preds = %10
  %16 = load i32* %length, align 4
  %17 = zext i32 %16 to i64
  %18 = load i8** %3, align 8
  %19 = getelementptr inbounds i8* %18, i64 %17
  %20 = load i8* %19, align 1
  %21 = zext i8 %20 to i32
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %23, label %27

; <label>:23                                      ; preds = %15
  br label %24

; <label>:24                                      ; preds = %23
  %25 = load i32* %length, align 4
  %26 = add i32 %25, 1
  store i32 %26, i32* %length, align 4
  br label %10

; <label>:27                                      ; preds = %15, %10
  %28 = load i32* %length, align 4
  %29 = add i32 %28, 2
  %30 = zext i32 %29 to i64
  %31 = load i64* %4, align 8
  %32 = icmp uge i64 %30, %31
  br i1 %32, label %33, label %34

; <label>:33                                      ; preds = %27
  store i32 75, i32* %error, align 4
  br label %115

; <label>:34                                      ; preds = %27
  %35 = load i32* %length, align 4
  %36 = icmp ult i32 %35, 1
  br i1 %36, label %40, label %37

; <label>:37                                      ; preds = %34
  %38 = load i32* %length, align 4
  %39 = icmp ugt i32 %38, 79
  br i1 %39, label %40, label %41

; <label>:40                                      ; preds = %37, %34
  store i32 89, i32* %error, align 4
  br label %115

; <label>:41                                      ; preds = %37
  %42 = load i32* %length, align 4
  %43 = add i32 %42, 1
  %44 = zext i32 %43 to i64
  %45 = call i8* @lodepng_malloc(i64 %44)
  store i8* %45, i8** %key, align 8
  %46 = load i8** %key, align 8
  %47 = icmp ne i8* %46, null
  br i1 %47, label %49, label %48

; <label>:48                                      ; preds = %41
  store i32 83, i32* %error, align 4
  br label %115

; <label>:49                                      ; preds = %41
  %50 = load i32* %length, align 4
  %51 = zext i32 %50 to i64
  %52 = load i8** %key, align 8
  %53 = getelementptr inbounds i8* %52, i64 %51
  store i8 0, i8* %53, align 1
  store i32 0, i32* %i, align 4
  br label %54

; <label>:54                                      ; preds = %68, %49
  %55 = load i32* %i, align 4
  %56 = load i32* %length, align 4
  %57 = icmp ult i32 %55, %56
  br i1 %57, label %58, label %71

; <label>:58                                      ; preds = %54
  %59 = load i32* %i, align 4
  %60 = zext i32 %59 to i64
  %61 = load i8** %3, align 8
  %62 = getelementptr inbounds i8* %61, i64 %60
  %63 = load i8* %62, align 1
  %64 = load i32* %i, align 4
  %65 = zext i32 %64 to i64
  %66 = load i8** %key, align 8
  %67 = getelementptr inbounds i8* %66, i64 %65
  store i8 %63, i8* %67, align 1
  br label %68

; <label>:68                                      ; preds = %58
  %69 = load i32* %i, align 4
  %70 = add i32 %69, 1
  store i32 %70, i32* %i, align 4
  br label %54

; <label>:71                                      ; preds = %54
  %72 = load i32* %length, align 4
  %73 = add i32 %72, 1
  %74 = zext i32 %73 to i64
  %75 = load i8** %3, align 8
  %76 = getelementptr inbounds i8* %75, i64 %74
  %77 = load i8* %76, align 1
  %78 = zext i8 %77 to i32
  %79 = icmp ne i32 %78, 0
  br i1 %79, label %80, label %81

; <label>:80                                      ; preds = %71
  store i32 72, i32* %error, align 4
  br label %115

; <label>:81                                      ; preds = %71
  %82 = load i32* %length, align 4
  %83 = add i32 %82, 2
  store i32 %83, i32* %string2_begin, align 4
  %84 = load i32* %string2_begin, align 4
  %85 = zext i32 %84 to i64
  %86 = load i64* %4, align 8
  %87 = icmp ugt i64 %85, %86
  br i1 %87, label %88, label %89

; <label>:88                                      ; preds = %81
  store i32 75, i32* %error, align 4
  br label %115

; <label>:89                                      ; preds = %81
  %90 = load i64* %4, align 8
  %91 = load i32* %string2_begin, align 4
  %92 = zext i32 %91 to i64
  %93 = sub i64 %90, %92
  %94 = trunc i64 %93 to i32
  store i32 %94, i32* %length, align 4
  %95 = getelementptr inbounds %struct.ucvector* %decoded, i32 0, i32 0
  %96 = getelementptr inbounds %struct.ucvector* %decoded, i32 0, i32 1
  %97 = load i32* %string2_begin, align 4
  %98 = zext i32 %97 to i64
  %99 = load i8** %3, align 8
  %100 = getelementptr inbounds i8* %99, i64 %98
  %101 = load i32* %length, align 4
  %102 = zext i32 %101 to i64
  %103 = load %struct.LodePNGDecompressSettings** %2, align 8
  %104 = call i32 @zlib_decompress(i8** %95, i64* %96, i8* %100, i64 %102, %struct.LodePNGDecompressSettings* %103)
  store i32 %104, i32* %error, align 4
  %105 = load i32* %error, align 4
  %106 = icmp ne i32 %105, 0
  br i1 %106, label %107, label %108

; <label>:107                                     ; preds = %89
  br label %115

; <label>:108                                     ; preds = %89
  %109 = call i32 @ucvector_push_back(%struct.ucvector* %decoded, i8 zeroext 0)
  %110 = load %struct.LodePNGInfo** %1, align 8
  %111 = load i8** %key, align 8
  %112 = getelementptr inbounds %struct.ucvector* %decoded, i32 0, i32 0
  %113 = load i8** %112, align 8
  %114 = call i32 @lodepng_add_text(%struct.LodePNGInfo* %110, i8* %111, i8* %113)
  store i32 %114, i32* %error, align 4
  br label %115

; <label>:115                                     ; preds = %108, %107, %88, %80, %48, %40, %33, %5
  %116 = load i8** %key, align 8
  call void @lodepng_free(i8* %116)
  %117 = bitcast %struct.ucvector* %decoded to i8*
  call void @ucvector_cleanup(i8* %117)
  %118 = load i32* %error, align 4
  ret i32 %118
}

; Function Attrs: nounwind uwtable
define internal i32 @readChunk_iTXt(%struct.LodePNGInfo* %info, %struct.LodePNGDecompressSettings* %zlibsettings, i8* %data, i64 %chunkLength) #0 {
  %1 = alloca %struct.LodePNGInfo*, align 8
  %2 = alloca %struct.LodePNGDecompressSettings*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i64, align 8
  %error = alloca i32, align 4
  %i = alloca i32, align 4
  %length = alloca i32, align 4
  %begin = alloca i32, align 4
  %compressed = alloca i32, align 4
  %key = alloca i8*, align 8
  %langtag = alloca i8*, align 8
  %transkey = alloca i8*, align 8
  %decoded = alloca %struct.ucvector, align 8
  store %struct.LodePNGInfo* %info, %struct.LodePNGInfo** %1, align 8
  store %struct.LodePNGDecompressSettings* %zlibsettings, %struct.LodePNGDecompressSettings** %2, align 8
  store i8* %data, i8** %3, align 8
  store i64 %chunkLength, i64* %4, align 8
  store i32 0, i32* %error, align 4
  store i8* null, i8** %key, align 8
  store i8* null, i8** %langtag, align 8
  store i8* null, i8** %transkey, align 8
  call void @ucvector_init(%struct.ucvector* %decoded)
  br label %5

; <label>:5                                       ; preds = %0
  %6 = load i32* %error, align 4
  %7 = icmp ne i32 %6, 0
  %8 = xor i1 %7, true
  br i1 %8, label %9, label %292

; <label>:9                                       ; preds = %5
  %10 = load i64* %4, align 8
  %11 = icmp ult i64 %10, 5
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %9
  store i32 30, i32* %error, align 4
  br label %292

; <label>:13                                      ; preds = %9
  store i32 0, i32* %length, align 4
  br label %14

; <label>:14                                      ; preds = %28, %13
  %15 = load i32* %length, align 4
  %16 = zext i32 %15 to i64
  %17 = load i64* %4, align 8
  %18 = icmp ult i64 %16, %17
  br i1 %18, label %19, label %31

; <label>:19                                      ; preds = %14
  %20 = load i32* %length, align 4
  %21 = zext i32 %20 to i64
  %22 = load i8** %3, align 8
  %23 = getelementptr inbounds i8* %22, i64 %21
  %24 = load i8* %23, align 1
  %25 = zext i8 %24 to i32
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %27, label %31

; <label>:27                                      ; preds = %19
  br label %28

; <label>:28                                      ; preds = %27
  %29 = load i32* %length, align 4
  %30 = add i32 %29, 1
  store i32 %30, i32* %length, align 4
  br label %14

; <label>:31                                      ; preds = %19, %14
  %32 = load i32* %length, align 4
  %33 = add i32 %32, 3
  %34 = zext i32 %33 to i64
  %35 = load i64* %4, align 8
  %36 = icmp uge i64 %34, %35
  br i1 %36, label %37, label %38

; <label>:37                                      ; preds = %31
  store i32 75, i32* %error, align 4
  br label %292

; <label>:38                                      ; preds = %31
  %39 = load i32* %length, align 4
  %40 = icmp ult i32 %39, 1
  br i1 %40, label %44, label %41

; <label>:41                                      ; preds = %38
  %42 = load i32* %length, align 4
  %43 = icmp ugt i32 %42, 79
  br i1 %43, label %44, label %45

; <label>:44                                      ; preds = %41, %38
  store i32 89, i32* %error, align 4
  br label %292

; <label>:45                                      ; preds = %41
  %46 = load i32* %length, align 4
  %47 = add i32 %46, 1
  %48 = zext i32 %47 to i64
  %49 = call i8* @lodepng_malloc(i64 %48)
  store i8* %49, i8** %key, align 8
  %50 = load i8** %key, align 8
  %51 = icmp ne i8* %50, null
  br i1 %51, label %53, label %52

; <label>:52                                      ; preds = %45
  store i32 83, i32* %error, align 4
  br label %292

; <label>:53                                      ; preds = %45
  %54 = load i32* %length, align 4
  %55 = zext i32 %54 to i64
  %56 = load i8** %key, align 8
  %57 = getelementptr inbounds i8* %56, i64 %55
  store i8 0, i8* %57, align 1
  store i32 0, i32* %i, align 4
  br label %58

; <label>:58                                      ; preds = %72, %53
  %59 = load i32* %i, align 4
  %60 = load i32* %length, align 4
  %61 = icmp ult i32 %59, %60
  br i1 %61, label %62, label %75

; <label>:62                                      ; preds = %58
  %63 = load i32* %i, align 4
  %64 = zext i32 %63 to i64
  %65 = load i8** %3, align 8
  %66 = getelementptr inbounds i8* %65, i64 %64
  %67 = load i8* %66, align 1
  %68 = load i32* %i, align 4
  %69 = zext i32 %68 to i64
  %70 = load i8** %key, align 8
  %71 = getelementptr inbounds i8* %70, i64 %69
  store i8 %67, i8* %71, align 1
  br label %72

; <label>:72                                      ; preds = %62
  %73 = load i32* %i, align 4
  %74 = add i32 %73, 1
  store i32 %74, i32* %i, align 4
  br label %58

; <label>:75                                      ; preds = %58
  %76 = load i32* %length, align 4
  %77 = add i32 %76, 1
  %78 = zext i32 %77 to i64
  %79 = load i8** %3, align 8
  %80 = getelementptr inbounds i8* %79, i64 %78
  %81 = load i8* %80, align 1
  %82 = zext i8 %81 to i32
  store i32 %82, i32* %compressed, align 4
  %83 = load i32* %length, align 4
  %84 = add i32 %83, 2
  %85 = zext i32 %84 to i64
  %86 = load i8** %3, align 8
  %87 = getelementptr inbounds i8* %86, i64 %85
  %88 = load i8* %87, align 1
  %89 = zext i8 %88 to i32
  %90 = icmp ne i32 %89, 0
  br i1 %90, label %91, label %92

; <label>:91                                      ; preds = %75
  store i32 72, i32* %error, align 4
  br label %292

; <label>:92                                      ; preds = %75
  %93 = load i32* %length, align 4
  %94 = add i32 %93, 3
  store i32 %94, i32* %begin, align 4
  store i32 0, i32* %length, align 4
  %95 = load i32* %begin, align 4
  store i32 %95, i32* %i, align 4
  br label %96

; <label>:96                                      ; preds = %112, %92
  %97 = load i32* %i, align 4
  %98 = zext i32 %97 to i64
  %99 = load i64* %4, align 8
  %100 = icmp ult i64 %98, %99
  br i1 %100, label %101, label %115

; <label>:101                                     ; preds = %96
  %102 = load i32* %i, align 4
  %103 = zext i32 %102 to i64
  %104 = load i8** %3, align 8
  %105 = getelementptr inbounds i8* %104, i64 %103
  %106 = load i8* %105, align 1
  %107 = zext i8 %106 to i32
  %108 = icmp ne i32 %107, 0
  br i1 %108, label %109, label %115

; <label>:109                                     ; preds = %101
  %110 = load i32* %length, align 4
  %111 = add i32 %110, 1
  store i32 %111, i32* %length, align 4
  br label %112

; <label>:112                                     ; preds = %109
  %113 = load i32* %i, align 4
  %114 = add i32 %113, 1
  store i32 %114, i32* %i, align 4
  br label %96

; <label>:115                                     ; preds = %101, %96
  %116 = load i32* %length, align 4
  %117 = add i32 %116, 1
  %118 = zext i32 %117 to i64
  %119 = call i8* @lodepng_malloc(i64 %118)
  store i8* %119, i8** %langtag, align 8
  %120 = load i8** %langtag, align 8
  %121 = icmp ne i8* %120, null
  br i1 %121, label %123, label %122

; <label>:122                                     ; preds = %115
  store i32 83, i32* %error, align 4
  br label %292

; <label>:123                                     ; preds = %115
  %124 = load i32* %length, align 4
  %125 = zext i32 %124 to i64
  %126 = load i8** %langtag, align 8
  %127 = getelementptr inbounds i8* %126, i64 %125
  store i8 0, i8* %127, align 1
  store i32 0, i32* %i, align 4
  br label %128

; <label>:128                                     ; preds = %144, %123
  %129 = load i32* %i, align 4
  %130 = load i32* %length, align 4
  %131 = icmp ult i32 %129, %130
  br i1 %131, label %132, label %147

; <label>:132                                     ; preds = %128
  %133 = load i32* %begin, align 4
  %134 = load i32* %i, align 4
  %135 = add i32 %133, %134
  %136 = zext i32 %135 to i64
  %137 = load i8** %3, align 8
  %138 = getelementptr inbounds i8* %137, i64 %136
  %139 = load i8* %138, align 1
  %140 = load i32* %i, align 4
  %141 = zext i32 %140 to i64
  %142 = load i8** %langtag, align 8
  %143 = getelementptr inbounds i8* %142, i64 %141
  store i8 %139, i8* %143, align 1
  br label %144

; <label>:144                                     ; preds = %132
  %145 = load i32* %i, align 4
  %146 = add i32 %145, 1
  store i32 %146, i32* %i, align 4
  br label %128

; <label>:147                                     ; preds = %128
  %148 = load i32* %length, align 4
  %149 = add i32 %148, 1
  %150 = load i32* %begin, align 4
  %151 = add i32 %150, %149
  store i32 %151, i32* %begin, align 4
  store i32 0, i32* %length, align 4
  %152 = load i32* %begin, align 4
  store i32 %152, i32* %i, align 4
  br label %153

; <label>:153                                     ; preds = %169, %147
  %154 = load i32* %i, align 4
  %155 = zext i32 %154 to i64
  %156 = load i64* %4, align 8
  %157 = icmp ult i64 %155, %156
  br i1 %157, label %158, label %172

; <label>:158                                     ; preds = %153
  %159 = load i32* %i, align 4
  %160 = zext i32 %159 to i64
  %161 = load i8** %3, align 8
  %162 = getelementptr inbounds i8* %161, i64 %160
  %163 = load i8* %162, align 1
  %164 = zext i8 %163 to i32
  %165 = icmp ne i32 %164, 0
  br i1 %165, label %166, label %172

; <label>:166                                     ; preds = %158
  %167 = load i32* %length, align 4
  %168 = add i32 %167, 1
  store i32 %168, i32* %length, align 4
  br label %169

; <label>:169                                     ; preds = %166
  %170 = load i32* %i, align 4
  %171 = add i32 %170, 1
  store i32 %171, i32* %i, align 4
  br label %153

; <label>:172                                     ; preds = %158, %153
  %173 = load i32* %length, align 4
  %174 = add i32 %173, 1
  %175 = zext i32 %174 to i64
  %176 = call i8* @lodepng_malloc(i64 %175)
  store i8* %176, i8** %transkey, align 8
  %177 = load i8** %transkey, align 8
  %178 = icmp ne i8* %177, null
  br i1 %178, label %180, label %179

; <label>:179                                     ; preds = %172
  store i32 83, i32* %error, align 4
  br label %292

; <label>:180                                     ; preds = %172
  %181 = load i32* %length, align 4
  %182 = zext i32 %181 to i64
  %183 = load i8** %transkey, align 8
  %184 = getelementptr inbounds i8* %183, i64 %182
  store i8 0, i8* %184, align 1
  store i32 0, i32* %i, align 4
  br label %185

; <label>:185                                     ; preds = %201, %180
  %186 = load i32* %i, align 4
  %187 = load i32* %length, align 4
  %188 = icmp ult i32 %186, %187
  br i1 %188, label %189, label %204

; <label>:189                                     ; preds = %185
  %190 = load i32* %begin, align 4
  %191 = load i32* %i, align 4
  %192 = add i32 %190, %191
  %193 = zext i32 %192 to i64
  %194 = load i8** %3, align 8
  %195 = getelementptr inbounds i8* %194, i64 %193
  %196 = load i8* %195, align 1
  %197 = load i32* %i, align 4
  %198 = zext i32 %197 to i64
  %199 = load i8** %transkey, align 8
  %200 = getelementptr inbounds i8* %199, i64 %198
  store i8 %196, i8* %200, align 1
  br label %201

; <label>:201                                     ; preds = %189
  %202 = load i32* %i, align 4
  %203 = add i32 %202, 1
  store i32 %203, i32* %i, align 4
  br label %185

; <label>:204                                     ; preds = %185
  %205 = load i32* %length, align 4
  %206 = add i32 %205, 1
  %207 = load i32* %begin, align 4
  %208 = add i32 %207, %206
  store i32 %208, i32* %begin, align 4
  %209 = load i64* %4, align 8
  %210 = load i32* %begin, align 4
  %211 = zext i32 %210 to i64
  %212 = icmp ult i64 %209, %211
  br i1 %212, label %213, label %214

; <label>:213                                     ; preds = %204
  br label %219

; <label>:214                                     ; preds = %204
  %215 = load i64* %4, align 8
  %216 = load i32* %begin, align 4
  %217 = zext i32 %216 to i64
  %218 = sub i64 %215, %217
  br label %219

; <label>:219                                     ; preds = %214, %213
  %220 = phi i64 [ 0, %213 ], [ %218, %214 ]
  %221 = trunc i64 %220 to i32
  store i32 %221, i32* %length, align 4
  %222 = load i32* %compressed, align 4
  %223 = icmp ne i32 %222, 0
  br i1 %223, label %224, label %250

; <label>:224                                     ; preds = %219
  %225 = getelementptr inbounds %struct.ucvector* %decoded, i32 0, i32 0
  %226 = getelementptr inbounds %struct.ucvector* %decoded, i32 0, i32 1
  %227 = load i32* %begin, align 4
  %228 = zext i32 %227 to i64
  %229 = load i8** %3, align 8
  %230 = getelementptr inbounds i8* %229, i64 %228
  %231 = load i32* %length, align 4
  %232 = zext i32 %231 to i64
  %233 = load %struct.LodePNGDecompressSettings** %2, align 8
  %234 = call i32 @zlib_decompress(i8** %225, i64* %226, i8* %230, i64 %232, %struct.LodePNGDecompressSettings* %233)
  store i32 %234, i32* %error, align 4
  %235 = load i32* %error, align 4
  %236 = icmp ne i32 %235, 0
  br i1 %236, label %237, label %238

; <label>:237                                     ; preds = %224
  br label %292

; <label>:238                                     ; preds = %224
  %239 = getelementptr inbounds %struct.ucvector* %decoded, i32 0, i32 2
  %240 = load i64* %239, align 8
  %241 = getelementptr inbounds %struct.ucvector* %decoded, i32 0, i32 1
  %242 = load i64* %241, align 8
  %243 = icmp ult i64 %240, %242
  br i1 %243, label %244, label %248

; <label>:244                                     ; preds = %238
  %245 = getelementptr inbounds %struct.ucvector* %decoded, i32 0, i32 1
  %246 = load i64* %245, align 8
  %247 = getelementptr inbounds %struct.ucvector* %decoded, i32 0, i32 2
  store i64 %246, i64* %247, align 8
  br label %248

; <label>:248                                     ; preds = %244, %238
  %249 = call i32 @ucvector_push_back(%struct.ucvector* %decoded, i8 zeroext 0)
  br label %284

; <label>:250                                     ; preds = %219
  %251 = load i32* %length, align 4
  %252 = add i32 %251, 1
  %253 = zext i32 %252 to i64
  %254 = call i32 @ucvector_resize(%struct.ucvector* %decoded, i64 %253)
  %255 = icmp ne i32 %254, 0
  br i1 %255, label %257, label %256

; <label>:256                                     ; preds = %250
  store i32 83, i32* %error, align 4
  br label %292

; <label>:257                                     ; preds = %250
  %258 = load i32* %length, align 4
  %259 = zext i32 %258 to i64
  %260 = getelementptr inbounds %struct.ucvector* %decoded, i32 0, i32 0
  %261 = load i8** %260, align 8
  %262 = getelementptr inbounds i8* %261, i64 %259
  store i8 0, i8* %262, align 1
  store i32 0, i32* %i, align 4
  br label %263

; <label>:263                                     ; preds = %280, %257
  %264 = load i32* %i, align 4
  %265 = load i32* %length, align 4
  %266 = icmp ult i32 %264, %265
  br i1 %266, label %267, label %283

; <label>:267                                     ; preds = %263
  %268 = load i32* %begin, align 4
  %269 = load i32* %i, align 4
  %270 = add i32 %268, %269
  %271 = zext i32 %270 to i64
  %272 = load i8** %3, align 8
  %273 = getelementptr inbounds i8* %272, i64 %271
  %274 = load i8* %273, align 1
  %275 = load i32* %i, align 4
  %276 = zext i32 %275 to i64
  %277 = getelementptr inbounds %struct.ucvector* %decoded, i32 0, i32 0
  %278 = load i8** %277, align 8
  %279 = getelementptr inbounds i8* %278, i64 %276
  store i8 %274, i8* %279, align 1
  br label %280

; <label>:280                                     ; preds = %267
  %281 = load i32* %i, align 4
  %282 = add i32 %281, 1
  store i32 %282, i32* %i, align 4
  br label %263

; <label>:283                                     ; preds = %263
  br label %284

; <label>:284                                     ; preds = %283, %248
  %285 = load %struct.LodePNGInfo** %1, align 8
  %286 = load i8** %key, align 8
  %287 = load i8** %langtag, align 8
  %288 = load i8** %transkey, align 8
  %289 = getelementptr inbounds %struct.ucvector* %decoded, i32 0, i32 0
  %290 = load i8** %289, align 8
  %291 = call i32 @lodepng_add_itext(%struct.LodePNGInfo* %285, i8* %286, i8* %287, i8* %288, i8* %290)
  store i32 %291, i32* %error, align 4
  br label %292

; <label>:292                                     ; preds = %284, %256, %237, %179, %122, %91, %52, %44, %37, %12, %5
  %293 = load i8** %key, align 8
  call void @lodepng_free(i8* %293)
  %294 = load i8** %langtag, align 8
  call void @lodepng_free(i8* %294)
  %295 = load i8** %transkey, align 8
  call void @lodepng_free(i8* %295)
  %296 = bitcast %struct.ucvector* %decoded to i8*
  call void @ucvector_cleanup(i8* %296)
  %297 = load i32* %error, align 4
  ret i32 %297
}

; Function Attrs: nounwind uwtable
define internal i32 @readChunk_tIME(%struct.LodePNGInfo* %info, i8* %data, i64 %chunkLength) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.LodePNGInfo*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i64, align 8
  store %struct.LodePNGInfo* %info, %struct.LodePNGInfo** %2, align 8
  store i8* %data, i8** %3, align 8
  store i64 %chunkLength, i64* %4, align 8
  %5 = load i64* %4, align 8
  %6 = icmp ne i64 %5, 7
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  store i32 73, i32* %1
  br label %59

; <label>:8                                       ; preds = %0
  %9 = load %struct.LodePNGInfo** %2, align 8
  %10 = getelementptr inbounds %struct.LodePNGInfo* %9, i32 0, i32 16
  store i32 1, i32* %10, align 4
  %11 = load i8** %3, align 8
  %12 = getelementptr inbounds i8* %11, i64 0
  %13 = load i8* %12, align 1
  %14 = zext i8 %13 to i32
  %15 = mul nsw i32 256, %14
  %16 = load i8** %3, align 8
  %17 = getelementptr inbounds i8* %16, i64 1
  %18 = load i8* %17, align 1
  %19 = zext i8 %18 to i32
  %20 = add nsw i32 %15, %19
  %21 = load %struct.LodePNGInfo** %2, align 8
  %22 = getelementptr inbounds %struct.LodePNGInfo* %21, i32 0, i32 17
  %23 = getelementptr inbounds %struct.LodePNGTime* %22, i32 0, i32 0
  store i32 %20, i32* %23, align 4
  %24 = load i8** %3, align 8
  %25 = getelementptr inbounds i8* %24, i64 2
  %26 = load i8* %25, align 1
  %27 = zext i8 %26 to i32
  %28 = load %struct.LodePNGInfo** %2, align 8
  %29 = getelementptr inbounds %struct.LodePNGInfo* %28, i32 0, i32 17
  %30 = getelementptr inbounds %struct.LodePNGTime* %29, i32 0, i32 1
  store i32 %27, i32* %30, align 4
  %31 = load i8** %3, align 8
  %32 = getelementptr inbounds i8* %31, i64 3
  %33 = load i8* %32, align 1
  %34 = zext i8 %33 to i32
  %35 = load %struct.LodePNGInfo** %2, align 8
  %36 = getelementptr inbounds %struct.LodePNGInfo* %35, i32 0, i32 17
  %37 = getelementptr inbounds %struct.LodePNGTime* %36, i32 0, i32 2
  store i32 %34, i32* %37, align 4
  %38 = load i8** %3, align 8
  %39 = getelementptr inbounds i8* %38, i64 4
  %40 = load i8* %39, align 1
  %41 = zext i8 %40 to i32
  %42 = load %struct.LodePNGInfo** %2, align 8
  %43 = getelementptr inbounds %struct.LodePNGInfo* %42, i32 0, i32 17
  %44 = getelementptr inbounds %struct.LodePNGTime* %43, i32 0, i32 3
  store i32 %41, i32* %44, align 4
  %45 = load i8** %3, align 8
  %46 = getelementptr inbounds i8* %45, i64 5
  %47 = load i8* %46, align 1
  %48 = zext i8 %47 to i32
  %49 = load %struct.LodePNGInfo** %2, align 8
  %50 = getelementptr inbounds %struct.LodePNGInfo* %49, i32 0, i32 17
  %51 = getelementptr inbounds %struct.LodePNGTime* %50, i32 0, i32 4
  store i32 %48, i32* %51, align 4
  %52 = load i8** %3, align 8
  %53 = getelementptr inbounds i8* %52, i64 6
  %54 = load i8* %53, align 1
  %55 = zext i8 %54 to i32
  %56 = load %struct.LodePNGInfo** %2, align 8
  %57 = getelementptr inbounds %struct.LodePNGInfo* %56, i32 0, i32 17
  %58 = getelementptr inbounds %struct.LodePNGTime* %57, i32 0, i32 5
  store i32 %55, i32* %58, align 4
  store i32 0, i32* %1
  br label %59

; <label>:59                                      ; preds = %8, %7
  %60 = load i32* %1
  ret i32 %60
}

; Function Attrs: nounwind uwtable
define internal i32 @readChunk_pHYs(%struct.LodePNGInfo* %info, i8* %data, i64 %chunkLength) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.LodePNGInfo*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i64, align 8
  store %struct.LodePNGInfo* %info, %struct.LodePNGInfo** %2, align 8
  store i8* %data, i8** %3, align 8
  store i64 %chunkLength, i64* %4, align 8
  %5 = load i64* %4, align 8
  %6 = icmp ne i64 %5, 9
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  store i32 74, i32* %1
  br label %65

; <label>:8                                       ; preds = %0
  %9 = load %struct.LodePNGInfo** %2, align 8
  %10 = getelementptr inbounds %struct.LodePNGInfo* %9, i32 0, i32 18
  store i32 1, i32* %10, align 4
  %11 = load i8** %3, align 8
  %12 = getelementptr inbounds i8* %11, i64 0
  %13 = load i8* %12, align 1
  %14 = zext i8 %13 to i32
  %15 = mul nsw i32 16777216, %14
  %16 = load i8** %3, align 8
  %17 = getelementptr inbounds i8* %16, i64 1
  %18 = load i8* %17, align 1
  %19 = zext i8 %18 to i32
  %20 = mul nsw i32 65536, %19
  %21 = add nsw i32 %15, %20
  %22 = load i8** %3, align 8
  %23 = getelementptr inbounds i8* %22, i64 2
  %24 = load i8* %23, align 1
  %25 = zext i8 %24 to i32
  %26 = mul nsw i32 256, %25
  %27 = add nsw i32 %21, %26
  %28 = load i8** %3, align 8
  %29 = getelementptr inbounds i8* %28, i64 3
  %30 = load i8* %29, align 1
  %31 = zext i8 %30 to i32
  %32 = add nsw i32 %27, %31
  %33 = load %struct.LodePNGInfo** %2, align 8
  %34 = getelementptr inbounds %struct.LodePNGInfo* %33, i32 0, i32 19
  store i32 %32, i32* %34, align 4
  %35 = load i8** %3, align 8
  %36 = getelementptr inbounds i8* %35, i64 4
  %37 = load i8* %36, align 1
  %38 = zext i8 %37 to i32
  %39 = mul nsw i32 16777216, %38
  %40 = load i8** %3, align 8
  %41 = getelementptr inbounds i8* %40, i64 5
  %42 = load i8* %41, align 1
  %43 = zext i8 %42 to i32
  %44 = mul nsw i32 65536, %43
  %45 = add nsw i32 %39, %44
  %46 = load i8** %3, align 8
  %47 = getelementptr inbounds i8* %46, i64 6
  %48 = load i8* %47, align 1
  %49 = zext i8 %48 to i32
  %50 = mul nsw i32 256, %49
  %51 = add nsw i32 %45, %50
  %52 = load i8** %3, align 8
  %53 = getelementptr inbounds i8* %52, i64 7
  %54 = load i8* %53, align 1
  %55 = zext i8 %54 to i32
  %56 = add nsw i32 %51, %55
  %57 = load %struct.LodePNGInfo** %2, align 8
  %58 = getelementptr inbounds %struct.LodePNGInfo* %57, i32 0, i32 20
  store i32 %56, i32* %58, align 4
  %59 = load i8** %3, align 8
  %60 = getelementptr inbounds i8* %59, i64 8
  %61 = load i8* %60, align 1
  %62 = zext i8 %61 to i32
  %63 = load %struct.LodePNGInfo** %2, align 8
  %64 = getelementptr inbounds %struct.LodePNGInfo* %63, i32 0, i32 21
  store i32 %62, i32* %64, align 4
  store i32 0, i32* %1
  br label %65

; <label>:65                                      ; preds = %8, %7
  %66 = load i32* %1
  ret i32 %66
}

; Function Attrs: nounwind uwtable
define internal i32 @zlib_decompress(i8** %out, i64* %outsize, i8* %in, i64 %insize, %struct.LodePNGDecompressSettings* %settings) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8**, align 8
  %3 = alloca i64*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i64, align 8
  %6 = alloca %struct.LodePNGDecompressSettings*, align 8
  store i8** %out, i8*** %2, align 8
  store i64* %outsize, i64** %3, align 8
  store i8* %in, i8** %4, align 8
  store i64 %insize, i64* %5, align 8
  store %struct.LodePNGDecompressSettings* %settings, %struct.LodePNGDecompressSettings** %6, align 8
  %7 = load %struct.LodePNGDecompressSettings** %6, align 8
  %8 = getelementptr inbounds %struct.LodePNGDecompressSettings* %7, i32 0, i32 1
  %9 = bitcast {}** %8 to i32 (i8**, i64*, i8*, i64, %struct.LodePNGDecompressSettings*)**
  %10 = load i32 (i8**, i64*, i8*, i64, %struct.LodePNGDecompressSettings*)** %9, align 8
  %11 = icmp ne i32 (i8**, i64*, i8*, i64, %struct.LodePNGDecompressSettings*)* %10, null
  br i1 %11, label %12, label %23

; <label>:12                                      ; preds = %0
  %13 = load %struct.LodePNGDecompressSettings** %6, align 8
  %14 = getelementptr inbounds %struct.LodePNGDecompressSettings* %13, i32 0, i32 1
  %15 = bitcast {}** %14 to i32 (i8**, i64*, i8*, i64, %struct.LodePNGDecompressSettings*)**
  %16 = load i32 (i8**, i64*, i8*, i64, %struct.LodePNGDecompressSettings*)** %15, align 8
  %17 = load i8*** %2, align 8
  %18 = load i64** %3, align 8
  %19 = load i8** %4, align 8
  %20 = load i64* %5, align 8
  %21 = load %struct.LodePNGDecompressSettings** %6, align 8
  %22 = call i32 %16(i8** %17, i64* %18, i8* %19, i64 %20, %struct.LodePNGDecompressSettings* %21)
  store i32 %22, i32* %1
  br label %30

; <label>:23                                      ; preds = %0
  %24 = load i8*** %2, align 8
  %25 = load i64** %3, align 8
  %26 = load i8** %4, align 8
  %27 = load i64* %5, align 8
  %28 = load %struct.LodePNGDecompressSettings** %6, align 8
  %29 = call i32 @lodepng_zlib_decompress(i8** %24, i64* %25, i8* %26, i64 %27, %struct.LodePNGDecompressSettings* %28)
  store i32 %29, i32* %1
  br label %30

; <label>:30                                      ; preds = %23, %12
  %31 = load i32* %1
  ret i32 %31
}

; Function Attrs: nounwind uwtable
define internal i32 @ucvector_resizev(%struct.ucvector* %p, i64 %size, i8 zeroext %value) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.ucvector*, align 8
  %3 = alloca i64, align 8
  %4 = alloca i8, align 1
  %oldsize = alloca i64, align 8
  %i = alloca i64, align 8
  store %struct.ucvector* %p, %struct.ucvector** %2, align 8
  store i64 %size, i64* %3, align 8
  store i8 %value, i8* %4, align 1
  %5 = load %struct.ucvector** %2, align 8
  %6 = getelementptr inbounds %struct.ucvector* %5, i32 0, i32 1
  %7 = load i64* %6, align 8
  store i64 %7, i64* %oldsize, align 8
  %8 = load %struct.ucvector** %2, align 8
  %9 = load i64* %3, align 8
  %10 = call i32 @ucvector_resize(%struct.ucvector* %8, i64 %9)
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %13, label %12

; <label>:12                                      ; preds = %0
  store i32 0, i32* %1
  br label %30

; <label>:13                                      ; preds = %0
  %14 = load i64* %oldsize, align 8
  store i64 %14, i64* %i, align 8
  br label %15

; <label>:15                                      ; preds = %26, %13
  %16 = load i64* %i, align 8
  %17 = load i64* %3, align 8
  %18 = icmp ult i64 %16, %17
  br i1 %18, label %19, label %29

; <label>:19                                      ; preds = %15
  %20 = load i8* %4, align 1
  %21 = load i64* %i, align 8
  %22 = load %struct.ucvector** %2, align 8
  %23 = getelementptr inbounds %struct.ucvector* %22, i32 0, i32 0
  %24 = load i8** %23, align 8
  %25 = getelementptr inbounds i8* %24, i64 %21
  store i8 %20, i8* %25, align 1
  br label %26

; <label>:26                                      ; preds = %19
  %27 = load i64* %i, align 8
  %28 = add i64 %27, 1
  store i64 %28, i64* %i, align 8
  br label %15

; <label>:29                                      ; preds = %15
  store i32 1, i32* %1
  br label %30

; <label>:30                                      ; preds = %29, %12
  %31 = load i32* %1
  ret i32 %31
}

; Function Attrs: nounwind uwtable
define internal i32 @postProcessScanlines(i8* %out, i8* %in, i32 %w, i32 %h, %struct.LodePNGInfo* %info_png) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca %struct.LodePNGInfo*, align 8
  %bpp = alloca i32, align 4
  %error = alloca i32, align 4
  %error1 = alloca i32, align 4
  %passw = alloca [7 x i32], align 16
  %passh = alloca [7 x i32], align 16
  %filter_passstart = alloca [8 x i64], align 16
  %padded_passstart = alloca [8 x i64], align 16
  %passstart = alloca [8 x i64], align 16
  %i = alloca i32, align 4
  %error2 = alloca i32, align 4
  store i8* %out, i8** %2, align 8
  store i8* %in, i8** %3, align 8
  store i32 %w, i32* %4, align 4
  store i32 %h, i32* %5, align 4
  store %struct.LodePNGInfo* %info_png, %struct.LodePNGInfo** %6, align 8
  %7 = load %struct.LodePNGInfo** %6, align 8
  %8 = getelementptr inbounds %struct.LodePNGInfo* %7, i32 0, i32 3
  %9 = call i32 @lodepng_get_bpp(%struct.LodePNGColorMode* %8)
  store i32 %9, i32* %bpp, align 4
  %10 = load i32* %bpp, align 4
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %0
  store i32 31, i32* %1
  br label %158

; <label>:13                                      ; preds = %0
  %14 = load %struct.LodePNGInfo** %6, align 8
  %15 = getelementptr inbounds %struct.LodePNGInfo* %14, i32 0, i32 2
  %16 = load i32* %15, align 4
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %71

; <label>:18                                      ; preds = %13
  %19 = load i32* %bpp, align 4
  %20 = icmp ult i32 %19, 8
  br i1 %20, label %21, label %58

; <label>:21                                      ; preds = %18
  %22 = load i32* %4, align 4
  %23 = load i32* %bpp, align 4
  %24 = mul i32 %22, %23
  %25 = load i32* %4, align 4
  %26 = load i32* %bpp, align 4
  %27 = mul i32 %25, %26
  %28 = add i32 %27, 7
  %29 = udiv i32 %28, 8
  %30 = mul i32 %29, 8
  %31 = icmp ne i32 %24, %30
  br i1 %31, label %32, label %58

; <label>:32                                      ; preds = %21
  %33 = load i8** %3, align 8
  %34 = load i8** %3, align 8
  %35 = load i32* %4, align 4
  %36 = load i32* %5, align 4
  %37 = load i32* %bpp, align 4
  %38 = call i32 @unfilter(i8* %33, i8* %34, i32 %35, i32 %36, i32 %37)
  store i32 %38, i32* %error, align 4
  %39 = load i32* %error, align 4
  %40 = icmp ne i32 %39, 0
  br i1 %40, label %41, label %43

; <label>:41                                      ; preds = %32
  %42 = load i32* %error, align 4
  store i32 %42, i32* %1
  br label %158

; <label>:43                                      ; preds = %32
  %44 = load i8** %2, align 8
  %45 = load i8** %3, align 8
  %46 = load i32* %4, align 4
  %47 = load i32* %bpp, align 4
  %48 = mul i32 %46, %47
  %49 = zext i32 %48 to i64
  %50 = load i32* %4, align 4
  %51 = load i32* %bpp, align 4
  %52 = mul i32 %50, %51
  %53 = add i32 %52, 7
  %54 = udiv i32 %53, 8
  %55 = mul i32 %54, 8
  %56 = zext i32 %55 to i64
  %57 = load i32* %5, align 4
  call void @removePaddingBits(i8* %44, i8* %45, i64 %49, i64 %56, i32 %57)
  br label %70

; <label>:58                                      ; preds = %21, %18
  %59 = load i8** %2, align 8
  %60 = load i8** %3, align 8
  %61 = load i32* %4, align 4
  %62 = load i32* %5, align 4
  %63 = load i32* %bpp, align 4
  %64 = call i32 @unfilter(i8* %59, i8* %60, i32 %61, i32 %62, i32 %63)
  store i32 %64, i32* %error1, align 4
  %65 = load i32* %error1, align 4
  %66 = icmp ne i32 %65, 0
  br i1 %66, label %67, label %69

; <label>:67                                      ; preds = %58
  %68 = load i32* %error1, align 4
  store i32 %68, i32* %1
  br label %158

; <label>:69                                      ; preds = %58
  br label %70

; <label>:70                                      ; preds = %69, %43
  br label %157

; <label>:71                                      ; preds = %13
  %72 = getelementptr inbounds [7 x i32]* %passw, i32 0, i32 0
  %73 = getelementptr inbounds [7 x i32]* %passh, i32 0, i32 0
  %74 = getelementptr inbounds [8 x i64]* %filter_passstart, i32 0, i32 0
  %75 = getelementptr inbounds [8 x i64]* %padded_passstart, i32 0, i32 0
  %76 = getelementptr inbounds [8 x i64]* %passstart, i32 0, i32 0
  %77 = load i32* %4, align 4
  %78 = load i32* %5, align 4
  %79 = load i32* %bpp, align 4
  call void @Adam7_getpassvalues(i32* %72, i32* %73, i64* %74, i64* %75, i64* %76, i32 %77, i32 %78, i32 %79)
  store i32 0, i32* %i, align 4
  br label %80

; <label>:80                                      ; preds = %148, %71
  %81 = load i32* %i, align 4
  %82 = icmp ult i32 %81, 7
  br i1 %82, label %83, label %151

; <label>:83                                      ; preds = %80
  %84 = load i32* %i, align 4
  %85 = zext i32 %84 to i64
  %86 = getelementptr inbounds [8 x i64]* %padded_passstart, i32 0, i64 %85
  %87 = load i64* %86, align 8
  %88 = load i8** %3, align 8
  %89 = getelementptr inbounds i8* %88, i64 %87
  %90 = load i32* %i, align 4
  %91 = zext i32 %90 to i64
  %92 = getelementptr inbounds [8 x i64]* %filter_passstart, i32 0, i64 %91
  %93 = load i64* %92, align 8
  %94 = load i8** %3, align 8
  %95 = getelementptr inbounds i8* %94, i64 %93
  %96 = load i32* %i, align 4
  %97 = zext i32 %96 to i64
  %98 = getelementptr inbounds [7 x i32]* %passw, i32 0, i64 %97
  %99 = load i32* %98, align 4
  %100 = load i32* %i, align 4
  %101 = zext i32 %100 to i64
  %102 = getelementptr inbounds [7 x i32]* %passh, i32 0, i64 %101
  %103 = load i32* %102, align 4
  %104 = load i32* %bpp, align 4
  %105 = call i32 @unfilter(i8* %89, i8* %95, i32 %99, i32 %103, i32 %104)
  store i32 %105, i32* %error2, align 4
  %106 = load i32* %error2, align 4
  %107 = icmp ne i32 %106, 0
  br i1 %107, label %108, label %110

; <label>:108                                     ; preds = %83
  %109 = load i32* %error2, align 4
  store i32 %109, i32* %1
  br label %158

; <label>:110                                     ; preds = %83
  %111 = load i32* %bpp, align 4
  %112 = icmp ult i32 %111, 8
  br i1 %112, label %113, label %147

; <label>:113                                     ; preds = %110
  %114 = load i32* %i, align 4
  %115 = zext i32 %114 to i64
  %116 = getelementptr inbounds [8 x i64]* %passstart, i32 0, i64 %115
  %117 = load i64* %116, align 8
  %118 = load i8** %3, align 8
  %119 = getelementptr inbounds i8* %118, i64 %117
  %120 = load i32* %i, align 4
  %121 = zext i32 %120 to i64
  %122 = getelementptr inbounds [8 x i64]* %padded_passstart, i32 0, i64 %121
  %123 = load i64* %122, align 8
  %124 = load i8** %3, align 8
  %125 = getelementptr inbounds i8* %124, i64 %123
  %126 = load i32* %i, align 4
  %127 = zext i32 %126 to i64
  %128 = getelementptr inbounds [7 x i32]* %passw, i32 0, i64 %127
  %129 = load i32* %128, align 4
  %130 = load i32* %bpp, align 4
  %131 = mul i32 %129, %130
  %132 = zext i32 %131 to i64
  %133 = load i32* %i, align 4
  %134 = zext i32 %133 to i64
  %135 = getelementptr inbounds [7 x i32]* %passw, i32 0, i64 %134
  %136 = load i32* %135, align 4
  %137 = load i32* %bpp, align 4
  %138 = mul i32 %136, %137
  %139 = add i32 %138, 7
  %140 = udiv i32 %139, 8
  %141 = mul i32 %140, 8
  %142 = zext i32 %141 to i64
  %143 = load i32* %i, align 4
  %144 = zext i32 %143 to i64
  %145 = getelementptr inbounds [7 x i32]* %passh, i32 0, i64 %144
  %146 = load i32* %145, align 4
  call void @removePaddingBits(i8* %119, i8* %125, i64 %132, i64 %142, i32 %146)
  br label %147

; <label>:147                                     ; preds = %113, %110
  br label %148

; <label>:148                                     ; preds = %147
  %149 = load i32* %i, align 4
  %150 = add i32 %149, 1
  store i32 %150, i32* %i, align 4
  br label %80

; <label>:151                                     ; preds = %80
  %152 = load i8** %2, align 8
  %153 = load i8** %3, align 8
  %154 = load i32* %4, align 4
  %155 = load i32* %5, align 4
  %156 = load i32* %bpp, align 4
  call void @Adam7_deinterlace(i8* %152, i8* %153, i32 %154, i32 %155, i32 %156)
  br label %157

; <label>:157                                     ; preds = %151, %70
  store i32 0, i32* %1
  br label %158

; <label>:158                                     ; preds = %157, %108, %67, %41, %12
  %159 = load i32* %1
  ret i32 %159
}

; Function Attrs: nounwind uwtable
define internal i32 @unfilter(i8* %out, i8* %in, i32 %w, i32 %h, i32 %bpp) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %y = alloca i32, align 4
  %prevline = alloca i8*, align 8
  %bytewidth = alloca i64, align 8
  %linebytes = alloca i64, align 8
  %outindex = alloca i64, align 8
  %inindex = alloca i64, align 8
  %filterType = alloca i8, align 1
  %error = alloca i32, align 4
  store i8* %out, i8** %2, align 8
  store i8* %in, i8** %3, align 8
  store i32 %w, i32* %4, align 4
  store i32 %h, i32* %5, align 4
  store i32 %bpp, i32* %6, align 4
  store i8* null, i8** %prevline, align 8
  %7 = load i32* %6, align 4
  %8 = add i32 %7, 7
  %9 = udiv i32 %8, 8
  %10 = zext i32 %9 to i64
  store i64 %10, i64* %bytewidth, align 8
  %11 = load i32* %4, align 4
  %12 = load i32* %6, align 4
  %13 = mul i32 %11, %12
  %14 = add i32 %13, 7
  %15 = udiv i32 %14, 8
  %16 = zext i32 %15 to i64
  store i64 %16, i64* %linebytes, align 8
  store i32 0, i32* %y, align 4
  br label %17

; <label>:17                                      ; preds = %55, %0
  %18 = load i32* %y, align 4
  %19 = load i32* %5, align 4
  %20 = icmp ult i32 %18, %19
  br i1 %20, label %21, label %58

; <label>:21                                      ; preds = %17
  %22 = load i64* %linebytes, align 8
  %23 = load i32* %y, align 4
  %24 = zext i32 %23 to i64
  %25 = mul i64 %22, %24
  store i64 %25, i64* %outindex, align 8
  %26 = load i64* %linebytes, align 8
  %27 = add i64 1, %26
  %28 = load i32* %y, align 4
  %29 = zext i32 %28 to i64
  %30 = mul i64 %27, %29
  store i64 %30, i64* %inindex, align 8
  %31 = load i64* %inindex, align 8
  %32 = load i8** %3, align 8
  %33 = getelementptr inbounds i8* %32, i64 %31
  %34 = load i8* %33, align 1
  store i8 %34, i8* %filterType, align 1
  %35 = load i64* %outindex, align 8
  %36 = load i8** %2, align 8
  %37 = getelementptr inbounds i8* %36, i64 %35
  %38 = load i64* %inindex, align 8
  %39 = add i64 %38, 1
  %40 = load i8** %3, align 8
  %41 = getelementptr inbounds i8* %40, i64 %39
  %42 = load i8** %prevline, align 8
  %43 = load i64* %bytewidth, align 8
  %44 = load i8* %filterType, align 1
  %45 = load i64* %linebytes, align 8
  %46 = call i32 @unfilterScanline(i8* %37, i8* %41, i8* %42, i64 %43, i8 zeroext %44, i64 %45)
  store i32 %46, i32* %error, align 4
  %47 = load i32* %error, align 4
  %48 = icmp ne i32 %47, 0
  br i1 %48, label %49, label %51

; <label>:49                                      ; preds = %21
  %50 = load i32* %error, align 4
  store i32 %50, i32* %1
  br label %59

; <label>:51                                      ; preds = %21
  %52 = load i64* %outindex, align 8
  %53 = load i8** %2, align 8
  %54 = getelementptr inbounds i8* %53, i64 %52
  store i8* %54, i8** %prevline, align 8
  br label %55

; <label>:55                                      ; preds = %51
  %56 = load i32* %y, align 4
  %57 = add i32 %56, 1
  store i32 %57, i32* %y, align 4
  br label %17

; <label>:58                                      ; preds = %17
  store i32 0, i32* %1
  br label %59

; <label>:59                                      ; preds = %58, %49
  %60 = load i32* %1
  ret i32 %60
}

; Function Attrs: nounwind uwtable
define internal void @removePaddingBits(i8* %out, i8* %in, i64 %olinebits, i64 %ilinebits, i32 %h) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca i32, align 4
  %y = alloca i32, align 4
  %diff = alloca i64, align 8
  %ibp = alloca i64, align 8
  %obp = alloca i64, align 8
  %x = alloca i64, align 8
  %bit = alloca i8, align 1
  store i8* %out, i8** %1, align 8
  store i8* %in, i8** %2, align 8
  store i64 %olinebits, i64* %3, align 8
  store i64 %ilinebits, i64* %4, align 8
  store i32 %h, i32* %5, align 4
  %6 = load i64* %4, align 8
  %7 = load i64* %3, align 8
  %8 = sub i64 %6, %7
  store i64 %8, i64* %diff, align 8
  store i64 0, i64* %ibp, align 8
  store i64 0, i64* %obp, align 8
  store i32 0, i32* %y, align 4
  br label %9

; <label>:9                                       ; preds = %30, %0
  %10 = load i32* %y, align 4
  %11 = load i32* %5, align 4
  %12 = icmp ult i32 %10, %11
  br i1 %12, label %13, label %33

; <label>:13                                      ; preds = %9
  store i64 0, i64* %x, align 8
  br label %14

; <label>:14                                      ; preds = %23, %13
  %15 = load i64* %x, align 8
  %16 = load i64* %3, align 8
  %17 = icmp ult i64 %15, %16
  br i1 %17, label %18, label %26

; <label>:18                                      ; preds = %14
  %19 = load i8** %2, align 8
  %20 = call zeroext i8 @readBitFromReversedStream(i64* %ibp, i8* %19)
  store i8 %20, i8* %bit, align 1
  %21 = load i8** %1, align 8
  %22 = load i8* %bit, align 1
  call void @setBitOfReversedStream(i64* %obp, i8* %21, i8 zeroext %22)
  br label %23

; <label>:23                                      ; preds = %18
  %24 = load i64* %x, align 8
  %25 = add i64 %24, 1
  store i64 %25, i64* %x, align 8
  br label %14

; <label>:26                                      ; preds = %14
  %27 = load i64* %diff, align 8
  %28 = load i64* %ibp, align 8
  %29 = add i64 %28, %27
  store i64 %29, i64* %ibp, align 8
  br label %30

; <label>:30                                      ; preds = %26
  %31 = load i32* %y, align 4
  %32 = add i32 %31, 1
  store i32 %32, i32* %y, align 4
  br label %9

; <label>:33                                      ; preds = %9
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @Adam7_deinterlace(i8* %out, i8* %in, i32 %w, i32 %h, i32 %bpp) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %passw = alloca [7 x i32], align 16
  %passh = alloca [7 x i32], align 16
  %filter_passstart = alloca [8 x i64], align 16
  %padded_passstart = alloca [8 x i64], align 16
  %passstart = alloca [8 x i64], align 16
  %i = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %b = alloca i32, align 4
  %bytewidth = alloca i64, align 8
  %pixelinstart = alloca i64, align 8
  %pixeloutstart = alloca i64, align 8
  %x1 = alloca i32, align 4
  %y2 = alloca i32, align 4
  %b3 = alloca i32, align 4
  %ilinebits = alloca i32, align 4
  %olinebits = alloca i32, align 4
  %obp = alloca i64, align 8
  %ibp = alloca i64, align 8
  %bit = alloca i8, align 1
  store i8* %out, i8** %1, align 8
  store i8* %in, i8** %2, align 8
  store i32 %w, i32* %3, align 4
  store i32 %h, i32* %4, align 4
  store i32 %bpp, i32* %5, align 4
  %6 = getelementptr inbounds [7 x i32]* %passw, i32 0, i32 0
  %7 = getelementptr inbounds [7 x i32]* %passh, i32 0, i32 0
  %8 = getelementptr inbounds [8 x i64]* %filter_passstart, i32 0, i32 0
  %9 = getelementptr inbounds [8 x i64]* %padded_passstart, i32 0, i32 0
  %10 = getelementptr inbounds [8 x i64]* %passstart, i32 0, i32 0
  %11 = load i32* %3, align 4
  %12 = load i32* %4, align 4
  %13 = load i32* %5, align 4
  call void @Adam7_getpassvalues(i32* %6, i32* %7, i64* %8, i64* %9, i64* %10, i32 %11, i32 %12, i32 %13)
  %14 = load i32* %5, align 4
  %15 = icmp uge i32 %14, 8
  br i1 %15, label %16, label %119

; <label>:16                                      ; preds = %0
  store i32 0, i32* %i, align 4
  br label %17

; <label>:17                                      ; preds = %115, %16
  %18 = load i32* %i, align 4
  %19 = icmp ult i32 %18, 7
  br i1 %19, label %20, label %118

; <label>:20                                      ; preds = %17
  %21 = load i32* %5, align 4
  %22 = udiv i32 %21, 8
  %23 = zext i32 %22 to i64
  store i64 %23, i64* %bytewidth, align 8
  store i32 0, i32* %y, align 4
  br label %24

; <label>:24                                      ; preds = %111, %20
  %25 = load i32* %y, align 4
  %26 = load i32* %i, align 4
  %27 = zext i32 %26 to i64
  %28 = getelementptr inbounds [7 x i32]* %passh, i32 0, i64 %27
  %29 = load i32* %28, align 4
  %30 = icmp ult i32 %25, %29
  br i1 %30, label %31, label %114

; <label>:31                                      ; preds = %24
  store i32 0, i32* %x, align 4
  br label %32

; <label>:32                                      ; preds = %107, %31
  %33 = load i32* %x, align 4
  %34 = load i32* %i, align 4
  %35 = zext i32 %34 to i64
  %36 = getelementptr inbounds [7 x i32]* %passw, i32 0, i64 %35
  %37 = load i32* %36, align 4
  %38 = icmp ult i32 %33, %37
  br i1 %38, label %39, label %110

; <label>:39                                      ; preds = %32
  %40 = load i32* %i, align 4
  %41 = zext i32 %40 to i64
  %42 = getelementptr inbounds [8 x i64]* %passstart, i32 0, i64 %41
  %43 = load i64* %42, align 8
  %44 = load i32* %y, align 4
  %45 = load i32* %i, align 4
  %46 = zext i32 %45 to i64
  %47 = getelementptr inbounds [7 x i32]* %passw, i32 0, i64 %46
  %48 = load i32* %47, align 4
  %49 = mul i32 %44, %48
  %50 = load i32* %x, align 4
  %51 = add i32 %49, %50
  %52 = zext i32 %51 to i64
  %53 = load i64* %bytewidth, align 8
  %54 = mul i64 %52, %53
  %55 = add i64 %43, %54
  store i64 %55, i64* %pixelinstart, align 8
  %56 = load i32* %i, align 4
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds [7 x i32]* @ADAM7_IY, i32 0, i64 %57
  %59 = load i32* %58, align 4
  %60 = load i32* %y, align 4
  %61 = load i32* %i, align 4
  %62 = zext i32 %61 to i64
  %63 = getelementptr inbounds [7 x i32]* @ADAM7_DY, i32 0, i64 %62
  %64 = load i32* %63, align 4
  %65 = mul i32 %60, %64
  %66 = add i32 %59, %65
  %67 = load i32* %3, align 4
  %68 = mul i32 %66, %67
  %69 = load i32* %i, align 4
  %70 = zext i32 %69 to i64
  %71 = getelementptr inbounds [7 x i32]* @ADAM7_IX, i32 0, i64 %70
  %72 = load i32* %71, align 4
  %73 = add i32 %68, %72
  %74 = load i32* %x, align 4
  %75 = load i32* %i, align 4
  %76 = zext i32 %75 to i64
  %77 = getelementptr inbounds [7 x i32]* @ADAM7_DX, i32 0, i64 %76
  %78 = load i32* %77, align 4
  %79 = mul i32 %74, %78
  %80 = add i32 %73, %79
  %81 = zext i32 %80 to i64
  %82 = load i64* %bytewidth, align 8
  %83 = mul i64 %81, %82
  store i64 %83, i64* %pixeloutstart, align 8
  store i32 0, i32* %b, align 4
  br label %84

; <label>:84                                      ; preds = %103, %39
  %85 = load i32* %b, align 4
  %86 = zext i32 %85 to i64
  %87 = load i64* %bytewidth, align 8
  %88 = icmp ult i64 %86, %87
  br i1 %88, label %89, label %106

; <label>:89                                      ; preds = %84
  %90 = load i64* %pixelinstart, align 8
  %91 = load i32* %b, align 4
  %92 = zext i32 %91 to i64
  %93 = add i64 %90, %92
  %94 = load i8** %2, align 8
  %95 = getelementptr inbounds i8* %94, i64 %93
  %96 = load i8* %95, align 1
  %97 = load i64* %pixeloutstart, align 8
  %98 = load i32* %b, align 4
  %99 = zext i32 %98 to i64
  %100 = add i64 %97, %99
  %101 = load i8** %1, align 8
  %102 = getelementptr inbounds i8* %101, i64 %100
  store i8 %96, i8* %102, align 1
  br label %103

; <label>:103                                     ; preds = %89
  %104 = load i32* %b, align 4
  %105 = add i32 %104, 1
  store i32 %105, i32* %b, align 4
  br label %84

; <label>:106                                     ; preds = %84
  br label %107

; <label>:107                                     ; preds = %106
  %108 = load i32* %x, align 4
  %109 = add i32 %108, 1
  store i32 %109, i32* %x, align 4
  br label %32

; <label>:110                                     ; preds = %32
  br label %111

; <label>:111                                     ; preds = %110
  %112 = load i32* %y, align 4
  %113 = add i32 %112, 1
  store i32 %113, i32* %y, align 4
  br label %24

; <label>:114                                     ; preds = %24
  br label %115

; <label>:115                                     ; preds = %114
  %116 = load i32* %i, align 4
  %117 = add i32 %116, 1
  store i32 %117, i32* %i, align 4
  br label %17

; <label>:118                                     ; preds = %17
  br label %216

; <label>:119                                     ; preds = %0
  store i32 0, i32* %i, align 4
  br label %120

; <label>:120                                     ; preds = %212, %119
  %121 = load i32* %i, align 4
  %122 = icmp ult i32 %121, 7
  br i1 %122, label %123, label %215

; <label>:123                                     ; preds = %120
  %124 = load i32* %5, align 4
  %125 = load i32* %i, align 4
  %126 = zext i32 %125 to i64
  %127 = getelementptr inbounds [7 x i32]* %passw, i32 0, i64 %126
  %128 = load i32* %127, align 4
  %129 = mul i32 %124, %128
  store i32 %129, i32* %ilinebits, align 4
  %130 = load i32* %5, align 4
  %131 = load i32* %3, align 4
  %132 = mul i32 %130, %131
  store i32 %132, i32* %olinebits, align 4
  store i32 0, i32* %y2, align 4
  br label %133

; <label>:133                                     ; preds = %208, %123
  %134 = load i32* %y2, align 4
  %135 = load i32* %i, align 4
  %136 = zext i32 %135 to i64
  %137 = getelementptr inbounds [7 x i32]* %passh, i32 0, i64 %136
  %138 = load i32* %137, align 4
  %139 = icmp ult i32 %134, %138
  br i1 %139, label %140, label %211

; <label>:140                                     ; preds = %133
  store i32 0, i32* %x1, align 4
  br label %141

; <label>:141                                     ; preds = %204, %140
  %142 = load i32* %x1, align 4
  %143 = load i32* %i, align 4
  %144 = zext i32 %143 to i64
  %145 = getelementptr inbounds [7 x i32]* %passw, i32 0, i64 %144
  %146 = load i32* %145, align 4
  %147 = icmp ult i32 %142, %146
  br i1 %147, label %148, label %207

; <label>:148                                     ; preds = %141
  %149 = load i32* %i, align 4
  %150 = zext i32 %149 to i64
  %151 = getelementptr inbounds [8 x i64]* %passstart, i32 0, i64 %150
  %152 = load i64* %151, align 8
  %153 = mul i64 8, %152
  %154 = load i32* %y2, align 4
  %155 = load i32* %ilinebits, align 4
  %156 = mul i32 %154, %155
  %157 = load i32* %x1, align 4
  %158 = load i32* %5, align 4
  %159 = mul i32 %157, %158
  %160 = add i32 %156, %159
  %161 = zext i32 %160 to i64
  %162 = add i64 %153, %161
  store i64 %162, i64* %ibp, align 8
  %163 = load i32* %i, align 4
  %164 = zext i32 %163 to i64
  %165 = getelementptr inbounds [7 x i32]* @ADAM7_IY, i32 0, i64 %164
  %166 = load i32* %165, align 4
  %167 = load i32* %y2, align 4
  %168 = load i32* %i, align 4
  %169 = zext i32 %168 to i64
  %170 = getelementptr inbounds [7 x i32]* @ADAM7_DY, i32 0, i64 %169
  %171 = load i32* %170, align 4
  %172 = mul i32 %167, %171
  %173 = add i32 %166, %172
  %174 = load i32* %olinebits, align 4
  %175 = mul i32 %173, %174
  %176 = load i32* %i, align 4
  %177 = zext i32 %176 to i64
  %178 = getelementptr inbounds [7 x i32]* @ADAM7_IX, i32 0, i64 %177
  %179 = load i32* %178, align 4
  %180 = load i32* %x1, align 4
  %181 = load i32* %i, align 4
  %182 = zext i32 %181 to i64
  %183 = getelementptr inbounds [7 x i32]* @ADAM7_DX, i32 0, i64 %182
  %184 = load i32* %183, align 4
  %185 = mul i32 %180, %184
  %186 = add i32 %179, %185
  %187 = load i32* %5, align 4
  %188 = mul i32 %186, %187
  %189 = add i32 %175, %188
  %190 = zext i32 %189 to i64
  store i64 %190, i64* %obp, align 8
  store i32 0, i32* %b3, align 4
  br label %191

; <label>:191                                     ; preds = %200, %148
  %192 = load i32* %b3, align 4
  %193 = load i32* %5, align 4
  %194 = icmp ult i32 %192, %193
  br i1 %194, label %195, label %203

; <label>:195                                     ; preds = %191
  %196 = load i8** %2, align 8
  %197 = call zeroext i8 @readBitFromReversedStream(i64* %ibp, i8* %196)
  store i8 %197, i8* %bit, align 1
  %198 = load i8** %1, align 8
  %199 = load i8* %bit, align 1
  call void @setBitOfReversedStream0(i64* %obp, i8* %198, i8 zeroext %199)
  br label %200

; <label>:200                                     ; preds = %195
  %201 = load i32* %b3, align 4
  %202 = add i32 %201, 1
  store i32 %202, i32* %b3, align 4
  br label %191

; <label>:203                                     ; preds = %191
  br label %204

; <label>:204                                     ; preds = %203
  %205 = load i32* %x1, align 4
  %206 = add i32 %205, 1
  store i32 %206, i32* %x1, align 4
  br label %141

; <label>:207                                     ; preds = %141
  br label %208

; <label>:208                                     ; preds = %207
  %209 = load i32* %y2, align 4
  %210 = add i32 %209, 1
  store i32 %210, i32* %y2, align 4
  br label %133

; <label>:211                                     ; preds = %133
  br label %212

; <label>:212                                     ; preds = %211
  %213 = load i32* %i, align 4
  %214 = add i32 %213, 1
  store i32 %214, i32* %i, align 4
  br label %120

; <label>:215                                     ; preds = %120
  br label %216

; <label>:216                                     ; preds = %215, %118
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @setBitOfReversedStream0(i64* %bitpointer, i8* %bitstream, i8 zeroext %bit) #0 {
  %1 = alloca i64*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i8, align 1
  store i64* %bitpointer, i64** %1, align 8
  store i8* %bitstream, i8** %2, align 8
  store i8 %bit, i8* %3, align 1
  %4 = load i8* %3, align 1
  %5 = icmp ne i8 %4, 0
  br i1 %5, label %6, label %24

; <label>:6                                       ; preds = %0
  %7 = load i8* %3, align 1
  %8 = zext i8 %7 to i32
  %9 = load i64** %1, align 8
  %10 = load i64* %9, align 8
  %11 = and i64 %10, 7
  %12 = sub i64 7, %11
  %13 = trunc i64 %12 to i32
  %14 = shl i32 %8, %13
  %15 = load i64** %1, align 8
  %16 = load i64* %15, align 8
  %17 = lshr i64 %16, 3
  %18 = load i8** %2, align 8
  %19 = getelementptr inbounds i8* %18, i64 %17
  %20 = load i8* %19, align 1
  %21 = zext i8 %20 to i32
  %22 = or i32 %21, %14
  %23 = trunc i32 %22 to i8
  store i8 %23, i8* %19, align 1
  br label %24

; <label>:24                                      ; preds = %6, %0
  %25 = load i64** %1, align 8
  %26 = load i64* %25, align 8
  %27 = add i64 %26, 1
  store i64 %27, i64* %25, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define internal i32 @unfilterScanline(i8* %recon, i8* %scanline, i8* %precon, i64 %bytewidth, i8 zeroext %filterType, i64 %length) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i64, align 8
  %6 = alloca i8, align 1
  %7 = alloca i64, align 8
  %i = alloca i64, align 8
  store i8* %recon, i8** %2, align 8
  store i8* %scanline, i8** %3, align 8
  store i8* %precon, i8** %4, align 8
  store i64 %bytewidth, i64* %5, align 8
  store i8 %filterType, i8* %6, align 1
  store i64 %length, i64* %7, align 8
  %8 = load i8* %6, align 1
  %9 = zext i8 %8 to i32
  switch i32 %9, label %340 [
    i32 0, label %10
    i32 1, label %27
    i32 2, label %71
    i32 3, label %117
    i32 4, label %226
  ]

; <label>:10                                      ; preds = %0
  store i64 0, i64* %i, align 8
  br label %11

; <label>:11                                      ; preds = %23, %10
  %12 = load i64* %i, align 8
  %13 = load i64* %7, align 8
  %14 = icmp ult i64 %12, %13
  br i1 %14, label %15, label %26

; <label>:15                                      ; preds = %11
  %16 = load i64* %i, align 8
  %17 = load i8** %3, align 8
  %18 = getelementptr inbounds i8* %17, i64 %16
  %19 = load i8* %18, align 1
  %20 = load i64* %i, align 8
  %21 = load i8** %2, align 8
  %22 = getelementptr inbounds i8* %21, i64 %20
  store i8 %19, i8* %22, align 1
  br label %23

; <label>:23                                      ; preds = %15
  %24 = load i64* %i, align 8
  %25 = add i64 %24, 1
  store i64 %25, i64* %i, align 8
  br label %11

; <label>:26                                      ; preds = %11
  br label %341

; <label>:27                                      ; preds = %0
  store i64 0, i64* %i, align 8
  br label %28

; <label>:28                                      ; preds = %40, %27
  %29 = load i64* %i, align 8
  %30 = load i64* %5, align 8
  %31 = icmp ult i64 %29, %30
  br i1 %31, label %32, label %43

; <label>:32                                      ; preds = %28
  %33 = load i64* %i, align 8
  %34 = load i8** %3, align 8
  %35 = getelementptr inbounds i8* %34, i64 %33
  %36 = load i8* %35, align 1
  %37 = load i64* %i, align 8
  %38 = load i8** %2, align 8
  %39 = getelementptr inbounds i8* %38, i64 %37
  store i8 %36, i8* %39, align 1
  br label %40

; <label>:40                                      ; preds = %32
  %41 = load i64* %i, align 8
  %42 = add i64 %41, 1
  store i64 %42, i64* %i, align 8
  br label %28

; <label>:43                                      ; preds = %28
  %44 = load i64* %5, align 8
  store i64 %44, i64* %i, align 8
  br label %45

; <label>:45                                      ; preds = %67, %43
  %46 = load i64* %i, align 8
  %47 = load i64* %7, align 8
  %48 = icmp ult i64 %46, %47
  br i1 %48, label %49, label %70

; <label>:49                                      ; preds = %45
  %50 = load i64* %i, align 8
  %51 = load i8** %3, align 8
  %52 = getelementptr inbounds i8* %51, i64 %50
  %53 = load i8* %52, align 1
  %54 = zext i8 %53 to i32
  %55 = load i64* %i, align 8
  %56 = load i64* %5, align 8
  %57 = sub i64 %55, %56
  %58 = load i8** %2, align 8
  %59 = getelementptr inbounds i8* %58, i64 %57
  %60 = load i8* %59, align 1
  %61 = zext i8 %60 to i32
  %62 = add nsw i32 %54, %61
  %63 = trunc i32 %62 to i8
  %64 = load i64* %i, align 8
  %65 = load i8** %2, align 8
  %66 = getelementptr inbounds i8* %65, i64 %64
  store i8 %63, i8* %66, align 1
  br label %67

; <label>:67                                      ; preds = %49
  %68 = load i64* %i, align 8
  %69 = add i64 %68, 1
  store i64 %69, i64* %i, align 8
  br label %45

; <label>:70                                      ; preds = %45
  br label %341

; <label>:71                                      ; preds = %0
  %72 = load i8** %4, align 8
  %73 = icmp ne i8* %72, null
  br i1 %73, label %74, label %99

; <label>:74                                      ; preds = %71
  store i64 0, i64* %i, align 8
  br label %75

; <label>:75                                      ; preds = %95, %74
  %76 = load i64* %i, align 8
  %77 = load i64* %7, align 8
  %78 = icmp ult i64 %76, %77
  br i1 %78, label %79, label %98

; <label>:79                                      ; preds = %75
  %80 = load i64* %i, align 8
  %81 = load i8** %3, align 8
  %82 = getelementptr inbounds i8* %81, i64 %80
  %83 = load i8* %82, align 1
  %84 = zext i8 %83 to i32
  %85 = load i64* %i, align 8
  %86 = load i8** %4, align 8
  %87 = getelementptr inbounds i8* %86, i64 %85
  %88 = load i8* %87, align 1
  %89 = zext i8 %88 to i32
  %90 = add nsw i32 %84, %89
  %91 = trunc i32 %90 to i8
  %92 = load i64* %i, align 8
  %93 = load i8** %2, align 8
  %94 = getelementptr inbounds i8* %93, i64 %92
  store i8 %91, i8* %94, align 1
  br label %95

; <label>:95                                      ; preds = %79
  %96 = load i64* %i, align 8
  %97 = add i64 %96, 1
  store i64 %97, i64* %i, align 8
  br label %75

; <label>:98                                      ; preds = %75
  br label %116

; <label>:99                                      ; preds = %71
  store i64 0, i64* %i, align 8
  br label %100

; <label>:100                                     ; preds = %112, %99
  %101 = load i64* %i, align 8
  %102 = load i64* %7, align 8
  %103 = icmp ult i64 %101, %102
  br i1 %103, label %104, label %115

; <label>:104                                     ; preds = %100
  %105 = load i64* %i, align 8
  %106 = load i8** %3, align 8
  %107 = getelementptr inbounds i8* %106, i64 %105
  %108 = load i8* %107, align 1
  %109 = load i64* %i, align 8
  %110 = load i8** %2, align 8
  %111 = getelementptr inbounds i8* %110, i64 %109
  store i8 %108, i8* %111, align 1
  br label %112

; <label>:112                                     ; preds = %104
  %113 = load i64* %i, align 8
  %114 = add i64 %113, 1
  store i64 %114, i64* %i, align 8
  br label %100

; <label>:115                                     ; preds = %100
  br label %116

; <label>:116                                     ; preds = %115, %98
  br label %341

; <label>:117                                     ; preds = %0
  %118 = load i8** %4, align 8
  %119 = icmp ne i8* %118, null
  br i1 %119, label %120, label %180

; <label>:120                                     ; preds = %117
  store i64 0, i64* %i, align 8
  br label %121

; <label>:121                                     ; preds = %142, %120
  %122 = load i64* %i, align 8
  %123 = load i64* %5, align 8
  %124 = icmp ult i64 %122, %123
  br i1 %124, label %125, label %145

; <label>:125                                     ; preds = %121
  %126 = load i64* %i, align 8
  %127 = load i8** %3, align 8
  %128 = getelementptr inbounds i8* %127, i64 %126
  %129 = load i8* %128, align 1
  %130 = zext i8 %129 to i32
  %131 = load i64* %i, align 8
  %132 = load i8** %4, align 8
  %133 = getelementptr inbounds i8* %132, i64 %131
  %134 = load i8* %133, align 1
  %135 = zext i8 %134 to i32
  %136 = sdiv i32 %135, 2
  %137 = add nsw i32 %130, %136
  %138 = trunc i32 %137 to i8
  %139 = load i64* %i, align 8
  %140 = load i8** %2, align 8
  %141 = getelementptr inbounds i8* %140, i64 %139
  store i8 %138, i8* %141, align 1
  br label %142

; <label>:142                                     ; preds = %125
  %143 = load i64* %i, align 8
  %144 = add i64 %143, 1
  store i64 %144, i64* %i, align 8
  br label %121

; <label>:145                                     ; preds = %121
  %146 = load i64* %5, align 8
  store i64 %146, i64* %i, align 8
  br label %147

; <label>:147                                     ; preds = %176, %145
  %148 = load i64* %i, align 8
  %149 = load i64* %7, align 8
  %150 = icmp ult i64 %148, %149
  br i1 %150, label %151, label %179

; <label>:151                                     ; preds = %147
  %152 = load i64* %i, align 8
  %153 = load i8** %3, align 8
  %154 = getelementptr inbounds i8* %153, i64 %152
  %155 = load i8* %154, align 1
  %156 = zext i8 %155 to i32
  %157 = load i64* %i, align 8
  %158 = load i64* %5, align 8
  %159 = sub i64 %157, %158
  %160 = load i8** %2, align 8
  %161 = getelementptr inbounds i8* %160, i64 %159
  %162 = load i8* %161, align 1
  %163 = zext i8 %162 to i32
  %164 = load i64* %i, align 8
  %165 = load i8** %4, align 8
  %166 = getelementptr inbounds i8* %165, i64 %164
  %167 = load i8* %166, align 1
  %168 = zext i8 %167 to i32
  %169 = add nsw i32 %163, %168
  %170 = sdiv i32 %169, 2
  %171 = add nsw i32 %156, %170
  %172 = trunc i32 %171 to i8
  %173 = load i64* %i, align 8
  %174 = load i8** %2, align 8
  %175 = getelementptr inbounds i8* %174, i64 %173
  store i8 %172, i8* %175, align 1
  br label %176

; <label>:176                                     ; preds = %151
  %177 = load i64* %i, align 8
  %178 = add i64 %177, 1
  store i64 %178, i64* %i, align 8
  br label %147

; <label>:179                                     ; preds = %147
  br label %225

; <label>:180                                     ; preds = %117
  store i64 0, i64* %i, align 8
  br label %181

; <label>:181                                     ; preds = %193, %180
  %182 = load i64* %i, align 8
  %183 = load i64* %5, align 8
  %184 = icmp ult i64 %182, %183
  br i1 %184, label %185, label %196

; <label>:185                                     ; preds = %181
  %186 = load i64* %i, align 8
  %187 = load i8** %3, align 8
  %188 = getelementptr inbounds i8* %187, i64 %186
  %189 = load i8* %188, align 1
  %190 = load i64* %i, align 8
  %191 = load i8** %2, align 8
  %192 = getelementptr inbounds i8* %191, i64 %190
  store i8 %189, i8* %192, align 1
  br label %193

; <label>:193                                     ; preds = %185
  %194 = load i64* %i, align 8
  %195 = add i64 %194, 1
  store i64 %195, i64* %i, align 8
  br label %181

; <label>:196                                     ; preds = %181
  %197 = load i64* %5, align 8
  store i64 %197, i64* %i, align 8
  br label %198

; <label>:198                                     ; preds = %221, %196
  %199 = load i64* %i, align 8
  %200 = load i64* %7, align 8
  %201 = icmp ult i64 %199, %200
  br i1 %201, label %202, label %224

; <label>:202                                     ; preds = %198
  %203 = load i64* %i, align 8
  %204 = load i8** %3, align 8
  %205 = getelementptr inbounds i8* %204, i64 %203
  %206 = load i8* %205, align 1
  %207 = zext i8 %206 to i32
  %208 = load i64* %i, align 8
  %209 = load i64* %5, align 8
  %210 = sub i64 %208, %209
  %211 = load i8** %2, align 8
  %212 = getelementptr inbounds i8* %211, i64 %210
  %213 = load i8* %212, align 1
  %214 = zext i8 %213 to i32
  %215 = sdiv i32 %214, 2
  %216 = add nsw i32 %207, %215
  %217 = trunc i32 %216 to i8
  %218 = load i64* %i, align 8
  %219 = load i8** %2, align 8
  %220 = getelementptr inbounds i8* %219, i64 %218
  store i8 %217, i8* %220, align 1
  br label %221

; <label>:221                                     ; preds = %202
  %222 = load i64* %i, align 8
  %223 = add i64 %222, 1
  store i64 %223, i64* %i, align 8
  br label %198

; <label>:224                                     ; preds = %198
  br label %225

; <label>:225                                     ; preds = %224, %179
  br label %341

; <label>:226                                     ; preds = %0
  %227 = load i8** %4, align 8
  %228 = icmp ne i8* %227, null
  br i1 %228, label %229, label %295

; <label>:229                                     ; preds = %226
  store i64 0, i64* %i, align 8
  br label %230

; <label>:230                                     ; preds = %250, %229
  %231 = load i64* %i, align 8
  %232 = load i64* %5, align 8
  %233 = icmp ult i64 %231, %232
  br i1 %233, label %234, label %253

; <label>:234                                     ; preds = %230
  %235 = load i64* %i, align 8
  %236 = load i8** %3, align 8
  %237 = getelementptr inbounds i8* %236, i64 %235
  %238 = load i8* %237, align 1
  %239 = zext i8 %238 to i32
  %240 = load i64* %i, align 8
  %241 = load i8** %4, align 8
  %242 = getelementptr inbounds i8* %241, i64 %240
  %243 = load i8* %242, align 1
  %244 = zext i8 %243 to i32
  %245 = add nsw i32 %239, %244
  %246 = trunc i32 %245 to i8
  %247 = load i64* %i, align 8
  %248 = load i8** %2, align 8
  %249 = getelementptr inbounds i8* %248, i64 %247
  store i8 %246, i8* %249, align 1
  br label %250

; <label>:250                                     ; preds = %234
  %251 = load i64* %i, align 8
  %252 = add i64 %251, 1
  store i64 %252, i64* %i, align 8
  br label %230

; <label>:253                                     ; preds = %230
  %254 = load i64* %5, align 8
  store i64 %254, i64* %i, align 8
  br label %255

; <label>:255                                     ; preds = %291, %253
  %256 = load i64* %i, align 8
  %257 = load i64* %7, align 8
  %258 = icmp ult i64 %256, %257
  br i1 %258, label %259, label %294

; <label>:259                                     ; preds = %255
  %260 = load i64* %i, align 8
  %261 = load i8** %3, align 8
  %262 = getelementptr inbounds i8* %261, i64 %260
  %263 = load i8* %262, align 1
  %264 = zext i8 %263 to i32
  %265 = load i64* %i, align 8
  %266 = load i64* %5, align 8
  %267 = sub i64 %265, %266
  %268 = load i8** %2, align 8
  %269 = getelementptr inbounds i8* %268, i64 %267
  %270 = load i8* %269, align 1
  %271 = zext i8 %270 to i16
  %272 = load i64* %i, align 8
  %273 = load i8** %4, align 8
  %274 = getelementptr inbounds i8* %273, i64 %272
  %275 = load i8* %274, align 1
  %276 = zext i8 %275 to i16
  %277 = load i64* %i, align 8
  %278 = load i64* %5, align 8
  %279 = sub i64 %277, %278
  %280 = load i8** %4, align 8
  %281 = getelementptr inbounds i8* %280, i64 %279
  %282 = load i8* %281, align 1
  %283 = zext i8 %282 to i16
  %284 = call zeroext i8 @paethPredictor(i16 signext %271, i16 signext %276, i16 signext %283)
  %285 = zext i8 %284 to i32
  %286 = add nsw i32 %264, %285
  %287 = trunc i32 %286 to i8
  %288 = load i64* %i, align 8
  %289 = load i8** %2, align 8
  %290 = getelementptr inbounds i8* %289, i64 %288
  store i8 %287, i8* %290, align 1
  br label %291

; <label>:291                                     ; preds = %259
  %292 = load i64* %i, align 8
  %293 = add i64 %292, 1
  store i64 %293, i64* %i, align 8
  br label %255

; <label>:294                                     ; preds = %255
  br label %339

; <label>:295                                     ; preds = %226
  store i64 0, i64* %i, align 8
  br label %296

; <label>:296                                     ; preds = %308, %295
  %297 = load i64* %i, align 8
  %298 = load i64* %5, align 8
  %299 = icmp ult i64 %297, %298
  br i1 %299, label %300, label %311

; <label>:300                                     ; preds = %296
  %301 = load i64* %i, align 8
  %302 = load i8** %3, align 8
  %303 = getelementptr inbounds i8* %302, i64 %301
  %304 = load i8* %303, align 1
  %305 = load i64* %i, align 8
  %306 = load i8** %2, align 8
  %307 = getelementptr inbounds i8* %306, i64 %305
  store i8 %304, i8* %307, align 1
  br label %308

; <label>:308                                     ; preds = %300
  %309 = load i64* %i, align 8
  %310 = add i64 %309, 1
  store i64 %310, i64* %i, align 8
  br label %296

; <label>:311                                     ; preds = %296
  %312 = load i64* %5, align 8
  store i64 %312, i64* %i, align 8
  br label %313

; <label>:313                                     ; preds = %335, %311
  %314 = load i64* %i, align 8
  %315 = load i64* %7, align 8
  %316 = icmp ult i64 %314, %315
  br i1 %316, label %317, label %338

; <label>:317                                     ; preds = %313
  %318 = load i64* %i, align 8
  %319 = load i8** %3, align 8
  %320 = getelementptr inbounds i8* %319, i64 %318
  %321 = load i8* %320, align 1
  %322 = zext i8 %321 to i32
  %323 = load i64* %i, align 8
  %324 = load i64* %5, align 8
  %325 = sub i64 %323, %324
  %326 = load i8** %2, align 8
  %327 = getelementptr inbounds i8* %326, i64 %325
  %328 = load i8* %327, align 1
  %329 = zext i8 %328 to i32
  %330 = add nsw i32 %322, %329
  %331 = trunc i32 %330 to i8
  %332 = load i64* %i, align 8
  %333 = load i8** %2, align 8
  %334 = getelementptr inbounds i8* %333, i64 %332
  store i8 %331, i8* %334, align 1
  br label %335

; <label>:335                                     ; preds = %317
  %336 = load i64* %i, align 8
  %337 = add i64 %336, 1
  store i64 %337, i64* %i, align 8
  br label %313

; <label>:338                                     ; preds = %313
  br label %339

; <label>:339                                     ; preds = %338, %294
  br label %341

; <label>:340                                     ; preds = %0
  store i32 36, i32* %1
  br label %342

; <label>:341                                     ; preds = %339, %225, %116, %70, %26
  store i32 0, i32* %1
  br label %342

; <label>:342                                     ; preds = %341, %340
  %343 = load i32* %1
  ret i32 %343
}

; Function Attrs: nounwind uwtable
define internal i32 @color_tree_has(%struct.ColorTree* %tree, i8 zeroext %r, i8 zeroext %g, i8 zeroext %b, i8 zeroext %a) #0 {
  %1 = alloca %struct.ColorTree*, align 8
  %2 = alloca i8, align 1
  %3 = alloca i8, align 1
  %4 = alloca i8, align 1
  %5 = alloca i8, align 1
  store %struct.ColorTree* %tree, %struct.ColorTree** %1, align 8
  store i8 %r, i8* %2, align 1
  store i8 %g, i8* %3, align 1
  store i8 %b, i8* %4, align 1
  store i8 %a, i8* %5, align 1
  %6 = load %struct.ColorTree** %1, align 8
  %7 = load i8* %2, align 1
  %8 = load i8* %3, align 1
  %9 = load i8* %4, align 1
  %10 = load i8* %5, align 1
  %11 = call i32 @color_tree_get(%struct.ColorTree* %6, i8 zeroext %7, i8 zeroext %8, i8 zeroext %9, i8 zeroext %10)
  %12 = icmp sge i32 %11, 0
  %13 = zext i1 %12 to i32
  ret i32 %13
}

; Function Attrs: nounwind uwtable
define internal i32 @color_tree_get(%struct.ColorTree* %tree, i8 zeroext %r, i8 zeroext %g, i8 zeroext %b, i8 zeroext %a) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.ColorTree*, align 8
  %3 = alloca i8, align 1
  %4 = alloca i8, align 1
  %5 = alloca i8, align 1
  %6 = alloca i8, align 1
  %bit = alloca i32, align 4
  %i = alloca i32, align 4
  store %struct.ColorTree* %tree, %struct.ColorTree** %2, align 8
  store i8 %r, i8* %3, align 1
  store i8 %g, i8* %4, align 1
  store i8 %b, i8* %5, align 1
  store i8 %a, i8* %6, align 1
  store i32 0, i32* %bit, align 4
  store i32 0, i32* %bit, align 4
  br label %7

; <label>:7                                       ; preds = %54, %0
  %8 = load i32* %bit, align 4
  %9 = icmp slt i32 %8, 8
  br i1 %9, label %10, label %57

; <label>:10                                      ; preds = %7
  %11 = load i8* %3, align 1
  %12 = zext i8 %11 to i32
  %13 = load i32* %bit, align 4
  %14 = ashr i32 %12, %13
  %15 = and i32 %14, 1
  %16 = mul nsw i32 8, %15
  %17 = load i8* %4, align 1
  %18 = zext i8 %17 to i32
  %19 = load i32* %bit, align 4
  %20 = ashr i32 %18, %19
  %21 = and i32 %20, 1
  %22 = mul nsw i32 4, %21
  %23 = add nsw i32 %16, %22
  %24 = load i8* %5, align 1
  %25 = zext i8 %24 to i32
  %26 = load i32* %bit, align 4
  %27 = ashr i32 %25, %26
  %28 = and i32 %27, 1
  %29 = mul nsw i32 2, %28
  %30 = add nsw i32 %23, %29
  %31 = load i8* %6, align 1
  %32 = zext i8 %31 to i32
  %33 = load i32* %bit, align 4
  %34 = ashr i32 %32, %33
  %35 = and i32 %34, 1
  %36 = mul nsw i32 1, %35
  %37 = add nsw i32 %30, %36
  store i32 %37, i32* %i, align 4
  %38 = load i32* %i, align 4
  %39 = sext i32 %38 to i64
  %40 = load %struct.ColorTree** %2, align 8
  %41 = getelementptr inbounds %struct.ColorTree* %40, i32 0, i32 0
  %42 = getelementptr inbounds [16 x %struct.ColorTree*]* %41, i32 0, i64 %39
  %43 = load %struct.ColorTree** %42, align 8
  %44 = icmp ne %struct.ColorTree* %43, null
  br i1 %44, label %46, label %45

; <label>:45                                      ; preds = %10
  store i32 -1, i32* %1
  br label %67

; <label>:46                                      ; preds = %10
  %47 = load i32* %i, align 4
  %48 = sext i32 %47 to i64
  %49 = load %struct.ColorTree** %2, align 8
  %50 = getelementptr inbounds %struct.ColorTree* %49, i32 0, i32 0
  %51 = getelementptr inbounds [16 x %struct.ColorTree*]* %50, i32 0, i64 %48
  %52 = load %struct.ColorTree** %51, align 8
  store %struct.ColorTree* %52, %struct.ColorTree** %2, align 8
  br label %53

; <label>:53                                      ; preds = %46
  br label %54

; <label>:54                                      ; preds = %53
  %55 = load i32* %bit, align 4
  %56 = add nsw i32 %55, 1
  store i32 %56, i32* %bit, align 4
  br label %7

; <label>:57                                      ; preds = %7
  %58 = load %struct.ColorTree** %2, align 8
  %59 = icmp ne %struct.ColorTree* %58, null
  br i1 %59, label %60, label %64

; <label>:60                                      ; preds = %57
  %61 = load %struct.ColorTree** %2, align 8
  %62 = getelementptr inbounds %struct.ColorTree* %61, i32 0, i32 1
  %63 = load i32* %62, align 4
  br label %65

; <label>:64                                      ; preds = %57
  br label %65

; <label>:65                                      ; preds = %64, %60
  %66 = phi i32 [ %63, %60 ], [ -1, %64 ]
  store i32 %66, i32* %1
  br label %67

; <label>:67                                      ; preds = %65, %45
  %68 = load i32* %1
  ret i32 %68
}

; Function Attrs: nounwind uwtable
define internal void @addColorBits(i8* %out, i64 %index, i32 %bits, i32 %in) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i64, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %m = alloca i32, align 4
  %p = alloca i32, align 4
  store i8* %out, i8** %1, align 8
  store i64 %index, i64* %2, align 8
  store i32 %bits, i32* %3, align 4
  store i32 %in, i32* %4, align 4
  %5 = load i32* %3, align 4
  %6 = icmp eq i32 %5, 1
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  br label %12

; <label>:8                                       ; preds = %0
  %9 = load i32* %3, align 4
  %10 = icmp eq i32 %9, 2
  %11 = select i1 %10, i32 3, i32 1
  br label %12

; <label>:12                                      ; preds = %8, %7
  %13 = phi i32 [ 7, %7 ], [ %11, %8 ]
  store i32 %13, i32* %m, align 4
  %14 = load i64* %2, align 8
  %15 = load i32* %m, align 4
  %16 = zext i32 %15 to i64
  %17 = and i64 %14, %16
  %18 = trunc i64 %17 to i32
  store i32 %18, i32* %p, align 4
  %19 = load i32* %3, align 4
  %20 = shl i32 1, %19
  %21 = sub nsw i32 %20, 1
  %22 = load i32* %4, align 4
  %23 = and i32 %22, %21
  store i32 %23, i32* %4, align 4
  %24 = load i32* %4, align 4
  %25 = load i32* %3, align 4
  %26 = load i32* %m, align 4
  %27 = load i32* %p, align 4
  %28 = sub i32 %26, %27
  %29 = mul i32 %25, %28
  %30 = shl i32 %24, %29
  store i32 %30, i32* %4, align 4
  %31 = load i32* %p, align 4
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %33, label %43

; <label>:33                                      ; preds = %12
  %34 = load i32* %4, align 4
  %35 = trunc i32 %34 to i8
  %36 = load i64* %2, align 8
  %37 = load i32* %3, align 4
  %38 = zext i32 %37 to i64
  %39 = mul i64 %36, %38
  %40 = udiv i64 %39, 8
  %41 = load i8** %1, align 8
  %42 = getelementptr inbounds i8* %41, i64 %40
  store i8 %35, i8* %42, align 1
  br label %56

; <label>:43                                      ; preds = %12
  %44 = load i32* %4, align 4
  %45 = load i64* %2, align 8
  %46 = load i32* %3, align 4
  %47 = zext i32 %46 to i64
  %48 = mul i64 %45, %47
  %49 = udiv i64 %48, 8
  %50 = load i8** %1, align 8
  %51 = getelementptr inbounds i8* %50, i64 %49
  %52 = load i8* %51, align 1
  %53 = zext i8 %52 to i32
  %54 = or i32 %53, %44
  %55 = trunc i32 %54 to i8
  store i8 %55, i8* %51, align 1
  br label %56

; <label>:56                                      ; preds = %43, %33
  ret void
}

; Function Attrs: nounwind uwtable
define internal i32 @readBitsFromReversedStream(i64* %bitpointer, i8* %bitstream, i64 %nbits) #0 {
  %1 = alloca i64*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i64, align 8
  %result = alloca i32, align 4
  %i = alloca i64, align 8
  store i64* %bitpointer, i64** %1, align 8
  store i8* %bitstream, i8** %2, align 8
  store i64 %nbits, i64* %3, align 8
  store i32 0, i32* %result, align 4
  %4 = load i64* %3, align 8
  %5 = sub i64 %4, 1
  store i64 %5, i64* %i, align 8
  br label %6

; <label>:6                                       ; preds = %20, %0
  %7 = load i64* %i, align 8
  %8 = load i64* %3, align 8
  %9 = icmp ult i64 %7, %8
  br i1 %9, label %10, label %23

; <label>:10                                      ; preds = %6
  %11 = load i64** %1, align 8
  %12 = load i8** %2, align 8
  %13 = call zeroext i8 @readBitFromReversedStream(i64* %11, i8* %12)
  %14 = zext i8 %13 to i32
  %15 = load i64* %i, align 8
  %16 = trunc i64 %15 to i32
  %17 = shl i32 %14, %16
  %18 = load i32* %result, align 4
  %19 = add i32 %18, %17
  store i32 %19, i32* %result, align 4
  br label %20

; <label>:20                                      ; preds = %10
  %21 = load i64* %i, align 8
  %22 = add i64 %21, -1
  store i64 %22, i64* %i, align 8
  br label %6

; <label>:23                                      ; preds = %6
  %24 = load i32* %result, align 4
  ret i32 %24
}

; Function Attrs: nounwind uwtable
define internal void @string_cleanup(i8** %out) #0 {
  %1 = alloca i8**, align 8
  store i8** %out, i8*** %1, align 8
  %2 = load i8*** %1, align 8
  %3 = load i8** %2, align 8
  call void @lodepng_free(i8* %3)
  %4 = load i8*** %1, align 8
  store i8* null, i8** %4, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define internal i32 @string_resize(i8** %out, i64 %size) #0 {
  %1 = alloca i8**, align 8
  %2 = alloca i64, align 8
  %data = alloca i8*, align 8
  store i8** %out, i8*** %1, align 8
  store i64 %size, i64* %2, align 8
  %3 = load i8*** %1, align 8
  %4 = load i8** %3, align 8
  %5 = load i64* %2, align 8
  %6 = add i64 %5, 1
  %7 = call i8* @lodepng_realloc(i8* %4, i64 %6)
  store i8* %7, i8** %data, align 8
  %8 = load i8** %data, align 8
  %9 = icmp ne i8* %8, null
  br i1 %9, label %10, label %16

; <label>:10                                      ; preds = %0
  %11 = load i64* %2, align 8
  %12 = load i8** %data, align 8
  %13 = getelementptr inbounds i8* %12, i64 %11
  store i8 0, i8* %13, align 1
  %14 = load i8** %data, align 8
  %15 = load i8*** %1, align 8
  store i8* %14, i8** %15, align 8
  br label %16

; <label>:16                                      ; preds = %10, %0
  %17 = load i8** %data, align 8
  %18 = icmp ne i8* %17, null
  %19 = zext i1 %18 to i32
  ret i32 %19
}

; Function Attrs: nounwind
declare i8* @realloc(i8*, i64) #5

; Function Attrs: nounwind uwtable
define internal i32 @update_adler32(i32 %adler, i8* %data, i32 %len) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %s1 = alloca i32, align 4
  %s2 = alloca i32, align 4
  %amount = alloca i32, align 4
  store i32 %adler, i32* %1, align 4
  store i8* %data, i8** %2, align 8
  store i32 %len, i32* %3, align 4
  %4 = load i32* %1, align 4
  %5 = and i32 %4, 65535
  store i32 %5, i32* %s1, align 4
  %6 = load i32* %1, align 4
  %7 = lshr i32 %6, 16
  %8 = and i32 %7, 65535
  store i32 %8, i32* %s2, align 4
  br label %9

; <label>:9                                       ; preds = %38, %0
  %10 = load i32* %3, align 4
  %11 = icmp ugt i32 %10, 0
  br i1 %11, label %12, label %43

; <label>:12                                      ; preds = %9
  %13 = load i32* %3, align 4
  %14 = icmp ugt i32 %13, 5550
  br i1 %14, label %15, label %16

; <label>:15                                      ; preds = %12
  br label %18

; <label>:16                                      ; preds = %12
  %17 = load i32* %3, align 4
  br label %18

; <label>:18                                      ; preds = %16, %15
  %19 = phi i32 [ 5550, %15 ], [ %17, %16 ]
  store i32 %19, i32* %amount, align 4
  %20 = load i32* %amount, align 4
  %21 = load i32* %3, align 4
  %22 = sub i32 %21, %20
  store i32 %22, i32* %3, align 4
  br label %23

; <label>:23                                      ; preds = %26, %18
  %24 = load i32* %amount, align 4
  %25 = icmp ugt i32 %24, 0
  br i1 %25, label %26, label %38

; <label>:26                                      ; preds = %23
  %27 = load i8** %2, align 8
  %28 = getelementptr inbounds i8* %27, i32 1
  store i8* %28, i8** %2, align 8
  %29 = load i8* %27, align 1
  %30 = zext i8 %29 to i32
  %31 = load i32* %s1, align 4
  %32 = add i32 %31, %30
  store i32 %32, i32* %s1, align 4
  %33 = load i32* %s1, align 4
  %34 = load i32* %s2, align 4
  %35 = add i32 %34, %33
  store i32 %35, i32* %s2, align 4
  %36 = load i32* %amount, align 4
  %37 = add i32 %36, -1
  store i32 %37, i32* %amount, align 4
  br label %23

; <label>:38                                      ; preds = %23
  %39 = load i32* %s1, align 4
  %40 = urem i32 %39, 65521
  store i32 %40, i32* %s1, align 4
  %41 = load i32* %s2, align 4
  %42 = urem i32 %41, 65521
  store i32 %42, i32* %s2, align 4
  br label %9

; <label>:43                                      ; preds = %9
  %44 = load i32* %s2, align 4
  %45 = shl i32 %44, 16
  %46 = load i32* %s1, align 4
  %47 = or i32 %45, %46
  ret i32 %47
}

; Function Attrs: nounwind uwtable
define internal i32 @deflateNoCompression(%struct.ucvector* %out, i8* %data, i64 %datasize) #0 {
  %1 = alloca %struct.ucvector*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i64, align 8
  %i = alloca i64, align 8
  %j = alloca i64, align 8
  %numdeflateblocks = alloca i64, align 8
  %datapos = alloca i32, align 4
  %BFINAL = alloca i32, align 4
  %BTYPE = alloca i32, align 4
  %LEN = alloca i32, align 4
  %NLEN = alloca i32, align 4
  %firstbyte = alloca i8, align 1
  store %struct.ucvector* %out, %struct.ucvector** %1, align 8
  store i8* %data, i8** %2, align 8
  store i64 %datasize, i64* %3, align 8
  %4 = load i64* %3, align 8
  %5 = add i64 %4, 65534
  %6 = udiv i64 %5, 65535
  store i64 %6, i64* %numdeflateblocks, align 8
  store i32 0, i32* %datapos, align 4
  store i64 0, i64* %i, align 8
  br label %7

; <label>:7                                       ; preds = %84, %0
  %8 = load i64* %i, align 8
  %9 = load i64* %numdeflateblocks, align 8
  %10 = icmp ult i64 %8, %9
  br i1 %10, label %11, label %87

; <label>:11                                      ; preds = %7
  %12 = load i64* %i, align 8
  %13 = load i64* %numdeflateblocks, align 8
  %14 = sub i64 %13, 1
  %15 = icmp eq i64 %12, %14
  %16 = zext i1 %15 to i32
  store i32 %16, i32* %BFINAL, align 4
  store i32 0, i32* %BTYPE, align 4
  %17 = load i32* %BFINAL, align 4
  %18 = load i32* %BTYPE, align 4
  %19 = and i32 %18, 1
  %20 = shl i32 %19, 1
  %21 = add i32 %17, %20
  %22 = load i32* %BTYPE, align 4
  %23 = and i32 %22, 2
  %24 = shl i32 %23, 1
  %25 = add i32 %21, %24
  %26 = trunc i32 %25 to i8
  store i8 %26, i8* %firstbyte, align 1
  %27 = load %struct.ucvector** %1, align 8
  %28 = load i8* %firstbyte, align 1
  %29 = call i32 @ucvector_push_back(%struct.ucvector* %27, i8 zeroext %28)
  store i32 65535, i32* %LEN, align 4
  %30 = load i64* %3, align 8
  %31 = load i32* %datapos, align 4
  %32 = zext i32 %31 to i64
  %33 = sub i64 %30, %32
  %34 = icmp ult i64 %33, 65535
  br i1 %34, label %35, label %40

; <label>:35                                      ; preds = %11
  %36 = load i64* %3, align 8
  %37 = trunc i64 %36 to i32
  %38 = load i32* %datapos, align 4
  %39 = sub i32 %37, %38
  store i32 %39, i32* %LEN, align 4
  br label %40

; <label>:40                                      ; preds = %35, %11
  %41 = load i32* %LEN, align 4
  %42 = sub i32 65535, %41
  store i32 %42, i32* %NLEN, align 4
  %43 = load %struct.ucvector** %1, align 8
  %44 = load i32* %LEN, align 4
  %45 = urem i32 %44, 256
  %46 = trunc i32 %45 to i8
  %47 = call i32 @ucvector_push_back(%struct.ucvector* %43, i8 zeroext %46)
  %48 = load %struct.ucvector** %1, align 8
  %49 = load i32* %LEN, align 4
  %50 = udiv i32 %49, 256
  %51 = trunc i32 %50 to i8
  %52 = call i32 @ucvector_push_back(%struct.ucvector* %48, i8 zeroext %51)
  %53 = load %struct.ucvector** %1, align 8
  %54 = load i32* %NLEN, align 4
  %55 = urem i32 %54, 256
  %56 = trunc i32 %55 to i8
  %57 = call i32 @ucvector_push_back(%struct.ucvector* %53, i8 zeroext %56)
  %58 = load %struct.ucvector** %1, align 8
  %59 = load i32* %NLEN, align 4
  %60 = udiv i32 %59, 256
  %61 = trunc i32 %60 to i8
  %62 = call i32 @ucvector_push_back(%struct.ucvector* %58, i8 zeroext %61)
  store i64 0, i64* %j, align 8
  br label %63

; <label>:63                                      ; preds = %80, %40
  %64 = load i64* %j, align 8
  %65 = icmp ult i64 %64, 65535
  br i1 %65, label %66, label %83

; <label>:66                                      ; preds = %63
  %67 = load i32* %datapos, align 4
  %68 = zext i32 %67 to i64
  %69 = load i64* %3, align 8
  %70 = icmp ult i64 %68, %69
  br i1 %70, label %71, label %83

; <label>:71                                      ; preds = %66
  %72 = load %struct.ucvector** %1, align 8
  %73 = load i32* %datapos, align 4
  %74 = add i32 %73, 1
  store i32 %74, i32* %datapos, align 4
  %75 = zext i32 %73 to i64
  %76 = load i8** %2, align 8
  %77 = getelementptr inbounds i8* %76, i64 %75
  %78 = load i8* %77, align 1
  %79 = call i32 @ucvector_push_back(%struct.ucvector* %72, i8 zeroext %78)
  br label %80

; <label>:80                                      ; preds = %71
  %81 = load i64* %j, align 8
  %82 = add i64 %81, 1
  store i64 %82, i64* %j, align 8
  br label %63

; <label>:83                                      ; preds = %66, %63
  br label %84

; <label>:84                                      ; preds = %83
  %85 = load i64* %i, align 8
  %86 = add i64 %85, 1
  store i64 %86, i64* %i, align 8
  br label %7

; <label>:87                                      ; preds = %7
  ret i32 0
}

; Function Attrs: nounwind uwtable
define internal i32 @hash_init(%struct.Hash* %hash, i32 %windowsize) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.Hash*, align 8
  %3 = alloca i32, align 4
  %i = alloca i32, align 4
  store %struct.Hash* %hash, %struct.Hash** %2, align 8
  store i32 %windowsize, i32* %3, align 4
  %4 = call i8* @lodepng_malloc(i64 262144)
  %5 = bitcast i8* %4 to i32*
  %6 = load %struct.Hash** %2, align 8
  %7 = getelementptr inbounds %struct.Hash* %6, i32 0, i32 0
  store i32* %5, i32** %7, align 8
  %8 = load i32* %3, align 4
  %9 = zext i32 %8 to i64
  %10 = mul i64 4, %9
  %11 = call i8* @lodepng_malloc(i64 %10)
  %12 = bitcast i8* %11 to i32*
  %13 = load %struct.Hash** %2, align 8
  %14 = getelementptr inbounds %struct.Hash* %13, i32 0, i32 1
  store i32* %12, i32** %14, align 8
  %15 = load i32* %3, align 4
  %16 = zext i32 %15 to i64
  %17 = mul i64 2, %16
  %18 = call i8* @lodepng_malloc(i64 %17)
  %19 = bitcast i8* %18 to i16*
  %20 = load %struct.Hash** %2, align 8
  %21 = getelementptr inbounds %struct.Hash* %20, i32 0, i32 2
  store i16* %19, i16** %21, align 8
  %22 = load i32* %3, align 4
  %23 = zext i32 %22 to i64
  %24 = mul i64 2, %23
  %25 = call i8* @lodepng_malloc(i64 %24)
  %26 = bitcast i8* %25 to i16*
  %27 = load %struct.Hash** %2, align 8
  %28 = getelementptr inbounds %struct.Hash* %27, i32 0, i32 3
  store i16* %26, i16** %28, align 8
  %29 = load %struct.Hash** %2, align 8
  %30 = getelementptr inbounds %struct.Hash* %29, i32 0, i32 0
  %31 = load i32** %30, align 8
  %32 = icmp ne i32* %31, null
  br i1 %32, label %33, label %48

; <label>:33                                      ; preds = %0
  %34 = load %struct.Hash** %2, align 8
  %35 = getelementptr inbounds %struct.Hash* %34, i32 0, i32 1
  %36 = load i32** %35, align 8
  %37 = icmp ne i32* %36, null
  br i1 %37, label %38, label %48

; <label>:38                                      ; preds = %33
  %39 = load %struct.Hash** %2, align 8
  %40 = getelementptr inbounds %struct.Hash* %39, i32 0, i32 2
  %41 = load i16** %40, align 8
  %42 = icmp ne i16* %41, null
  br i1 %42, label %43, label %48

; <label>:43                                      ; preds = %38
  %44 = load %struct.Hash** %2, align 8
  %45 = getelementptr inbounds %struct.Hash* %44, i32 0, i32 3
  %46 = load i16** %45, align 8
  %47 = icmp ne i16* %46, null
  br i1 %47, label %49, label %48

; <label>:48                                      ; preds = %43, %38, %33, %0
  store i32 83, i32* %1
  br label %96

; <label>:49                                      ; preds = %43
  store i32 0, i32* %i, align 4
  br label %50

; <label>:50                                      ; preds = %60, %49
  %51 = load i32* %i, align 4
  %52 = icmp ult i32 %51, 65536
  br i1 %52, label %53, label %63

; <label>:53                                      ; preds = %50
  %54 = load i32* %i, align 4
  %55 = zext i32 %54 to i64
  %56 = load %struct.Hash** %2, align 8
  %57 = getelementptr inbounds %struct.Hash* %56, i32 0, i32 0
  %58 = load i32** %57, align 8
  %59 = getelementptr inbounds i32* %58, i64 %55
  store i32 -1, i32* %59, align 4
  br label %60

; <label>:60                                      ; preds = %53
  %61 = load i32* %i, align 4
  %62 = add i32 %61, 1
  store i32 %62, i32* %i, align 4
  br label %50

; <label>:63                                      ; preds = %50
  store i32 0, i32* %i, align 4
  br label %64

; <label>:64                                      ; preds = %75, %63
  %65 = load i32* %i, align 4
  %66 = load i32* %3, align 4
  %67 = icmp ult i32 %65, %66
  br i1 %67, label %68, label %78

; <label>:68                                      ; preds = %64
  %69 = load i32* %i, align 4
  %70 = zext i32 %69 to i64
  %71 = load %struct.Hash** %2, align 8
  %72 = getelementptr inbounds %struct.Hash* %71, i32 0, i32 1
  %73 = load i32** %72, align 8
  %74 = getelementptr inbounds i32* %73, i64 %70
  store i32 -1, i32* %74, align 4
  br label %75

; <label>:75                                      ; preds = %68
  %76 = load i32* %i, align 4
  %77 = add i32 %76, 1
  store i32 %77, i32* %i, align 4
  br label %64

; <label>:78                                      ; preds = %64
  store i32 0, i32* %i, align 4
  br label %79

; <label>:79                                      ; preds = %92, %78
  %80 = load i32* %i, align 4
  %81 = load i32* %3, align 4
  %82 = icmp ult i32 %80, %81
  br i1 %82, label %83, label %95

; <label>:83                                      ; preds = %79
  %84 = load i32* %i, align 4
  %85 = trunc i32 %84 to i16
  %86 = load i32* %i, align 4
  %87 = zext i32 %86 to i64
  %88 = load %struct.Hash** %2, align 8
  %89 = getelementptr inbounds %struct.Hash* %88, i32 0, i32 2
  %90 = load i16** %89, align 8
  %91 = getelementptr inbounds i16* %90, i64 %87
  store i16 %85, i16* %91, align 2
  br label %92

; <label>:92                                      ; preds = %83
  %93 = load i32* %i, align 4
  %94 = add i32 %93, 1
  store i32 %94, i32* %i, align 4
  br label %79

; <label>:95                                      ; preds = %79
  store i32 0, i32* %1
  br label %96

; <label>:96                                      ; preds = %95, %48
  %97 = load i32* %1
  ret i32 %97
}

; Function Attrs: nounwind uwtable
define internal i32 @deflateFixed(%struct.ucvector* %out, i64* %bp, %struct.Hash* %hash, i8* %data, i64 %datapos, i64 %dataend, %struct.LodePNGCompressSettings* %settings, i32 %final) #0 {
  %1 = alloca %struct.ucvector*, align 8
  %2 = alloca i64*, align 8
  %3 = alloca %struct.Hash*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca %struct.LodePNGCompressSettings*, align 8
  %8 = alloca i32, align 4
  %tree_ll = alloca %struct.HuffmanTree, align 8
  %tree_d = alloca %struct.HuffmanTree, align 8
  %BFINAL = alloca i32, align 4
  %error = alloca i32, align 4
  %i = alloca i64, align 8
  %lz77_encoded = alloca %struct.uivector, align 8
  store %struct.ucvector* %out, %struct.ucvector** %1, align 8
  store i64* %bp, i64** %2, align 8
  store %struct.Hash* %hash, %struct.Hash** %3, align 8
  store i8* %data, i8** %4, align 8
  store i64 %datapos, i64* %5, align 8
  store i64 %dataend, i64* %6, align 8
  store %struct.LodePNGCompressSettings* %settings, %struct.LodePNGCompressSettings** %7, align 8
  store i32 %final, i32* %8, align 4
  %9 = load i32* %8, align 4
  store i32 %9, i32* %BFINAL, align 4
  store i32 0, i32* %error, align 4
  call void @HuffmanTree_init(%struct.HuffmanTree* %tree_ll)
  call void @HuffmanTree_init(%struct.HuffmanTree* %tree_d)
  %10 = call i32 @generateFixedLitLenTree(%struct.HuffmanTree* %tree_ll)
  %11 = call i32 @generateFixedDistanceTree(%struct.HuffmanTree* %tree_d)
  %12 = load i64** %2, align 8
  %13 = load i64* %12, align 8
  %14 = and i64 %13, 7
  %15 = icmp eq i64 %14, 0
  br i1 %15, label %16, label %19

; <label>:16                                      ; preds = %0
  %17 = load %struct.ucvector** %1, align 8
  %18 = call i32 @ucvector_push_back(%struct.ucvector* %17, i8 zeroext 0)
  br label %19

; <label>:19                                      ; preds = %16, %0
  %20 = load i32* %BFINAL, align 4
  %21 = load i64** %2, align 8
  %22 = load i64* %21, align 8
  %23 = and i64 %22, 7
  %24 = trunc i64 %23 to i32
  %25 = shl i32 %20, %24
  %26 = load %struct.ucvector** %1, align 8
  %27 = getelementptr inbounds %struct.ucvector* %26, i32 0, i32 1
  %28 = load i64* %27, align 8
  %29 = sub i64 %28, 1
  %30 = load %struct.ucvector** %1, align 8
  %31 = getelementptr inbounds %struct.ucvector* %30, i32 0, i32 0
  %32 = load i8** %31, align 8
  %33 = getelementptr inbounds i8* %32, i64 %29
  %34 = load i8* %33, align 1
  %35 = zext i8 %34 to i32
  %36 = or i32 %35, %25
  %37 = trunc i32 %36 to i8
  store i8 %37, i8* %33, align 1
  %38 = load i64** %2, align 8
  %39 = load i64* %38, align 8
  %40 = add i64 %39, 1
  store i64 %40, i64* %38, align 8
  %41 = load i64** %2, align 8
  %42 = load i64* %41, align 8
  %43 = and i64 %42, 7
  %44 = icmp eq i64 %43, 0
  br i1 %44, label %45, label %48

; <label>:45                                      ; preds = %19
  %46 = load %struct.ucvector** %1, align 8
  %47 = call i32 @ucvector_push_back(%struct.ucvector* %46, i8 zeroext 0)
  br label %48

; <label>:48                                      ; preds = %45, %19
  %49 = load i64** %2, align 8
  %50 = load i64* %49, align 8
  %51 = and i64 %50, 7
  %52 = trunc i64 %51 to i32
  %53 = shl i32 1, %52
  %54 = load %struct.ucvector** %1, align 8
  %55 = getelementptr inbounds %struct.ucvector* %54, i32 0, i32 1
  %56 = load i64* %55, align 8
  %57 = sub i64 %56, 1
  %58 = load %struct.ucvector** %1, align 8
  %59 = getelementptr inbounds %struct.ucvector* %58, i32 0, i32 0
  %60 = load i8** %59, align 8
  %61 = getelementptr inbounds i8* %60, i64 %57
  %62 = load i8* %61, align 1
  %63 = zext i8 %62 to i32
  %64 = or i32 %63, %53
  %65 = trunc i32 %64 to i8
  store i8 %65, i8* %61, align 1
  %66 = load i64** %2, align 8
  %67 = load i64* %66, align 8
  %68 = add i64 %67, 1
  store i64 %68, i64* %66, align 8
  %69 = load i64** %2, align 8
  %70 = load i64* %69, align 8
  %71 = and i64 %70, 7
  %72 = icmp eq i64 %71, 0
  br i1 %72, label %73, label %76

; <label>:73                                      ; preds = %48
  %74 = load %struct.ucvector** %1, align 8
  %75 = call i32 @ucvector_push_back(%struct.ucvector* %74, i8 zeroext 0)
  br label %76

; <label>:76                                      ; preds = %73, %48
  %77 = load i64** %2, align 8
  %78 = load i64* %77, align 8
  %79 = and i64 %78, 7
  %80 = trunc i64 %79 to i32
  %81 = shl i32 0, %80
  %82 = load %struct.ucvector** %1, align 8
  %83 = getelementptr inbounds %struct.ucvector* %82, i32 0, i32 1
  %84 = load i64* %83, align 8
  %85 = sub i64 %84, 1
  %86 = load %struct.ucvector** %1, align 8
  %87 = getelementptr inbounds %struct.ucvector* %86, i32 0, i32 0
  %88 = load i8** %87, align 8
  %89 = getelementptr inbounds i8* %88, i64 %85
  %90 = load i8* %89, align 1
  %91 = zext i8 %90 to i32
  %92 = or i32 %91, %81
  %93 = trunc i32 %92 to i8
  store i8 %93, i8* %89, align 1
  %94 = load i64** %2, align 8
  %95 = load i64* %94, align 8
  %96 = add i64 %95, 1
  store i64 %96, i64* %94, align 8
  %97 = load %struct.LodePNGCompressSettings** %7, align 8
  %98 = getelementptr inbounds %struct.LodePNGCompressSettings* %97, i32 0, i32 1
  %99 = load i32* %98, align 4
  %100 = icmp ne i32 %99, 0
  br i1 %100, label %101, label %126

; <label>:101                                     ; preds = %76
  call void @uivector_init(%struct.uivector* %lz77_encoded)
  %102 = load %struct.Hash** %3, align 8
  %103 = load i8** %4, align 8
  %104 = load i64* %5, align 8
  %105 = load i64* %6, align 8
  %106 = load %struct.LodePNGCompressSettings** %7, align 8
  %107 = getelementptr inbounds %struct.LodePNGCompressSettings* %106, i32 0, i32 2
  %108 = load i32* %107, align 4
  %109 = load %struct.LodePNGCompressSettings** %7, align 8
  %110 = getelementptr inbounds %struct.LodePNGCompressSettings* %109, i32 0, i32 3
  %111 = load i32* %110, align 4
  %112 = load %struct.LodePNGCompressSettings** %7, align 8
  %113 = getelementptr inbounds %struct.LodePNGCompressSettings* %112, i32 0, i32 4
  %114 = load i32* %113, align 4
  %115 = load %struct.LodePNGCompressSettings** %7, align 8
  %116 = getelementptr inbounds %struct.LodePNGCompressSettings* %115, i32 0, i32 5
  %117 = load i32* %116, align 4
  %118 = call i32 @encodeLZ77(%struct.uivector* %lz77_encoded, %struct.Hash* %102, i8* %103, i64 %104, i64 %105, i32 %108, i32 %111, i32 %114, i32 %117)
  store i32 %118, i32* %error, align 4
  %119 = load i32* %error, align 4
  %120 = icmp ne i32 %119, 0
  br i1 %120, label %124, label %121

; <label>:121                                     ; preds = %101
  %122 = load i64** %2, align 8
  %123 = load %struct.ucvector** %1, align 8
  call void @writeLZ77data(i64* %122, %struct.ucvector* %123, %struct.uivector* %lz77_encoded, %struct.HuffmanTree* %tree_ll, %struct.HuffmanTree* %tree_d)
  br label %124

; <label>:124                                     ; preds = %121, %101
  %125 = bitcast %struct.uivector* %lz77_encoded to i8*
  call void @uivector_cleanup(i8* %125)
  br label %151

; <label>:126                                     ; preds = %76
  %127 = load i64* %5, align 8
  store i64 %127, i64* %i, align 8
  br label %128

; <label>:128                                     ; preds = %147, %126
  %129 = load i64* %i, align 8
  %130 = load i64* %6, align 8
  %131 = icmp ult i64 %129, %130
  br i1 %131, label %132, label %150

; <label>:132                                     ; preds = %128
  %133 = load i64** %2, align 8
  %134 = load %struct.ucvector** %1, align 8
  %135 = load i64* %i, align 8
  %136 = load i8** %4, align 8
  %137 = getelementptr inbounds i8* %136, i64 %135
  %138 = load i8* %137, align 1
  %139 = zext i8 %138 to i32
  %140 = call i32 @HuffmanTree_getCode(%struct.HuffmanTree* %tree_ll, i32 %139)
  %141 = load i64* %i, align 8
  %142 = load i8** %4, align 8
  %143 = getelementptr inbounds i8* %142, i64 %141
  %144 = load i8* %143, align 1
  %145 = zext i8 %144 to i32
  %146 = call i32 @HuffmanTree_getLength(%struct.HuffmanTree* %tree_ll, i32 %145)
  call void @addHuffmanSymbol(i64* %133, %struct.ucvector* %134, i32 %140, i32 %146)
  br label %147

; <label>:147                                     ; preds = %132
  %148 = load i64* %i, align 8
  %149 = add i64 %148, 1
  store i64 %149, i64* %i, align 8
  br label %128

; <label>:150                                     ; preds = %128
  br label %151

; <label>:151                                     ; preds = %150, %124
  %152 = load i32* %error, align 4
  %153 = icmp ne i32 %152, 0
  br i1 %153, label %159, label %154

; <label>:154                                     ; preds = %151
  %155 = load i64** %2, align 8
  %156 = load %struct.ucvector** %1, align 8
  %157 = call i32 @HuffmanTree_getCode(%struct.HuffmanTree* %tree_ll, i32 256)
  %158 = call i32 @HuffmanTree_getLength(%struct.HuffmanTree* %tree_ll, i32 256)
  call void @addHuffmanSymbol(i64* %155, %struct.ucvector* %156, i32 %157, i32 %158)
  br label %159

; <label>:159                                     ; preds = %154, %151
  call void @HuffmanTree_cleanup(%struct.HuffmanTree* %tree_ll)
  call void @HuffmanTree_cleanup(%struct.HuffmanTree* %tree_d)
  %160 = load i32* %error, align 4
  ret i32 %160
}

; Function Attrs: nounwind uwtable
define internal i32 @deflateDynamic(%struct.ucvector* %out, i64* %bp, %struct.Hash* %hash, i8* %data, i64 %datapos, i64 %dataend, %struct.LodePNGCompressSettings* %settings, i32 %final) #0 {
  %1 = alloca %struct.ucvector*, align 8
  %2 = alloca i64*, align 8
  %3 = alloca %struct.Hash*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca %struct.LodePNGCompressSettings*, align 8
  %8 = alloca i32, align 4
  %error = alloca i32, align 4
  %lz77_encoded = alloca %struct.uivector, align 8
  %tree_ll = alloca %struct.HuffmanTree, align 8
  %tree_d = alloca %struct.HuffmanTree, align 8
  %tree_cl = alloca %struct.HuffmanTree, align 8
  %frequencies_ll = alloca %struct.uivector, align 8
  %frequencies_d = alloca %struct.uivector, align 8
  %frequencies_cl = alloca %struct.uivector, align 8
  %bitlen_lld = alloca %struct.uivector, align 8
  %bitlen_lld_e = alloca %struct.uivector, align 8
  %bitlen_cl = alloca %struct.uivector, align 8
  %datasize = alloca i64, align 8
  %BFINAL = alloca i32, align 4
  %numcodes_ll = alloca i64, align 8
  %numcodes_d = alloca i64, align 8
  %i = alloca i64, align 8
  %HLIT = alloca i32, align 4
  %HDIST = alloca i32, align 4
  %HCLEN = alloca i32, align 4
  %symbol = alloca i32, align 4
  %dist = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i64, align 8
  %num = alloca i32, align 4
  %rest = alloca i32, align 4
  store %struct.ucvector* %out, %struct.ucvector** %1, align 8
  store i64* %bp, i64** %2, align 8
  store %struct.Hash* %hash, %struct.Hash** %3, align 8
  store i8* %data, i8** %4, align 8
  store i64 %datapos, i64* %5, align 8
  store i64 %dataend, i64* %6, align 8
  store %struct.LodePNGCompressSettings* %settings, %struct.LodePNGCompressSettings** %7, align 8
  store i32 %final, i32* %8, align 4
  store i32 0, i32* %error, align 4
  %9 = load i64* %6, align 8
  %10 = load i64* %5, align 8
  %11 = sub i64 %9, %10
  store i64 %11, i64* %datasize, align 8
  %12 = load i32* %8, align 4
  store i32 %12, i32* %BFINAL, align 4
  call void @uivector_init(%struct.uivector* %lz77_encoded)
  call void @HuffmanTree_init(%struct.HuffmanTree* %tree_ll)
  call void @HuffmanTree_init(%struct.HuffmanTree* %tree_d)
  call void @HuffmanTree_init(%struct.HuffmanTree* %tree_cl)
  call void @uivector_init(%struct.uivector* %frequencies_ll)
  call void @uivector_init(%struct.uivector* %frequencies_d)
  call void @uivector_init(%struct.uivector* %frequencies_cl)
  call void @uivector_init(%struct.uivector* %bitlen_lld)
  call void @uivector_init(%struct.uivector* %bitlen_lld_e)
  call void @uivector_init(%struct.uivector* %bitlen_cl)
  br label %13

; <label>:13                                      ; preds = %0
  %14 = load i32* %error, align 4
  %15 = icmp ne i32 %14, 0
  %16 = xor i1 %15, true
  br i1 %16, label %17, label %635

; <label>:17                                      ; preds = %13
  %18 = load %struct.LodePNGCompressSettings** %7, align 8
  %19 = getelementptr inbounds %struct.LodePNGCompressSettings* %18, i32 0, i32 1
  %20 = load i32* %19, align 4
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %44

; <label>:22                                      ; preds = %17
  %23 = load %struct.Hash** %3, align 8
  %24 = load i8** %4, align 8
  %25 = load i64* %5, align 8
  %26 = load i64* %6, align 8
  %27 = load %struct.LodePNGCompressSettings** %7, align 8
  %28 = getelementptr inbounds %struct.LodePNGCompressSettings* %27, i32 0, i32 2
  %29 = load i32* %28, align 4
  %30 = load %struct.LodePNGCompressSettings** %7, align 8
  %31 = getelementptr inbounds %struct.LodePNGCompressSettings* %30, i32 0, i32 3
  %32 = load i32* %31, align 4
  %33 = load %struct.LodePNGCompressSettings** %7, align 8
  %34 = getelementptr inbounds %struct.LodePNGCompressSettings* %33, i32 0, i32 4
  %35 = load i32* %34, align 4
  %36 = load %struct.LodePNGCompressSettings** %7, align 8
  %37 = getelementptr inbounds %struct.LodePNGCompressSettings* %36, i32 0, i32 5
  %38 = load i32* %37, align 4
  %39 = call i32 @encodeLZ77(%struct.uivector* %lz77_encoded, %struct.Hash* %23, i8* %24, i64 %25, i64 %26, i32 %29, i32 %32, i32 %35, i32 %38)
  store i32 %39, i32* %error, align 4
  %40 = load i32* %error, align 4
  %41 = icmp ne i32 %40, 0
  br i1 %41, label %42, label %43

; <label>:42                                      ; preds = %22
  br label %635

; <label>:43                                      ; preds = %22
  br label %69

; <label>:44                                      ; preds = %17
  %45 = load i64* %datasize, align 8
  %46 = call i32 @uivector_resize(%struct.uivector* %lz77_encoded, i64 %45)
  %47 = icmp ne i32 %46, 0
  br i1 %47, label %49, label %48

; <label>:48                                      ; preds = %44
  store i32 83, i32* %error, align 4
  br label %635

; <label>:49                                      ; preds = %44
  %50 = load i64* %5, align 8
  store i64 %50, i64* %i, align 8
  br label %51

; <label>:51                                      ; preds = %65, %49
  %52 = load i64* %i, align 8
  %53 = load i64* %6, align 8
  %54 = icmp ult i64 %52, %53
  br i1 %54, label %55, label %68

; <label>:55                                      ; preds = %51
  %56 = load i64* %i, align 8
  %57 = load i8** %4, align 8
  %58 = getelementptr inbounds i8* %57, i64 %56
  %59 = load i8* %58, align 1
  %60 = zext i8 %59 to i32
  %61 = load i64* %i, align 8
  %62 = getelementptr inbounds %struct.uivector* %lz77_encoded, i32 0, i32 0
  %63 = load i32** %62, align 8
  %64 = getelementptr inbounds i32* %63, i64 %61
  store i32 %60, i32* %64, align 4
  br label %65

; <label>:65                                      ; preds = %55
  %66 = load i64* %i, align 8
  %67 = add i64 %66, 1
  store i64 %67, i64* %i, align 8
  br label %51

; <label>:68                                      ; preds = %51
  br label %69

; <label>:69                                      ; preds = %68, %43
  %70 = call i32 @uivector_resizev(%struct.uivector* %frequencies_ll, i64 286, i32 0)
  %71 = icmp ne i32 %70, 0
  br i1 %71, label %73, label %72

; <label>:72                                      ; preds = %69
  store i32 83, i32* %error, align 4
  br label %635

; <label>:73                                      ; preds = %69
  %74 = call i32 @uivector_resizev(%struct.uivector* %frequencies_d, i64 30, i32 0)
  %75 = icmp ne i32 %74, 0
  br i1 %75, label %77, label %76

; <label>:76                                      ; preds = %73
  store i32 83, i32* %error, align 4
  br label %635

; <label>:77                                      ; preds = %73
  store i64 0, i64* %i, align 8
  br label %78

; <label>:78                                      ; preds = %115, %77
  %79 = load i64* %i, align 8
  %80 = getelementptr inbounds %struct.uivector* %lz77_encoded, i32 0, i32 1
  %81 = load i64* %80, align 8
  %82 = icmp ult i64 %79, %81
  br i1 %82, label %83, label %118

; <label>:83                                      ; preds = %78
  %84 = load i64* %i, align 8
  %85 = getelementptr inbounds %struct.uivector* %lz77_encoded, i32 0, i32 0
  %86 = load i32** %85, align 8
  %87 = getelementptr inbounds i32* %86, i64 %84
  %88 = load i32* %87, align 4
  store i32 %88, i32* %symbol, align 4
  %89 = load i32* %symbol, align 4
  %90 = zext i32 %89 to i64
  %91 = getelementptr inbounds %struct.uivector* %frequencies_ll, i32 0, i32 0
  %92 = load i32** %91, align 8
  %93 = getelementptr inbounds i32* %92, i64 %90
  %94 = load i32* %93, align 4
  %95 = add i32 %94, 1
  store i32 %95, i32* %93, align 4
  %96 = load i32* %symbol, align 4
  %97 = icmp ugt i32 %96, 256
  br i1 %97, label %98, label %114

; <label>:98                                      ; preds = %83
  %99 = load i64* %i, align 8
  %100 = add i64 %99, 2
  %101 = getelementptr inbounds %struct.uivector* %lz77_encoded, i32 0, i32 0
  %102 = load i32** %101, align 8
  %103 = getelementptr inbounds i32* %102, i64 %100
  %104 = load i32* %103, align 4
  store i32 %104, i32* %dist, align 4
  %105 = load i32* %dist, align 4
  %106 = zext i32 %105 to i64
  %107 = getelementptr inbounds %struct.uivector* %frequencies_d, i32 0, i32 0
  %108 = load i32** %107, align 8
  %109 = getelementptr inbounds i32* %108, i64 %106
  %110 = load i32* %109, align 4
  %111 = add i32 %110, 1
  store i32 %111, i32* %109, align 4
  %112 = load i64* %i, align 8
  %113 = add i64 %112, 3
  store i64 %113, i64* %i, align 8
  br label %114

; <label>:114                                     ; preds = %98, %83
  br label %115

; <label>:115                                     ; preds = %114
  %116 = load i64* %i, align 8
  %117 = add i64 %116, 1
  store i64 %117, i64* %i, align 8
  br label %78

; <label>:118                                     ; preds = %78
  %119 = getelementptr inbounds %struct.uivector* %frequencies_ll, i32 0, i32 0
  %120 = load i32** %119, align 8
  %121 = getelementptr inbounds i32* %120, i64 256
  store i32 1, i32* %121, align 4
  %122 = getelementptr inbounds %struct.uivector* %frequencies_ll, i32 0, i32 0
  %123 = load i32** %122, align 8
  %124 = getelementptr inbounds %struct.uivector* %frequencies_ll, i32 0, i32 1
  %125 = load i64* %124, align 8
  %126 = call i32 @HuffmanTree_makeFromFrequencies(%struct.HuffmanTree* %tree_ll, i32* %123, i64 257, i64 %125, i32 15)
  store i32 %126, i32* %error, align 4
  %127 = load i32* %error, align 4
  %128 = icmp ne i32 %127, 0
  br i1 %128, label %129, label %130

; <label>:129                                     ; preds = %118
  br label %635

; <label>:130                                     ; preds = %118
  %131 = getelementptr inbounds %struct.uivector* %frequencies_d, i32 0, i32 0
  %132 = load i32** %131, align 8
  %133 = getelementptr inbounds %struct.uivector* %frequencies_d, i32 0, i32 1
  %134 = load i64* %133, align 8
  %135 = call i32 @HuffmanTree_makeFromFrequencies(%struct.HuffmanTree* %tree_d, i32* %132, i64 2, i64 %134, i32 15)
  store i32 %135, i32* %error, align 4
  %136 = load i32* %error, align 4
  %137 = icmp ne i32 %136, 0
  br i1 %137, label %138, label %139

; <label>:138                                     ; preds = %130
  br label %635

; <label>:139                                     ; preds = %130
  %140 = getelementptr inbounds %struct.HuffmanTree* %tree_ll, i32 0, i32 4
  %141 = load i32* %140, align 4
  %142 = zext i32 %141 to i64
  store i64 %142, i64* %numcodes_ll, align 8
  %143 = load i64* %numcodes_ll, align 8
  %144 = icmp ugt i64 %143, 286
  br i1 %144, label %145, label %146

; <label>:145                                     ; preds = %139
  store i64 286, i64* %numcodes_ll, align 8
  br label %146

; <label>:146                                     ; preds = %145, %139
  %147 = getelementptr inbounds %struct.HuffmanTree* %tree_d, i32 0, i32 4
  %148 = load i32* %147, align 4
  %149 = zext i32 %148 to i64
  store i64 %149, i64* %numcodes_d, align 8
  %150 = load i64* %numcodes_d, align 8
  %151 = icmp ugt i64 %150, 30
  br i1 %151, label %152, label %153

; <label>:152                                     ; preds = %146
  store i64 30, i64* %numcodes_d, align 8
  br label %153

; <label>:153                                     ; preds = %152, %146
  store i64 0, i64* %i, align 8
  br label %154

; <label>:154                                     ; preds = %163, %153
  %155 = load i64* %i, align 8
  %156 = load i64* %numcodes_ll, align 8
  %157 = icmp ult i64 %155, %156
  br i1 %157, label %158, label %166

; <label>:158                                     ; preds = %154
  %159 = load i64* %i, align 8
  %160 = trunc i64 %159 to i32
  %161 = call i32 @HuffmanTree_getLength(%struct.HuffmanTree* %tree_ll, i32 %160)
  %162 = call i32 @uivector_push_back(%struct.uivector* %bitlen_lld, i32 %161)
  br label %163

; <label>:163                                     ; preds = %158
  %164 = load i64* %i, align 8
  %165 = add i64 %164, 1
  store i64 %165, i64* %i, align 8
  br label %154

; <label>:166                                     ; preds = %154
  store i64 0, i64* %i, align 8
  br label %167

; <label>:167                                     ; preds = %176, %166
  %168 = load i64* %i, align 8
  %169 = load i64* %numcodes_d, align 8
  %170 = icmp ult i64 %168, %169
  br i1 %170, label %171, label %179

; <label>:171                                     ; preds = %167
  %172 = load i64* %i, align 8
  %173 = trunc i64 %172 to i32
  %174 = call i32 @HuffmanTree_getLength(%struct.HuffmanTree* %tree_d, i32 %173)
  %175 = call i32 @uivector_push_back(%struct.uivector* %bitlen_lld, i32 %174)
  br label %176

; <label>:176                                     ; preds = %171
  %177 = load i64* %i, align 8
  %178 = add i64 %177, 1
  store i64 %178, i64* %i, align 8
  br label %167

; <label>:179                                     ; preds = %167
  store i64 0, i64* %i, align 8
  br label %180

; <label>:180                                     ; preds = %306, %179
  %181 = load i64* %i, align 8
  %182 = getelementptr inbounds %struct.uivector* %bitlen_lld, i32 0, i32 1
  %183 = load i64* %182, align 8
  %184 = trunc i64 %183 to i32
  %185 = zext i32 %184 to i64
  %186 = icmp ult i64 %181, %185
  br i1 %186, label %187, label %309

; <label>:187                                     ; preds = %180
  store i32 0, i32* %j, align 4
  br label %188

; <label>:188                                     ; preds = %217, %187
  %189 = load i64* %i, align 8
  %190 = load i32* %j, align 4
  %191 = zext i32 %190 to i64
  %192 = add i64 %189, %191
  %193 = add i64 %192, 1
  %194 = getelementptr inbounds %struct.uivector* %bitlen_lld, i32 0, i32 1
  %195 = load i64* %194, align 8
  %196 = trunc i64 %195 to i32
  %197 = zext i32 %196 to i64
  %198 = icmp ult i64 %193, %197
  br i1 %198, label %199, label %215

; <label>:199                                     ; preds = %188
  %200 = load i64* %i, align 8
  %201 = load i32* %j, align 4
  %202 = zext i32 %201 to i64
  %203 = add i64 %200, %202
  %204 = add i64 %203, 1
  %205 = getelementptr inbounds %struct.uivector* %bitlen_lld, i32 0, i32 0
  %206 = load i32** %205, align 8
  %207 = getelementptr inbounds i32* %206, i64 %204
  %208 = load i32* %207, align 4
  %209 = load i64* %i, align 8
  %210 = getelementptr inbounds %struct.uivector* %bitlen_lld, i32 0, i32 0
  %211 = load i32** %210, align 8
  %212 = getelementptr inbounds i32* %211, i64 %209
  %213 = load i32* %212, align 4
  %214 = icmp eq i32 %208, %213
  br label %215

; <label>:215                                     ; preds = %199, %188
  %216 = phi i1 [ false, %188 ], [ %214, %199 ]
  br i1 %216, label %217, label %220

; <label>:217                                     ; preds = %215
  %218 = load i32* %j, align 4
  %219 = add i32 %218, 1
  store i32 %219, i32* %j, align 4
  br label %188

; <label>:220                                     ; preds = %215
  %221 = load i64* %i, align 8
  %222 = getelementptr inbounds %struct.uivector* %bitlen_lld, i32 0, i32 0
  %223 = load i32** %222, align 8
  %224 = getelementptr inbounds i32* %223, i64 %221
  %225 = load i32* %224, align 4
  %226 = icmp eq i32 %225, 0
  br i1 %226, label %227, label %255

; <label>:227                                     ; preds = %220
  %228 = load i32* %j, align 4
  %229 = icmp uge i32 %228, 2
  br i1 %229, label %230, label %255

; <label>:230                                     ; preds = %227
  %231 = load i32* %j, align 4
  %232 = add i32 %231, 1
  store i32 %232, i32* %j, align 4
  %233 = load i32* %j, align 4
  %234 = icmp ule i32 %233, 10
  br i1 %234, label %235, label %240

; <label>:235                                     ; preds = %230
  %236 = call i32 @uivector_push_back(%struct.uivector* %bitlen_lld_e, i32 17)
  %237 = load i32* %j, align 4
  %238 = sub i32 %237, 3
  %239 = call i32 @uivector_push_back(%struct.uivector* %bitlen_lld_e, i32 %238)
  br label %249

; <label>:240                                     ; preds = %230
  %241 = load i32* %j, align 4
  %242 = icmp ugt i32 %241, 138
  br i1 %242, label %243, label %244

; <label>:243                                     ; preds = %240
  store i32 138, i32* %j, align 4
  br label %244

; <label>:244                                     ; preds = %243, %240
  %245 = call i32 @uivector_push_back(%struct.uivector* %bitlen_lld_e, i32 18)
  %246 = load i32* %j, align 4
  %247 = sub i32 %246, 11
  %248 = call i32 @uivector_push_back(%struct.uivector* %bitlen_lld_e, i32 %247)
  br label %249

; <label>:249                                     ; preds = %244, %235
  %250 = load i32* %j, align 4
  %251 = sub i32 %250, 1
  %252 = zext i32 %251 to i64
  %253 = load i64* %i, align 8
  %254 = add i64 %253, %252
  store i64 %254, i64* %i, align 8
  br label %305

; <label>:255                                     ; preds = %227, %220
  %256 = load i32* %j, align 4
  %257 = icmp uge i32 %256, 3
  br i1 %257, label %258, label %297

; <label>:258                                     ; preds = %255
  %259 = load i32* %j, align 4
  %260 = udiv i32 %259, 6
  store i32 %260, i32* %num, align 4
  %261 = load i32* %j, align 4
  %262 = urem i32 %261, 6
  store i32 %262, i32* %rest, align 4
  %263 = load i64* %i, align 8
  %264 = getelementptr inbounds %struct.uivector* %bitlen_lld, i32 0, i32 0
  %265 = load i32** %264, align 8
  %266 = getelementptr inbounds i32* %265, i64 %263
  %267 = load i32* %266, align 4
  %268 = call i32 @uivector_push_back(%struct.uivector* %bitlen_lld_e, i32 %267)
  store i64 0, i64* %k, align 8
  br label %269

; <label>:269                                     ; preds = %277, %258
  %270 = load i64* %k, align 8
  %271 = load i32* %num, align 4
  %272 = zext i32 %271 to i64
  %273 = icmp ult i64 %270, %272
  br i1 %273, label %274, label %280

; <label>:274                                     ; preds = %269
  %275 = call i32 @uivector_push_back(%struct.uivector* %bitlen_lld_e, i32 16)
  %276 = call i32 @uivector_push_back(%struct.uivector* %bitlen_lld_e, i32 3)
  br label %277

; <label>:277                                     ; preds = %274
  %278 = load i64* %k, align 8
  %279 = add i64 %278, 1
  store i64 %279, i64* %k, align 8
  br label %269

; <label>:280                                     ; preds = %269
  %281 = load i32* %rest, align 4
  %282 = icmp uge i32 %281, 3
  br i1 %282, label %283, label %288

; <label>:283                                     ; preds = %280
  %284 = call i32 @uivector_push_back(%struct.uivector* %bitlen_lld_e, i32 16)
  %285 = load i32* %rest, align 4
  %286 = sub i32 %285, 3
  %287 = call i32 @uivector_push_back(%struct.uivector* %bitlen_lld_e, i32 %286)
  br label %292

; <label>:288                                     ; preds = %280
  %289 = load i32* %rest, align 4
  %290 = load i32* %j, align 4
  %291 = sub i32 %290, %289
  store i32 %291, i32* %j, align 4
  br label %292

; <label>:292                                     ; preds = %288, %283
  %293 = load i32* %j, align 4
  %294 = zext i32 %293 to i64
  %295 = load i64* %i, align 8
  %296 = add i64 %295, %294
  store i64 %296, i64* %i, align 8
  br label %304

; <label>:297                                     ; preds = %255
  %298 = load i64* %i, align 8
  %299 = getelementptr inbounds %struct.uivector* %bitlen_lld, i32 0, i32 0
  %300 = load i32** %299, align 8
  %301 = getelementptr inbounds i32* %300, i64 %298
  %302 = load i32* %301, align 4
  %303 = call i32 @uivector_push_back(%struct.uivector* %bitlen_lld_e, i32 %302)
  br label %304

; <label>:304                                     ; preds = %297, %292
  br label %305

; <label>:305                                     ; preds = %304, %249
  br label %306

; <label>:306                                     ; preds = %305
  %307 = load i64* %i, align 8
  %308 = add i64 %307, 1
  store i64 %308, i64* %i, align 8
  br label %180

; <label>:309                                     ; preds = %180
  %310 = call i32 @uivector_resizev(%struct.uivector* %frequencies_cl, i64 19, i32 0)
  %311 = icmp ne i32 %310, 0
  br i1 %311, label %313, label %312

; <label>:312                                     ; preds = %309
  store i32 83, i32* %error, align 4
  br label %635

; <label>:313                                     ; preds = %309
  store i64 0, i64* %i, align 8
  br label %314

; <label>:314                                     ; preds = %341, %313
  %315 = load i64* %i, align 8
  %316 = getelementptr inbounds %struct.uivector* %bitlen_lld_e, i32 0, i32 1
  %317 = load i64* %316, align 8
  %318 = icmp ult i64 %315, %317
  br i1 %318, label %319, label %344

; <label>:319                                     ; preds = %314
  %320 = load i64* %i, align 8
  %321 = getelementptr inbounds %struct.uivector* %bitlen_lld_e, i32 0, i32 0
  %322 = load i32** %321, align 8
  %323 = getelementptr inbounds i32* %322, i64 %320
  %324 = load i32* %323, align 4
  %325 = zext i32 %324 to i64
  %326 = getelementptr inbounds %struct.uivector* %frequencies_cl, i32 0, i32 0
  %327 = load i32** %326, align 8
  %328 = getelementptr inbounds i32* %327, i64 %325
  %329 = load i32* %328, align 4
  %330 = add i32 %329, 1
  store i32 %330, i32* %328, align 4
  %331 = load i64* %i, align 8
  %332 = getelementptr inbounds %struct.uivector* %bitlen_lld_e, i32 0, i32 0
  %333 = load i32** %332, align 8
  %334 = getelementptr inbounds i32* %333, i64 %331
  %335 = load i32* %334, align 4
  %336 = icmp uge i32 %335, 16
  br i1 %336, label %337, label %340

; <label>:337                                     ; preds = %319
  %338 = load i64* %i, align 8
  %339 = add i64 %338, 1
  store i64 %339, i64* %i, align 8
  br label %340

; <label>:340                                     ; preds = %337, %319
  br label %341

; <label>:341                                     ; preds = %340
  %342 = load i64* %i, align 8
  %343 = add i64 %342, 1
  store i64 %343, i64* %i, align 8
  br label %314

; <label>:344                                     ; preds = %314
  %345 = getelementptr inbounds %struct.uivector* %frequencies_cl, i32 0, i32 0
  %346 = load i32** %345, align 8
  %347 = getelementptr inbounds %struct.uivector* %frequencies_cl, i32 0, i32 1
  %348 = load i64* %347, align 8
  %349 = getelementptr inbounds %struct.uivector* %frequencies_cl, i32 0, i32 1
  %350 = load i64* %349, align 8
  %351 = call i32 @HuffmanTree_makeFromFrequencies(%struct.HuffmanTree* %tree_cl, i32* %346, i64 %348, i64 %350, i32 7)
  store i32 %351, i32* %error, align 4
  %352 = load i32* %error, align 4
  %353 = icmp ne i32 %352, 0
  br i1 %353, label %354, label %355

; <label>:354                                     ; preds = %344
  br label %635

; <label>:355                                     ; preds = %344
  %356 = getelementptr inbounds %struct.HuffmanTree* %tree_cl, i32 0, i32 4
  %357 = load i32* %356, align 4
  %358 = zext i32 %357 to i64
  %359 = call i32 @uivector_resize(%struct.uivector* %bitlen_cl, i64 %358)
  %360 = icmp ne i32 %359, 0
  br i1 %360, label %362, label %361

; <label>:361                                     ; preds = %355
  store i32 83, i32* %error, align 4
  br label %635

; <label>:362                                     ; preds = %355
  store i64 0, i64* %i, align 8
  br label %363

; <label>:363                                     ; preds = %378, %362
  %364 = load i64* %i, align 8
  %365 = getelementptr inbounds %struct.HuffmanTree* %tree_cl, i32 0, i32 4
  %366 = load i32* %365, align 4
  %367 = zext i32 %366 to i64
  %368 = icmp ult i64 %364, %367
  br i1 %368, label %369, label %381

; <label>:369                                     ; preds = %363
  %370 = load i64* %i, align 8
  %371 = getelementptr inbounds [19 x i32]* @CLCL_ORDER, i32 0, i64 %370
  %372 = load i32* %371, align 4
  %373 = call i32 @HuffmanTree_getLength(%struct.HuffmanTree* %tree_cl, i32 %372)
  %374 = load i64* %i, align 8
  %375 = getelementptr inbounds %struct.uivector* %bitlen_cl, i32 0, i32 0
  %376 = load i32** %375, align 8
  %377 = getelementptr inbounds i32* %376, i64 %374
  store i32 %373, i32* %377, align 4
  br label %378

; <label>:378                                     ; preds = %369
  %379 = load i64* %i, align 8
  %380 = add i64 %379, 1
  store i64 %380, i64* %i, align 8
  br label %363

; <label>:381                                     ; preds = %363
  br label %382

; <label>:382                                     ; preds = %404, %381
  %383 = getelementptr inbounds %struct.uivector* %bitlen_cl, i32 0, i32 1
  %384 = load i64* %383, align 8
  %385 = sub i64 %384, 1
  %386 = getelementptr inbounds %struct.uivector* %bitlen_cl, i32 0, i32 0
  %387 = load i32** %386, align 8
  %388 = getelementptr inbounds i32* %387, i64 %385
  %389 = load i32* %388, align 4
  %390 = icmp eq i32 %389, 0
  br i1 %390, label %391, label %395

; <label>:391                                     ; preds = %382
  %392 = getelementptr inbounds %struct.uivector* %bitlen_cl, i32 0, i32 1
  %393 = load i64* %392, align 8
  %394 = icmp ugt i64 %393, 4
  br label %395

; <label>:395                                     ; preds = %391, %382
  %396 = phi i1 [ false, %382 ], [ %394, %391 ]
  br i1 %396, label %397, label %405

; <label>:397                                     ; preds = %395
  %398 = getelementptr inbounds %struct.uivector* %bitlen_cl, i32 0, i32 1
  %399 = load i64* %398, align 8
  %400 = sub i64 %399, 1
  %401 = call i32 @uivector_resize(%struct.uivector* %bitlen_cl, i64 %400)
  %402 = icmp ne i32 %401, 0
  br i1 %402, label %404, label %403

; <label>:403                                     ; preds = %397
  store i32 83, i32* %error, align 4
  br label %405

; <label>:404                                     ; preds = %397
  br label %382

; <label>:405                                     ; preds = %403, %395
  %406 = load i32* %error, align 4
  %407 = icmp ne i32 %406, 0
  br i1 %407, label %408, label %409

; <label>:408                                     ; preds = %405
  br label %635

; <label>:409                                     ; preds = %405
  %410 = load i64** %2, align 8
  %411 = load i64* %410, align 8
  %412 = and i64 %411, 7
  %413 = icmp eq i64 %412, 0
  br i1 %413, label %414, label %417

; <label>:414                                     ; preds = %409
  %415 = load %struct.ucvector** %1, align 8
  %416 = call i32 @ucvector_push_back(%struct.ucvector* %415, i8 zeroext 0)
  br label %417

; <label>:417                                     ; preds = %414, %409
  %418 = load i32* %BFINAL, align 4
  %419 = load i64** %2, align 8
  %420 = load i64* %419, align 8
  %421 = and i64 %420, 7
  %422 = trunc i64 %421 to i32
  %423 = shl i32 %418, %422
  %424 = load %struct.ucvector** %1, align 8
  %425 = getelementptr inbounds %struct.ucvector* %424, i32 0, i32 1
  %426 = load i64* %425, align 8
  %427 = sub i64 %426, 1
  %428 = load %struct.ucvector** %1, align 8
  %429 = getelementptr inbounds %struct.ucvector* %428, i32 0, i32 0
  %430 = load i8** %429, align 8
  %431 = getelementptr inbounds i8* %430, i64 %427
  %432 = load i8* %431, align 1
  %433 = zext i8 %432 to i32
  %434 = or i32 %433, %423
  %435 = trunc i32 %434 to i8
  store i8 %435, i8* %431, align 1
  %436 = load i64** %2, align 8
  %437 = load i64* %436, align 8
  %438 = add i64 %437, 1
  store i64 %438, i64* %436, align 8
  %439 = load i64** %2, align 8
  %440 = load i64* %439, align 8
  %441 = and i64 %440, 7
  %442 = icmp eq i64 %441, 0
  br i1 %442, label %443, label %446

; <label>:443                                     ; preds = %417
  %444 = load %struct.ucvector** %1, align 8
  %445 = call i32 @ucvector_push_back(%struct.ucvector* %444, i8 zeroext 0)
  br label %446

; <label>:446                                     ; preds = %443, %417
  %447 = load i64** %2, align 8
  %448 = load i64* %447, align 8
  %449 = and i64 %448, 7
  %450 = trunc i64 %449 to i32
  %451 = shl i32 0, %450
  %452 = load %struct.ucvector** %1, align 8
  %453 = getelementptr inbounds %struct.ucvector* %452, i32 0, i32 1
  %454 = load i64* %453, align 8
  %455 = sub i64 %454, 1
  %456 = load %struct.ucvector** %1, align 8
  %457 = getelementptr inbounds %struct.ucvector* %456, i32 0, i32 0
  %458 = load i8** %457, align 8
  %459 = getelementptr inbounds i8* %458, i64 %455
  %460 = load i8* %459, align 1
  %461 = zext i8 %460 to i32
  %462 = or i32 %461, %451
  %463 = trunc i32 %462 to i8
  store i8 %463, i8* %459, align 1
  %464 = load i64** %2, align 8
  %465 = load i64* %464, align 8
  %466 = add i64 %465, 1
  store i64 %466, i64* %464, align 8
  %467 = load i64** %2, align 8
  %468 = load i64* %467, align 8
  %469 = and i64 %468, 7
  %470 = icmp eq i64 %469, 0
  br i1 %470, label %471, label %474

; <label>:471                                     ; preds = %446
  %472 = load %struct.ucvector** %1, align 8
  %473 = call i32 @ucvector_push_back(%struct.ucvector* %472, i8 zeroext 0)
  br label %474

; <label>:474                                     ; preds = %471, %446
  %475 = load i64** %2, align 8
  %476 = load i64* %475, align 8
  %477 = and i64 %476, 7
  %478 = trunc i64 %477 to i32
  %479 = shl i32 1, %478
  %480 = load %struct.ucvector** %1, align 8
  %481 = getelementptr inbounds %struct.ucvector* %480, i32 0, i32 1
  %482 = load i64* %481, align 8
  %483 = sub i64 %482, 1
  %484 = load %struct.ucvector** %1, align 8
  %485 = getelementptr inbounds %struct.ucvector* %484, i32 0, i32 0
  %486 = load i8** %485, align 8
  %487 = getelementptr inbounds i8* %486, i64 %483
  %488 = load i8* %487, align 1
  %489 = zext i8 %488 to i32
  %490 = or i32 %489, %479
  %491 = trunc i32 %490 to i8
  store i8 %491, i8* %487, align 1
  %492 = load i64** %2, align 8
  %493 = load i64* %492, align 8
  %494 = add i64 %493, 1
  store i64 %494, i64* %492, align 8
  %495 = load i64* %numcodes_ll, align 8
  %496 = sub i64 %495, 257
  %497 = trunc i64 %496 to i32
  store i32 %497, i32* %HLIT, align 4
  %498 = load i64* %numcodes_d, align 8
  %499 = sub i64 %498, 1
  %500 = trunc i64 %499 to i32
  store i32 %500, i32* %HDIST, align 4
  %501 = getelementptr inbounds %struct.uivector* %bitlen_cl, i32 0, i32 1
  %502 = load i64* %501, align 8
  %503 = trunc i64 %502 to i32
  %504 = sub i32 %503, 4
  store i32 %504, i32* %HCLEN, align 4
  br label %505

; <label>:505                                     ; preds = %520, %474
  %506 = load i32* %HCLEN, align 4
  %507 = add i32 %506, 4
  %508 = sub i32 %507, 1
  %509 = zext i32 %508 to i64
  %510 = getelementptr inbounds %struct.uivector* %bitlen_cl, i32 0, i32 0
  %511 = load i32** %510, align 8
  %512 = getelementptr inbounds i32* %511, i64 %509
  %513 = load i32* %512, align 4
  %514 = icmp ne i32 %513, 0
  br i1 %514, label %518, label %515

; <label>:515                                     ; preds = %505
  %516 = load i32* %HCLEN, align 4
  %517 = icmp ugt i32 %516, 0
  br label %518

; <label>:518                                     ; preds = %515, %505
  %519 = phi i1 [ false, %505 ], [ %517, %515 ]
  br i1 %519, label %520, label %523

; <label>:520                                     ; preds = %518
  %521 = load i32* %HCLEN, align 4
  %522 = add i32 %521, -1
  store i32 %522, i32* %HCLEN, align 4
  br label %505

; <label>:523                                     ; preds = %518
  %524 = load i64** %2, align 8
  %525 = load %struct.ucvector** %1, align 8
  %526 = load i32* %HLIT, align 4
  call void @addBitsToStream(i64* %524, %struct.ucvector* %525, i32 %526, i64 5)
  %527 = load i64** %2, align 8
  %528 = load %struct.ucvector** %1, align 8
  %529 = load i32* %HDIST, align 4
  call void @addBitsToStream(i64* %527, %struct.ucvector* %528, i32 %529, i64 5)
  %530 = load i64** %2, align 8
  %531 = load %struct.ucvector** %1, align 8
  %532 = load i32* %HCLEN, align 4
  call void @addBitsToStream(i64* %530, %struct.ucvector* %531, i32 %532, i64 4)
  store i64 0, i64* %i, align 8
  br label %533

; <label>:533                                     ; preds = %547, %523
  %534 = load i64* %i, align 8
  %535 = load i32* %HCLEN, align 4
  %536 = add i32 %535, 4
  %537 = zext i32 %536 to i64
  %538 = icmp ult i64 %534, %537
  br i1 %538, label %539, label %550

; <label>:539                                     ; preds = %533
  %540 = load i64** %2, align 8
  %541 = load %struct.ucvector** %1, align 8
  %542 = load i64* %i, align 8
  %543 = getelementptr inbounds %struct.uivector* %bitlen_cl, i32 0, i32 0
  %544 = load i32** %543, align 8
  %545 = getelementptr inbounds i32* %544, i64 %542
  %546 = load i32* %545, align 4
  call void @addBitsToStream(i64* %540, %struct.ucvector* %541, i32 %546, i64 3)
  br label %547

; <label>:547                                     ; preds = %539
  %548 = load i64* %i, align 8
  %549 = add i64 %548, 1
  store i64 %549, i64* %i, align 8
  br label %533

; <label>:550                                     ; preds = %533
  store i64 0, i64* %i, align 8
  br label %551

; <label>:551                                     ; preds = %621, %550
  %552 = load i64* %i, align 8
  %553 = getelementptr inbounds %struct.uivector* %bitlen_lld_e, i32 0, i32 1
  %554 = load i64* %553, align 8
  %555 = icmp ult i64 %552, %554
  br i1 %555, label %556, label %624

; <label>:556                                     ; preds = %551
  %557 = load i64** %2, align 8
  %558 = load %struct.ucvector** %1, align 8
  %559 = load i64* %i, align 8
  %560 = getelementptr inbounds %struct.uivector* %bitlen_lld_e, i32 0, i32 0
  %561 = load i32** %560, align 8
  %562 = getelementptr inbounds i32* %561, i64 %559
  %563 = load i32* %562, align 4
  %564 = call i32 @HuffmanTree_getCode(%struct.HuffmanTree* %tree_cl, i32 %563)
  %565 = load i64* %i, align 8
  %566 = getelementptr inbounds %struct.uivector* %bitlen_lld_e, i32 0, i32 0
  %567 = load i32** %566, align 8
  %568 = getelementptr inbounds i32* %567, i64 %565
  %569 = load i32* %568, align 4
  %570 = call i32 @HuffmanTree_getLength(%struct.HuffmanTree* %tree_cl, i32 %569)
  call void @addHuffmanSymbol(i64* %557, %struct.ucvector* %558, i32 %564, i32 %570)
  %571 = load i64* %i, align 8
  %572 = getelementptr inbounds %struct.uivector* %bitlen_lld_e, i32 0, i32 0
  %573 = load i32** %572, align 8
  %574 = getelementptr inbounds i32* %573, i64 %571
  %575 = load i32* %574, align 4
  %576 = icmp eq i32 %575, 16
  br i1 %576, label %577, label %586

; <label>:577                                     ; preds = %556
  %578 = load i64** %2, align 8
  %579 = load %struct.ucvector** %1, align 8
  %580 = load i64* %i, align 8
  %581 = add i64 %580, 1
  store i64 %581, i64* %i, align 8
  %582 = getelementptr inbounds %struct.uivector* %bitlen_lld_e, i32 0, i32 0
  %583 = load i32** %582, align 8
  %584 = getelementptr inbounds i32* %583, i64 %581
  %585 = load i32* %584, align 4
  call void @addBitsToStream(i64* %578, %struct.ucvector* %579, i32 %585, i64 2)
  br label %620

; <label>:586                                     ; preds = %556
  %587 = load i64* %i, align 8
  %588 = getelementptr inbounds %struct.uivector* %bitlen_lld_e, i32 0, i32 0
  %589 = load i32** %588, align 8
  %590 = getelementptr inbounds i32* %589, i64 %587
  %591 = load i32* %590, align 4
  %592 = icmp eq i32 %591, 17
  br i1 %592, label %593, label %602

; <label>:593                                     ; preds = %586
  %594 = load i64** %2, align 8
  %595 = load %struct.ucvector** %1, align 8
  %596 = load i64* %i, align 8
  %597 = add i64 %596, 1
  store i64 %597, i64* %i, align 8
  %598 = getelementptr inbounds %struct.uivector* %bitlen_lld_e, i32 0, i32 0
  %599 = load i32** %598, align 8
  %600 = getelementptr inbounds i32* %599, i64 %597
  %601 = load i32* %600, align 4
  call void @addBitsToStream(i64* %594, %struct.ucvector* %595, i32 %601, i64 3)
  br label %619

; <label>:602                                     ; preds = %586
  %603 = load i64* %i, align 8
  %604 = getelementptr inbounds %struct.uivector* %bitlen_lld_e, i32 0, i32 0
  %605 = load i32** %604, align 8
  %606 = getelementptr inbounds i32* %605, i64 %603
  %607 = load i32* %606, align 4
  %608 = icmp eq i32 %607, 18
  br i1 %608, label %609, label %618

; <label>:609                                     ; preds = %602
  %610 = load i64** %2, align 8
  %611 = load %struct.ucvector** %1, align 8
  %612 = load i64* %i, align 8
  %613 = add i64 %612, 1
  store i64 %613, i64* %i, align 8
  %614 = getelementptr inbounds %struct.uivector* %bitlen_lld_e, i32 0, i32 0
  %615 = load i32** %614, align 8
  %616 = getelementptr inbounds i32* %615, i64 %613
  %617 = load i32* %616, align 4
  call void @addBitsToStream(i64* %610, %struct.ucvector* %611, i32 %617, i64 7)
  br label %618

; <label>:618                                     ; preds = %609, %602
  br label %619

; <label>:619                                     ; preds = %618, %593
  br label %620

; <label>:620                                     ; preds = %619, %577
  br label %621

; <label>:621                                     ; preds = %620
  %622 = load i64* %i, align 8
  %623 = add i64 %622, 1
  store i64 %623, i64* %i, align 8
  br label %551

; <label>:624                                     ; preds = %551
  %625 = load i64** %2, align 8
  %626 = load %struct.ucvector** %1, align 8
  call void @writeLZ77data(i64* %625, %struct.ucvector* %626, %struct.uivector* %lz77_encoded, %struct.HuffmanTree* %tree_ll, %struct.HuffmanTree* %tree_d)
  %627 = call i32 @HuffmanTree_getLength(%struct.HuffmanTree* %tree_ll, i32 256)
  %628 = icmp eq i32 %627, 0
  br i1 %628, label %629, label %630

; <label>:629                                     ; preds = %624
  store i32 64, i32* %error, align 4
  br label %635

; <label>:630                                     ; preds = %624
  %631 = load i64** %2, align 8
  %632 = load %struct.ucvector** %1, align 8
  %633 = call i32 @HuffmanTree_getCode(%struct.HuffmanTree* %tree_ll, i32 256)
  %634 = call i32 @HuffmanTree_getLength(%struct.HuffmanTree* %tree_ll, i32 256)
  call void @addHuffmanSymbol(i64* %631, %struct.ucvector* %632, i32 %633, i32 %634)
  br label %635

; <label>:635                                     ; preds = %630, %629, %408, %361, %354, %312, %138, %129, %76, %72, %48, %42, %13
  %636 = bitcast %struct.uivector* %lz77_encoded to i8*
  call void @uivector_cleanup(i8* %636)
  call void @HuffmanTree_cleanup(%struct.HuffmanTree* %tree_ll)
  call void @HuffmanTree_cleanup(%struct.HuffmanTree* %tree_d)
  call void @HuffmanTree_cleanup(%struct.HuffmanTree* %tree_cl)
  %637 = bitcast %struct.uivector* %frequencies_ll to i8*
  call void @uivector_cleanup(i8* %637)
  %638 = bitcast %struct.uivector* %frequencies_d to i8*
  call void @uivector_cleanup(i8* %638)
  %639 = bitcast %struct.uivector* %frequencies_cl to i8*
  call void @uivector_cleanup(i8* %639)
  %640 = bitcast %struct.uivector* %bitlen_lld_e to i8*
  call void @uivector_cleanup(i8* %640)
  %641 = bitcast %struct.uivector* %bitlen_lld to i8*
  call void @uivector_cleanup(i8* %641)
  %642 = bitcast %struct.uivector* %bitlen_cl to i8*
  call void @uivector_cleanup(i8* %642)
  %643 = load i32* %error, align 4
  ret i32 %643
}

; Function Attrs: nounwind uwtable
define internal void @hash_cleanup(%struct.Hash* %hash) #0 {
  %1 = alloca %struct.Hash*, align 8
  store %struct.Hash* %hash, %struct.Hash** %1, align 8
  %2 = load %struct.Hash** %1, align 8
  %3 = getelementptr inbounds %struct.Hash* %2, i32 0, i32 0
  %4 = load i32** %3, align 8
  %5 = bitcast i32* %4 to i8*
  call void @lodepng_free(i8* %5)
  %6 = load %struct.Hash** %1, align 8
  %7 = getelementptr inbounds %struct.Hash* %6, i32 0, i32 1
  %8 = load i32** %7, align 8
  %9 = bitcast i32* %8 to i8*
  call void @lodepng_free(i8* %9)
  %10 = load %struct.Hash** %1, align 8
  %11 = getelementptr inbounds %struct.Hash* %10, i32 0, i32 2
  %12 = load i16** %11, align 8
  %13 = bitcast i16* %12 to i8*
  call void @lodepng_free(i8* %13)
  %14 = load %struct.Hash** %1, align 8
  %15 = getelementptr inbounds %struct.Hash* %14, i32 0, i32 3
  %16 = load i16** %15, align 8
  %17 = bitcast i16* %16 to i8*
  call void @lodepng_free(i8* %17)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @uivector_init(%struct.uivector* %p) #0 {
  %1 = alloca %struct.uivector*, align 8
  store %struct.uivector* %p, %struct.uivector** %1, align 8
  %2 = load %struct.uivector** %1, align 8
  %3 = getelementptr inbounds %struct.uivector* %2, i32 0, i32 0
  store i32* null, i32** %3, align 8
  %4 = load %struct.uivector** %1, align 8
  %5 = getelementptr inbounds %struct.uivector* %4, i32 0, i32 2
  store i64 0, i64* %5, align 8
  %6 = load %struct.uivector** %1, align 8
  %7 = getelementptr inbounds %struct.uivector* %6, i32 0, i32 1
  store i64 0, i64* %7, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @HuffmanTree_init(%struct.HuffmanTree* %tree) #0 {
  %1 = alloca %struct.HuffmanTree*, align 8
  store %struct.HuffmanTree* %tree, %struct.HuffmanTree** %1, align 8
  %2 = load %struct.HuffmanTree** %1, align 8
  %3 = getelementptr inbounds %struct.HuffmanTree* %2, i32 0, i32 0
  store i32* null, i32** %3, align 8
  %4 = load %struct.HuffmanTree** %1, align 8
  %5 = getelementptr inbounds %struct.HuffmanTree* %4, i32 0, i32 1
  store i32* null, i32** %5, align 8
  %6 = load %struct.HuffmanTree** %1, align 8
  %7 = getelementptr inbounds %struct.HuffmanTree* %6, i32 0, i32 2
  store i32* null, i32** %7, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define internal i32 @encodeLZ77(%struct.uivector* %out, %struct.Hash* %hash, i8* %in, i64 %inpos, i64 %insize, i32 %windowsize, i32 %minmatch, i32 %nicematch, i32 %lazymatching) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.uivector*, align 8
  %3 = alloca %struct.Hash*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %pos = alloca i32, align 4
  %i = alloca i32, align 4
  %error = alloca i32, align 4
  %maxchainlength = alloca i32, align 4
  %maxlazymatch = alloca i32, align 4
  %usezeros = alloca i32, align 4
  %numzeros = alloca i32, align 4
  %offset = alloca i32, align 4
  %length = alloca i32, align 4
  %lazy = alloca i32, align 4
  %lazylength = alloca i32, align 4
  %lazyoffset = alloca i32, align 4
  %hashval = alloca i32, align 4
  %current_offset = alloca i32, align 4
  %current_length = alloca i32, align 4
  %lastptr = alloca i8*, align 8
  %foreptr = alloca i8*, align 8
  %backptr = alloca i8*, align 8
  %hashpos = alloca i32, align 4
  %prevpos = alloca i32, align 4
  %wpos = alloca i64, align 8
  %chainlength = alloca i32, align 4
  %skip = alloca i32, align 4
  store %struct.uivector* %out, %struct.uivector** %2, align 8
  store %struct.Hash* %hash, %struct.Hash** %3, align 8
  store i8* %in, i8** %4, align 8
  store i64 %inpos, i64* %5, align 8
  store i64 %insize, i64* %6, align 8
  store i32 %windowsize, i32* %7, align 4
  store i32 %minmatch, i32* %8, align 4
  store i32 %nicematch, i32* %9, align 4
  store i32 %lazymatching, i32* %10, align 4
  store i32 0, i32* %error, align 4
  %11 = load i32* %7, align 4
  %12 = icmp uge i32 %11, 8192
  br i1 %12, label %13, label %15

; <label>:13                                      ; preds = %0
  %14 = load i32* %7, align 4
  br label %18

; <label>:15                                      ; preds = %0
  %16 = load i32* %7, align 4
  %17 = udiv i32 %16, 8
  br label %18

; <label>:18                                      ; preds = %15, %13
  %19 = phi i32 [ %14, %13 ], [ %17, %15 ]
  store i32 %19, i32* %maxchainlength, align 4
  %20 = load i32* %7, align 4
  %21 = icmp uge i32 %20, 8192
  %22 = select i1 %21, i64 258, i64 64
  %23 = trunc i64 %22 to i32
  store i32 %23, i32* %maxlazymatch, align 4
  store i32 1, i32* %usezeros, align 4
  store i32 0, i32* %numzeros, align 4
  store i32 0, i32* %lazy, align 4
  store i32 0, i32* %lazylength, align 4
  store i32 0, i32* %lazyoffset, align 4
  %24 = load i32* %7, align 4
  %25 = icmp ule i32 %24, 0
  br i1 %25, label %29, label %26

; <label>:26                                      ; preds = %18
  %27 = load i32* %7, align 4
  %28 = icmp ugt i32 %27, 32768
  br i1 %28, label %29, label %30

; <label>:29                                      ; preds = %26, %18
  store i32 60, i32* %1
  br label %497

; <label>:30                                      ; preds = %26
  %31 = load i32* %7, align 4
  %32 = load i32* %7, align 4
  %33 = sub i32 %32, 1
  %34 = and i32 %31, %33
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %36, label %37

; <label>:36                                      ; preds = %30
  store i32 90, i32* %1
  br label %497

; <label>:37                                      ; preds = %30
  %38 = load i32* %9, align 4
  %39 = zext i32 %38 to i64
  %40 = icmp ugt i64 %39, 258
  br i1 %40, label %41, label %42

; <label>:41                                      ; preds = %37
  store i32 258, i32* %9, align 4
  br label %42

; <label>:42                                      ; preds = %41, %37
  %43 = load i64* %5, align 8
  %44 = trunc i64 %43 to i32
  store i32 %44, i32* %pos, align 4
  br label %45

; <label>:45                                      ; preds = %492, %42
  %46 = load i32* %pos, align 4
  %47 = zext i32 %46 to i64
  %48 = load i64* %6, align 8
  %49 = icmp ult i64 %47, %48
  br i1 %49, label %50, label %495

; <label>:50                                      ; preds = %45
  %51 = load i32* %pos, align 4
  %52 = load i32* %7, align 4
  %53 = sub i32 %52, 1
  %54 = and i32 %51, %53
  %55 = zext i32 %54 to i64
  store i64 %55, i64* %wpos, align 8
  store i32 0, i32* %chainlength, align 4
  %56 = load i8** %4, align 8
  %57 = load i64* %6, align 8
  %58 = load i32* %pos, align 4
  %59 = zext i32 %58 to i64
  %60 = call i32 @getHash(i8* %56, i64 %57, i64 %59)
  store i32 %60, i32* %hashval, align 4
  %61 = load %struct.Hash** %3, align 8
  %62 = load i64* %wpos, align 8
  %63 = load i32* %hashval, align 4
  call void @updateHashChain(%struct.Hash* %61, i64 %62, i32 %63)
  %64 = load i32* %usezeros, align 4
  %65 = icmp ne i32 %64, 0
  br i1 %65, label %66, label %108

; <label>:66                                      ; preds = %50
  %67 = load i32* %hashval, align 4
  %68 = icmp eq i32 %67, 0
  br i1 %68, label %69, label %108

; <label>:69                                      ; preds = %66
  %70 = load i32* %numzeros, align 4
  %71 = icmp eq i32 %70, 0
  br i1 %71, label %72, label %78

; <label>:72                                      ; preds = %69
  %73 = load i8** %4, align 8
  %74 = load i64* %6, align 8
  %75 = load i32* %pos, align 4
  %76 = zext i32 %75 to i64
  %77 = call i32 @countZeros(i8* %73, i64 %74, i64 %76)
  store i32 %77, i32* %numzeros, align 4
  br label %100

; <label>:78                                      ; preds = %69
  %79 = load i32* %pos, align 4
  %80 = load i32* %numzeros, align 4
  %81 = add i32 %79, %80
  %82 = zext i32 %81 to i64
  %83 = load i64* %6, align 8
  %84 = icmp uge i64 %82, %83
  br i1 %84, label %96, label %85

; <label>:85                                      ; preds = %78
  %86 = load i32* %pos, align 4
  %87 = load i32* %numzeros, align 4
  %88 = add i32 %86, %87
  %89 = sub i32 %88, 1
  %90 = zext i32 %89 to i64
  %91 = load i8** %4, align 8
  %92 = getelementptr inbounds i8* %91, i64 %90
  %93 = load i8* %92, align 1
  %94 = zext i8 %93 to i32
  %95 = icmp ne i32 %94, 0
  br i1 %95, label %96, label %99

; <label>:96                                      ; preds = %85, %78
  %97 = load i32* %numzeros, align 4
  %98 = add i32 %97, -1
  store i32 %98, i32* %numzeros, align 4
  br label %99

; <label>:99                                      ; preds = %96, %85
  br label %100

; <label>:100                                     ; preds = %99, %72
  %101 = load i32* %numzeros, align 4
  %102 = trunc i32 %101 to i16
  %103 = load i64* %wpos, align 8
  %104 = load %struct.Hash** %3, align 8
  %105 = getelementptr inbounds %struct.Hash* %104, i32 0, i32 3
  %106 = load i16** %105, align 8
  %107 = getelementptr inbounds i16* %106, i64 %103
  store i16 %102, i16* %107, align 2
  br label %109

; <label>:108                                     ; preds = %66, %50
  store i32 0, i32* %numzeros, align 4
  br label %109

; <label>:109                                     ; preds = %108, %100
  store i32 0, i32* %length, align 4
  store i32 0, i32* %offset, align 4
  %110 = load i32* %hashval, align 4
  %111 = zext i32 %110 to i64
  %112 = load %struct.Hash** %3, align 8
  %113 = getelementptr inbounds %struct.Hash* %112, i32 0, i32 0
  %114 = load i32** %113, align 8
  %115 = getelementptr inbounds i32* %114, i64 %111
  %116 = load i32* %115, align 4
  store i32 %116, i32* %prevpos, align 4
  %117 = load i32* %prevpos, align 4
  %118 = zext i32 %117 to i64
  %119 = load %struct.Hash** %3, align 8
  %120 = getelementptr inbounds %struct.Hash* %119, i32 0, i32 2
  %121 = load i16** %120, align 8
  %122 = getelementptr inbounds i16* %121, i64 %118
  %123 = load i16* %122, align 2
  %124 = zext i16 %123 to i32
  store i32 %124, i32* %hashpos, align 4
  %125 = load i64* %6, align 8
  %126 = load i32* %pos, align 4
  %127 = zext i32 %126 to i64
  %128 = add i64 %127, 258
  %129 = icmp ult i64 %125, %128
  br i1 %129, label %130, label %132

; <label>:130                                     ; preds = %109
  %131 = load i64* %6, align 8
  br label %136

; <label>:132                                     ; preds = %109
  %133 = load i32* %pos, align 4
  %134 = zext i32 %133 to i64
  %135 = add i64 %134, 258
  br label %136

; <label>:136                                     ; preds = %132, %130
  %137 = phi i64 [ %131, %130 ], [ %135, %132 ]
  %138 = load i8** %4, align 8
  %139 = getelementptr inbounds i8* %138, i64 %137
  store i8* %139, i8** %lastptr, align 8
  br label %140

; <label>:140                                     ; preds = %301, %136
  %141 = load i32* %prevpos, align 4
  %142 = zext i32 %141 to i64
  %143 = load i64* %wpos, align 8
  %144 = icmp ult i64 %142, %143
  br i1 %144, label %145, label %155

; <label>:145                                     ; preds = %140
  %146 = load i32* %hashpos, align 4
  %147 = load i32* %prevpos, align 4
  %148 = icmp ugt i32 %146, %147
  br i1 %148, label %149, label %155

; <label>:149                                     ; preds = %145
  %150 = load i32* %hashpos, align 4
  %151 = zext i32 %150 to i64
  %152 = load i64* %wpos, align 8
  %153 = icmp ule i64 %151, %152
  br i1 %153, label %154, label %155

; <label>:154                                     ; preds = %149
  br label %311

; <label>:155                                     ; preds = %149, %145, %140
  %156 = load i32* %prevpos, align 4
  %157 = zext i32 %156 to i64
  %158 = load i64* %wpos, align 8
  %159 = icmp ugt i64 %157, %158
  br i1 %159, label %160, label %170

; <label>:160                                     ; preds = %155
  %161 = load i32* %hashpos, align 4
  %162 = zext i32 %161 to i64
  %163 = load i64* %wpos, align 8
  %164 = icmp ule i64 %162, %163
  br i1 %164, label %169, label %165

; <label>:165                                     ; preds = %160
  %166 = load i32* %hashpos, align 4
  %167 = load i32* %prevpos, align 4
  %168 = icmp ugt i32 %166, %167
  br i1 %168, label %169, label %170

; <label>:169                                     ; preds = %165, %160
  br label %311

; <label>:170                                     ; preds = %165, %155
  %171 = load i32* %chainlength, align 4
  %172 = add i32 %171, 1
  store i32 %172, i32* %chainlength, align 4
  %173 = load i32* %maxchainlength, align 4
  %174 = icmp uge i32 %171, %173
  br i1 %174, label %175, label %176

; <label>:175                                     ; preds = %170
  br label %311

; <label>:176                                     ; preds = %170
  %177 = load i32* %hashpos, align 4
  %178 = zext i32 %177 to i64
  %179 = load i64* %wpos, align 8
  %180 = icmp ule i64 %178, %179
  br i1 %180, label %181, label %186

; <label>:181                                     ; preds = %176
  %182 = load i64* %wpos, align 8
  %183 = load i32* %hashpos, align 4
  %184 = zext i32 %183 to i64
  %185 = sub i64 %182, %184
  br label %194

; <label>:186                                     ; preds = %176
  %187 = load i64* %wpos, align 8
  %188 = load i32* %hashpos, align 4
  %189 = zext i32 %188 to i64
  %190 = sub i64 %187, %189
  %191 = load i32* %7, align 4
  %192 = zext i32 %191 to i64
  %193 = add i64 %190, %192
  br label %194

; <label>:194                                     ; preds = %186, %181
  %195 = phi i64 [ %185, %181 ], [ %193, %186 ]
  %196 = trunc i64 %195 to i32
  store i32 %196, i32* %current_offset, align 4
  %197 = load i32* %current_offset, align 4
  %198 = icmp ugt i32 %197, 0
  br i1 %198, label %199, label %289

; <label>:199                                     ; preds = %194
  %200 = load i32* %pos, align 4
  %201 = zext i32 %200 to i64
  %202 = load i8** %4, align 8
  %203 = getelementptr inbounds i8* %202, i64 %201
  store i8* %203, i8** %foreptr, align 8
  %204 = load i32* %pos, align 4
  %205 = load i32* %current_offset, align 4
  %206 = sub i32 %204, %205
  %207 = zext i32 %206 to i64
  %208 = load i8** %4, align 8
  %209 = getelementptr inbounds i8* %208, i64 %207
  store i8* %209, i8** %backptr, align 8
  %210 = load i32* %usezeros, align 4
  %211 = icmp ne i32 %210, 0
  br i1 %211, label %212, label %247

; <label>:212                                     ; preds = %199
  %213 = load i32* %hashval, align 4
  %214 = icmp eq i32 %213, 0
  br i1 %214, label %215, label %247

; <label>:215                                     ; preds = %212
  %216 = load i32* %hashpos, align 4
  %217 = zext i32 %216 to i64
  %218 = load %struct.Hash** %3, align 8
  %219 = getelementptr inbounds %struct.Hash* %218, i32 0, i32 1
  %220 = load i32** %219, align 8
  %221 = getelementptr inbounds i32* %220, i64 %217
  %222 = load i32* %221, align 4
  %223 = icmp eq i32 %222, 0
  br i1 %223, label %224, label %247

; <label>:224                                     ; preds = %215
  %225 = load i32* %hashpos, align 4
  %226 = zext i32 %225 to i64
  %227 = load %struct.Hash** %3, align 8
  %228 = getelementptr inbounds %struct.Hash* %227, i32 0, i32 3
  %229 = load i16** %228, align 8
  %230 = getelementptr inbounds i16* %229, i64 %226
  %231 = load i16* %230, align 2
  %232 = zext i16 %231 to i32
  store i32 %232, i32* %skip, align 4
  %233 = load i32* %skip, align 4
  %234 = load i32* %numzeros, align 4
  %235 = icmp ugt i32 %233, %234
  br i1 %235, label %236, label %238

; <label>:236                                     ; preds = %224
  %237 = load i32* %numzeros, align 4
  store i32 %237, i32* %skip, align 4
  br label %238

; <label>:238                                     ; preds = %236, %224
  %239 = load i32* %skip, align 4
  %240 = load i8** %backptr, align 8
  %241 = zext i32 %239 to i64
  %242 = getelementptr inbounds i8* %240, i64 %241
  store i8* %242, i8** %backptr, align 8
  %243 = load i32* %skip, align 4
  %244 = load i8** %foreptr, align 8
  %245 = zext i32 %243 to i64
  %246 = getelementptr inbounds i8* %244, i64 %245
  store i8* %246, i8** %foreptr, align 8
  br label %247

; <label>:247                                     ; preds = %238, %215, %212, %199
  br label %248

; <label>:248                                     ; preds = %262, %247
  %249 = load i8** %foreptr, align 8
  %250 = load i8** %lastptr, align 8
  %251 = icmp ne i8* %249, %250
  br i1 %251, label %252, label %260

; <label>:252                                     ; preds = %248
  %253 = load i8** %backptr, align 8
  %254 = load i8* %253, align 1
  %255 = zext i8 %254 to i32
  %256 = load i8** %foreptr, align 8
  %257 = load i8* %256, align 1
  %258 = zext i8 %257 to i32
  %259 = icmp eq i32 %255, %258
  br label %260

; <label>:260                                     ; preds = %252, %248
  %261 = phi i1 [ false, %248 ], [ %259, %252 ]
  br i1 %261, label %262, label %267

; <label>:262                                     ; preds = %260
  %263 = load i8** %backptr, align 8
  %264 = getelementptr inbounds i8* %263, i32 1
  store i8* %264, i8** %backptr, align 8
  %265 = load i8** %foreptr, align 8
  %266 = getelementptr inbounds i8* %265, i32 1
  store i8* %266, i8** %foreptr, align 8
  br label %248

; <label>:267                                     ; preds = %260
  %268 = load i8** %foreptr, align 8
  %269 = load i32* %pos, align 4
  %270 = zext i32 %269 to i64
  %271 = load i8** %4, align 8
  %272 = getelementptr inbounds i8* %271, i64 %270
  %273 = ptrtoint i8* %268 to i64
  %274 = ptrtoint i8* %272 to i64
  %275 = sub i64 %273, %274
  %276 = trunc i64 %275 to i32
  store i32 %276, i32* %current_length, align 4
  %277 = load i32* %current_length, align 4
  %278 = load i32* %length, align 4
  %279 = icmp ugt i32 %277, %278
  br i1 %279, label %280, label %288

; <label>:280                                     ; preds = %267
  %281 = load i32* %current_length, align 4
  store i32 %281, i32* %length, align 4
  %282 = load i32* %current_offset, align 4
  store i32 %282, i32* %offset, align 4
  %283 = load i32* %current_length, align 4
  %284 = load i32* %9, align 4
  %285 = icmp uge i32 %283, %284
  br i1 %285, label %286, label %287

; <label>:286                                     ; preds = %280
  br label %311

; <label>:287                                     ; preds = %280
  br label %288

; <label>:288                                     ; preds = %287, %267
  br label %289

; <label>:289                                     ; preds = %288, %194
  %290 = load i32* %hashpos, align 4
  %291 = load i32* %hashpos, align 4
  %292 = zext i32 %291 to i64
  %293 = load %struct.Hash** %3, align 8
  %294 = getelementptr inbounds %struct.Hash* %293, i32 0, i32 2
  %295 = load i16** %294, align 8
  %296 = getelementptr inbounds i16* %295, i64 %292
  %297 = load i16* %296, align 2
  %298 = zext i16 %297 to i32
  %299 = icmp eq i32 %290, %298
  br i1 %299, label %300, label %301

; <label>:300                                     ; preds = %289
  br label %311

; <label>:301                                     ; preds = %289
  %302 = load i32* %hashpos, align 4
  store i32 %302, i32* %prevpos, align 4
  %303 = load i32* %hashpos, align 4
  %304 = zext i32 %303 to i64
  %305 = load %struct.Hash** %3, align 8
  %306 = getelementptr inbounds %struct.Hash* %305, i32 0, i32 2
  %307 = load i16** %306, align 8
  %308 = getelementptr inbounds i16* %307, i64 %304
  %309 = load i16* %308, align 2
  %310 = zext i16 %309 to i32
  store i32 %310, i32* %hashpos, align 4
  br label %140

; <label>:311                                     ; preds = %300, %286, %175, %169, %154
  %312 = load i32* %10, align 4
  %313 = icmp ne i32 %312, 0
  br i1 %313, label %314, label %369

; <label>:314                                     ; preds = %311
  %315 = load i32* %lazy, align 4
  %316 = icmp ne i32 %315, 0
  br i1 %316, label %331, label %317

; <label>:317                                     ; preds = %314
  %318 = load i32* %length, align 4
  %319 = icmp uge i32 %318, 3
  br i1 %319, label %320, label %331

; <label>:320                                     ; preds = %317
  %321 = load i32* %length, align 4
  %322 = load i32* %maxlazymatch, align 4
  %323 = icmp ule i32 %321, %322
  br i1 %323, label %324, label %331

; <label>:324                                     ; preds = %320
  %325 = load i32* %length, align 4
  %326 = zext i32 %325 to i64
  %327 = icmp ult i64 %326, 258
  br i1 %327, label %328, label %331

; <label>:328                                     ; preds = %324
  store i32 1, i32* %lazy, align 4
  %329 = load i32* %length, align 4
  store i32 %329, i32* %lazylength, align 4
  %330 = load i32* %offset, align 4
  store i32 %330, i32* %lazyoffset, align 4
  br label %492

; <label>:331                                     ; preds = %324, %320, %317, %314
  %332 = load i32* %lazy, align 4
  %333 = icmp ne i32 %332, 0
  br i1 %333, label %334, label %368

; <label>:334                                     ; preds = %331
  store i32 0, i32* %lazy, align 4
  %335 = load i32* %pos, align 4
  %336 = icmp eq i32 %335, 0
  br i1 %336, label %337, label %338

; <label>:337                                     ; preds = %334
  store i32 81, i32* %error, align 4
  br label %495

; <label>:338                                     ; preds = %334
  %339 = load i32* %length, align 4
  %340 = load i32* %lazylength, align 4
  %341 = add i32 %340, 1
  %342 = icmp ugt i32 %339, %341
  br i1 %342, label %343, label %356

; <label>:343                                     ; preds = %338
  %344 = load %struct.uivector** %2, align 8
  %345 = load i32* %pos, align 4
  %346 = sub i32 %345, 1
  %347 = zext i32 %346 to i64
  %348 = load i8** %4, align 8
  %349 = getelementptr inbounds i8* %348, i64 %347
  %350 = load i8* %349, align 1
  %351 = zext i8 %350 to i32
  %352 = call i32 @uivector_push_back(%struct.uivector* %344, i32 %351)
  %353 = icmp ne i32 %352, 0
  br i1 %353, label %355, label %354

; <label>:354                                     ; preds = %343
  store i32 83, i32* %error, align 4
  br label %495

; <label>:355                                     ; preds = %343
  br label %367

; <label>:356                                     ; preds = %338
  %357 = load i32* %lazylength, align 4
  store i32 %357, i32* %length, align 4
  %358 = load i32* %lazyoffset, align 4
  store i32 %358, i32* %offset, align 4
  %359 = load i32* %hashval, align 4
  %360 = zext i32 %359 to i64
  %361 = load %struct.Hash** %3, align 8
  %362 = getelementptr inbounds %struct.Hash* %361, i32 0, i32 0
  %363 = load i32** %362, align 8
  %364 = getelementptr inbounds i32* %363, i64 %360
  store i32 -1, i32* %364, align 4
  %365 = load i32* %pos, align 4
  %366 = add i32 %365, -1
  store i32 %366, i32* %pos, align 4
  br label %367

; <label>:367                                     ; preds = %356, %355
  br label %368

; <label>:368                                     ; preds = %367, %331
  br label %369

; <label>:369                                     ; preds = %368, %311
  %370 = load i32* %length, align 4
  %371 = icmp uge i32 %370, 3
  br i1 %371, label %372, label %377

; <label>:372                                     ; preds = %369
  %373 = load i32* %offset, align 4
  %374 = load i32* %7, align 4
  %375 = icmp ugt i32 %373, %374
  br i1 %375, label %376, label %377

; <label>:376                                     ; preds = %372
  store i32 86, i32* %error, align 4
  br label %495

; <label>:377                                     ; preds = %372, %369
  %378 = load i32* %length, align 4
  %379 = icmp ult i32 %378, 3
  br i1 %379, label %380, label %392

; <label>:380                                     ; preds = %377
  %381 = load %struct.uivector** %2, align 8
  %382 = load i32* %pos, align 4
  %383 = zext i32 %382 to i64
  %384 = load i8** %4, align 8
  %385 = getelementptr inbounds i8* %384, i64 %383
  %386 = load i8* %385, align 1
  %387 = zext i8 %386 to i32
  %388 = call i32 @uivector_push_back(%struct.uivector* %381, i32 %387)
  %389 = icmp ne i32 %388, 0
  br i1 %389, label %391, label %390

; <label>:390                                     ; preds = %380
  store i32 83, i32* %error, align 4
  br label %495

; <label>:391                                     ; preds = %380
  br label %491

; <label>:392                                     ; preds = %377
  %393 = load i32* %length, align 4
  %394 = load i32* %8, align 4
  %395 = icmp ult i32 %393, %394
  br i1 %395, label %402, label %396

; <label>:396                                     ; preds = %392
  %397 = load i32* %length, align 4
  %398 = icmp eq i32 %397, 3
  br i1 %398, label %399, label %414

; <label>:399                                     ; preds = %396
  %400 = load i32* %offset, align 4
  %401 = icmp ugt i32 %400, 4096
  br i1 %401, label %402, label %414

; <label>:402                                     ; preds = %399, %392
  %403 = load %struct.uivector** %2, align 8
  %404 = load i32* %pos, align 4
  %405 = zext i32 %404 to i64
  %406 = load i8** %4, align 8
  %407 = getelementptr inbounds i8* %406, i64 %405
  %408 = load i8* %407, align 1
  %409 = zext i8 %408 to i32
  %410 = call i32 @uivector_push_back(%struct.uivector* %403, i32 %409)
  %411 = icmp ne i32 %410, 0
  br i1 %411, label %413, label %412

; <label>:412                                     ; preds = %402
  store i32 83, i32* %error, align 4
  br label %495

; <label>:413                                     ; preds = %402
  br label %490

; <label>:414                                     ; preds = %399, %396
  %415 = load %struct.uivector** %2, align 8
  %416 = load i32* %length, align 4
  %417 = zext i32 %416 to i64
  %418 = load i32* %offset, align 4
  %419 = zext i32 %418 to i64
  call void @addLengthDistance(%struct.uivector* %415, i64 %417, i64 %419)
  store i32 1, i32* %i, align 4
  br label %420

; <label>:420                                     ; preds = %486, %414
  %421 = load i32* %i, align 4
  %422 = load i32* %length, align 4
  %423 = icmp ult i32 %421, %422
  br i1 %423, label %424, label %489

; <label>:424                                     ; preds = %420
  %425 = load i32* %pos, align 4
  %426 = add i32 %425, 1
  store i32 %426, i32* %pos, align 4
  %427 = load i32* %pos, align 4
  %428 = load i32* %7, align 4
  %429 = sub i32 %428, 1
  %430 = and i32 %427, %429
  %431 = zext i32 %430 to i64
  store i64 %431, i64* %wpos, align 8
  %432 = load i8** %4, align 8
  %433 = load i64* %6, align 8
  %434 = load i32* %pos, align 4
  %435 = zext i32 %434 to i64
  %436 = call i32 @getHash(i8* %432, i64 %433, i64 %435)
  store i32 %436, i32* %hashval, align 4
  %437 = load %struct.Hash** %3, align 8
  %438 = load i64* %wpos, align 8
  %439 = load i32* %hashval, align 4
  call void @updateHashChain(%struct.Hash* %437, i64 %438, i32 %439)
  %440 = load i32* %usezeros, align 4
  %441 = icmp ne i32 %440, 0
  br i1 %441, label %442, label %484

; <label>:442                                     ; preds = %424
  %443 = load i32* %hashval, align 4
  %444 = icmp eq i32 %443, 0
  br i1 %444, label %445, label %484

; <label>:445                                     ; preds = %442
  %446 = load i32* %numzeros, align 4
  %447 = icmp eq i32 %446, 0
  br i1 %447, label %448, label %454

; <label>:448                                     ; preds = %445
  %449 = load i8** %4, align 8
  %450 = load i64* %6, align 8
  %451 = load i32* %pos, align 4
  %452 = zext i32 %451 to i64
  %453 = call i32 @countZeros(i8* %449, i64 %450, i64 %452)
  store i32 %453, i32* %numzeros, align 4
  br label %476

; <label>:454                                     ; preds = %445
  %455 = load i32* %pos, align 4
  %456 = load i32* %numzeros, align 4
  %457 = add i32 %455, %456
  %458 = zext i32 %457 to i64
  %459 = load i64* %6, align 8
  %460 = icmp uge i64 %458, %459
  br i1 %460, label %472, label %461

; <label>:461                                     ; preds = %454
  %462 = load i32* %pos, align 4
  %463 = load i32* %numzeros, align 4
  %464 = add i32 %462, %463
  %465 = sub i32 %464, 1
  %466 = zext i32 %465 to i64
  %467 = load i8** %4, align 8
  %468 = getelementptr inbounds i8* %467, i64 %466
  %469 = load i8* %468, align 1
  %470 = zext i8 %469 to i32
  %471 = icmp ne i32 %470, 0
  br i1 %471, label %472, label %475

; <label>:472                                     ; preds = %461, %454
  %473 = load i32* %numzeros, align 4
  %474 = add i32 %473, -1
  store i32 %474, i32* %numzeros, align 4
  br label %475

; <label>:475                                     ; preds = %472, %461
  br label %476

; <label>:476                                     ; preds = %475, %448
  %477 = load i32* %numzeros, align 4
  %478 = trunc i32 %477 to i16
  %479 = load i64* %wpos, align 8
  %480 = load %struct.Hash** %3, align 8
  %481 = getelementptr inbounds %struct.Hash* %480, i32 0, i32 3
  %482 = load i16** %481, align 8
  %483 = getelementptr inbounds i16* %482, i64 %479
  store i16 %478, i16* %483, align 2
  br label %485

; <label>:484                                     ; preds = %442, %424
  store i32 0, i32* %numzeros, align 4
  br label %485

; <label>:485                                     ; preds = %484, %476
  br label %486

; <label>:486                                     ; preds = %485
  %487 = load i32* %i, align 4
  %488 = add i32 %487, 1
  store i32 %488, i32* %i, align 4
  br label %420

; <label>:489                                     ; preds = %420
  br label %490

; <label>:490                                     ; preds = %489, %413
  br label %491

; <label>:491                                     ; preds = %490, %391
  br label %492

; <label>:492                                     ; preds = %491, %328
  %493 = load i32* %pos, align 4
  %494 = add i32 %493, 1
  store i32 %494, i32* %pos, align 4
  br label %45

; <label>:495                                     ; preds = %412, %390, %376, %354, %337, %45
  %496 = load i32* %error, align 4
  store i32 %496, i32* %1
  br label %497

; <label>:497                                     ; preds = %495, %36, %29
  %498 = load i32* %1
  ret i32 %498
}

; Function Attrs: nounwind uwtable
define internal i32 @uivector_resize(%struct.uivector* %p, i64 %size) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.uivector*, align 8
  %3 = alloca i64, align 8
  %newsize = alloca i64, align 8
  %data = alloca i8*, align 8
  store %struct.uivector* %p, %struct.uivector** %2, align 8
  store i64 %size, i64* %3, align 8
  %4 = load i64* %3, align 8
  %5 = mul i64 %4, 4
  %6 = load %struct.uivector** %2, align 8
  %7 = getelementptr inbounds %struct.uivector* %6, i32 0, i32 2
  %8 = load i64* %7, align 8
  %9 = icmp ugt i64 %5, %8
  br i1 %9, label %10, label %35

; <label>:10                                      ; preds = %0
  %11 = load i64* %3, align 8
  %12 = mul i64 %11, 4
  %13 = mul i64 %12, 2
  store i64 %13, i64* %newsize, align 8
  %14 = load %struct.uivector** %2, align 8
  %15 = getelementptr inbounds %struct.uivector* %14, i32 0, i32 0
  %16 = load i32** %15, align 8
  %17 = bitcast i32* %16 to i8*
  %18 = load i64* %newsize, align 8
  %19 = call i8* @lodepng_realloc(i8* %17, i64 %18)
  store i8* %19, i8** %data, align 8
  %20 = load i8** %data, align 8
  %21 = icmp ne i8* %20, null
  br i1 %21, label %22, label %33

; <label>:22                                      ; preds = %10
  %23 = load i64* %newsize, align 8
  %24 = load %struct.uivector** %2, align 8
  %25 = getelementptr inbounds %struct.uivector* %24, i32 0, i32 2
  store i64 %23, i64* %25, align 8
  %26 = load i8** %data, align 8
  %27 = bitcast i8* %26 to i32*
  %28 = load %struct.uivector** %2, align 8
  %29 = getelementptr inbounds %struct.uivector* %28, i32 0, i32 0
  store i32* %27, i32** %29, align 8
  %30 = load i64* %3, align 8
  %31 = load %struct.uivector** %2, align 8
  %32 = getelementptr inbounds %struct.uivector* %31, i32 0, i32 1
  store i64 %30, i64* %32, align 8
  br label %34

; <label>:33                                      ; preds = %10
  store i32 0, i32* %1
  br label %40

; <label>:34                                      ; preds = %22
  br label %39

; <label>:35                                      ; preds = %0
  %36 = load i64* %3, align 8
  %37 = load %struct.uivector** %2, align 8
  %38 = getelementptr inbounds %struct.uivector* %37, i32 0, i32 1
  store i64 %36, i64* %38, align 8
  br label %39

; <label>:39                                      ; preds = %35, %34
  store i32 1, i32* %1
  br label %40

; <label>:40                                      ; preds = %39, %33
  %41 = load i32* %1
  ret i32 %41
}

; Function Attrs: nounwind uwtable
define internal i32 @uivector_resizev(%struct.uivector* %p, i64 %size, i32 %value) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.uivector*, align 8
  %3 = alloca i64, align 8
  %4 = alloca i32, align 4
  %oldsize = alloca i64, align 8
  %i = alloca i64, align 8
  store %struct.uivector* %p, %struct.uivector** %2, align 8
  store i64 %size, i64* %3, align 8
  store i32 %value, i32* %4, align 4
  %5 = load %struct.uivector** %2, align 8
  %6 = getelementptr inbounds %struct.uivector* %5, i32 0, i32 1
  %7 = load i64* %6, align 8
  store i64 %7, i64* %oldsize, align 8
  %8 = load %struct.uivector** %2, align 8
  %9 = load i64* %3, align 8
  %10 = call i32 @uivector_resize(%struct.uivector* %8, i64 %9)
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %13, label %12

; <label>:12                                      ; preds = %0
  store i32 0, i32* %1
  br label %30

; <label>:13                                      ; preds = %0
  %14 = load i64* %oldsize, align 8
  store i64 %14, i64* %i, align 8
  br label %15

; <label>:15                                      ; preds = %26, %13
  %16 = load i64* %i, align 8
  %17 = load i64* %3, align 8
  %18 = icmp ult i64 %16, %17
  br i1 %18, label %19, label %29

; <label>:19                                      ; preds = %15
  %20 = load i32* %4, align 4
  %21 = load i64* %i, align 8
  %22 = load %struct.uivector** %2, align 8
  %23 = getelementptr inbounds %struct.uivector* %22, i32 0, i32 0
  %24 = load i32** %23, align 8
  %25 = getelementptr inbounds i32* %24, i64 %21
  store i32 %20, i32* %25, align 4
  br label %26

; <label>:26                                      ; preds = %19
  %27 = load i64* %i, align 8
  %28 = add i64 %27, 1
  store i64 %28, i64* %i, align 8
  br label %15

; <label>:29                                      ; preds = %15
  store i32 1, i32* %1
  br label %30

; <label>:30                                      ; preds = %29, %12
  %31 = load i32* %1
  ret i32 %31
}

; Function Attrs: nounwind uwtable
define internal i32 @HuffmanTree_makeFromFrequencies(%struct.HuffmanTree* %tree, i32* %frequencies, i64 %mincodes, i64 %numcodes, i32 %maxbitlen) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.HuffmanTree*, align 8
  %3 = alloca i32*, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i32, align 4
  %error = alloca i32, align 4
  store %struct.HuffmanTree* %tree, %struct.HuffmanTree** %2, align 8
  store i32* %frequencies, i32** %3, align 8
  store i64 %mincodes, i64* %4, align 8
  store i64 %numcodes, i64* %5, align 8
  store i32 %maxbitlen, i32* %6, align 4
  store i32 0, i32* %error, align 4
  br label %7

; <label>:7                                       ; preds = %20, %0
  %8 = load i64* %5, align 8
  %9 = sub i64 %8, 1
  %10 = load i32** %3, align 8
  %11 = getelementptr inbounds i32* %10, i64 %9
  %12 = load i32* %11, align 4
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %18, label %14

; <label>:14                                      ; preds = %7
  %15 = load i64* %5, align 8
  %16 = load i64* %4, align 8
  %17 = icmp ugt i64 %15, %16
  br label %18

; <label>:18                                      ; preds = %14, %7
  %19 = phi i1 [ false, %7 ], [ %17, %14 ]
  br i1 %19, label %20, label %23

; <label>:20                                      ; preds = %18
  %21 = load i64* %5, align 8
  %22 = add i64 %21, -1
  store i64 %22, i64* %5, align 8
  br label %7

; <label>:23                                      ; preds = %18
  %24 = load i32* %6, align 4
  %25 = load %struct.HuffmanTree** %2, align 8
  %26 = getelementptr inbounds %struct.HuffmanTree* %25, i32 0, i32 3
  store i32 %24, i32* %26, align 4
  %27 = load i64* %5, align 8
  %28 = trunc i64 %27 to i32
  %29 = load %struct.HuffmanTree** %2, align 8
  %30 = getelementptr inbounds %struct.HuffmanTree* %29, i32 0, i32 4
  store i32 %28, i32* %30, align 4
  %31 = load %struct.HuffmanTree** %2, align 8
  %32 = getelementptr inbounds %struct.HuffmanTree* %31, i32 0, i32 2
  %33 = load i32** %32, align 8
  %34 = bitcast i32* %33 to i8*
  %35 = load i64* %5, align 8
  %36 = mul i64 %35, 4
  %37 = call i8* @lodepng_realloc(i8* %34, i64 %36)
  %38 = bitcast i8* %37 to i32*
  %39 = load %struct.HuffmanTree** %2, align 8
  %40 = getelementptr inbounds %struct.HuffmanTree* %39, i32 0, i32 2
  store i32* %38, i32** %40, align 8
  %41 = load %struct.HuffmanTree** %2, align 8
  %42 = getelementptr inbounds %struct.HuffmanTree* %41, i32 0, i32 2
  %43 = load i32** %42, align 8
  %44 = icmp ne i32* %43, null
  br i1 %44, label %46, label %45

; <label>:45                                      ; preds = %23
  store i32 83, i32* %1
  br label %67

; <label>:46                                      ; preds = %23
  %47 = load %struct.HuffmanTree** %2, align 8
  %48 = getelementptr inbounds %struct.HuffmanTree* %47, i32 0, i32 2
  %49 = load i32** %48, align 8
  %50 = bitcast i32* %49 to i8*
  %51 = load i64* %5, align 8
  %52 = mul i64 %51, 4
  call void @llvm.memset.p0i8.i64(i8* %50, i8 0, i64 %52, i32 4, i1 false)
  %53 = load %struct.HuffmanTree** %2, align 8
  %54 = getelementptr inbounds %struct.HuffmanTree* %53, i32 0, i32 2
  %55 = load i32** %54, align 8
  %56 = load i32** %3, align 8
  %57 = load i64* %5, align 8
  %58 = load i32* %6, align 4
  %59 = call i32 @lodepng_huffman_code_lengths(i32* %55, i32* %56, i64 %57, i32 %58)
  store i32 %59, i32* %error, align 4
  %60 = load i32* %error, align 4
  %61 = icmp ne i32 %60, 0
  br i1 %61, label %65, label %62

; <label>:62                                      ; preds = %46
  %63 = load %struct.HuffmanTree** %2, align 8
  %64 = call i32 @HuffmanTree_makeFromLengths2(%struct.HuffmanTree* %63)
  store i32 %64, i32* %error, align 4
  br label %65

; <label>:65                                      ; preds = %62, %46
  %66 = load i32* %error, align 4
  store i32 %66, i32* %1
  br label %67

; <label>:67                                      ; preds = %65, %45
  %68 = load i32* %1
  ret i32 %68
}

; Function Attrs: nounwind uwtable
define internal i32 @uivector_push_back(%struct.uivector* %p, i32 %c) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.uivector*, align 8
  %3 = alloca i32, align 4
  store %struct.uivector* %p, %struct.uivector** %2, align 8
  store i32 %c, i32* %3, align 4
  %4 = load %struct.uivector** %2, align 8
  %5 = load %struct.uivector** %2, align 8
  %6 = getelementptr inbounds %struct.uivector* %5, i32 0, i32 1
  %7 = load i64* %6, align 8
  %8 = add i64 %7, 1
  %9 = call i32 @uivector_resize(%struct.uivector* %4, i64 %8)
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %12, label %11

; <label>:11                                      ; preds = %0
  store i32 0, i32* %1
  br label %22

; <label>:12                                      ; preds = %0
  %13 = load i32* %3, align 4
  %14 = load %struct.uivector** %2, align 8
  %15 = getelementptr inbounds %struct.uivector* %14, i32 0, i32 1
  %16 = load i64* %15, align 8
  %17 = sub i64 %16, 1
  %18 = load %struct.uivector** %2, align 8
  %19 = getelementptr inbounds %struct.uivector* %18, i32 0, i32 0
  %20 = load i32** %19, align 8
  %21 = getelementptr inbounds i32* %20, i64 %17
  store i32 %13, i32* %21, align 4
  store i32 1, i32* %1
  br label %22

; <label>:22                                      ; preds = %12, %11
  %23 = load i32* %1
  ret i32 %23
}

; Function Attrs: nounwind uwtable
define internal i32 @HuffmanTree_getLength(%struct.HuffmanTree* %tree, i32 %index) #0 {
  %1 = alloca %struct.HuffmanTree*, align 8
  %2 = alloca i32, align 4
  store %struct.HuffmanTree* %tree, %struct.HuffmanTree** %1, align 8
  store i32 %index, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = zext i32 %3 to i64
  %5 = load %struct.HuffmanTree** %1, align 8
  %6 = getelementptr inbounds %struct.HuffmanTree* %5, i32 0, i32 2
  %7 = load i32** %6, align 8
  %8 = getelementptr inbounds i32* %7, i64 %4
  %9 = load i32* %8, align 4
  ret i32 %9
}

; Function Attrs: nounwind uwtable
define internal void @addBitsToStream(i64* %bitpointer, %struct.ucvector* %bitstream, i32 %value, i64 %nbits) #0 {
  %1 = alloca i64*, align 8
  %2 = alloca %struct.ucvector*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i64, align 8
  %i = alloca i64, align 8
  store i64* %bitpointer, i64** %1, align 8
  store %struct.ucvector* %bitstream, %struct.ucvector** %2, align 8
  store i32 %value, i32* %3, align 4
  store i64 %nbits, i64* %4, align 8
  store i64 0, i64* %i, align 8
  br label %5

; <label>:5                                       ; preds = %45, %0
  %6 = load i64* %i, align 8
  %7 = load i64* %4, align 8
  %8 = icmp ult i64 %6, %7
  br i1 %8, label %9, label %48

; <label>:9                                       ; preds = %5
  %10 = load i64** %1, align 8
  %11 = load i64* %10, align 8
  %12 = and i64 %11, 7
  %13 = icmp eq i64 %12, 0
  br i1 %13, label %14, label %17

; <label>:14                                      ; preds = %9
  %15 = load %struct.ucvector** %2, align 8
  %16 = call i32 @ucvector_push_back(%struct.ucvector* %15, i8 zeroext 0)
  br label %17

; <label>:17                                      ; preds = %14, %9
  %18 = load i32* %3, align 4
  %19 = load i64* %i, align 8
  %20 = trunc i64 %19 to i32
  %21 = lshr i32 %18, %20
  %22 = and i32 %21, 1
  %23 = trunc i32 %22 to i8
  %24 = zext i8 %23 to i32
  %25 = load i64** %1, align 8
  %26 = load i64* %25, align 8
  %27 = and i64 %26, 7
  %28 = trunc i64 %27 to i32
  %29 = shl i32 %24, %28
  %30 = load %struct.ucvector** %2, align 8
  %31 = getelementptr inbounds %struct.ucvector* %30, i32 0, i32 1
  %32 = load i64* %31, align 8
  %33 = sub i64 %32, 1
  %34 = load %struct.ucvector** %2, align 8
  %35 = getelementptr inbounds %struct.ucvector* %34, i32 0, i32 0
  %36 = load i8** %35, align 8
  %37 = getelementptr inbounds i8* %36, i64 %33
  %38 = load i8* %37, align 1
  %39 = zext i8 %38 to i32
  %40 = or i32 %39, %29
  %41 = trunc i32 %40 to i8
  store i8 %41, i8* %37, align 1
  %42 = load i64** %1, align 8
  %43 = load i64* %42, align 8
  %44 = add i64 %43, 1
  store i64 %44, i64* %42, align 8
  br label %45

; <label>:45                                      ; preds = %17
  %46 = load i64* %i, align 8
  %47 = add i64 %46, 1
  store i64 %47, i64* %i, align 8
  br label %5

; <label>:48                                      ; preds = %5
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @addHuffmanSymbol(i64* %bp, %struct.ucvector* %compressed, i32 %code, i32 %bitlen) #0 {
  %1 = alloca i64*, align 8
  %2 = alloca %struct.ucvector*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i64* %bp, i64** %1, align 8
  store %struct.ucvector* %compressed, %struct.ucvector** %2, align 8
  store i32 %code, i32* %3, align 4
  store i32 %bitlen, i32* %4, align 4
  %5 = load i64** %1, align 8
  %6 = load %struct.ucvector** %2, align 8
  %7 = load i32* %3, align 4
  %8 = load i32* %4, align 4
  %9 = zext i32 %8 to i64
  call void @addBitsToStreamReversed(i64* %5, %struct.ucvector* %6, i32 %7, i64 %9)
  ret void
}

; Function Attrs: nounwind uwtable
define internal i32 @HuffmanTree_getCode(%struct.HuffmanTree* %tree, i32 %index) #0 {
  %1 = alloca %struct.HuffmanTree*, align 8
  %2 = alloca i32, align 4
  store %struct.HuffmanTree* %tree, %struct.HuffmanTree** %1, align 8
  store i32 %index, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = zext i32 %3 to i64
  %5 = load %struct.HuffmanTree** %1, align 8
  %6 = getelementptr inbounds %struct.HuffmanTree* %5, i32 0, i32 1
  %7 = load i32** %6, align 8
  %8 = getelementptr inbounds i32* %7, i64 %4
  %9 = load i32* %8, align 4
  ret i32 %9
}

; Function Attrs: nounwind uwtable
define internal void @writeLZ77data(i64* %bp, %struct.ucvector* %out, %struct.uivector* %lz77_encoded, %struct.HuffmanTree* %tree_ll, %struct.HuffmanTree* %tree_d) #0 {
  %1 = alloca i64*, align 8
  %2 = alloca %struct.ucvector*, align 8
  %3 = alloca %struct.uivector*, align 8
  %4 = alloca %struct.HuffmanTree*, align 8
  %5 = alloca %struct.HuffmanTree*, align 8
  %i = alloca i64, align 8
  %val = alloca i32, align 4
  %length_index = alloca i32, align 4
  %n_length_extra_bits = alloca i32, align 4
  %length_extra_bits = alloca i32, align 4
  %distance_code = alloca i32, align 4
  %distance_index = alloca i32, align 4
  %n_distance_extra_bits = alloca i32, align 4
  %distance_extra_bits = alloca i32, align 4
  store i64* %bp, i64** %1, align 8
  store %struct.ucvector* %out, %struct.ucvector** %2, align 8
  store %struct.uivector* %lz77_encoded, %struct.uivector** %3, align 8
  store %struct.HuffmanTree* %tree_ll, %struct.HuffmanTree** %4, align 8
  store %struct.HuffmanTree* %tree_d, %struct.HuffmanTree** %5, align 8
  store i64 0, i64* %i, align 8
  store i64 0, i64* %i, align 8
  br label %6

; <label>:6                                       ; preds = %81, %0
  %7 = load i64* %i, align 8
  %8 = load %struct.uivector** %3, align 8
  %9 = getelementptr inbounds %struct.uivector* %8, i32 0, i32 1
  %10 = load i64* %9, align 8
  %11 = icmp ult i64 %7, %10
  br i1 %11, label %12, label %84

; <label>:12                                      ; preds = %6
  %13 = load i64* %i, align 8
  %14 = load %struct.uivector** %3, align 8
  %15 = getelementptr inbounds %struct.uivector* %14, i32 0, i32 0
  %16 = load i32** %15, align 8
  %17 = getelementptr inbounds i32* %16, i64 %13
  %18 = load i32* %17, align 4
  store i32 %18, i32* %val, align 4
  %19 = load i64** %1, align 8
  %20 = load %struct.ucvector** %2, align 8
  %21 = load %struct.HuffmanTree** %4, align 8
  %22 = load i32* %val, align 4
  %23 = call i32 @HuffmanTree_getCode(%struct.HuffmanTree* %21, i32 %22)
  %24 = load %struct.HuffmanTree** %4, align 8
  %25 = load i32* %val, align 4
  %26 = call i32 @HuffmanTree_getLength(%struct.HuffmanTree* %24, i32 %25)
  call void @addHuffmanSymbol(i64* %19, %struct.ucvector* %20, i32 %23, i32 %26)
  %27 = load i32* %val, align 4
  %28 = icmp ugt i32 %27, 256
  br i1 %28, label %29, label %80

; <label>:29                                      ; preds = %12
  %30 = load i32* %val, align 4
  %31 = sub i32 %30, 257
  store i32 %31, i32* %length_index, align 4
  %32 = load i32* %length_index, align 4
  %33 = zext i32 %32 to i64
  %34 = getelementptr inbounds [29 x i32]* @LENGTHEXTRA, i32 0, i64 %33
  %35 = load i32* %34, align 4
  store i32 %35, i32* %n_length_extra_bits, align 4
  %36 = load i64* %i, align 8
  %37 = add i64 %36, 1
  store i64 %37, i64* %i, align 8
  %38 = load %struct.uivector** %3, align 8
  %39 = getelementptr inbounds %struct.uivector* %38, i32 0, i32 0
  %40 = load i32** %39, align 8
  %41 = getelementptr inbounds i32* %40, i64 %37
  %42 = load i32* %41, align 4
  store i32 %42, i32* %length_extra_bits, align 4
  %43 = load i64* %i, align 8
  %44 = add i64 %43, 1
  store i64 %44, i64* %i, align 8
  %45 = load %struct.uivector** %3, align 8
  %46 = getelementptr inbounds %struct.uivector* %45, i32 0, i32 0
  %47 = load i32** %46, align 8
  %48 = getelementptr inbounds i32* %47, i64 %44
  %49 = load i32* %48, align 4
  store i32 %49, i32* %distance_code, align 4
  %50 = load i32* %distance_code, align 4
  store i32 %50, i32* %distance_index, align 4
  %51 = load i32* %distance_index, align 4
  %52 = zext i32 %51 to i64
  %53 = getelementptr inbounds [30 x i32]* @DISTANCEEXTRA, i32 0, i64 %52
  %54 = load i32* %53, align 4
  store i32 %54, i32* %n_distance_extra_bits, align 4
  %55 = load i64* %i, align 8
  %56 = add i64 %55, 1
  store i64 %56, i64* %i, align 8
  %57 = load %struct.uivector** %3, align 8
  %58 = getelementptr inbounds %struct.uivector* %57, i32 0, i32 0
  %59 = load i32** %58, align 8
  %60 = getelementptr inbounds i32* %59, i64 %56
  %61 = load i32* %60, align 4
  store i32 %61, i32* %distance_extra_bits, align 4
  %62 = load i64** %1, align 8
  %63 = load %struct.ucvector** %2, align 8
  %64 = load i32* %length_extra_bits, align 4
  %65 = load i32* %n_length_extra_bits, align 4
  %66 = zext i32 %65 to i64
  call void @addBitsToStream(i64* %62, %struct.ucvector* %63, i32 %64, i64 %66)
  %67 = load i64** %1, align 8
  %68 = load %struct.ucvector** %2, align 8
  %69 = load %struct.HuffmanTree** %5, align 8
  %70 = load i32* %distance_code, align 4
  %71 = call i32 @HuffmanTree_getCode(%struct.HuffmanTree* %69, i32 %70)
  %72 = load %struct.HuffmanTree** %5, align 8
  %73 = load i32* %distance_code, align 4
  %74 = call i32 @HuffmanTree_getLength(%struct.HuffmanTree* %72, i32 %73)
  call void @addHuffmanSymbol(i64* %67, %struct.ucvector* %68, i32 %71, i32 %74)
  %75 = load i64** %1, align 8
  %76 = load %struct.ucvector** %2, align 8
  %77 = load i32* %distance_extra_bits, align 4
  %78 = load i32* %n_distance_extra_bits, align 4
  %79 = zext i32 %78 to i64
  call void @addBitsToStream(i64* %75, %struct.ucvector* %76, i32 %77, i64 %79)
  br label %80

; <label>:80                                      ; preds = %29, %12
  br label %81

; <label>:81                                      ; preds = %80
  %82 = load i64* %i, align 8
  %83 = add i64 %82, 1
  store i64 %83, i64* %i, align 8
  br label %6

; <label>:84                                      ; preds = %6
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @uivector_cleanup(i8* %p) #0 {
  %1 = alloca i8*, align 8
  store i8* %p, i8** %1, align 8
  %2 = load i8** %1, align 8
  %3 = bitcast i8* %2 to %struct.uivector*
  %4 = getelementptr inbounds %struct.uivector* %3, i32 0, i32 2
  store i64 0, i64* %4, align 8
  %5 = load i8** %1, align 8
  %6 = bitcast i8* %5 to %struct.uivector*
  %7 = getelementptr inbounds %struct.uivector* %6, i32 0, i32 1
  store i64 0, i64* %7, align 8
  %8 = load i8** %1, align 8
  %9 = bitcast i8* %8 to %struct.uivector*
  %10 = getelementptr inbounds %struct.uivector* %9, i32 0, i32 0
  %11 = load i32** %10, align 8
  %12 = bitcast i32* %11 to i8*
  call void @lodepng_free(i8* %12)
  %13 = load i8** %1, align 8
  %14 = bitcast i8* %13 to %struct.uivector*
  %15 = getelementptr inbounds %struct.uivector* %14, i32 0, i32 0
  store i32* null, i32** %15, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @HuffmanTree_cleanup(%struct.HuffmanTree* %tree) #0 {
  %1 = alloca %struct.HuffmanTree*, align 8
  store %struct.HuffmanTree* %tree, %struct.HuffmanTree** %1, align 8
  %2 = load %struct.HuffmanTree** %1, align 8
  %3 = getelementptr inbounds %struct.HuffmanTree* %2, i32 0, i32 0
  %4 = load i32** %3, align 8
  %5 = bitcast i32* %4 to i8*
  call void @lodepng_free(i8* %5)
  %6 = load %struct.HuffmanTree** %1, align 8
  %7 = getelementptr inbounds %struct.HuffmanTree* %6, i32 0, i32 1
  %8 = load i32** %7, align 8
  %9 = bitcast i32* %8 to i8*
  call void @lodepng_free(i8* %9)
  %10 = load %struct.HuffmanTree** %1, align 8
  %11 = getelementptr inbounds %struct.HuffmanTree* %10, i32 0, i32 2
  %12 = load i32** %11, align 8
  %13 = bitcast i32* %12 to i8*
  call void @lodepng_free(i8* %13)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @addBitsToStreamReversed(i64* %bitpointer, %struct.ucvector* %bitstream, i32 %value, i64 %nbits) #0 {
  %1 = alloca i64*, align 8
  %2 = alloca %struct.ucvector*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i64, align 8
  %i = alloca i64, align 8
  store i64* %bitpointer, i64** %1, align 8
  store %struct.ucvector* %bitstream, %struct.ucvector** %2, align 8
  store i32 %value, i32* %3, align 4
  store i64 %nbits, i64* %4, align 8
  store i64 0, i64* %i, align 8
  br label %5

; <label>:5                                       ; preds = %48, %0
  %6 = load i64* %i, align 8
  %7 = load i64* %4, align 8
  %8 = icmp ult i64 %6, %7
  br i1 %8, label %9, label %51

; <label>:9                                       ; preds = %5
  %10 = load i64** %1, align 8
  %11 = load i64* %10, align 8
  %12 = and i64 %11, 7
  %13 = icmp eq i64 %12, 0
  br i1 %13, label %14, label %17

; <label>:14                                      ; preds = %9
  %15 = load %struct.ucvector** %2, align 8
  %16 = call i32 @ucvector_push_back(%struct.ucvector* %15, i8 zeroext 0)
  br label %17

; <label>:17                                      ; preds = %14, %9
  %18 = load i32* %3, align 4
  %19 = load i64* %4, align 8
  %20 = sub i64 %19, 1
  %21 = load i64* %i, align 8
  %22 = sub i64 %20, %21
  %23 = trunc i64 %22 to i32
  %24 = lshr i32 %18, %23
  %25 = and i32 %24, 1
  %26 = trunc i32 %25 to i8
  %27 = zext i8 %26 to i32
  %28 = load i64** %1, align 8
  %29 = load i64* %28, align 8
  %30 = and i64 %29, 7
  %31 = trunc i64 %30 to i32
  %32 = shl i32 %27, %31
  %33 = load %struct.ucvector** %2, align 8
  %34 = getelementptr inbounds %struct.ucvector* %33, i32 0, i32 1
  %35 = load i64* %34, align 8
  %36 = sub i64 %35, 1
  %37 = load %struct.ucvector** %2, align 8
  %38 = getelementptr inbounds %struct.ucvector* %37, i32 0, i32 0
  %39 = load i8** %38, align 8
  %40 = getelementptr inbounds i8* %39, i64 %36
  %41 = load i8* %40, align 1
  %42 = zext i8 %41 to i32
  %43 = or i32 %42, %32
  %44 = trunc i32 %43 to i8
  store i8 %44, i8* %40, align 1
  %45 = load i64** %1, align 8
  %46 = load i64* %45, align 8
  %47 = add i64 %46, 1
  store i64 %47, i64* %45, align 8
  br label %48

; <label>:48                                      ; preds = %17
  %49 = load i64* %i, align 8
  %50 = add i64 %49, 1
  store i64 %50, i64* %i, align 8
  br label %5

; <label>:51                                      ; preds = %5
  ret void
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #3

; Function Attrs: nounwind uwtable
define internal i32 @HuffmanTree_makeFromLengths2(%struct.HuffmanTree* %tree) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.HuffmanTree*, align 8
  %blcount = alloca %struct.uivector, align 8
  %nextcode = alloca %struct.uivector, align 8
  %bits = alloca i32, align 4
  %n = alloca i32, align 4
  %error = alloca i32, align 4
  store %struct.HuffmanTree* %tree, %struct.HuffmanTree** %2, align 8
  store i32 0, i32* %error, align 4
  call void @uivector_init(%struct.uivector* %blcount)
  call void @uivector_init(%struct.uivector* %nextcode)
  %3 = load %struct.HuffmanTree** %2, align 8
  %4 = getelementptr inbounds %struct.HuffmanTree* %3, i32 0, i32 4
  %5 = load i32* %4, align 4
  %6 = zext i32 %5 to i64
  %7 = mul i64 %6, 4
  %8 = call i8* @lodepng_malloc(i64 %7)
  %9 = bitcast i8* %8 to i32*
  %10 = load %struct.HuffmanTree** %2, align 8
  %11 = getelementptr inbounds %struct.HuffmanTree* %10, i32 0, i32 1
  store i32* %9, i32** %11, align 8
  %12 = load %struct.HuffmanTree** %2, align 8
  %13 = getelementptr inbounds %struct.HuffmanTree* %12, i32 0, i32 1
  %14 = load i32** %13, align 8
  %15 = icmp ne i32* %14, null
  br i1 %15, label %17, label %16

; <label>:16                                      ; preds = %0
  store i32 83, i32* %error, align 4
  br label %17

; <label>:17                                      ; preds = %16, %0
  %18 = load %struct.HuffmanTree** %2, align 8
  %19 = getelementptr inbounds %struct.HuffmanTree* %18, i32 0, i32 3
  %20 = load i32* %19, align 4
  %21 = add i32 %20, 1
  %22 = zext i32 %21 to i64
  %23 = call i32 @uivector_resizev(%struct.uivector* %blcount, i64 %22, i32 0)
  %24 = icmp ne i32 %23, 0
  br i1 %24, label %25, label %33

; <label>:25                                      ; preds = %17
  %26 = load %struct.HuffmanTree** %2, align 8
  %27 = getelementptr inbounds %struct.HuffmanTree* %26, i32 0, i32 3
  %28 = load i32* %27, align 4
  %29 = add i32 %28, 1
  %30 = zext i32 %29 to i64
  %31 = call i32 @uivector_resizev(%struct.uivector* %nextcode, i64 %30, i32 0)
  %32 = icmp ne i32 %31, 0
  br i1 %32, label %34, label %33

; <label>:33                                      ; preds = %25, %17
  store i32 83, i32* %error, align 4
  br label %34

; <label>:34                                      ; preds = %33, %25
  %35 = load i32* %error, align 4
  %36 = icmp ne i32 %35, 0
  br i1 %36, label %134, label %37

; <label>:37                                      ; preds = %34
  store i32 0, i32* %bits, align 4
  br label %38

; <label>:38                                      ; preds = %58, %37
  %39 = load i32* %bits, align 4
  %40 = load %struct.HuffmanTree** %2, align 8
  %41 = getelementptr inbounds %struct.HuffmanTree* %40, i32 0, i32 4
  %42 = load i32* %41, align 4
  %43 = icmp ult i32 %39, %42
  br i1 %43, label %44, label %61

; <label>:44                                      ; preds = %38
  %45 = load i32* %bits, align 4
  %46 = zext i32 %45 to i64
  %47 = load %struct.HuffmanTree** %2, align 8
  %48 = getelementptr inbounds %struct.HuffmanTree* %47, i32 0, i32 2
  %49 = load i32** %48, align 8
  %50 = getelementptr inbounds i32* %49, i64 %46
  %51 = load i32* %50, align 4
  %52 = zext i32 %51 to i64
  %53 = getelementptr inbounds %struct.uivector* %blcount, i32 0, i32 0
  %54 = load i32** %53, align 8
  %55 = getelementptr inbounds i32* %54, i64 %52
  %56 = load i32* %55, align 4
  %57 = add i32 %56, 1
  store i32 %57, i32* %55, align 4
  br label %58

; <label>:58                                      ; preds = %44
  %59 = load i32* %bits, align 4
  %60 = add i32 %59, 1
  store i32 %60, i32* %bits, align 4
  br label %38

; <label>:61                                      ; preds = %38
  store i32 1, i32* %bits, align 4
  br label %62

; <label>:62                                      ; preds = %90, %61
  %63 = load i32* %bits, align 4
  %64 = load %struct.HuffmanTree** %2, align 8
  %65 = getelementptr inbounds %struct.HuffmanTree* %64, i32 0, i32 3
  %66 = load i32* %65, align 4
  %67 = icmp ule i32 %63, %66
  br i1 %67, label %68, label %93

; <label>:68                                      ; preds = %62
  %69 = load i32* %bits, align 4
  %70 = sub i32 %69, 1
  %71 = zext i32 %70 to i64
  %72 = getelementptr inbounds %struct.uivector* %nextcode, i32 0, i32 0
  %73 = load i32** %72, align 8
  %74 = getelementptr inbounds i32* %73, i64 %71
  %75 = load i32* %74, align 4
  %76 = load i32* %bits, align 4
  %77 = sub i32 %76, 1
  %78 = zext i32 %77 to i64
  %79 = getelementptr inbounds %struct.uivector* %blcount, i32 0, i32 0
  %80 = load i32** %79, align 8
  %81 = getelementptr inbounds i32* %80, i64 %78
  %82 = load i32* %81, align 4
  %83 = add i32 %75, %82
  %84 = shl i32 %83, 1
  %85 = load i32* %bits, align 4
  %86 = zext i32 %85 to i64
  %87 = getelementptr inbounds %struct.uivector* %nextcode, i32 0, i32 0
  %88 = load i32** %87, align 8
  %89 = getelementptr inbounds i32* %88, i64 %86
  store i32 %84, i32* %89, align 4
  br label %90

; <label>:90                                      ; preds = %68
  %91 = load i32* %bits, align 4
  %92 = add i32 %91, 1
  store i32 %92, i32* %bits, align 4
  br label %62

; <label>:93                                      ; preds = %62
  store i32 0, i32* %n, align 4
  br label %94

; <label>:94                                      ; preds = %130, %93
  %95 = load i32* %n, align 4
  %96 = load %struct.HuffmanTree** %2, align 8
  %97 = getelementptr inbounds %struct.HuffmanTree* %96, i32 0, i32 4
  %98 = load i32* %97, align 4
  %99 = icmp ult i32 %95, %98
  br i1 %99, label %100, label %133

; <label>:100                                     ; preds = %94
  %101 = load i32* %n, align 4
  %102 = zext i32 %101 to i64
  %103 = load %struct.HuffmanTree** %2, align 8
  %104 = getelementptr inbounds %struct.HuffmanTree* %103, i32 0, i32 2
  %105 = load i32** %104, align 8
  %106 = getelementptr inbounds i32* %105, i64 %102
  %107 = load i32* %106, align 4
  %108 = icmp ne i32 %107, 0
  br i1 %108, label %109, label %129

; <label>:109                                     ; preds = %100
  %110 = load i32* %n, align 4
  %111 = zext i32 %110 to i64
  %112 = load %struct.HuffmanTree** %2, align 8
  %113 = getelementptr inbounds %struct.HuffmanTree* %112, i32 0, i32 2
  %114 = load i32** %113, align 8
  %115 = getelementptr inbounds i32* %114, i64 %111
  %116 = load i32* %115, align 4
  %117 = zext i32 %116 to i64
  %118 = getelementptr inbounds %struct.uivector* %nextcode, i32 0, i32 0
  %119 = load i32** %118, align 8
  %120 = getelementptr inbounds i32* %119, i64 %117
  %121 = load i32* %120, align 4
  %122 = add i32 %121, 1
  store i32 %122, i32* %120, align 4
  %123 = load i32* %n, align 4
  %124 = zext i32 %123 to i64
  %125 = load %struct.HuffmanTree** %2, align 8
  %126 = getelementptr inbounds %struct.HuffmanTree* %125, i32 0, i32 1
  %127 = load i32** %126, align 8
  %128 = getelementptr inbounds i32* %127, i64 %124
  store i32 %121, i32* %128, align 4
  br label %129

; <label>:129                                     ; preds = %109, %100
  br label %130

; <label>:130                                     ; preds = %129
  %131 = load i32* %n, align 4
  %132 = add i32 %131, 1
  store i32 %132, i32* %n, align 4
  br label %94

; <label>:133                                     ; preds = %94
  br label %134

; <label>:134                                     ; preds = %133, %34
  %135 = bitcast %struct.uivector* %blcount to i8*
  call void @uivector_cleanup(i8* %135)
  %136 = bitcast %struct.uivector* %nextcode to i8*
  call void @uivector_cleanup(i8* %136)
  %137 = load i32* %error, align 4
  %138 = icmp ne i32 %137, 0
  br i1 %138, label %142, label %139

; <label>:139                                     ; preds = %134
  %140 = load %struct.HuffmanTree** %2, align 8
  %141 = call i32 @HuffmanTree_make2DTree(%struct.HuffmanTree* %140)
  store i32 %141, i32* %1
  br label %144

; <label>:142                                     ; preds = %134
  %143 = load i32* %error, align 4
  store i32 %143, i32* %1
  br label %144

; <label>:144                                     ; preds = %142, %139
  %145 = load i32* %1
  ret i32 %145
}

; Function Attrs: nounwind uwtable
define internal i32 @HuffmanTree_make2DTree(%struct.HuffmanTree* %tree) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.HuffmanTree*, align 8
  %nodefilled = alloca i32, align 4
  %treepos = alloca i32, align 4
  %n = alloca i32, align 4
  %i = alloca i32, align 4
  %bit = alloca i8, align 1
  store %struct.HuffmanTree* %tree, %struct.HuffmanTree** %2, align 8
  store i32 0, i32* %nodefilled, align 4
  store i32 0, i32* %treepos, align 4
  %3 = load %struct.HuffmanTree** %2, align 8
  %4 = getelementptr inbounds %struct.HuffmanTree* %3, i32 0, i32 4
  %5 = load i32* %4, align 4
  %6 = mul i32 %5, 2
  %7 = zext i32 %6 to i64
  %8 = mul i64 %7, 4
  %9 = call i8* @lodepng_malloc(i64 %8)
  %10 = bitcast i8* %9 to i32*
  %11 = load %struct.HuffmanTree** %2, align 8
  %12 = getelementptr inbounds %struct.HuffmanTree* %11, i32 0, i32 0
  store i32* %10, i32** %12, align 8
  %13 = load %struct.HuffmanTree** %2, align 8
  %14 = getelementptr inbounds %struct.HuffmanTree* %13, i32 0, i32 0
  %15 = load i32** %14, align 8
  %16 = icmp ne i32* %15, null
  br i1 %16, label %18, label %17

; <label>:17                                      ; preds = %0
  store i32 83, i32* %1
  br label %191

; <label>:18                                      ; preds = %0
  store i32 0, i32* %n, align 4
  br label %19

; <label>:19                                      ; preds = %33, %18
  %20 = load i32* %n, align 4
  %21 = load %struct.HuffmanTree** %2, align 8
  %22 = getelementptr inbounds %struct.HuffmanTree* %21, i32 0, i32 4
  %23 = load i32* %22, align 4
  %24 = mul i32 %23, 2
  %25 = icmp ult i32 %20, %24
  br i1 %25, label %26, label %36

; <label>:26                                      ; preds = %19
  %27 = load i32* %n, align 4
  %28 = zext i32 %27 to i64
  %29 = load %struct.HuffmanTree** %2, align 8
  %30 = getelementptr inbounds %struct.HuffmanTree* %29, i32 0, i32 0
  %31 = load i32** %30, align 8
  %32 = getelementptr inbounds i32* %31, i64 %28
  store i32 32767, i32* %32, align 4
  br label %33

; <label>:33                                      ; preds = %26
  %34 = load i32* %n, align 4
  %35 = add i32 %34, 1
  store i32 %35, i32* %n, align 4
  br label %19

; <label>:36                                      ; preds = %19
  store i32 0, i32* %n, align 4
  br label %37

; <label>:37                                      ; preds = %159, %36
  %38 = load i32* %n, align 4
  %39 = load %struct.HuffmanTree** %2, align 8
  %40 = getelementptr inbounds %struct.HuffmanTree* %39, i32 0, i32 4
  %41 = load i32* %40, align 4
  %42 = icmp ult i32 %38, %41
  br i1 %42, label %43, label %162

; <label>:43                                      ; preds = %37
  store i32 0, i32* %i, align 4
  br label %44

; <label>:44                                      ; preds = %155, %43
  %45 = load i32* %i, align 4
  %46 = load i32* %n, align 4
  %47 = zext i32 %46 to i64
  %48 = load %struct.HuffmanTree** %2, align 8
  %49 = getelementptr inbounds %struct.HuffmanTree* %48, i32 0, i32 2
  %50 = load i32** %49, align 8
  %51 = getelementptr inbounds i32* %50, i64 %47
  %52 = load i32* %51, align 4
  %53 = icmp ult i32 %45, %52
  br i1 %53, label %54, label %158

; <label>:54                                      ; preds = %44
  %55 = load i32* %n, align 4
  %56 = zext i32 %55 to i64
  %57 = load %struct.HuffmanTree** %2, align 8
  %58 = getelementptr inbounds %struct.HuffmanTree* %57, i32 0, i32 1
  %59 = load i32** %58, align 8
  %60 = getelementptr inbounds i32* %59, i64 %56
  %61 = load i32* %60, align 4
  %62 = load i32* %n, align 4
  %63 = zext i32 %62 to i64
  %64 = load %struct.HuffmanTree** %2, align 8
  %65 = getelementptr inbounds %struct.HuffmanTree* %64, i32 0, i32 2
  %66 = load i32** %65, align 8
  %67 = getelementptr inbounds i32* %66, i64 %63
  %68 = load i32* %67, align 4
  %69 = load i32* %i, align 4
  %70 = sub i32 %68, %69
  %71 = sub i32 %70, 1
  %72 = lshr i32 %61, %71
  %73 = and i32 %72, 1
  %74 = trunc i32 %73 to i8
  store i8 %74, i8* %bit, align 1
  %75 = load i32* %treepos, align 4
  %76 = load %struct.HuffmanTree** %2, align 8
  %77 = getelementptr inbounds %struct.HuffmanTree* %76, i32 0, i32 4
  %78 = load i32* %77, align 4
  %79 = sub i32 %78, 2
  %80 = icmp ugt i32 %75, %79
  br i1 %80, label %81, label %82

; <label>:81                                      ; preds = %54
  store i32 55, i32* %1
  br label %191

; <label>:82                                      ; preds = %54
  %83 = load i32* %treepos, align 4
  %84 = mul i32 2, %83
  %85 = load i8* %bit, align 1
  %86 = zext i8 %85 to i32
  %87 = add i32 %84, %86
  %88 = zext i32 %87 to i64
  %89 = load %struct.HuffmanTree** %2, align 8
  %90 = getelementptr inbounds %struct.HuffmanTree* %89, i32 0, i32 0
  %91 = load i32** %90, align 8
  %92 = getelementptr inbounds i32* %91, i64 %88
  %93 = load i32* %92, align 4
  %94 = icmp eq i32 %93, 32767
  br i1 %94, label %95, label %138

; <label>:95                                      ; preds = %82
  %96 = load i32* %i, align 4
  %97 = add i32 %96, 1
  %98 = load i32* %n, align 4
  %99 = zext i32 %98 to i64
  %100 = load %struct.HuffmanTree** %2, align 8
  %101 = getelementptr inbounds %struct.HuffmanTree* %100, i32 0, i32 2
  %102 = load i32** %101, align 8
  %103 = getelementptr inbounds i32* %102, i64 %99
  %104 = load i32* %103, align 4
  %105 = icmp eq i32 %97, %104
  br i1 %105, label %106, label %118

; <label>:106                                     ; preds = %95
  %107 = load i32* %n, align 4
  %108 = load i32* %treepos, align 4
  %109 = mul i32 2, %108
  %110 = load i8* %bit, align 1
  %111 = zext i8 %110 to i32
  %112 = add i32 %109, %111
  %113 = zext i32 %112 to i64
  %114 = load %struct.HuffmanTree** %2, align 8
  %115 = getelementptr inbounds %struct.HuffmanTree* %114, i32 0, i32 0
  %116 = load i32** %115, align 8
  %117 = getelementptr inbounds i32* %116, i64 %113
  store i32 %107, i32* %117, align 4
  store i32 0, i32* %treepos, align 4
  br label %137

; <label>:118                                     ; preds = %95
  %119 = load i32* %nodefilled, align 4
  %120 = add i32 %119, 1
  store i32 %120, i32* %nodefilled, align 4
  %121 = load i32* %nodefilled, align 4
  %122 = load %struct.HuffmanTree** %2, align 8
  %123 = getelementptr inbounds %struct.HuffmanTree* %122, i32 0, i32 4
  %124 = load i32* %123, align 4
  %125 = add i32 %121, %124
  %126 = load i32* %treepos, align 4
  %127 = mul i32 2, %126
  %128 = load i8* %bit, align 1
  %129 = zext i8 %128 to i32
  %130 = add i32 %127, %129
  %131 = zext i32 %130 to i64
  %132 = load %struct.HuffmanTree** %2, align 8
  %133 = getelementptr inbounds %struct.HuffmanTree* %132, i32 0, i32 0
  %134 = load i32** %133, align 8
  %135 = getelementptr inbounds i32* %134, i64 %131
  store i32 %125, i32* %135, align 4
  %136 = load i32* %nodefilled, align 4
  store i32 %136, i32* %treepos, align 4
  br label %137

; <label>:137                                     ; preds = %118, %106
  br label %154

; <label>:138                                     ; preds = %82
  %139 = load i32* %treepos, align 4
  %140 = mul i32 2, %139
  %141 = load i8* %bit, align 1
  %142 = zext i8 %141 to i32
  %143 = add i32 %140, %142
  %144 = zext i32 %143 to i64
  %145 = load %struct.HuffmanTree** %2, align 8
  %146 = getelementptr inbounds %struct.HuffmanTree* %145, i32 0, i32 0
  %147 = load i32** %146, align 8
  %148 = getelementptr inbounds i32* %147, i64 %144
  %149 = load i32* %148, align 4
  %150 = load %struct.HuffmanTree** %2, align 8
  %151 = getelementptr inbounds %struct.HuffmanTree* %150, i32 0, i32 4
  %152 = load i32* %151, align 4
  %153 = sub i32 %149, %152
  store i32 %153, i32* %treepos, align 4
  br label %154

; <label>:154                                     ; preds = %138, %137
  br label %155

; <label>:155                                     ; preds = %154
  %156 = load i32* %i, align 4
  %157 = add i32 %156, 1
  store i32 %157, i32* %i, align 4
  br label %44

; <label>:158                                     ; preds = %44
  br label %159

; <label>:159                                     ; preds = %158
  %160 = load i32* %n, align 4
  %161 = add i32 %160, 1
  store i32 %161, i32* %n, align 4
  br label %37

; <label>:162                                     ; preds = %37
  store i32 0, i32* %n, align 4
  br label %163

; <label>:163                                     ; preds = %187, %162
  %164 = load i32* %n, align 4
  %165 = load %struct.HuffmanTree** %2, align 8
  %166 = getelementptr inbounds %struct.HuffmanTree* %165, i32 0, i32 4
  %167 = load i32* %166, align 4
  %168 = mul i32 %167, 2
  %169 = icmp ult i32 %164, %168
  br i1 %169, label %170, label %190

; <label>:170                                     ; preds = %163
  %171 = load i32* %n, align 4
  %172 = zext i32 %171 to i64
  %173 = load %struct.HuffmanTree** %2, align 8
  %174 = getelementptr inbounds %struct.HuffmanTree* %173, i32 0, i32 0
  %175 = load i32** %174, align 8
  %176 = getelementptr inbounds i32* %175, i64 %172
  %177 = load i32* %176, align 4
  %178 = icmp eq i32 %177, 32767
  br i1 %178, label %179, label %186

; <label>:179                                     ; preds = %170
  %180 = load i32* %n, align 4
  %181 = zext i32 %180 to i64
  %182 = load %struct.HuffmanTree** %2, align 8
  %183 = getelementptr inbounds %struct.HuffmanTree* %182, i32 0, i32 0
  %184 = load i32** %183, align 8
  %185 = getelementptr inbounds i32* %184, i64 %181
  store i32 0, i32* %185, align 4
  br label %186

; <label>:186                                     ; preds = %179, %170
  br label %187

; <label>:187                                     ; preds = %186
  %188 = load i32* %n, align 4
  %189 = add i32 %188, 1
  store i32 %189, i32* %n, align 4
  br label %163

; <label>:190                                     ; preds = %163
  store i32 0, i32* %1
  br label %191

; <label>:191                                     ; preds = %190, %81, %17
  %192 = load i32* %1
  ret i32 %192
}

; Function Attrs: nounwind uwtable
define internal i32 @getHash(i8* %data, i64 %size, i64 %pos) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8*, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %result = alloca i32, align 4
  %amount = alloca i64, align 8
  %i = alloca i64, align 8
  store i8* %data, i8** %2, align 8
  store i64 %size, i64* %3, align 8
  store i64 %pos, i64* %4, align 8
  store i32 0, i32* %result, align 4
  %5 = load i64* %4, align 8
  %6 = add i64 %5, 2
  %7 = load i64* %3, align 8
  %8 = icmp ult i64 %6, %7
  br i1 %8, label %9, label %37

; <label>:9                                       ; preds = %0
  %10 = load i64* %4, align 8
  %11 = add i64 %10, 0
  %12 = load i8** %2, align 8
  %13 = getelementptr inbounds i8* %12, i64 %11
  %14 = load i8* %13, align 1
  %15 = zext i8 %14 to i32
  %16 = shl i32 %15, 0
  %17 = load i32* %result, align 4
  %18 = xor i32 %17, %16
  store i32 %18, i32* %result, align 4
  %19 = load i64* %4, align 8
  %20 = add i64 %19, 1
  %21 = load i8** %2, align 8
  %22 = getelementptr inbounds i8* %21, i64 %20
  %23 = load i8* %22, align 1
  %24 = zext i8 %23 to i32
  %25 = shl i32 %24, 2
  %26 = load i32* %result, align 4
  %27 = xor i32 %26, %25
  store i32 %27, i32* %result, align 4
  %28 = load i64* %4, align 8
  %29 = add i64 %28, 2
  %30 = load i8** %2, align 8
  %31 = getelementptr inbounds i8* %30, i64 %29
  %32 = load i8* %31, align 1
  %33 = zext i8 %32 to i32
  %34 = shl i32 %33, 4
  %35 = load i32* %result, align 4
  %36 = xor i32 %35, %34
  store i32 %36, i32* %result, align 4
  br label %75

; <label>:37                                      ; preds = %0
  %38 = load i64* %4, align 8
  %39 = load i64* %3, align 8
  %40 = icmp uge i64 %38, %39
  br i1 %40, label %41, label %42

; <label>:41                                      ; preds = %37
  store i32 0, i32* %1
  br label %78

; <label>:42                                      ; preds = %37
  store i64 3, i64* %amount, align 8
  %43 = load i64* %4, align 8
  %44 = load i64* %amount, align 8
  %45 = add i64 %43, %44
  %46 = load i64* %3, align 8
  %47 = icmp uge i64 %45, %46
  br i1 %47, label %48, label %52

; <label>:48                                      ; preds = %42
  %49 = load i64* %3, align 8
  %50 = load i64* %4, align 8
  %51 = sub i64 %49, %50
  store i64 %51, i64* %amount, align 8
  br label %52

; <label>:52                                      ; preds = %48, %42
  store i64 0, i64* %i, align 8
  br label %53

; <label>:53                                      ; preds = %71, %52
  %54 = load i64* %i, align 8
  %55 = load i64* %amount, align 8
  %56 = icmp ult i64 %54, %55
  br i1 %56, label %57, label %74

; <label>:57                                      ; preds = %53
  %58 = load i64* %4, align 8
  %59 = load i64* %i, align 8
  %60 = add i64 %58, %59
  %61 = load i8** %2, align 8
  %62 = getelementptr inbounds i8* %61, i64 %60
  %63 = load i8* %62, align 1
  %64 = zext i8 %63 to i32
  %65 = load i64* %i, align 8
  %66 = mul i64 %65, 2
  %67 = trunc i64 %66 to i32
  %68 = shl i32 %64, %67
  %69 = load i32* %result, align 4
  %70 = xor i32 %69, %68
  store i32 %70, i32* %result, align 4
  br label %71

; <label>:71                                      ; preds = %57
  %72 = load i64* %i, align 8
  %73 = add i64 %72, 1
  store i64 %73, i64* %i, align 8
  br label %53

; <label>:74                                      ; preds = %53
  br label %75

; <label>:75                                      ; preds = %74, %9
  %76 = load i32* %result, align 4
  %77 = and i32 %76, 65535
  store i32 %77, i32* %1
  br label %78

; <label>:78                                      ; preds = %75, %41
  %79 = load i32* %1
  ret i32 %79
}

; Function Attrs: nounwind uwtable
define internal void @updateHashChain(%struct.Hash* %hash, i64 %wpos, i32 %hashval) #0 {
  %1 = alloca %struct.Hash*, align 8
  %2 = alloca i64, align 8
  %3 = alloca i32, align 4
  store %struct.Hash* %hash, %struct.Hash** %1, align 8
  store i64 %wpos, i64* %2, align 8
  store i32 %hashval, i32* %3, align 4
  %4 = load i32* %3, align 4
  %5 = load i64* %2, align 8
  %6 = load %struct.Hash** %1, align 8
  %7 = getelementptr inbounds %struct.Hash* %6, i32 0, i32 1
  %8 = load i32** %7, align 8
  %9 = getelementptr inbounds i32* %8, i64 %5
  store i32 %4, i32* %9, align 4
  %10 = load i32* %3, align 4
  %11 = sext i32 %10 to i64
  %12 = load %struct.Hash** %1, align 8
  %13 = getelementptr inbounds %struct.Hash* %12, i32 0, i32 0
  %14 = load i32** %13, align 8
  %15 = getelementptr inbounds i32* %14, i64 %11
  %16 = load i32* %15, align 4
  %17 = icmp ne i32 %16, -1
  br i1 %17, label %18, label %32

; <label>:18                                      ; preds = %0
  %19 = load i32* %3, align 4
  %20 = sext i32 %19 to i64
  %21 = load %struct.Hash** %1, align 8
  %22 = getelementptr inbounds %struct.Hash* %21, i32 0, i32 0
  %23 = load i32** %22, align 8
  %24 = getelementptr inbounds i32* %23, i64 %20
  %25 = load i32* %24, align 4
  %26 = trunc i32 %25 to i16
  %27 = load i64* %2, align 8
  %28 = load %struct.Hash** %1, align 8
  %29 = getelementptr inbounds %struct.Hash* %28, i32 0, i32 2
  %30 = load i16** %29, align 8
  %31 = getelementptr inbounds i16* %30, i64 %27
  store i16 %26, i16* %31, align 2
  br label %32

; <label>:32                                      ; preds = %18, %0
  %33 = load i64* %2, align 8
  %34 = trunc i64 %33 to i32
  %35 = load i32* %3, align 4
  %36 = sext i32 %35 to i64
  %37 = load %struct.Hash** %1, align 8
  %38 = getelementptr inbounds %struct.Hash* %37, i32 0, i32 0
  %39 = load i32** %38, align 8
  %40 = getelementptr inbounds i32* %39, i64 %36
  store i32 %34, i32* %40, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define internal i32 @countZeros(i8* %data, i64 %size, i64 %pos) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  %start = alloca i8*, align 8
  %end = alloca i8*, align 8
  store i8* %data, i8** %1, align 8
  store i64 %size, i64* %2, align 8
  store i64 %pos, i64* %3, align 8
  %4 = load i8** %1, align 8
  %5 = load i64* %3, align 8
  %6 = getelementptr inbounds i8* %4, i64 %5
  store i8* %6, i8** %start, align 8
  %7 = load i8** %start, align 8
  %8 = getelementptr inbounds i8* %7, i64 258
  store i8* %8, i8** %end, align 8
  %9 = load i8** %end, align 8
  %10 = load i8** %1, align 8
  %11 = load i64* %2, align 8
  %12 = getelementptr inbounds i8* %10, i64 %11
  %13 = icmp ugt i8* %9, %12
  br i1 %13, label %14, label %18

; <label>:14                                      ; preds = %0
  %15 = load i8** %1, align 8
  %16 = load i64* %2, align 8
  %17 = getelementptr inbounds i8* %15, i64 %16
  store i8* %17, i8** %end, align 8
  br label %18

; <label>:18                                      ; preds = %14, %0
  %19 = load i8** %start, align 8
  store i8* %19, i8** %1, align 8
  br label %20

; <label>:20                                      ; preds = %31, %18
  %21 = load i8** %1, align 8
  %22 = load i8** %end, align 8
  %23 = icmp ne i8* %21, %22
  br i1 %23, label %24, label %29

; <label>:24                                      ; preds = %20
  %25 = load i8** %1, align 8
  %26 = load i8* %25, align 1
  %27 = zext i8 %26 to i32
  %28 = icmp eq i32 %27, 0
  br label %29

; <label>:29                                      ; preds = %24, %20
  %30 = phi i1 [ false, %20 ], [ %28, %24 ]
  br i1 %30, label %31, label %34

; <label>:31                                      ; preds = %29
  %32 = load i8** %1, align 8
  %33 = getelementptr inbounds i8* %32, i32 1
  store i8* %33, i8** %1, align 8
  br label %20

; <label>:34                                      ; preds = %29
  %35 = load i8** %1, align 8
  %36 = load i8** %start, align 8
  %37 = ptrtoint i8* %35 to i64
  %38 = ptrtoint i8* %36 to i64
  %39 = sub i64 %37, %38
  %40 = trunc i64 %39 to i32
  ret i32 %40
}

; Function Attrs: nounwind uwtable
define internal void @addLengthDistance(%struct.uivector* %values, i64 %length, i64 %distance) #0 {
  %1 = alloca %struct.uivector*, align 8
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  %length_code = alloca i32, align 4
  %extra_length = alloca i32, align 4
  %dist_code = alloca i32, align 4
  %extra_distance = alloca i32, align 4
  store %struct.uivector* %values, %struct.uivector** %1, align 8
  store i64 %length, i64* %2, align 8
  store i64 %distance, i64* %3, align 8
  %4 = load i64* %2, align 8
  %5 = call i64 @searchCodeIndex(i32* getelementptr inbounds ([29 x i32]* @LENGTHBASE, i32 0, i32 0), i64 29, i64 %4)
  %6 = trunc i64 %5 to i32
  store i32 %6, i32* %length_code, align 4
  %7 = load i64* %2, align 8
  %8 = load i32* %length_code, align 4
  %9 = zext i32 %8 to i64
  %10 = getelementptr inbounds [29 x i32]* @LENGTHBASE, i32 0, i64 %9
  %11 = load i32* %10, align 4
  %12 = zext i32 %11 to i64
  %13 = sub i64 %7, %12
  %14 = trunc i64 %13 to i32
  store i32 %14, i32* %extra_length, align 4
  %15 = load i64* %3, align 8
  %16 = call i64 @searchCodeIndex(i32* getelementptr inbounds ([30 x i32]* @DISTANCEBASE, i32 0, i32 0), i64 30, i64 %15)
  %17 = trunc i64 %16 to i32
  store i32 %17, i32* %dist_code, align 4
  %18 = load i64* %3, align 8
  %19 = load i32* %dist_code, align 4
  %20 = zext i32 %19 to i64
  %21 = getelementptr inbounds [30 x i32]* @DISTANCEBASE, i32 0, i64 %20
  %22 = load i32* %21, align 4
  %23 = zext i32 %22 to i64
  %24 = sub i64 %18, %23
  %25 = trunc i64 %24 to i32
  store i32 %25, i32* %extra_distance, align 4
  %26 = load %struct.uivector** %1, align 8
  %27 = load i32* %length_code, align 4
  %28 = add i32 %27, 257
  %29 = call i32 @uivector_push_back(%struct.uivector* %26, i32 %28)
  %30 = load %struct.uivector** %1, align 8
  %31 = load i32* %extra_length, align 4
  %32 = call i32 @uivector_push_back(%struct.uivector* %30, i32 %31)
  %33 = load %struct.uivector** %1, align 8
  %34 = load i32* %dist_code, align 4
  %35 = call i32 @uivector_push_back(%struct.uivector* %33, i32 %34)
  %36 = load %struct.uivector** %1, align 8
  %37 = load i32* %extra_distance, align 4
  %38 = call i32 @uivector_push_back(%struct.uivector* %36, i32 %37)
  ret void
}

; Function Attrs: nounwind uwtable
define internal i64 @searchCodeIndex(i32* %array, i64 %array_size, i64 %value) #0 {
  %1 = alloca i64, align 8
  %2 = alloca i32*, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %left = alloca i64, align 8
  %right = alloca i64, align 8
  %mid = alloca i64, align 8
  store i32* %array, i32** %2, align 8
  store i64 %array_size, i64* %3, align 8
  store i64 %value, i64* %4, align 8
  store i64 1, i64* %left, align 8
  %5 = load i64* %3, align 8
  %6 = sub i64 %5, 1
  store i64 %6, i64* %right, align 8
  br label %7

; <label>:7                                       ; preds = %42, %0
  %8 = load i64* %left, align 8
  %9 = load i64* %right, align 8
  %10 = icmp ule i64 %8, %9
  br i1 %10, label %11, label %43

; <label>:11                                      ; preds = %7
  %12 = load i64* %left, align 8
  %13 = load i64* %right, align 8
  %14 = add i64 %12, %13
  %15 = udiv i64 %14, 2
  store i64 %15, i64* %mid, align 8
  %16 = load i64* %mid, align 8
  %17 = load i32** %2, align 8
  %18 = getelementptr inbounds i32* %17, i64 %16
  %19 = load i32* %18, align 4
  %20 = zext i32 %19 to i64
  %21 = load i64* %4, align 8
  %22 = icmp ule i64 %20, %21
  br i1 %22, label %23, label %26

; <label>:23                                      ; preds = %11
  %24 = load i64* %mid, align 8
  %25 = add i64 %24, 1
  store i64 %25, i64* %left, align 8
  br label %42

; <label>:26                                      ; preds = %11
  %27 = load i64* %mid, align 8
  %28 = sub i64 %27, 1
  %29 = load i32** %2, align 8
  %30 = getelementptr inbounds i32* %29, i64 %28
  %31 = load i32* %30, align 4
  %32 = zext i32 %31 to i64
  %33 = load i64* %4, align 8
  %34 = icmp ugt i64 %32, %33
  br i1 %34, label %35, label %38

; <label>:35                                      ; preds = %26
  %36 = load i64* %mid, align 8
  %37 = sub i64 %36, 1
  store i64 %37, i64* %right, align 8
  br label %41

; <label>:38                                      ; preds = %26
  %39 = load i64* %mid, align 8
  %40 = sub i64 %39, 1
  store i64 %40, i64* %1
  br label %46

; <label>:41                                      ; preds = %35
  br label %42

; <label>:42                                      ; preds = %41, %23
  br label %7

; <label>:43                                      ; preds = %7
  %44 = load i64* %3, align 8
  %45 = sub i64 %44, 1
  store i64 %45, i64* %1
  br label %46

; <label>:46                                      ; preds = %43, %38
  %47 = load i64* %1
  ret i64 %47
}

; Function Attrs: nounwind uwtable
define internal i32 @generateFixedLitLenTree(%struct.HuffmanTree* %tree) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.HuffmanTree*, align 8
  %i = alloca i32, align 4
  %error = alloca i32, align 4
  %bitlen = alloca i32*, align 8
  store %struct.HuffmanTree* %tree, %struct.HuffmanTree** %2, align 8
  store i32 0, i32* %error, align 4
  %3 = call i8* @lodepng_malloc(i64 1152)
  %4 = bitcast i8* %3 to i32*
  store i32* %4, i32** %bitlen, align 8
  %5 = load i32** %bitlen, align 8
  %6 = icmp ne i32* %5, null
  br i1 %6, label %8, label %7

; <label>:7                                       ; preds = %0
  store i32 83, i32* %1
  br label %63

; <label>:8                                       ; preds = %0
  store i32 0, i32* %i, align 4
  br label %9

; <label>:9                                       ; preds = %17, %8
  %10 = load i32* %i, align 4
  %11 = icmp ule i32 %10, 143
  br i1 %11, label %12, label %20

; <label>:12                                      ; preds = %9
  %13 = load i32* %i, align 4
  %14 = zext i32 %13 to i64
  %15 = load i32** %bitlen, align 8
  %16 = getelementptr inbounds i32* %15, i64 %14
  store i32 8, i32* %16, align 4
  br label %17

; <label>:17                                      ; preds = %12
  %18 = load i32* %i, align 4
  %19 = add i32 %18, 1
  store i32 %19, i32* %i, align 4
  br label %9

; <label>:20                                      ; preds = %9
  store i32 144, i32* %i, align 4
  br label %21

; <label>:21                                      ; preds = %29, %20
  %22 = load i32* %i, align 4
  %23 = icmp ule i32 %22, 255
  br i1 %23, label %24, label %32

; <label>:24                                      ; preds = %21
  %25 = load i32* %i, align 4
  %26 = zext i32 %25 to i64
  %27 = load i32** %bitlen, align 8
  %28 = getelementptr inbounds i32* %27, i64 %26
  store i32 9, i32* %28, align 4
  br label %29

; <label>:29                                      ; preds = %24
  %30 = load i32* %i, align 4
  %31 = add i32 %30, 1
  store i32 %31, i32* %i, align 4
  br label %21

; <label>:32                                      ; preds = %21
  store i32 256, i32* %i, align 4
  br label %33

; <label>:33                                      ; preds = %41, %32
  %34 = load i32* %i, align 4
  %35 = icmp ule i32 %34, 279
  br i1 %35, label %36, label %44

; <label>:36                                      ; preds = %33
  %37 = load i32* %i, align 4
  %38 = zext i32 %37 to i64
  %39 = load i32** %bitlen, align 8
  %40 = getelementptr inbounds i32* %39, i64 %38
  store i32 7, i32* %40, align 4
  br label %41

; <label>:41                                      ; preds = %36
  %42 = load i32* %i, align 4
  %43 = add i32 %42, 1
  store i32 %43, i32* %i, align 4
  br label %33

; <label>:44                                      ; preds = %33
  store i32 280, i32* %i, align 4
  br label %45

; <label>:45                                      ; preds = %53, %44
  %46 = load i32* %i, align 4
  %47 = icmp ule i32 %46, 287
  br i1 %47, label %48, label %56

; <label>:48                                      ; preds = %45
  %49 = load i32* %i, align 4
  %50 = zext i32 %49 to i64
  %51 = load i32** %bitlen, align 8
  %52 = getelementptr inbounds i32* %51, i64 %50
  store i32 8, i32* %52, align 4
  br label %53

; <label>:53                                      ; preds = %48
  %54 = load i32* %i, align 4
  %55 = add i32 %54, 1
  store i32 %55, i32* %i, align 4
  br label %45

; <label>:56                                      ; preds = %45
  %57 = load %struct.HuffmanTree** %2, align 8
  %58 = load i32** %bitlen, align 8
  %59 = call i32 @HuffmanTree_makeFromLengths(%struct.HuffmanTree* %57, i32* %58, i64 288, i32 15)
  store i32 %59, i32* %error, align 4
  %60 = load i32** %bitlen, align 8
  %61 = bitcast i32* %60 to i8*
  call void @lodepng_free(i8* %61)
  %62 = load i32* %error, align 4
  store i32 %62, i32* %1
  br label %63

; <label>:63                                      ; preds = %56, %7
  %64 = load i32* %1
  ret i32 %64
}

; Function Attrs: nounwind uwtable
define internal i32 @generateFixedDistanceTree(%struct.HuffmanTree* %tree) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.HuffmanTree*, align 8
  %i = alloca i32, align 4
  %error = alloca i32, align 4
  %bitlen = alloca i32*, align 8
  store %struct.HuffmanTree* %tree, %struct.HuffmanTree** %2, align 8
  store i32 0, i32* %error, align 4
  %3 = call i8* @lodepng_malloc(i64 128)
  %4 = bitcast i8* %3 to i32*
  store i32* %4, i32** %bitlen, align 8
  %5 = load i32** %bitlen, align 8
  %6 = icmp ne i32* %5, null
  br i1 %6, label %8, label %7

; <label>:7                                       ; preds = %0
  store i32 83, i32* %1
  br label %27

; <label>:8                                       ; preds = %0
  store i32 0, i32* %i, align 4
  br label %9

; <label>:9                                       ; preds = %17, %8
  %10 = load i32* %i, align 4
  %11 = icmp ult i32 %10, 32
  br i1 %11, label %12, label %20

; <label>:12                                      ; preds = %9
  %13 = load i32* %i, align 4
  %14 = zext i32 %13 to i64
  %15 = load i32** %bitlen, align 8
  %16 = getelementptr inbounds i32* %15, i64 %14
  store i32 5, i32* %16, align 4
  br label %17

; <label>:17                                      ; preds = %12
  %18 = load i32* %i, align 4
  %19 = add i32 %18, 1
  store i32 %19, i32* %i, align 4
  br label %9

; <label>:20                                      ; preds = %9
  %21 = load %struct.HuffmanTree** %2, align 8
  %22 = load i32** %bitlen, align 8
  %23 = call i32 @HuffmanTree_makeFromLengths(%struct.HuffmanTree* %21, i32* %22, i64 32, i32 15)
  store i32 %23, i32* %error, align 4
  %24 = load i32** %bitlen, align 8
  %25 = bitcast i32* %24 to i8*
  call void @lodepng_free(i8* %25)
  %26 = load i32* %error, align 4
  store i32 %26, i32* %1
  br label %27

; <label>:27                                      ; preds = %20, %7
  %28 = load i32* %1
  ret i32 %28
}

; Function Attrs: nounwind uwtable
define internal i32 @HuffmanTree_makeFromLengths(%struct.HuffmanTree* %tree, i32* %bitlen, i64 %numcodes, i32 %maxbitlen) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.HuffmanTree*, align 8
  %3 = alloca i32*, align 8
  %4 = alloca i64, align 8
  %5 = alloca i32, align 4
  %i = alloca i32, align 4
  store %struct.HuffmanTree* %tree, %struct.HuffmanTree** %2, align 8
  store i32* %bitlen, i32** %3, align 8
  store i64 %numcodes, i64* %4, align 8
  store i32 %maxbitlen, i32* %5, align 4
  %6 = load i64* %4, align 8
  %7 = mul i64 %6, 4
  %8 = call i8* @lodepng_malloc(i64 %7)
  %9 = bitcast i8* %8 to i32*
  %10 = load %struct.HuffmanTree** %2, align 8
  %11 = getelementptr inbounds %struct.HuffmanTree* %10, i32 0, i32 2
  store i32* %9, i32** %11, align 8
  %12 = load %struct.HuffmanTree** %2, align 8
  %13 = getelementptr inbounds %struct.HuffmanTree* %12, i32 0, i32 2
  %14 = load i32** %13, align 8
  %15 = icmp ne i32* %14, null
  br i1 %15, label %17, label %16

; <label>:16                                      ; preds = %0
  store i32 83, i32* %1
  br label %48

; <label>:17                                      ; preds = %0
  store i32 0, i32* %i, align 4
  br label %18

; <label>:18                                      ; preds = %35, %17
  %19 = load i32* %i, align 4
  %20 = zext i32 %19 to i64
  %21 = load i64* %4, align 8
  %22 = icmp ult i64 %20, %21
  br i1 %22, label %23, label %38

; <label>:23                                      ; preds = %18
  %24 = load i32* %i, align 4
  %25 = zext i32 %24 to i64
  %26 = load i32** %3, align 8
  %27 = getelementptr inbounds i32* %26, i64 %25
  %28 = load i32* %27, align 4
  %29 = load i32* %i, align 4
  %30 = zext i32 %29 to i64
  %31 = load %struct.HuffmanTree** %2, align 8
  %32 = getelementptr inbounds %struct.HuffmanTree* %31, i32 0, i32 2
  %33 = load i32** %32, align 8
  %34 = getelementptr inbounds i32* %33, i64 %30
  store i32 %28, i32* %34, align 4
  br label %35

; <label>:35                                      ; preds = %23
  %36 = load i32* %i, align 4
  %37 = add i32 %36, 1
  store i32 %37, i32* %i, align 4
  br label %18

; <label>:38                                      ; preds = %18
  %39 = load i64* %4, align 8
  %40 = trunc i64 %39 to i32
  %41 = load %struct.HuffmanTree** %2, align 8
  %42 = getelementptr inbounds %struct.HuffmanTree* %41, i32 0, i32 4
  store i32 %40, i32* %42, align 4
  %43 = load i32* %5, align 4
  %44 = load %struct.HuffmanTree** %2, align 8
  %45 = getelementptr inbounds %struct.HuffmanTree* %44, i32 0, i32 3
  store i32 %43, i32* %45, align 4
  %46 = load %struct.HuffmanTree** %2, align 8
  %47 = call i32 @HuffmanTree_makeFromLengths2(%struct.HuffmanTree* %46)
  store i32 %47, i32* %1
  br label %48

; <label>:48                                      ; preds = %38, %16
  %49 = load i32* %1
  ret i32 %49
}

; Function Attrs: nounwind uwtable
define internal zeroext i8 @readBitFromStream(i64* %bitpointer, i8* %bitstream) #0 {
  %1 = alloca i64*, align 8
  %2 = alloca i8*, align 8
  %result = alloca i8, align 1
  store i64* %bitpointer, i64** %1, align 8
  store i8* %bitstream, i8** %2, align 8
  %3 = load i64** %1, align 8
  %4 = load i64* %3, align 8
  %5 = lshr i64 %4, 3
  %6 = load i8** %2, align 8
  %7 = getelementptr inbounds i8* %6, i64 %5
  %8 = load i8* %7, align 1
  %9 = zext i8 %8 to i32
  %10 = load i64** %1, align 8
  %11 = load i64* %10, align 8
  %12 = and i64 %11, 7
  %13 = trunc i64 %12 to i32
  %14 = ashr i32 %9, %13
  %15 = and i32 %14, 1
  %16 = trunc i32 %15 to i8
  store i8 %16, i8* %result, align 1
  %17 = load i64** %1, align 8
  %18 = load i64* %17, align 8
  %19 = add i64 %18, 1
  store i64 %19, i64* %17, align 8
  %20 = load i8* %result, align 1
  ret i8 %20
}

; Function Attrs: nounwind uwtable
define internal i32 @inflateNoCompression(%struct.ucvector* %out, i8* %in, i64* %bp, i64* %pos, i64 %inlength) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.ucvector*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i64*, align 8
  %5 = alloca i64*, align 8
  %6 = alloca i64, align 8
  %p = alloca i64, align 8
  %LEN = alloca i32, align 4
  %NLEN = alloca i32, align 4
  %n = alloca i32, align 4
  %error = alloca i32, align 4
  store %struct.ucvector* %out, %struct.ucvector** %2, align 8
  store i8* %in, i8** %3, align 8
  store i64* %bp, i64** %4, align 8
  store i64* %pos, i64** %5, align 8
  store i64 %inlength, i64* %6, align 8
  store i32 0, i32* %error, align 4
  br label %7

; <label>:7                                       ; preds = %12, %0
  %8 = load i64** %4, align 8
  %9 = load i64* %8, align 8
  %10 = and i64 %9, 7
  %11 = icmp ne i64 %10, 0
  br i1 %11, label %12, label %16

; <label>:12                                      ; preds = %7
  %13 = load i64** %4, align 8
  %14 = load i64* %13, align 8
  %15 = add i64 %14, 1
  store i64 %15, i64* %13, align 8
  br label %7

; <label>:16                                      ; preds = %7
  %17 = load i64** %4, align 8
  %18 = load i64* %17, align 8
  %19 = udiv i64 %18, 8
  store i64 %19, i64* %p, align 8
  %20 = load i64* %p, align 8
  %21 = load i64* %6, align 8
  %22 = sub i64 %21, 4
  %23 = icmp uge i64 %20, %22
  br i1 %23, label %24, label %25

; <label>:24                                      ; preds = %16
  store i32 52, i32* %1
  br label %116

; <label>:25                                      ; preds = %16
  %26 = load i64* %p, align 8
  %27 = load i8** %3, align 8
  %28 = getelementptr inbounds i8* %27, i64 %26
  %29 = load i8* %28, align 1
  %30 = zext i8 %29 to i32
  %31 = load i64* %p, align 8
  %32 = add i64 %31, 1
  %33 = load i8** %3, align 8
  %34 = getelementptr inbounds i8* %33, i64 %32
  %35 = load i8* %34, align 1
  %36 = zext i8 %35 to i32
  %37 = mul nsw i32 256, %36
  %38 = add nsw i32 %30, %37
  store i32 %38, i32* %LEN, align 4
  %39 = load i64* %p, align 8
  %40 = add i64 %39, 2
  store i64 %40, i64* %p, align 8
  %41 = load i64* %p, align 8
  %42 = load i8** %3, align 8
  %43 = getelementptr inbounds i8* %42, i64 %41
  %44 = load i8* %43, align 1
  %45 = zext i8 %44 to i32
  %46 = load i64* %p, align 8
  %47 = add i64 %46, 1
  %48 = load i8** %3, align 8
  %49 = getelementptr inbounds i8* %48, i64 %47
  %50 = load i8* %49, align 1
  %51 = zext i8 %50 to i32
  %52 = mul nsw i32 256, %51
  %53 = add nsw i32 %45, %52
  store i32 %53, i32* %NLEN, align 4
  %54 = load i64* %p, align 8
  %55 = add i64 %54, 2
  store i64 %55, i64* %p, align 8
  %56 = load i32* %LEN, align 4
  %57 = load i32* %NLEN, align 4
  %58 = add i32 %56, %57
  %59 = icmp ne i32 %58, 65535
  br i1 %59, label %60, label %61

; <label>:60                                      ; preds = %25
  store i32 21, i32* %1
  br label %116

; <label>:61                                      ; preds = %25
  %62 = load i64** %5, align 8
  %63 = load i64* %62, align 8
  %64 = load i32* %LEN, align 4
  %65 = zext i32 %64 to i64
  %66 = add i64 %63, %65
  %67 = load %struct.ucvector** %2, align 8
  %68 = getelementptr inbounds %struct.ucvector* %67, i32 0, i32 1
  %69 = load i64* %68, align 8
  %70 = icmp uge i64 %66, %69
  br i1 %70, label %71, label %82

; <label>:71                                      ; preds = %61
  %72 = load %struct.ucvector** %2, align 8
  %73 = load i64** %5, align 8
  %74 = load i64* %73, align 8
  %75 = load i32* %LEN, align 4
  %76 = zext i32 %75 to i64
  %77 = add i64 %74, %76
  %78 = call i32 @ucvector_resize(%struct.ucvector* %72, i64 %77)
  %79 = icmp ne i32 %78, 0
  br i1 %79, label %81, label %80

; <label>:80                                      ; preds = %71
  store i32 83, i32* %1
  br label %116

; <label>:81                                      ; preds = %71
  br label %82

; <label>:82                                      ; preds = %81, %61
  %83 = load i64* %p, align 8
  %84 = load i32* %LEN, align 4
  %85 = zext i32 %84 to i64
  %86 = add i64 %83, %85
  %87 = load i64* %6, align 8
  %88 = icmp ugt i64 %86, %87
  br i1 %88, label %89, label %90

; <label>:89                                      ; preds = %82
  store i32 23, i32* %1
  br label %116

; <label>:90                                      ; preds = %82
  store i32 0, i32* %n, align 4
  br label %91

; <label>:91                                      ; preds = %108, %90
  %92 = load i32* %n, align 4
  %93 = load i32* %LEN, align 4
  %94 = icmp ult i32 %92, %93
  br i1 %94, label %95, label %111

; <label>:95                                      ; preds = %91
  %96 = load i64* %p, align 8
  %97 = add i64 %96, 1
  store i64 %97, i64* %p, align 8
  %98 = load i8** %3, align 8
  %99 = getelementptr inbounds i8* %98, i64 %96
  %100 = load i8* %99, align 1
  %101 = load i64** %5, align 8
  %102 = load i64* %101, align 8
  %103 = add i64 %102, 1
  store i64 %103, i64* %101, align 8
  %104 = load %struct.ucvector** %2, align 8
  %105 = getelementptr inbounds %struct.ucvector* %104, i32 0, i32 0
  %106 = load i8** %105, align 8
  %107 = getelementptr inbounds i8* %106, i64 %102
  store i8 %100, i8* %107, align 1
  br label %108

; <label>:108                                     ; preds = %95
  %109 = load i32* %n, align 4
  %110 = add i32 %109, 1
  store i32 %110, i32* %n, align 4
  br label %91

; <label>:111                                     ; preds = %91
  %112 = load i64* %p, align 8
  %113 = mul i64 %112, 8
  %114 = load i64** %4, align 8
  store i64 %113, i64* %114, align 8
  %115 = load i32* %error, align 4
  store i32 %115, i32* %1
  br label %116

; <label>:116                                     ; preds = %111, %89, %80, %60, %24
  %117 = load i32* %1
  ret i32 %117
}

; Function Attrs: nounwind uwtable
define internal i32 @inflateHuffmanBlock(%struct.ucvector* %out, i8* %in, i64* %bp, i64* %pos, i64 %inlength, i32 %btype) #0 {
  %1 = alloca %struct.ucvector*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i64*, align 8
  %4 = alloca i64*, align 8
  %5 = alloca i64, align 8
  %6 = alloca i32, align 4
  %error = alloca i32, align 4
  %tree_ll = alloca %struct.HuffmanTree, align 8
  %tree_d = alloca %struct.HuffmanTree, align 8
  %inbitlength = alloca i64, align 8
  %code_ll = alloca i32, align 4
  %code_d = alloca i32, align 4
  %distance = alloca i32, align 4
  %numextrabits_l = alloca i32, align 4
  %numextrabits_d = alloca i32, align 4
  %start = alloca i64, align 8
  %forward = alloca i64, align 8
  %backward = alloca i64, align 8
  %length = alloca i64, align 8
  store %struct.ucvector* %out, %struct.ucvector** %1, align 8
  store i8* %in, i8** %2, align 8
  store i64* %bp, i64** %3, align 8
  store i64* %pos, i64** %4, align 8
  store i64 %inlength, i64* %5, align 8
  store i32 %btype, i32* %6, align 4
  store i32 0, i32* %error, align 4
  %7 = load i64* %5, align 8
  %8 = mul i64 %7, 8
  store i64 %8, i64* %inbitlength, align 8
  call void @HuffmanTree_init(%struct.HuffmanTree* %tree_ll)
  call void @HuffmanTree_init(%struct.HuffmanTree* %tree_d)
  %9 = load i32* %6, align 4
  %10 = icmp eq i32 %9, 1
  br i1 %10, label %11, label %12

; <label>:11                                      ; preds = %0
  call void @getTreeInflateFixed(%struct.HuffmanTree* %tree_ll, %struct.HuffmanTree* %tree_d)
  br label %21

; <label>:12                                      ; preds = %0
  %13 = load i32* %6, align 4
  %14 = icmp eq i32 %13, 2
  br i1 %14, label %15, label %20

; <label>:15                                      ; preds = %12
  %16 = load i8** %2, align 8
  %17 = load i64** %3, align 8
  %18 = load i64* %5, align 8
  %19 = call i32 @getTreeInflateDynamic(%struct.HuffmanTree* %tree_ll, %struct.HuffmanTree* %tree_d, i8* %16, i64* %17, i64 %18)
  store i32 %19, i32* %error, align 4
  br label %20

; <label>:20                                      ; preds = %15, %12
  br label %21

; <label>:21                                      ; preds = %20, %11
  br label %22

; <label>:22                                      ; preds = %213, %21
  %23 = load i32* %error, align 4
  %24 = icmp ne i32 %23, 0
  %25 = xor i1 %24, true
  br i1 %25, label %26, label %214

; <label>:26                                      ; preds = %22
  %27 = load i8** %2, align 8
  %28 = load i64** %3, align 8
  %29 = load i64* %inbitlength, align 8
  %30 = call i32 @huffmanDecodeSymbol(i8* %27, i64* %28, %struct.HuffmanTree* %tree_ll, i64 %29)
  store i32 %30, i32* %code_ll, align 4
  %31 = load i32* %code_ll, align 4
  %32 = icmp ule i32 %31, 255
  br i1 %32, label %33, label %62

; <label>:33                                      ; preds = %26
  %34 = load i64** %4, align 8
  %35 = load i64* %34, align 8
  %36 = load %struct.ucvector** %1, align 8
  %37 = getelementptr inbounds %struct.ucvector* %36, i32 0, i32 1
  %38 = load i64* %37, align 8
  %39 = icmp uge i64 %35, %38
  br i1 %39, label %40, label %50

; <label>:40                                      ; preds = %33
  %41 = load %struct.ucvector** %1, align 8
  %42 = load i64** %4, align 8
  %43 = load i64* %42, align 8
  %44 = add i64 %43, 1
  %45 = mul i64 %44, 2
  %46 = call i32 @ucvector_resize(%struct.ucvector* %41, i64 %45)
  %47 = icmp ne i32 %46, 0
  br i1 %47, label %49, label %48

; <label>:48                                      ; preds = %40
  store i32 83, i32* %error, align 4
  br label %214

; <label>:49                                      ; preds = %40
  br label %50

; <label>:50                                      ; preds = %49, %33
  %51 = load i32* %code_ll, align 4
  %52 = trunc i32 %51 to i8
  %53 = load i64** %4, align 8
  %54 = load i64* %53, align 8
  %55 = load %struct.ucvector** %1, align 8
  %56 = getelementptr inbounds %struct.ucvector* %55, i32 0, i32 0
  %57 = load i8** %56, align 8
  %58 = getelementptr inbounds i8* %57, i64 %54
  store i8 %52, i8* %58, align 1
  %59 = load i64** %4, align 8
  %60 = load i64* %59, align 8
  %61 = add i64 %60, 1
  store i64 %61, i64* %59, align 8
  br label %213

; <label>:62                                      ; preds = %26
  %63 = load i32* %code_ll, align 4
  %64 = icmp uge i32 %63, 257
  br i1 %64, label %65, label %201

; <label>:65                                      ; preds = %62
  %66 = load i32* %code_ll, align 4
  %67 = icmp ule i32 %66, 285
  br i1 %67, label %68, label %201

; <label>:68                                      ; preds = %65
  %69 = load i32* %code_ll, align 4
  %70 = sub i32 %69, 257
  %71 = zext i32 %70 to i64
  %72 = getelementptr inbounds [29 x i32]* @LENGTHBASE, i32 0, i64 %71
  %73 = load i32* %72, align 4
  %74 = zext i32 %73 to i64
  store i64 %74, i64* %length, align 8
  %75 = load i32* %code_ll, align 4
  %76 = sub i32 %75, 257
  %77 = zext i32 %76 to i64
  %78 = getelementptr inbounds [29 x i32]* @LENGTHEXTRA, i32 0, i64 %77
  %79 = load i32* %78, align 4
  store i32 %79, i32* %numextrabits_l, align 4
  %80 = load i64** %3, align 8
  %81 = load i64* %80, align 8
  %82 = load i64* %inbitlength, align 8
  %83 = icmp uge i64 %81, %82
  br i1 %83, label %84, label %85

; <label>:84                                      ; preds = %68
  store i32 51, i32* %error, align 4
  br label %214

; <label>:85                                      ; preds = %68
  %86 = load i64** %3, align 8
  %87 = load i8** %2, align 8
  %88 = load i32* %numextrabits_l, align 4
  %89 = zext i32 %88 to i64
  %90 = call i32 @readBitsFromStream(i64* %86, i8* %87, i64 %89)
  %91 = zext i32 %90 to i64
  %92 = load i64* %length, align 8
  %93 = add i64 %92, %91
  store i64 %93, i64* %length, align 8
  %94 = load i8** %2, align 8
  %95 = load i64** %3, align 8
  %96 = load i64* %inbitlength, align 8
  %97 = call i32 @huffmanDecodeSymbol(i8* %94, i64* %95, %struct.HuffmanTree* %tree_d, i64 %96)
  store i32 %97, i32* %code_d, align 4
  %98 = load i32* %code_d, align 4
  %99 = icmp ugt i32 %98, 29
  br i1 %99, label %100, label %112

; <label>:100                                     ; preds = %85
  %101 = load i32* %code_ll, align 4
  %102 = icmp eq i32 %101, -1
  br i1 %102, label %103, label %110

; <label>:103                                     ; preds = %100
  %104 = load i64** %3, align 8
  %105 = load i64* %104, align 8
  %106 = load i64* %5, align 8
  %107 = mul i64 %106, 8
  %108 = icmp ugt i64 %105, %107
  %109 = select i1 %108, i32 10, i32 11
  store i32 %109, i32* %error, align 4
  br label %111

; <label>:110                                     ; preds = %100
  store i32 18, i32* %error, align 4
  br label %111

; <label>:111                                     ; preds = %110, %103
  br label %214

; <label>:112                                     ; preds = %85
  %113 = load i32* %code_d, align 4
  %114 = zext i32 %113 to i64
  %115 = getelementptr inbounds [30 x i32]* @DISTANCEBASE, i32 0, i64 %114
  %116 = load i32* %115, align 4
  store i32 %116, i32* %distance, align 4
  %117 = load i32* %code_d, align 4
  %118 = zext i32 %117 to i64
  %119 = getelementptr inbounds [30 x i32]* @DISTANCEEXTRA, i32 0, i64 %118
  %120 = load i32* %119, align 4
  store i32 %120, i32* %numextrabits_d, align 4
  %121 = load i64** %3, align 8
  %122 = load i64* %121, align 8
  %123 = load i64* %inbitlength, align 8
  %124 = icmp uge i64 %122, %123
  br i1 %124, label %125, label %126

; <label>:125                                     ; preds = %112
  store i32 51, i32* %error, align 4
  br label %214

; <label>:126                                     ; preds = %112
  %127 = load i64** %3, align 8
  %128 = load i8** %2, align 8
  %129 = load i32* %numextrabits_d, align 4
  %130 = zext i32 %129 to i64
  %131 = call i32 @readBitsFromStream(i64* %127, i8* %128, i64 %130)
  %132 = load i32* %distance, align 4
  %133 = add i32 %132, %131
  store i32 %133, i32* %distance, align 4
  %134 = load i64** %4, align 8
  %135 = load i64* %134, align 8
  store i64 %135, i64* %start, align 8
  %136 = load i32* %distance, align 4
  %137 = zext i32 %136 to i64
  %138 = load i64* %start, align 8
  %139 = icmp ugt i64 %137, %138
  br i1 %139, label %140, label %141

; <label>:140                                     ; preds = %126
  store i32 52, i32* %error, align 4
  br label %214

; <label>:141                                     ; preds = %126
  %142 = load i64* %start, align 8
  %143 = load i32* %distance, align 4
  %144 = zext i32 %143 to i64
  %145 = sub i64 %142, %144
  store i64 %145, i64* %backward, align 8
  %146 = load i64** %4, align 8
  %147 = load i64* %146, align 8
  %148 = load i64* %length, align 8
  %149 = add i64 %147, %148
  %150 = load %struct.ucvector** %1, align 8
  %151 = getelementptr inbounds %struct.ucvector* %150, i32 0, i32 1
  %152 = load i64* %151, align 8
  %153 = icmp uge i64 %149, %152
  br i1 %153, label %154, label %165

; <label>:154                                     ; preds = %141
  %155 = load %struct.ucvector** %1, align 8
  %156 = load i64** %4, align 8
  %157 = load i64* %156, align 8
  %158 = load i64* %length, align 8
  %159 = add i64 %157, %158
  %160 = mul i64 %159, 2
  %161 = call i32 @ucvector_resize(%struct.ucvector* %155, i64 %160)
  %162 = icmp ne i32 %161, 0
  br i1 %162, label %164, label %163

; <label>:163                                     ; preds = %154
  store i32 83, i32* %error, align 4
  br label %214

; <label>:164                                     ; preds = %154
  br label %165

; <label>:165                                     ; preds = %164, %141
  store i64 0, i64* %forward, align 8
  br label %166

; <label>:166                                     ; preds = %197, %165
  %167 = load i64* %forward, align 8
  %168 = load i64* %length, align 8
  %169 = icmp ult i64 %167, %168
  br i1 %169, label %170, label %200

; <label>:170                                     ; preds = %166
  %171 = load i64* %backward, align 8
  %172 = load %struct.ucvector** %1, align 8
  %173 = getelementptr inbounds %struct.ucvector* %172, i32 0, i32 0
  %174 = load i8** %173, align 8
  %175 = getelementptr inbounds i8* %174, i64 %171
  %176 = load i8* %175, align 1
  %177 = load i64** %4, align 8
  %178 = load i64* %177, align 8
  %179 = load %struct.ucvector** %1, align 8
  %180 = getelementptr inbounds %struct.ucvector* %179, i32 0, i32 0
  %181 = load i8** %180, align 8
  %182 = getelementptr inbounds i8* %181, i64 %178
  store i8 %176, i8* %182, align 1
  %183 = load i64** %4, align 8
  %184 = load i64* %183, align 8
  %185 = add i64 %184, 1
  store i64 %185, i64* %183, align 8
  %186 = load i64* %backward, align 8
  %187 = add i64 %186, 1
  store i64 %187, i64* %backward, align 8
  %188 = load i64* %backward, align 8
  %189 = load i64* %start, align 8
  %190 = icmp uge i64 %188, %189
  br i1 %190, label %191, label %196

; <label>:191                                     ; preds = %170
  %192 = load i64* %start, align 8
  %193 = load i32* %distance, align 4
  %194 = zext i32 %193 to i64
  %195 = sub i64 %192, %194
  store i64 %195, i64* %backward, align 8
  br label %196

; <label>:196                                     ; preds = %191, %170
  br label %197

; <label>:197                                     ; preds = %196
  %198 = load i64* %forward, align 8
  %199 = add i64 %198, 1
  store i64 %199, i64* %forward, align 8
  br label %166

; <label>:200                                     ; preds = %166
  br label %212

; <label>:201                                     ; preds = %65, %62
  %202 = load i32* %code_ll, align 4
  %203 = icmp eq i32 %202, 256
  br i1 %203, label %204, label %205

; <label>:204                                     ; preds = %201
  br label %214

; <label>:205                                     ; preds = %201
  %206 = load i64** %3, align 8
  %207 = load i64* %206, align 8
  %208 = load i64* %5, align 8
  %209 = mul i64 %208, 8
  %210 = icmp ugt i64 %207, %209
  %211 = select i1 %210, i32 10, i32 11
  store i32 %211, i32* %error, align 4
  br label %214

; <label>:212                                     ; preds = %200
  br label %213

; <label>:213                                     ; preds = %212, %50
  br label %22

; <label>:214                                     ; preds = %205, %204, %163, %140, %125, %111, %84, %48, %22
  call void @HuffmanTree_cleanup(%struct.HuffmanTree* %tree_ll)
  call void @HuffmanTree_cleanup(%struct.HuffmanTree* %tree_d)
  %215 = load i32* %error, align 4
  ret i32 %215
}

; Function Attrs: nounwind uwtable
define internal void @getTreeInflateFixed(%struct.HuffmanTree* %tree_ll, %struct.HuffmanTree* %tree_d) #0 {
  %1 = alloca %struct.HuffmanTree*, align 8
  %2 = alloca %struct.HuffmanTree*, align 8
  store %struct.HuffmanTree* %tree_ll, %struct.HuffmanTree** %1, align 8
  store %struct.HuffmanTree* %tree_d, %struct.HuffmanTree** %2, align 8
  %3 = load %struct.HuffmanTree** %1, align 8
  %4 = call i32 @generateFixedLitLenTree(%struct.HuffmanTree* %3)
  %5 = load %struct.HuffmanTree** %2, align 8
  %6 = call i32 @generateFixedDistanceTree(%struct.HuffmanTree* %5)
  ret void
}

; Function Attrs: nounwind uwtable
define internal i32 @getTreeInflateDynamic(%struct.HuffmanTree* %tree_ll, %struct.HuffmanTree* %tree_d, i8* %in, i64* %bp, i64 %inlength) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.HuffmanTree*, align 8
  %3 = alloca %struct.HuffmanTree*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i64*, align 8
  %6 = alloca i64, align 8
  %error = alloca i32, align 4
  %n = alloca i32, align 4
  %HLIT = alloca i32, align 4
  %HDIST = alloca i32, align 4
  %HCLEN = alloca i32, align 4
  %i = alloca i32, align 4
  %inbitlength = alloca i64, align 8
  %bitlen_ll = alloca i32*, align 8
  %bitlen_d = alloca i32*, align 8
  %bitlen_cl = alloca i32*, align 8
  %tree_cl = alloca %struct.HuffmanTree, align 8
  %code = alloca i32, align 4
  %replength = alloca i32, align 4
  %value = alloca i32, align 4
  %replength1 = alloca i32, align 4
  %replength2 = alloca i32, align 4
  store %struct.HuffmanTree* %tree_ll, %struct.HuffmanTree** %2, align 8
  store %struct.HuffmanTree* %tree_d, %struct.HuffmanTree** %3, align 8
  store i8* %in, i8** %4, align 8
  store i64* %bp, i64** %5, align 8
  store i64 %inlength, i64* %6, align 8
  store i32 0, i32* %error, align 4
  %7 = load i64* %6, align 8
  %8 = mul i64 %7, 8
  store i64 %8, i64* %inbitlength, align 8
  store i32* null, i32** %bitlen_ll, align 8
  store i32* null, i32** %bitlen_d, align 8
  store i32* null, i32** %bitlen_cl, align 8
  %9 = load i64** %5, align 8
  %10 = load i64* %9, align 8
  %11 = lshr i64 %10, 3
  %12 = load i64* %6, align 8
  %13 = sub i64 %12, 2
  %14 = icmp uge i64 %11, %13
  br i1 %14, label %15, label %16

; <label>:15                                      ; preds = %0
  store i32 49, i32* %1
  br label %364

; <label>:16                                      ; preds = %0
  %17 = load i64** %5, align 8
  %18 = load i8** %4, align 8
  %19 = call i32 @readBitsFromStream(i64* %17, i8* %18, i64 5)
  %20 = add i32 %19, 257
  store i32 %20, i32* %HLIT, align 4
  %21 = load i64** %5, align 8
  %22 = load i8** %4, align 8
  %23 = call i32 @readBitsFromStream(i64* %21, i8* %22, i64 5)
  %24 = add i32 %23, 1
  store i32 %24, i32* %HDIST, align 4
  %25 = load i64** %5, align 8
  %26 = load i8** %4, align 8
  %27 = call i32 @readBitsFromStream(i64* %25, i8* %26, i64 4)
  %28 = add i32 %27, 4
  store i32 %28, i32* %HCLEN, align 4
  call void @HuffmanTree_init(%struct.HuffmanTree* %tree_cl)
  br label %29

; <label>:29                                      ; preds = %16
  %30 = load i32* %error, align 4
  %31 = icmp ne i32 %30, 0
  %32 = xor i1 %31, true
  br i1 %32, label %33, label %356

; <label>:33                                      ; preds = %29
  %34 = call i8* @lodepng_malloc(i64 76)
  %35 = bitcast i8* %34 to i32*
  store i32* %35, i32** %bitlen_cl, align 8
  %36 = load i32** %bitlen_cl, align 8
  %37 = icmp ne i32* %36, null
  br i1 %37, label %39, label %38

; <label>:38                                      ; preds = %33
  store i32 83, i32* %error, align 4
  br label %356

; <label>:39                                      ; preds = %33
  store i32 0, i32* %i, align 4
  br label %40

; <label>:40                                      ; preds = %67, %39
  %41 = load i32* %i, align 4
  %42 = icmp ult i32 %41, 19
  br i1 %42, label %43, label %70

; <label>:43                                      ; preds = %40
  %44 = load i32* %i, align 4
  %45 = load i32* %HCLEN, align 4
  %46 = icmp ult i32 %44, %45
  br i1 %46, label %47, label %58

; <label>:47                                      ; preds = %43
  %48 = load i64** %5, align 8
  %49 = load i8** %4, align 8
  %50 = call i32 @readBitsFromStream(i64* %48, i8* %49, i64 3)
  %51 = load i32* %i, align 4
  %52 = zext i32 %51 to i64
  %53 = getelementptr inbounds [19 x i32]* @CLCL_ORDER, i32 0, i64 %52
  %54 = load i32* %53, align 4
  %55 = zext i32 %54 to i64
  %56 = load i32** %bitlen_cl, align 8
  %57 = getelementptr inbounds i32* %56, i64 %55
  store i32 %50, i32* %57, align 4
  br label %66

; <label>:58                                      ; preds = %43
  %59 = load i32* %i, align 4
  %60 = zext i32 %59 to i64
  %61 = getelementptr inbounds [19 x i32]* @CLCL_ORDER, i32 0, i64 %60
  %62 = load i32* %61, align 4
  %63 = zext i32 %62 to i64
  %64 = load i32** %bitlen_cl, align 8
  %65 = getelementptr inbounds i32* %64, i64 %63
  store i32 0, i32* %65, align 4
  br label %66

; <label>:66                                      ; preds = %58, %47
  br label %67

; <label>:67                                      ; preds = %66
  %68 = load i32* %i, align 4
  %69 = add i32 %68, 1
  store i32 %69, i32* %i, align 4
  br label %40

; <label>:70                                      ; preds = %40
  %71 = load i32** %bitlen_cl, align 8
  %72 = call i32 @HuffmanTree_makeFromLengths(%struct.HuffmanTree* %tree_cl, i32* %71, i64 19, i32 7)
  store i32 %72, i32* %error, align 4
  %73 = load i32* %error, align 4
  %74 = icmp ne i32 %73, 0
  br i1 %74, label %75, label %76

; <label>:75                                      ; preds = %70
  br label %356

; <label>:76                                      ; preds = %70
  %77 = call i8* @lodepng_malloc(i64 1152)
  %78 = bitcast i8* %77 to i32*
  store i32* %78, i32** %bitlen_ll, align 8
  %79 = call i8* @lodepng_malloc(i64 128)
  %80 = bitcast i8* %79 to i32*
  store i32* %80, i32** %bitlen_d, align 8
  %81 = load i32** %bitlen_ll, align 8
  %82 = icmp ne i32* %81, null
  br i1 %82, label %83, label %86

; <label>:83                                      ; preds = %76
  %84 = load i32** %bitlen_d, align 8
  %85 = icmp ne i32* %84, null
  br i1 %85, label %87, label %86

; <label>:86                                      ; preds = %83, %76
  store i32 83, i32* %error, align 4
  br label %356

; <label>:87                                      ; preds = %83
  store i32 0, i32* %i, align 4
  br label %88

; <label>:88                                      ; preds = %96, %87
  %89 = load i32* %i, align 4
  %90 = icmp ult i32 %89, 288
  br i1 %90, label %91, label %99

; <label>:91                                      ; preds = %88
  %92 = load i32* %i, align 4
  %93 = zext i32 %92 to i64
  %94 = load i32** %bitlen_ll, align 8
  %95 = getelementptr inbounds i32* %94, i64 %93
  store i32 0, i32* %95, align 4
  br label %96

; <label>:96                                      ; preds = %91
  %97 = load i32* %i, align 4
  %98 = add i32 %97, 1
  store i32 %98, i32* %i, align 4
  br label %88

; <label>:99                                      ; preds = %88
  store i32 0, i32* %i, align 4
  br label %100

; <label>:100                                     ; preds = %108, %99
  %101 = load i32* %i, align 4
  %102 = icmp ult i32 %101, 32
  br i1 %102, label %103, label %111

; <label>:103                                     ; preds = %100
  %104 = load i32* %i, align 4
  %105 = zext i32 %104 to i64
  %106 = load i32** %bitlen_d, align 8
  %107 = getelementptr inbounds i32* %106, i64 %105
  store i32 0, i32* %107, align 4
  br label %108

; <label>:108                                     ; preds = %103
  %109 = load i32* %i, align 4
  %110 = add i32 %109, 1
  store i32 %110, i32* %i, align 4
  br label %100

; <label>:111                                     ; preds = %100
  store i32 0, i32* %i, align 4
  br label %112

; <label>:112                                     ; preds = %334, %111
  %113 = load i32* %i, align 4
  %114 = load i32* %HLIT, align 4
  %115 = load i32* %HDIST, align 4
  %116 = add i32 %114, %115
  %117 = icmp ult i32 %113, %116
  br i1 %117, label %118, label %335

; <label>:118                                     ; preds = %112
  %119 = load i8** %4, align 8
  %120 = load i64** %5, align 8
  %121 = load i64* %inbitlength, align 8
  %122 = call i32 @huffmanDecodeSymbol(i8* %119, i64* %120, %struct.HuffmanTree* %tree_cl, i64 %121)
  store i32 %122, i32* %code, align 4
  %123 = load i32* %code, align 4
  %124 = icmp ule i32 %123, 15
  br i1 %124, label %125, label %146

; <label>:125                                     ; preds = %118
  %126 = load i32* %i, align 4
  %127 = load i32* %HLIT, align 4
  %128 = icmp ult i32 %126, %127
  br i1 %128, label %129, label %135

; <label>:129                                     ; preds = %125
  %130 = load i32* %code, align 4
  %131 = load i32* %i, align 4
  %132 = zext i32 %131 to i64
  %133 = load i32** %bitlen_ll, align 8
  %134 = getelementptr inbounds i32* %133, i64 %132
  store i32 %130, i32* %134, align 4
  br label %143

; <label>:135                                     ; preds = %125
  %136 = load i32* %code, align 4
  %137 = load i32* %i, align 4
  %138 = load i32* %HLIT, align 4
  %139 = sub i32 %137, %138
  %140 = zext i32 %139 to i64
  %141 = load i32** %bitlen_d, align 8
  %142 = getelementptr inbounds i32* %141, i64 %140
  store i32 %136, i32* %142, align 4
  br label %143

; <label>:143                                     ; preds = %135, %129
  %144 = load i32* %i, align 4
  %145 = add i32 %144, 1
  store i32 %145, i32* %i, align 4
  br label %334

; <label>:146                                     ; preds = %118
  %147 = load i32* %code, align 4
  %148 = icmp eq i32 %147, 16
  br i1 %148, label %149, label %222

; <label>:149                                     ; preds = %146
  store i32 3, i32* %replength, align 4
  %150 = load i64** %5, align 8
  %151 = load i64* %150, align 8
  %152 = load i64* %inbitlength, align 8
  %153 = icmp uge i64 %151, %152
  br i1 %153, label %154, label %155

; <label>:154                                     ; preds = %149
  store i32 50, i32* %error, align 4
  br label %335

; <label>:155                                     ; preds = %149
  %156 = load i32* %i, align 4
  %157 = icmp eq i32 %156, 0
  br i1 %157, label %158, label %159

; <label>:158                                     ; preds = %155
  store i32 54, i32* %error, align 4
  br label %335

; <label>:159                                     ; preds = %155
  %160 = load i64** %5, align 8
  %161 = load i8** %4, align 8
  %162 = call i32 @readBitsFromStream(i64* %160, i8* %161, i64 2)
  %163 = load i32* %replength, align 4
  %164 = add i32 %163, %162
  store i32 %164, i32* %replength, align 4
  %165 = load i32* %i, align 4
  %166 = load i32* %HLIT, align 4
  %167 = add i32 %166, 1
  %168 = icmp ult i32 %165, %167
  br i1 %168, label %169, label %176

; <label>:169                                     ; preds = %159
  %170 = load i32* %i, align 4
  %171 = sub i32 %170, 1
  %172 = zext i32 %171 to i64
  %173 = load i32** %bitlen_ll, align 8
  %174 = getelementptr inbounds i32* %173, i64 %172
  %175 = load i32* %174, align 4
  store i32 %175, i32* %value, align 4
  br label %185

; <label>:176                                     ; preds = %159
  %177 = load i32* %i, align 4
  %178 = load i32* %HLIT, align 4
  %179 = sub i32 %177, %178
  %180 = sub i32 %179, 1
  %181 = zext i32 %180 to i64
  %182 = load i32** %bitlen_d, align 8
  %183 = getelementptr inbounds i32* %182, i64 %181
  %184 = load i32* %183, align 4
  store i32 %184, i32* %value, align 4
  br label %185

; <label>:185                                     ; preds = %176, %169
  store i32 0, i32* %n, align 4
  br label %186

; <label>:186                                     ; preds = %218, %185
  %187 = load i32* %n, align 4
  %188 = load i32* %replength, align 4
  %189 = icmp ult i32 %187, %188
  br i1 %189, label %190, label %221

; <label>:190                                     ; preds = %186
  %191 = load i32* %i, align 4
  %192 = load i32* %HLIT, align 4
  %193 = load i32* %HDIST, align 4
  %194 = add i32 %192, %193
  %195 = icmp uge i32 %191, %194
  br i1 %195, label %196, label %197

; <label>:196                                     ; preds = %190
  store i32 13, i32* %error, align 4
  br label %221

; <label>:197                                     ; preds = %190
  %198 = load i32* %i, align 4
  %199 = load i32* %HLIT, align 4
  %200 = icmp ult i32 %198, %199
  br i1 %200, label %201, label %207

; <label>:201                                     ; preds = %197
  %202 = load i32* %value, align 4
  %203 = load i32* %i, align 4
  %204 = zext i32 %203 to i64
  %205 = load i32** %bitlen_ll, align 8
  %206 = getelementptr inbounds i32* %205, i64 %204
  store i32 %202, i32* %206, align 4
  br label %215

; <label>:207                                     ; preds = %197
  %208 = load i32* %value, align 4
  %209 = load i32* %i, align 4
  %210 = load i32* %HLIT, align 4
  %211 = sub i32 %209, %210
  %212 = zext i32 %211 to i64
  %213 = load i32** %bitlen_d, align 8
  %214 = getelementptr inbounds i32* %213, i64 %212
  store i32 %208, i32* %214, align 4
  br label %215

; <label>:215                                     ; preds = %207, %201
  %216 = load i32* %i, align 4
  %217 = add i32 %216, 1
  store i32 %217, i32* %i, align 4
  br label %218

; <label>:218                                     ; preds = %215
  %219 = load i32* %n, align 4
  %220 = add i32 %219, 1
  store i32 %220, i32* %n, align 4
  br label %186

; <label>:221                                     ; preds = %196, %186
  br label %333

; <label>:222                                     ; preds = %146
  %223 = load i32* %code, align 4
  %224 = icmp eq i32 %223, 17
  br i1 %224, label %225, label %271

; <label>:225                                     ; preds = %222
  store i32 3, i32* %replength1, align 4
  %226 = load i64** %5, align 8
  %227 = load i64* %226, align 8
  %228 = load i64* %inbitlength, align 8
  %229 = icmp uge i64 %227, %228
  br i1 %229, label %230, label %231

; <label>:230                                     ; preds = %225
  store i32 50, i32* %error, align 4
  br label %335

; <label>:231                                     ; preds = %225
  %232 = load i64** %5, align 8
  %233 = load i8** %4, align 8
  %234 = call i32 @readBitsFromStream(i64* %232, i8* %233, i64 3)
  %235 = load i32* %replength1, align 4
  %236 = add i32 %235, %234
  store i32 %236, i32* %replength1, align 4
  store i32 0, i32* %n, align 4
  br label %237

; <label>:237                                     ; preds = %267, %231
  %238 = load i32* %n, align 4
  %239 = load i32* %replength1, align 4
  %240 = icmp ult i32 %238, %239
  br i1 %240, label %241, label %270

; <label>:241                                     ; preds = %237
  %242 = load i32* %i, align 4
  %243 = load i32* %HLIT, align 4
  %244 = load i32* %HDIST, align 4
  %245 = add i32 %243, %244
  %246 = icmp uge i32 %242, %245
  br i1 %246, label %247, label %248

; <label>:247                                     ; preds = %241
  store i32 14, i32* %error, align 4
  br label %270

; <label>:248                                     ; preds = %241
  %249 = load i32* %i, align 4
  %250 = load i32* %HLIT, align 4
  %251 = icmp ult i32 %249, %250
  br i1 %251, label %252, label %257

; <label>:252                                     ; preds = %248
  %253 = load i32* %i, align 4
  %254 = zext i32 %253 to i64
  %255 = load i32** %bitlen_ll, align 8
  %256 = getelementptr inbounds i32* %255, i64 %254
  store i32 0, i32* %256, align 4
  br label %264

; <label>:257                                     ; preds = %248
  %258 = load i32* %i, align 4
  %259 = load i32* %HLIT, align 4
  %260 = sub i32 %258, %259
  %261 = zext i32 %260 to i64
  %262 = load i32** %bitlen_d, align 8
  %263 = getelementptr inbounds i32* %262, i64 %261
  store i32 0, i32* %263, align 4
  br label %264

; <label>:264                                     ; preds = %257, %252
  %265 = load i32* %i, align 4
  %266 = add i32 %265, 1
  store i32 %266, i32* %i, align 4
  br label %267

; <label>:267                                     ; preds = %264
  %268 = load i32* %n, align 4
  %269 = add i32 %268, 1
  store i32 %269, i32* %n, align 4
  br label %237

; <label>:270                                     ; preds = %247, %237
  br label %332

; <label>:271                                     ; preds = %222
  %272 = load i32* %code, align 4
  %273 = icmp eq i32 %272, 18
  br i1 %273, label %274, label %320

; <label>:274                                     ; preds = %271
  store i32 11, i32* %replength2, align 4
  %275 = load i64** %5, align 8
  %276 = load i64* %275, align 8
  %277 = load i64* %inbitlength, align 8
  %278 = icmp uge i64 %276, %277
  br i1 %278, label %279, label %280

; <label>:279                                     ; preds = %274
  store i32 50, i32* %error, align 4
  br label %335

; <label>:280                                     ; preds = %274
  %281 = load i64** %5, align 8
  %282 = load i8** %4, align 8
  %283 = call i32 @readBitsFromStream(i64* %281, i8* %282, i64 7)
  %284 = load i32* %replength2, align 4
  %285 = add i32 %284, %283
  store i32 %285, i32* %replength2, align 4
  store i32 0, i32* %n, align 4
  br label %286

; <label>:286                                     ; preds = %316, %280
  %287 = load i32* %n, align 4
  %288 = load i32* %replength2, align 4
  %289 = icmp ult i32 %287, %288
  br i1 %289, label %290, label %319

; <label>:290                                     ; preds = %286
  %291 = load i32* %i, align 4
  %292 = load i32* %HLIT, align 4
  %293 = load i32* %HDIST, align 4
  %294 = add i32 %292, %293
  %295 = icmp uge i32 %291, %294
  br i1 %295, label %296, label %297

; <label>:296                                     ; preds = %290
  store i32 15, i32* %error, align 4
  br label %319

; <label>:297                                     ; preds = %290
  %298 = load i32* %i, align 4
  %299 = load i32* %HLIT, align 4
  %300 = icmp ult i32 %298, %299
  br i1 %300, label %301, label %306

; <label>:301                                     ; preds = %297
  %302 = load i32* %i, align 4
  %303 = zext i32 %302 to i64
  %304 = load i32** %bitlen_ll, align 8
  %305 = getelementptr inbounds i32* %304, i64 %303
  store i32 0, i32* %305, align 4
  br label %313

; <label>:306                                     ; preds = %297
  %307 = load i32* %i, align 4
  %308 = load i32* %HLIT, align 4
  %309 = sub i32 %307, %308
  %310 = zext i32 %309 to i64
  %311 = load i32** %bitlen_d, align 8
  %312 = getelementptr inbounds i32* %311, i64 %310
  store i32 0, i32* %312, align 4
  br label %313

; <label>:313                                     ; preds = %306, %301
  %314 = load i32* %i, align 4
  %315 = add i32 %314, 1
  store i32 %315, i32* %i, align 4
  br label %316

; <label>:316                                     ; preds = %313
  %317 = load i32* %n, align 4
  %318 = add i32 %317, 1
  store i32 %318, i32* %n, align 4
  br label %286

; <label>:319                                     ; preds = %296, %286
  br label %331

; <label>:320                                     ; preds = %271
  %321 = load i32* %code, align 4
  %322 = icmp eq i32 %321, -1
  br i1 %322, label %323, label %329

; <label>:323                                     ; preds = %320
  %324 = load i64** %5, align 8
  %325 = load i64* %324, align 8
  %326 = load i64* %inbitlength, align 8
  %327 = icmp ugt i64 %325, %326
  %328 = select i1 %327, i32 10, i32 11
  store i32 %328, i32* %error, align 4
  br label %330

; <label>:329                                     ; preds = %320
  store i32 16, i32* %error, align 4
  br label %330

; <label>:330                                     ; preds = %329, %323
  br label %335

; <label>:331                                     ; preds = %319
  br label %332

; <label>:332                                     ; preds = %331, %270
  br label %333

; <label>:333                                     ; preds = %332, %221
  br label %334

; <label>:334                                     ; preds = %333, %143
  br label %112

; <label>:335                                     ; preds = %330, %279, %230, %158, %154, %112
  %336 = load i32* %error, align 4
  %337 = icmp ne i32 %336, 0
  br i1 %337, label %338, label %339

; <label>:338                                     ; preds = %335
  br label %356

; <label>:339                                     ; preds = %335
  %340 = load i32** %bitlen_ll, align 8
  %341 = getelementptr inbounds i32* %340, i64 256
  %342 = load i32* %341, align 4
  %343 = icmp eq i32 %342, 0
  br i1 %343, label %344, label %345

; <label>:344                                     ; preds = %339
  store i32 64, i32* %error, align 4
  br label %356

; <label>:345                                     ; preds = %339
  %346 = load %struct.HuffmanTree** %2, align 8
  %347 = load i32** %bitlen_ll, align 8
  %348 = call i32 @HuffmanTree_makeFromLengths(%struct.HuffmanTree* %346, i32* %347, i64 288, i32 15)
  store i32 %348, i32* %error, align 4
  %349 = load i32* %error, align 4
  %350 = icmp ne i32 %349, 0
  br i1 %350, label %351, label %352

; <label>:351                                     ; preds = %345
  br label %356

; <label>:352                                     ; preds = %345
  %353 = load %struct.HuffmanTree** %3, align 8
  %354 = load i32** %bitlen_d, align 8
  %355 = call i32 @HuffmanTree_makeFromLengths(%struct.HuffmanTree* %353, i32* %354, i64 32, i32 15)
  store i32 %355, i32* %error, align 4
  br label %356

; <label>:356                                     ; preds = %352, %351, %344, %338, %86, %75, %38, %29
  %357 = load i32** %bitlen_cl, align 8
  %358 = bitcast i32* %357 to i8*
  call void @lodepng_free(i8* %358)
  %359 = load i32** %bitlen_ll, align 8
  %360 = bitcast i32* %359 to i8*
  call void @lodepng_free(i8* %360)
  %361 = load i32** %bitlen_d, align 8
  %362 = bitcast i32* %361 to i8*
  call void @lodepng_free(i8* %362)
  call void @HuffmanTree_cleanup(%struct.HuffmanTree* %tree_cl)
  %363 = load i32* %error, align 4
  store i32 %363, i32* %1
  br label %364

; <label>:364                                     ; preds = %356, %15
  %365 = load i32* %1
  ret i32 %365
}

; Function Attrs: nounwind uwtable
define internal i32 @huffmanDecodeSymbol(i8* %in, i64* %bp, %struct.HuffmanTree* %codetree, i64 %inbitlength) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8*, align 8
  %3 = alloca i64*, align 8
  %4 = alloca %struct.HuffmanTree*, align 8
  %5 = alloca i64, align 8
  %treepos = alloca i32, align 4
  %ct = alloca i32, align 4
  store i8* %in, i8** %2, align 8
  store i64* %bp, i64** %3, align 8
  store %struct.HuffmanTree* %codetree, %struct.HuffmanTree** %4, align 8
  store i64 %inbitlength, i64* %5, align 8
  store i32 0, i32* %treepos, align 4
  br label %6

; <label>:6                                       ; preds = %58, %0
  %7 = load i64** %3, align 8
  %8 = load i64* %7, align 8
  %9 = load i64* %5, align 8
  %10 = icmp uge i64 %8, %9
  br i1 %10, label %11, label %12

; <label>:11                                      ; preds = %6
  store i32 -1, i32* %1
  br label %59

; <label>:12                                      ; preds = %6
  %13 = load i32* %treepos, align 4
  %14 = shl i32 %13, 1
  %15 = load i64** %3, align 8
  %16 = load i64* %15, align 8
  %17 = lshr i64 %16, 3
  %18 = load i8** %2, align 8
  %19 = getelementptr inbounds i8* %18, i64 %17
  %20 = load i8* %19, align 1
  %21 = zext i8 %20 to i32
  %22 = load i64** %3, align 8
  %23 = load i64* %22, align 8
  %24 = and i64 %23, 7
  %25 = trunc i64 %24 to i32
  %26 = ashr i32 %21, %25
  %27 = and i32 %26, 1
  %28 = add i32 %14, %27
  %29 = zext i32 %28 to i64
  %30 = load %struct.HuffmanTree** %4, align 8
  %31 = getelementptr inbounds %struct.HuffmanTree* %30, i32 0, i32 0
  %32 = load i32** %31, align 8
  %33 = getelementptr inbounds i32* %32, i64 %29
  %34 = load i32* %33, align 4
  store i32 %34, i32* %ct, align 4
  %35 = load i64** %3, align 8
  %36 = load i64* %35, align 8
  %37 = add i64 %36, 1
  store i64 %37, i64* %35, align 8
  %38 = load i32* %ct, align 4
  %39 = load %struct.HuffmanTree** %4, align 8
  %40 = getelementptr inbounds %struct.HuffmanTree* %39, i32 0, i32 4
  %41 = load i32* %40, align 4
  %42 = icmp ult i32 %38, %41
  br i1 %42, label %43, label %45

; <label>:43                                      ; preds = %12
  %44 = load i32* %ct, align 4
  store i32 %44, i32* %1
  br label %59

; <label>:45                                      ; preds = %12
  %46 = load i32* %ct, align 4
  %47 = load %struct.HuffmanTree** %4, align 8
  %48 = getelementptr inbounds %struct.HuffmanTree* %47, i32 0, i32 4
  %49 = load i32* %48, align 4
  %50 = sub i32 %46, %49
  store i32 %50, i32* %treepos, align 4
  br label %51

; <label>:51                                      ; preds = %45
  %52 = load i32* %treepos, align 4
  %53 = load %struct.HuffmanTree** %4, align 8
  %54 = getelementptr inbounds %struct.HuffmanTree* %53, i32 0, i32 4
  %55 = load i32* %54, align 4
  %56 = icmp uge i32 %52, %55
  br i1 %56, label %57, label %58

; <label>:57                                      ; preds = %51
  store i32 -1, i32* %1
  br label %59

; <label>:58                                      ; preds = %51
  br label %6

; <label>:59                                      ; preds = %57, %43, %11
  %60 = load i32* %1
  ret i32 %60
}

; Function Attrs: nounwind uwtable
define internal i32 @readBitsFromStream(i64* %bitpointer, i8* %bitstream, i64 %nbits) #0 {
  %1 = alloca i64*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i64, align 8
  %result = alloca i32, align 4
  %i = alloca i32, align 4
  store i64* %bitpointer, i64** %1, align 8
  store i8* %bitstream, i8** %2, align 8
  store i64 %nbits, i64* %3, align 8
  store i32 0, i32* %result, align 4
  store i32 0, i32* %i, align 4
  br label %4

; <label>:4                                       ; preds = %30, %0
  %5 = load i32* %i, align 4
  %6 = zext i32 %5 to i64
  %7 = load i64* %3, align 8
  %8 = icmp ult i64 %6, %7
  br i1 %8, label %9, label %33

; <label>:9                                       ; preds = %4
  %10 = load i64** %1, align 8
  %11 = load i64* %10, align 8
  %12 = lshr i64 %11, 3
  %13 = load i8** %2, align 8
  %14 = getelementptr inbounds i8* %13, i64 %12
  %15 = load i8* %14, align 1
  %16 = zext i8 %15 to i32
  %17 = load i64** %1, align 8
  %18 = load i64* %17, align 8
  %19 = and i64 %18, 7
  %20 = trunc i64 %19 to i32
  %21 = ashr i32 %16, %20
  %22 = and i32 %21, 1
  %23 = load i32* %i, align 4
  %24 = shl i32 %22, %23
  %25 = load i32* %result, align 4
  %26 = add i32 %25, %24
  store i32 %26, i32* %result, align 4
  %27 = load i64** %1, align 8
  %28 = load i64* %27, align 8
  %29 = add i64 %28, 1
  store i64 %29, i64* %27, align 8
  br label %30

; <label>:30                                      ; preds = %9
  %31 = load i32* %i, align 4
  %32 = add i32 %31, 1
  store i32 %32, i32* %i, align 4
  br label %4

; <label>:33                                      ; preds = %4
  %34 = load i32* %result, align 4
  ret i32 %34
}

; Function Attrs: nounwind uwtable
define internal i32 @uivector_copy(%struct.uivector* %p, %struct.uivector* %q) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.uivector*, align 8
  %3 = alloca %struct.uivector*, align 8
  %i = alloca i64, align 8
  store %struct.uivector* %p, %struct.uivector** %2, align 8
  store %struct.uivector* %q, %struct.uivector** %3, align 8
  %4 = load %struct.uivector** %2, align 8
  %5 = load %struct.uivector** %3, align 8
  %6 = getelementptr inbounds %struct.uivector* %5, i32 0, i32 1
  %7 = load i64* %6, align 8
  %8 = call i32 @uivector_resize(%struct.uivector* %4, i64 %7)
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %11, label %10

; <label>:10                                      ; preds = %0
  store i32 0, i32* %1
  br label %34

; <label>:11                                      ; preds = %0
  store i64 0, i64* %i, align 8
  br label %12

; <label>:12                                      ; preds = %30, %11
  %13 = load i64* %i, align 8
  %14 = load %struct.uivector** %3, align 8
  %15 = getelementptr inbounds %struct.uivector* %14, i32 0, i32 1
  %16 = load i64* %15, align 8
  %17 = icmp ult i64 %13, %16
  br i1 %17, label %18, label %33

; <label>:18                                      ; preds = %12
  %19 = load i64* %i, align 8
  %20 = load %struct.uivector** %3, align 8
  %21 = getelementptr inbounds %struct.uivector* %20, i32 0, i32 0
  %22 = load i32** %21, align 8
  %23 = getelementptr inbounds i32* %22, i64 %19
  %24 = load i32* %23, align 4
  %25 = load i64* %i, align 8
  %26 = load %struct.uivector** %2, align 8
  %27 = getelementptr inbounds %struct.uivector* %26, i32 0, i32 0
  %28 = load i32** %27, align 8
  %29 = getelementptr inbounds i32* %28, i64 %25
  store i32 %24, i32* %29, align 4
  br label %30

; <label>:30                                      ; preds = %18
  %31 = load i64* %i, align 8
  %32 = add i64 %31, 1
  store i64 %32, i64* %i, align 8
  br label %12

; <label>:33                                      ; preds = %12
  store i32 1, i32* %1
  br label %34

; <label>:34                                      ; preds = %33, %10
  %35 = load i32* %1
  ret i32 %35
}

; Function Attrs: nounwind uwtable
define internal void @coin_cleanup(i8* %c) #0 {
  %1 = alloca i8*, align 8
  store i8* %c, i8** %1, align 8
  %2 = load i8** %1, align 8
  %3 = bitcast i8* %2 to %struct.Coin*
  %4 = getelementptr inbounds %struct.Coin* %3, i32 0, i32 0
  %5 = bitcast %struct.uivector* %4 to i8*
  call void @uivector_cleanup(i8* %5)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @coin_init(%struct.Coin* %c) #0 {
  %1 = alloca %struct.Coin*, align 8
  store %struct.Coin* %c, %struct.Coin** %1, align 8
  %2 = load %struct.Coin** %1, align 8
  %3 = getelementptr inbounds %struct.Coin* %2, i32 0, i32 0
  call void @uivector_init(%struct.uivector* %3)
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #5

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #5

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readonly }
attributes #7 = { nounwind readnone }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4 (tags/RELEASE_34/final)"}
