/// C types for gsk4 library
module gsk.c.types;

public import gid.basictypes;
public import gdk.c.types;
public import graphene.c.types;

/**
    The blend modes available for render nodes.
    
    The implementation of each blend mode is deferred to the
    rendering pipeline.
    
    See <https://www.w3.org/TR/compositing-1/#blending> for more information
    on blending and blend modes.
*/
enum GskBlendMode
{
  /**
      The default blend mode, which specifies no blending
  */
  Default = 0,

  /**
      The source color is multiplied by the destination
        and replaces the destination
  */
  Multiply = 1,

  /**
      Multiplies the complements of the destination and source
        color values, then complements the result.
  */
  Screen = 2,

  /**
      Multiplies or screens the colors, depending on the
        destination color value. This is the inverse of hard-list
  */
  Overlay = 3,

  /**
      Selects the darker of the destination and source colors
  */
  Darken = 4,

  /**
      Selects the lighter of the destination and source colors
  */
  Lighten = 5,

  /**
      Brightens the destination color to reflect the source color
  */
  ColorDodge = 6,

  /**
      Darkens the destination color to reflect the source color
  */
  ColorBurn = 7,

  /**
      Multiplies or screens the colors, depending on the source color value
  */
  HardLight = 8,

  /**
      Darkens or lightens the colors, depending on the source color value
  */
  SoftLight = 9,

  /**
      Subtracts the darker of the two constituent colors from the lighter color
  */
  Difference = 10,

  /**
      Produces an effect similar to that of the difference mode but lower in contrast
  */
  Exclusion = 11,

  /**
      Creates a color with the hue and saturation of the source color and the luminosity of the destination color
  */
  Color = 12,

  /**
      Creates a color with the hue of the source color and the saturation and luminosity of the destination color
  */
  Hue = 13,

  /**
      Creates a color with the saturation of the source color and the hue and luminosity of the destination color
  */
  Saturation = 14,

  /**
      Creates a color with the luminosity of the source color and the hue and saturation of the destination color
  */
  Luminosity = 15,
}

/**
    The corner indices used by [gsk.rounded_rect.RoundedRect].
*/
enum GskCorner
{
  /**
      The top left corner
  */
  TopLeft = 0,

  /**
      The top right corner
  */
  TopRight = 1,

  /**
      The bottom right corner
  */
  BottomRight = 2,

  /**
      The bottom left corner
  */
  BottomLeft = 3,
}

/**
    [gsk.types.FillRule] is used to select how paths are filled.
    
    Whether or not a point is included in the fill is determined by taking
    a ray from that point to infinity and looking at intersections with the
    path. The ray can be in any direction, as long as it doesn't pass through
    the end point of a segment or have a tricky intersection such as
    intersecting tangent to the path.
    
    (Note that filling is not actually implemented in this way. This
    is just a description of the rule that is applied.)
    
    New entries may be added in future versions.
*/
enum GskFillRule
{
  /**
      If the path crosses the ray from
        left-to-right, counts +1. If the path crosses the ray
        from right to left, counts -1. (Left and right are determined
        from the perspective of looking along the ray from the starting
        point.) If the total count is non-zero, the point will be filled.
  */
  Winding = 0,

  /**
      Counts the total number of
        intersections, without regard to the orientation of the contour. If
        the total number of intersections is odd, the point will be
        filled.
  */
  EvenOdd = 1,
}

/**
    This defines the types of the uniforms that `GskGLShaders`
    declare.
    
    It defines both what the type is called in the GLSL shader
    code, and what the corresponding C type is on the Gtk side.
*/
enum GskGLUniformType
{
  /**
      No type, used for uninitialized or unspecified values.
  */
  None = 0,

  /**
      A float uniform
  */
  Float = 1,

  /**
      A GLSL int / gint32 uniform
  */
  Int = 2,

  /**
      A GLSL uint / guint32 uniform
  */
  Uint = 3,

  /**
      A GLSL bool / gboolean uniform
  */
  Bool = 4,

  /**
      A GLSL vec2 / graphene_vec2_t uniform
  */
  Vec2 = 5,

  /**
      A GLSL vec3 / graphene_vec3_t uniform
  */
  Vec3 = 6,

  /**
      A GLSL vec4 / graphene_vec4_t uniform
  */
  Vec4 = 7,
}

