//!gir Graphene-1.0
//!info description "D binding for the Graphene library - library providing efficient types for 2D and 3D math"
//!info homepage https://ebassi.github.io/graphene/
//!info docs https://www.kymorphia.com/gid/gid~graphene1/
//!info capi https://ebassi.github.io/graphene/docs/

//# Not sure why the c:type is _Bool in graphene, just make it bool
//!subtype _Bool bool

//# graphene_simd4f_t is a 16 byte aligned SIMD type in C (__m128, float32x4_t or a GCC vector), the GIR describes the
//# scalar fallback. Align it so the D layout of the types containing it (Vec2/3/4, Matrix, Box, Sphere, Plane, Frustum,
//# Ray, Triangle, Euler, Gsk.PathPoint, etc) matches C and stack temporaries are aligned for SIMD loads/stores
//!set record[Simd4F][gid-align] 16
