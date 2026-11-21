/// D types for graphene1 library
module gid.graphene1.types;

import gid.core.gid;
import gid.graphene1.c.functions;
import gid.graphene1.c.types;


// Enums

/** */
alias EulerOrder = graphene_euler_order_t;

/** */
alias RayIntersectionKind = graphene_ray_intersection_kind_t;

// Structs

/** */
alias Simd4F = graphene_simd4f_t;

/** */
enum PI = 3.141593;

/** */
enum PI_2 = 1.570796;

/**
    Evaluates to the number of components of a #graphene_vec2_t.
    
    This symbol is useful when declaring a C array of floating
    point values to be used with [gid.graphene1.vec2.Vec2.initFromFloat] and
    [gid.graphene1.vec2.Vec2.toFloat], e.g.
    
    ```
      float v[GRAPHENE_VEC2_LEN];
    
      // vec is defined elsewhere
      graphene_vec2_to_float (&vec, v);
    
      for (int i = 0; i < GRAPHENE_VEC2_LEN; i++)
        fprintf (stdout, "component %d: %g\n", i, v[i]);
    ```
*/
enum VEC2_LEN = 2;

/**
    Evaluates to the number of components of a #graphene_vec3_t.
    
    This symbol is useful when declaring a C array of floating
    point values to be used with [gid.graphene1.vec3.Vec3.initFromFloat] and
    [gid.graphene1.vec3.Vec3.toFloat], e.g.
    
    ```
      float v[GRAPHENE_VEC3_LEN];
    
      // vec is defined elsewhere
      graphene_vec3_to_float (&vec, v);
    
      for (int i = 0; i < GRAPHENE_VEC2_LEN; i++)
        fprintf (stdout, "component %d: %g\n", i, v[i]);
    ```
*/
enum VEC3_LEN = 3;

/**
    Evaluates to the number of components of a #graphene_vec4_t.
    
    This symbol is useful when declaring a C array of floating
    point values to be used with [gid.graphene1.vec4.Vec4.initFromFloat] and
    [gid.graphene1.vec4.Vec4.toFloat], e.g.
    
    ```
      float v[GRAPHENE_VEC4_LEN];
    
      // vec is defined elsewhere
      graphene_vec4_to_float (&vec, v);
    
      for (int i = 0; i < GRAPHENE_VEC4_LEN; i++)
        fprintf (stdout, "component %d: %g\n", i, v[i]);
    ```
*/
enum VEC4_LEN = 4;