/**
    Specifies how to render the start and end points of contours or
    dashes when stroking.
    
    The default line cap style is [gsk.types.LineCap.Butt].
    
    New entries may be added in future versions.
    
    <figure>
      <picture>
        <source srcset="caps-dark.png" media="(prefers-color-scheme: dark)">
        <img alt="Line Cap Styles" src="caps-light.png">
      </picture>
      <figcaption>GSK_LINE_CAP_BUTT, GSK_LINE_CAP_ROUND, GSK_LINE_CAP_SQUARE</figcaption>
    </figure>
*/
enum GskLineCap
{
  /**
      Start and stop the line exactly at the start
        and end point
  */
  Butt = 0,

  /**
      Use a round ending, the center of the circle
        is the start or end point
  */
  Round = 1,

  /**
      use squared ending, the center of the square
        is the start or end point
  */
  Square = 2,
}

/**
    Specifies how to render the junction of two lines when stroking.
    
    The default line join style is [gsk.types.LineJoin.Miter].
    
    New entries may be added in future versions.
    
    <figure>
      <picture>
        <source srcset="join-dark.png" media="(prefers-color-scheme: dark)">
        <img alt="Line Join Styles" src="join-light.png">
      </picture>
      <figcaption>GSK_LINE_JOINT_MITER, GSK_LINE_JOINT_ROUND, GSK_LINE_JOIN_BEVEL</figcaption>
    </figure>
*/
enum GskLineJoin
{
  /**
      Use a sharp angled corner
  */
  Miter = 0,

  /**
      Use a round join, the center of the circle is
        the join point
  */
  Round = 1,

  /**
      use a cut-off join, the join is cut off at half
        the line width from the joint point
  */
  Bevel = 2,
}

/**
    The mask modes available for mask nodes.
*/
enum GskMaskMode
{
  /**
      Use the alpha channel of the mask
  */
  Alpha = 0,

  /**
      Use the inverted alpha channel of the mask
  */
  InvertedAlpha = 1,

  /**
      Use the luminance of the mask,
          multiplied by mask alpha
  */
  Luminance = 2,

  /**
      Use the inverted luminance of the mask,
          multiplied by mask alpha
  */
  InvertedLuminance = 3,
}

/**
    The values of the [gsk.types.PathDirection] enum are used to pick one
    of the four tangents at a given point on the path.
    
    Note that the directions for @GSK_PATH_FROM_START/@GSK_PATH_TO_END and
    @GSK_PATH_TO_START/@GSK_PATH_FROM_END will coincide for smooth points.
    Only sharp turns will exhibit four different directions.
    
    <picture>
      <source srcset="directions-dark.png" media="(prefers-color-scheme: dark)">
      <img alt="Path Tangents" src="directions-light.png">
    </picture>
*/
enum GskPathDirection
{
  /**
      The tangent in path direction of the incoming side
        of the path
  */
  FromStart = 0,

  /**
      The tangent against path direction of the incoming side
        of the path
  */
  ToStart = 1,

  /**
      The tangent in path direction of the outgoing side
        of the path
  */
  ToEnd = 2,

  /**
      The tangent against path direction of the outgoing
        side of the path
  */
  FromEnd = 3,
}

/**
    Flags that can be passed to [gsk.path.Path.foreach_] to influence what
    kinds of operations the path is decomposed into.
    
    By default, [gsk.path.Path.foreach_] will only emit a path with all
    operations flattened to straight lines to allow for maximum compatibility.
    The only operations emitted will be [gsk.types.PathOperation.Move], [gsk.types.PathOperation.Line] and
    [gsk.types.PathOperation.Close].
*/
enum GskPathForeachFlags : uint
{
  /**
      The default behavior, only allow lines.
  */
  OnlyLines = 0,

  /**
      Allow emission of [gsk.types.PathOperation.Quad] operations
  */
  Quad = 1,

  /**
      Allow emission of [gsk.types.PathOperation.Cubic] operations.
  */
  Cubic = 2,

  /**
      Allow emission of [gsk.types.PathOperation.Conic] operations.
  */
  Conic = 4,
}

/**
    Path operations are used to describe the segments of a [gsk.path.Path].
    
    More values may be added in the future.
*/
enum GskPathOperation
{
  /**
      A move-to operation, with 1 point describing the target point.
  */
  Move = 0,

  /**
      A close operation ending the current contour with a line back
        to the starting point. Two points describe the start and end of the line.
  */
  Close = 1,

  /**
      A line-to operation, with 2 points describing the start and
        end point of a straight line.
  */
  Line = 2,

  /**
      A curve-to operation describing a quadratic Bézier curve
        with 3 points describing the start point, the control point and the end
        point of the curve.
  */
  Quad = 3,

  /**
      A curve-to operation describing a cubic Bézier curve with 4
        points describing the start point, the two control points and the end point
        of the curve.
  */
  Cubic = 4,

  /**
      A rational quadratic Bézier curve with 3 points describing
        the start point, control point and end point of the curve. A weight for the
        curve will be passed, too.
  */
  Conic = 5,
}

/**
    The type of a node determines what the node is rendering.
*/
enum GskRenderNodeType
{
  /**
      Error type. No node will ever have this type.
  */
  NotARenderNode = 0,

  /**
      A node containing a stack of children
  */
  ContainerNode = 1,

  /**
      A node drawing a [cairo.surface.Surface]
  */
  CairoNode = 2,

  /**
      A node drawing a single color rectangle
  */
  ColorNode = 3,

  /**
      A node drawing a linear gradient
  */
  LinearGradientNode = 4,

  /**
      A node drawing a repeating linear gradient
  */
  RepeatingLinearGradientNode = 5,

  /**
      A node drawing a radial gradient
  */
  RadialGradientNode = 6,

  /**
      A node drawing a repeating radial gradient
  */
  RepeatingRadialGradientNode = 7,

  /**
      A node drawing a conic gradient
  */
  ConicGradientNode = 8,

  /**
      A node stroking a border around an area
  */
  BorderNode = 9,

  /**
      A node drawing a [gdk.texture.Texture]
  */
  TextureNode = 10,

  /**
      A node drawing an inset shadow
  */
  InsetShadowNode = 11,

  /**
      A node drawing an outset shadow
  */
  OutsetShadowNode = 12,

  /**
      A node that renders its child after applying a matrix transform
  */
  TransformNode = 13,

  /**
      A node that changes the opacity of its child
  */
  OpacityNode = 14,

  /**
      A node that applies a color matrix to every pixel
  */
  ColorMatrixNode = 15,

  /**
      A node that repeats the child's contents
  */
  RepeatNode = 16,

  /**
      A node that clips its child to a rectangular area
  */
  ClipNode = 17,

  /**
      A node that clips its child to a rounded rectangle
  */
  RoundedClipNode = 18,

  /**
      A node that draws a shadow below its child
  */
  ShadowNode = 19,

  /**
      A node that blends two children together
  */
  BlendNode = 20,

  /**
      A node that cross-fades between two children
  */
  CrossFadeNode = 21,

  /**
      A node containing a glyph string
  */
  TextNode = 22,

  /**
      A node that applies a blur
  */
  BlurNode = 23,

  /**
      Debug information that does not affect the rendering
  */
  DebugNode = 24,

  /**
      A node that uses OpenGL fragment shaders to render
  */
  GlShaderNode = 25,

  /**
      A node drawing a [gdk.texture.Texture] scaled and filtered.
  */
  TextureScaleNode = 26,

  /**
      A node that masks one child with another.
  */
  MaskNode = 27,

  /**
      A node that fills a path.
  */
  FillNode = 28,

  /**
      A node that strokes a path.
  */
  StrokeNode = 29,

  /**
      A node that possibly redirects part of the scene graph to a subsurface.
  */
  SubsurfaceNode = 30,
}

/**
    The filters used when scaling texture data.
    
    The actual implementation of each filter is deferred to the
    rendering pipeline.
*/
enum GskScalingFilter
{
  /**
      linear interpolation filter
  */
  Linear = 0,

  /**
      nearest neighbor interpolation filter
  */
  Nearest = 1,

  /**
      linear interpolation along each axis,
        plus mipmap generation, with linear interpolation along the mipmap
        levels
  */
  Trilinear = 2,
}

/**
    Errors that can happen during (de)serialization.
*/
enum GskSerializationError
{
  /**
      The format can not be identified
  */
  UnsupportedFormat = 0,

  /**
      The version of the data is not
        understood
  */
  UnsupportedVersion = 1,

  /**
      The given data may not exist in
        a proper serialization
  */
  InvalidData = 2,
}

/**
    The categories of matrices relevant for GSK and GTK.
    
    Note that any category includes matrices of all later categories.
    So if you want to for example check if a matrix is a 2D matrix,
    `category >= GSK_TRANSFORM_CATEGORY_2D` is the way to do this.
    
    Also keep in mind that rounding errors may cause matrices to not
    conform to their categories. Otherwise, matrix operations done via
    multiplication will not worsen categories. So for the matrix
    multiplication `C = A * B`, `category(C) = MIN (category(A), category(B))`.
*/
enum GskTransformCategory
{
  /**
      The category of the matrix has not been
        determined.
  */
  Unknown = 0,

  /**
      Analyzing the matrix concluded that it does
        not fit in any other category.
  */
  Any = 1,

  /**
      The matrix is a 3D matrix. This means that
        the w column (the last column) has the values (0, 0, 0, 1).
  */
  _3d = 2,

  /**
      The matrix is a 2D matrix. This is equivalent
        to [graphene.matrix.Matrix.is2d] returning true. In particular, this
        means that Cairo can deal with the matrix.
  */
  _2d = 3,

  /**
      The matrix is a combination of 2D scale
        and 2D translation operations. In particular, this means that any
        rectangle can be transformed exactly using this matrix.
  */
  _2dAffine = 4,

  /**
      The matrix is a 2D translation.
  */
  _2dTranslate = 5,

  /**
      The matrix is the identity matrix.
  */
  Identity = 6,
}

/**
    A render node applying a blending function between its two child nodes.
*/
struct GskBlendNode;

/**
    A render node applying a blur effect to its single child.
*/
struct GskBlurNode;

/**
    A render node for a border.
*/
struct GskBorderNode;

/** */
struct GskBroadwayRenderer;

/** */
struct GskBroadwayRendererClass;

/**
    A render node for a Cairo surface.
*/
struct GskCairoNode;

/**
    A GSK renderer that is using cairo.
    
    Since it is using cairo, this renderer cannot support
    3D transformations.
*/
struct GskCairoRenderer;

/** */
struct GskCairoRendererClass;

/**
    A render node applying a rectangular clip to its single child node.
*/
struct GskClipNode;

/**
    A render node controlling the color matrix of its single child node.
*/
struct GskColorMatrixNode;

/**
    A render node for a solid color.
*/
struct GskColorNode;

/**
    A color stop in a gradient node.
*/
struct GskColorStop
{
  /**
      the offset of the color stop
  */
  float offset;

  /**
      the color at the given offset
  */
  GdkRGBA color;
}

/**
    A render node for a conic gradient.
*/
struct GskConicGradientNode;

/**
    A render node that can contain other render nodes.
*/
struct GskContainerNode;

/**
    A render node cross fading between two child nodes.
*/
struct GskCrossFadeNode;

/**
    A render node that emits a debugging message when drawing its
    child node.
*/
struct GskDebugNode;

/**
    A render node filling the area given by [gsk.path.Path]
    and [gsk.types.FillRule] with the child node.
*/
struct GskFillNode;

/** */
struct GskGLRenderer;

/** */
struct GskGLRendererClass;

/**
    A [gsk.glshader.GLShader] is a snippet of GLSL that is meant to run in the
    fragment shader of the rendering pipeline.
    
    A fragment shader gets the coordinates being rendered as input and
    produces the pixel values for that particular pixel. Additionally,
    the shader can declare a set of other input arguments, called
    uniforms (as they are uniform over all the calls to your shader in
    each instance of use). A shader can also receive up to 4
    textures that it can use as input when producing the pixel data.
    
    [gsk.glshader.GLShader] is usually used with [gtk.snapshot.Snapshot.pushGlShader]
    to produce a [gsk.glshader_node.GLShaderNode] in the rendering hierarchy,
    and then its input textures are constructed by rendering the child
    nodes to textures before rendering the shader node itself. (You can
    pass texture nodes as children if you want to directly use a texture
    as input).
    
    The actual shader code is GLSL code that gets combined with
    some other code into the fragment shader. Since the exact
    capabilities of the GPU driver differs between different OpenGL
    drivers and hardware, GTK adds some defines that you can use
    to ensure your GLSL code runs on as many drivers as it can.
    
    If the OpenGL driver is GLES, then the shader language version
    is set to 100, and GSK_GLES will be defined in the shader.
    
    Otherwise, if the OpenGL driver does not support the 3.2 core profile,
    then the shader will run with language version 110 for GL2 and 130 for GL3,
    and GSK_LEGACY will be defined in the shader.
    
    If the OpenGL driver supports the 3.2 code profile, it will be used,
    the shader language version is set to 150, and GSK_GL3 will be defined
    in the shader.
    
    The main function the shader must implement is:
    
    ```glsl
     void mainImage(out vec4 fragColor,
                    in vec2 fragCoord,
                    in vec2 resolution,
                    in vec2 uv)
    ```
    
    Where the input @fragCoord is the coordinate of the pixel we're
    currently rendering, relative to the boundary rectangle that was
    specified in the [gsk.glshader_node.GLShaderNode], and @resolution is the width and
    height of that rectangle. This is in the typical GTK coordinate
    system with the origin in the top left. @uv contains the u and v
    coordinates that can be used to index a texture at the
    corresponding point. These coordinates are in the [0..1]x[0..1]
    region, with 0, 0 being in the lower left corder (which is typical
    for OpenGL).
    
    The output @fragColor should be a RGBA color (with
    premultiplied alpha) that will be used as the output for the
    specified pixel location. Note that this output will be
    automatically clipped to the clip region of the glshader node.
    
    In addition to the function arguments the shader can define
    up to 4 uniforms for textures which must be called u_textureN
    (i.e. u_texture1 to u_texture4) as well as any custom uniforms
    you want of types int, uint, bool, float, vec2, vec3 or vec4.
    
    All textures sources contain premultiplied alpha colors, but if some
    there are outer sources of colors there is a gsk_premultiply() helper
    to compute premultiplication when needed.
    
    Note that GTK parses the uniform declarations, so each uniform has to
    be on a line by itself with no other code, like so:
    
    ```glsl
    uniform float u_time;
    uniform vec3 u_color;
    uniform sampler2D u_texture1;
    uniform sampler2D u_texture2;
    ```
    
    GTK uses the "gsk" namespace in the symbols it uses in the
    shader, so your code should not use any symbols with the prefix gsk
    or GSK. There are some helper functions declared that you can use:
    
    ```glsl
    vec4 GskTexture(sampler2D sampler, vec2 texCoords);
    ```
    
    This samples a texture (e.g. u_texture1) at the specified
    coordinates, and contains some helper ifdefs to ensure that
    it works on all OpenGL versions.
    
    You can compile the shader yourself using [gsk.glshader.GLShader.compile],
    otherwise the GSK renderer will do it when it handling the glshader
    node. If errors occurs, the returned @error will include the glsl
    sources, so you can see what GSK was passing to the compiler. You
    can also set GSK_DEBUG=shaders in the environment to see the sources
    and other relevant information about all shaders that GSK is handling.
    
    # An example shader
    
    ```glsl
    uniform float position;
    uniform sampler2D u_texture1;
    uniform sampler2D u_texture2;
    
    void mainImage(out vec4 fragColor,
                   in vec2 fragCoord,
                   in vec2 resolution,
                   in vec2 uv) {
      vec4 source1 = GskTexture(u_texture1, uv);
      vec4 source2 = GskTexture(u_texture2, uv);
    
      fragColor = position * source1 + (1.0 - position) * source2;
    }
    ```
*/
struct GskGLShader;

/** */
struct GskGLShaderClass
{
  /** */
  GObjectClass parentClass;
}

/**
    A render node using a GL shader when drawing its children nodes.
*/
struct GskGLShaderNode;

/**
    A render node for an inset shadow.
*/
struct GskInsetShadowNode;

/**
    A render node for a linear gradient.
*/
struct GskLinearGradientNode;

/**
    A render node masking one child node with another.
*/
struct GskMaskNode;

/** */
struct GskNglRenderer;

/**
    A render node controlling the opacity of its single child node.
*/
struct GskOpacityNode;

/**
    A render node for an outset shadow.
*/
struct GskOutsetShadowNode;

/**
    A location in a parse buffer.
*/
struct GskParseLocation
{
  /**
      the offset of the location in the parse buffer, as bytes
  */
  size_t bytes;

  /**
      the offset of the location in the parse buffer, as characters
  */
  size_t chars;

  /**
      the line of the location in the parse buffer
  */
  size_t lines;

  /**
      the position in the line, as bytes
  */
  size_t lineBytes;

  /**
      the position in the line, as characters
  */
  size_t lineChars;
}

/**
    A [gsk.path.Path] describes lines and curves that are more complex
    than simple rectangles.
    
    Paths can used for rendering (filling or stroking) and for animations
    (e.g. as trajectories).
    
    [gsk.path.Path] is an immutable, opaque, reference-counted struct.
    After creation, you cannot change the types it represents. Instead,
    new [gsk.path.Path] objects have to be created. The [gsk.path_builder.PathBuilder]
    structure is meant to help in this endeavor.
    
    Conceptually, a path consists of zero or more contours (continuous, connected
    curves), each of which may or may not be closed. Contours are typically
    constructed from Bézier segments.
    
    <picture>
      <source srcset="path-dark.png" media="(prefers-color-scheme: dark)">
      <img alt="A Path" src="path-light.png">
    </picture>
*/
struct GskPath;

/**
    [gsk.path_builder.PathBuilder] is an auxiliary object for constructing
    [gsk.path.Path] objects.
    
    A path is constructed like this:
    
    ```c
    GskPath *
    construct_path (void)
    {
      GskPathBuilder *builder;
    
      builder = gsk_path_builder_new ();
    
      // add contours to the path here
    
      return gsk_path_builder_free_to_path (builder);
    ```
    
    Adding contours to the path can be done in two ways.
    The easiest option is to use the `gsk_path_builder_add_*` group
    of functions that add predefined contours to the current path,
    either common shapes like [gsk.path_builder.PathBuilder.addCircle]
    or by adding from other paths like [gsk.path_builder.PathBuilder.addPath].
    
    The `gsk_path_builder_add_*` methods always add complete contours,
    and do not use or modify the current point.
    
    The other option is to define each line and curve manually with
    the `gsk_path_builder_*_to` group of functions. You start with
    a call to [gsk.path_builder.PathBuilder.moveTo] to set the starting point
    and then use multiple calls to any of the drawing functions to
    move the pen along the plane. Once you are done, you can call
    [gsk.path_builder.PathBuilder.close] to close the path by connecting it
    back with a line to the starting point.
    
    This is similar to how paths are drawn in Cairo.
    
    Note that [gsk.path_builder.PathBuilder] will reduce the degree of added Bézier
    curves as much as possible, to simplify rendering.
*/
struct GskPathBuilder;

/**
    [gsk.path_measure.PathMeasure] is an object that allows measurements
    on [gsk.path.Path]s such as determining the length of the path.
    
    Many measuring operations require sampling the path length
    at intermediate points. Therefore, a [gsk.path_measure.PathMeasure] has
    a tolerance that determines what precision is required
    for such approximations.
    
    A [gsk.path_measure.PathMeasure] struct is a reference counted struct
    and should be treated as opaque.
*/
struct GskPathMeasure;

/**
    [gsk.path_point.PathPoint] is an opaque type representing a point on a path.
    
    It can be queried for properties of the path at that point, such as
    its tangent or its curvature.
    
    To obtain a [gsk.path_point.PathPoint], use [gsk.path.Path.getClosestPoint],
    [gsk.path.Path.getStartPoint], [gsk.path.Path.getEndPoint]
    or [gsk.path_measure.PathMeasure.getPoint].
    
    Note that [gsk.path_point.PathPoint] structs are meant to be stack-allocated,
    and don't hold a reference to the path object they are obtained from.
    It is the callers responsibility to keep a reference to the path
    as long as the [gsk.path_point.PathPoint] is used.
*/
struct GskPathPoint;

/**
    A render node for a radial gradient.
*/
struct GskRadialGradientNode;

/**
    [gsk.render_node.RenderNode] is the basic block in a scene graph to be
    rendered using [gsk.renderer.Renderer].
    
    Each node has a parent, except the top-level node; each node may have
    children nodes.
    
    Each node has an associated drawing surface, which has the size of
    the rectangle set when creating it.
    
    Render nodes are meant to be transient; once they have been associated
    to a [gsk.renderer.Renderer] it's safe to release any reference you have on
    them. All [gsk.render_node.RenderNode]s are immutable, you can only specify their
    properties during construction.
*/
struct GskRenderNode;

/**
    [gsk.renderer.Renderer] is a class that renders a scene graph defined via a
    tree of [gsk.render_node.RenderNode] instances.
    
    Typically you will use a [gsk.renderer.Renderer] instance to repeatedly call
    [gsk.renderer.Renderer.render] to update the contents of its associated
    [gdk.surface.Surface].
    
    It is necessary to realize a [gsk.renderer.Renderer] instance using
    [gsk.renderer.Renderer.realize] before calling [gsk.renderer.Renderer.render],
    in order to create the appropriate windowing system resources needed
    to render the scene.
*/
struct GskRenderer;

/** */
struct GskRendererClass;

/**
    A render node repeating its single child node.
*/
struct GskRepeatNode;

/**
    A render node for a repeating linear gradient.
*/
struct GskRepeatingLinearGradientNode;

/**
    A render node for a repeating radial gradient.
*/
struct GskRepeatingRadialGradientNode;

/**
    A render node applying a rounded rectangle clip to its single child.
*/
struct GskRoundedClipNode;

/**
    A rectangular region with rounded corners.
    
    Application code should normalize rectangles using
    [gsk.rounded_rect.RoundedRect.normalize]; this function will ensure that
    the bounds of the rectangle are normalized and ensure that the corner
    values are positive and the corners do not overlap.
    
    All functions taking a [gsk.rounded_rect.RoundedRect] as an argument will internally
    operate on a normalized copy; all functions returning a [gsk.rounded_rect.RoundedRect]
    will always return a normalized one.
    
    The algorithm used for normalizing corner sizes is described in
    [the CSS specification](https://drafts.csswg.org/css-backgrounds-3/#border-radius).
*/
struct GskRoundedRect
{
  /**
      the bounds of the rectangle
  */
  graphene_rect_t bounds;

  /**
      the size of the 4 rounded corners
  */
  graphene_size_t[4] corner;
}

/**
    An object to build the uniforms data for a [gsk.glshader.GLShader].
*/
struct GskShaderArgsBuilder;

/**
    The shadow parameters in a shadow node.
*/
struct GskShadow
{
  /**
      the color of the shadow
  */
  GdkRGBA color;

  /**
      the horizontal offset of the shadow
  */
  float dx;

  /**
      the vertical offset of the shadow
  */
  float dy;

  /**
      the radius of the shadow
  */
  float radius;
}

/**
    A render node drawing one or more shadows behind its single child node.
*/
struct GskShadowNode;

/**
    A [gsk.stroke.Stroke] struct collects the parameters that influence
    the operation of stroking a path.
*/
struct GskStroke;

/**
    A render node that will fill the area determined by stroking the the given
    [gsk.path.Path] using the [gsk.stroke.Stroke] attributes.
*/
struct GskStrokeNode;

/**
    A render node that potentially diverts a part of the scene graph to a subsurface.
*/
struct GskSubsurfaceNode;

/**
    A render node drawing a set of glyphs.
*/
struct GskTextNode;

/**
    A render node for a [gdk.texture.Texture].
*/
struct GskTextureNode;

/**
    A render node for a [gdk.texture.Texture].
*/
struct GskTextureScaleNode;

/**
    [gsk.transform.Transform] is an object to describe transform matrices.
    
    Unlike [graphene.matrix.Matrix], [gsk.transform.Transform] retains the steps in how
    a transform was constructed, and allows inspecting them. It is modeled
    after the way CSS describes transforms.
    
    [gsk.transform.Transform] objects are immutable and cannot be changed after creation.
    This means code can safely expose them as properties of objects without
    having to worry about others changing them.
*/
struct GskTransform;

/**
    A render node applying a [gsk.transform.Transform] to its single child node.
*/
struct GskTransformNode;

/**
    A GSK renderer that is using Vulkan.
    
    This renderer will fail to realize if Vulkan is not supported.
*/
struct GskVulkanRenderer;

/** */
struct GskVulkanRendererClass;

alias extern(C) void function(const(GskParseLocation)* start, const(GskParseLocation)* end, const(GError)* error, void* userData) GskParseErrorFunc;

alias extern(C) gboolean function(GskPathOperation op, const(graphene_point_t)* pts, size_t nPts, float weight, void* userData) GskPathForeachFunc;

