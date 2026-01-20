/// Module for [Snapshot] class
module gtk.snapshot;

import cairo.context;
import gdk.paintable;
import gdk.rgba;
import gdk.snapshot;
import gdk.texture;
import gid.gid;
import glib.bytes;
import gobject.object;
import graphene.matrix;
import graphene.point3_d;
import graphene.point;
import graphene.rect;
import graphene.size;
import graphene.vec3;
import graphene.vec4;
import gsk.glshader;
import gsk.path;
import gsk.render_node;
import gsk.rounded_rect;
import gsk.stroke;
import gsk.transform;
import gsk.types;
import gtk.c.functions;
import gtk.c.types;
import gtk.style_context;
import gtk.types;
import pango.layout;
import pango.types;

/**
    [gtk.snapshot.Snapshot] assists in creating [gsk.render_node.RenderNode]s for widgets.
    
    It functions in a similar way to a cairo context, and maintains a stack
    of render nodes and their associated transformations.
    
    The node at the top of the stack is the one that `gtk_snapshot_append_…()`
    functions operate on. Use the `gtk_snapshot_push_…()` functions and
    [gtk.snapshot.Snapshot.pop] to change the current node.
    
    The typical way to obtain a [gtk.snapshot.Snapshot] object is as an argument to
    the `vfunc@Gtk.Widget.snapshot` vfunc. If you need to create your own
    [gtk.snapshot.Snapshot], use [gtk.snapshot.Snapshot.new_].
*/
class Snapshot : gdk.snapshot.Snapshot
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_snapshot_get_type != &gidSymbolNotFound ? gtk_snapshot_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Snapshot self()
  {
    return this;
  }

  /**
      Creates a new [gtk.snapshot.Snapshot].
      Returns: a newly-allocated [gtk.snapshot.Snapshot]
  */
  this()
  {
    GtkSnapshot* _cretval;
    _cretval = gtk_snapshot_new();
    this(_cretval, Yes.Take);
  }

  /**
      Appends a stroked border rectangle inside the given outline.
      
      The four sides of the border can have different widths and colors.
  
      Params:
        outline = the outline of the border
        borderWidth = the stroke width of the border on
            the top, right, bottom and left side respectively.
        borderColor = the color used on the top, right,
            bottom and left side.
  */
  void appendBorder(gsk.rounded_rect.RoundedRect outline, float[] borderWidth, gdk.rgba.RGBA[] borderColor)
  {
    assert(!borderWidth || borderWidth.length == 4);
    auto _borderWidth = cast(const(float)*)borderWidth.ptr;
    assert(!borderColor || borderColor.length == 4);
    auto _borderColor = cast(const(GdkRGBA)*)borderColor.ptr;
    gtk_snapshot_append_border(cast(GtkSnapshot*)this._cPtr, outline ? cast(const(GskRoundedRect)*)outline._cPtr : null, _borderWidth, _borderColor);
  }

  /**
      Creates a new [gsk.cairo_node.CairoNode] and appends it to the current
      render node of snapshot, without changing the current node.
  
      Params:
        bounds = the bounds for the new node
      Returns: a [cairo.context.Context] suitable for drawing the contents of
          the newly created render node
  */
  cairo.context.Context appendCairo(graphene.rect.Rect bounds)
  {
    cairo_t* _cretval;
    _cretval = gtk_snapshot_append_cairo(cast(GtkSnapshot*)this._cPtr, bounds ? cast(const(graphene_rect_t)*)bounds._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new cairo.context.Context(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a new render node drawing the color into the
      given bounds and appends it to the current render node
      of snapshot.
      
      You should try to avoid calling this function if
      color is transparent.
  
      Params:
        color = the color to draw
        bounds = the bounds for the new node
  */
  void appendColor(gdk.rgba.RGBA color, graphene.rect.Rect bounds)
  {
    gtk_snapshot_append_color(cast(GtkSnapshot*)this._cPtr, cast(const(GdkRGBA)*)&color, bounds ? cast(const(graphene_rect_t)*)bounds._cPtr(No.Dup) : null);
  }

  /**
      A convenience method to fill a path with a color.
      
      See [gtk.snapshot.Snapshot.pushFill] if you need
      to fill a path with more complex content than
      a color.
  
      Params:
        path = The path describing the area to fill
        fillRule = The fill rule to use
        color = the color to fill the path with
  */
  void appendFill(gsk.path.Path path, gsk.types.FillRule fillRule, gdk.rgba.RGBA color)
  {
    gtk_snapshot_append_fill(cast(GtkSnapshot*)this._cPtr, path ? cast(GskPath*)path._cPtr(No.Dup) : null, fillRule, cast(const(GdkRGBA)*)&color);
  }

  /**
      Appends an inset shadow into the box given by outline.
  
      Params:
        outline = outline of the region surrounded by shadow
        color = color of the shadow
        dx = horizontal offset of shadow
        dy = vertical offset of shadow
        spread = how far the shadow spreads towards the inside
        blurRadius = how much blur to apply to the shadow
  */
  void appendInsetShadow(gsk.rounded_rect.RoundedRect outline, gdk.rgba.RGBA color, float dx, float dy, float spread, float blurRadius)
  {
    gtk_snapshot_append_inset_shadow(cast(GtkSnapshot*)this._cPtr, outline ? cast(const(GskRoundedRect)*)outline._cPtr : null, cast(const(GdkRGBA)*)&color, dx, dy, spread, blurRadius);
  }

  /** */
  void appendLayout(pango.layout.Layout layout, gdk.rgba.RGBA color)
  {
    gtk_snapshot_append_layout(cast(GtkSnapshot*)this._cPtr, layout ? cast(PangoLayout*)layout._cPtr(No.Dup) : null, cast(const(GdkRGBA)*)&color);
  }

  /**
      Appends node to the current render node of snapshot,
      without changing the current node.
      
      If snapshot does not have a current node yet, node
      will become the initial node.
  
      Params:
        node = a [gsk.render_node.RenderNode]
  */
  void appendNode(gsk.render_node.RenderNode node)
  {
    gtk_snapshot_append_node(cast(GtkSnapshot*)this._cPtr, node ? cast(GskRenderNode*)node._cPtr(No.Dup) : null);
  }

  /**
      Appends an outset shadow node around the box given by outline.
  
      Params:
        outline = outline of the region surrounded by shadow
        color = color of the shadow
        dx = horizontal offset of shadow
        dy = vertical offset of shadow
        spread = how far the shadow spreads towards the outside
        blurRadius = how much blur to apply to the shadow
  */
  void appendOutsetShadow(gsk.rounded_rect.RoundedRect outline, gdk.rgba.RGBA color, float dx, float dy, float spread, float blurRadius)
  {
    gtk_snapshot_append_outset_shadow(cast(GtkSnapshot*)this._cPtr, outline ? cast(const(GskRoundedRect)*)outline._cPtr : null, cast(const(GdkRGBA)*)&color, dx, dy, spread, blurRadius);
  }

  /**
      Creates a new render node drawing the texture
      into the given bounds and appends it to the
      current render node of snapshot.
      
      In contrast to [gtk.snapshot.Snapshot.appendTexture],
      this function provides control about how the filter
      that is used when scaling.
  
      Params:
        texture = the texture to render
        filter = the filter to use
        bounds = the bounds for the new node
  */
  void appendScaledTexture(gdk.texture.Texture texture, gsk.types.ScalingFilter filter, graphene.rect.Rect bounds)
  {
    gtk_snapshot_append_scaled_texture(cast(GtkSnapshot*)this._cPtr, texture ? cast(GdkTexture*)texture._cPtr(No.Dup) : null, filter, bounds ? cast(const(graphene_rect_t)*)bounds._cPtr(No.Dup) : null);
  }

  /**
      A convenience method to stroke a path with a color.
      
      See [gtk.snapshot.Snapshot.pushStroke] if you need
      to stroke a path with more complex content than
      a color.
  
      Params:
        path = The path describing the area to fill
        stroke = The stroke attributes
        color = the color to fill the path with
  */
  void appendStroke(gsk.path.Path path, gsk.stroke.Stroke stroke, gdk.rgba.RGBA color)
  {
    gtk_snapshot_append_stroke(cast(GtkSnapshot*)this._cPtr, path ? cast(GskPath*)path._cPtr(No.Dup) : null, stroke ? cast(const(GskStroke)*)stroke._cPtr(No.Dup) : null, cast(const(GdkRGBA)*)&color);
  }

  /**
      Creates a new render node drawing the texture
      into the given bounds and appends it to the
      current render node of snapshot.
      
      If the texture needs to be scaled to fill bounds,
      linear filtering is used. See [gtk.snapshot.Snapshot.appendScaledTexture]
      if you need other filtering, such as nearest-neighbour.
  
      Params:
        texture = the texture to render
        bounds = the bounds for the new node
  */
  void appendTexture(gdk.texture.Texture texture, graphene.rect.Rect bounds)
  {
    gtk_snapshot_append_texture(cast(GtkSnapshot*)this._cPtr, texture ? cast(GdkTexture*)texture._cPtr(No.Dup) : null, bounds ? cast(const(graphene_rect_t)*)bounds._cPtr(No.Dup) : null);
  }

  /**
      Removes the top element from the stack of render nodes and
      adds it to the nearest [gsk.glshader_node.GLShaderNode] below it.
      
      This must be called the same number of times as the number
      of textures is needed for the shader in
      [gtk.snapshot.Snapshot.pushGlShader].
  */
  void glShaderPopTexture()
  {
    gtk_snapshot_gl_shader_pop_texture(cast(GtkSnapshot*)this._cPtr);
  }

  /**
      Applies a perspective projection transform.
      
      See [gsk.transform.Transform.perspective] for a discussion on the details.
  
      Params:
        depth = distance of the z=0 plane
  */
  void perspective(float depth)
  {
    gtk_snapshot_perspective(cast(GtkSnapshot*)this._cPtr, depth);
  }

  /**
      Removes the top element from the stack of render nodes,
      and appends it to the node underneath it.
  */
  void pop()
  {
    gtk_snapshot_pop(cast(GtkSnapshot*)this._cPtr);
  }

  /**
      Blends together two images with the given blend mode.
      
      Until the first call to [gtk.snapshot.Snapshot.pop], the
      bottom image for the blend operation will be recorded.
      After that call, the top image to be blended will be
      recorded until the second call to [gtk.snapshot.Snapshot.pop].
      
      Calling this function requires two subsequent calls
      to [gtk.snapshot.Snapshot.pop].
  
      Params:
        blendMode = blend mode to use
  */
  void pushBlend(gsk.types.BlendMode blendMode)
  {
    gtk_snapshot_push_blend(cast(GtkSnapshot*)this._cPtr, blendMode);
  }

  /**
      Blurs an image.
      
      The image is recorded until the next call to [gtk.snapshot.Snapshot.pop].
  
      Params:
        radius = the blur radius to use. Must be positive
  */
  void pushBlur(double radius)
  {
    gtk_snapshot_push_blur(cast(GtkSnapshot*)this._cPtr, radius);
  }

  /**
      Clips an image to a rectangle.
      
      The image is recorded until the next call to [gtk.snapshot.Snapshot.pop].
  
      Params:
        bounds = the rectangle to clip to
  */
  void pushClip(graphene.rect.Rect bounds)
  {
    gtk_snapshot_push_clip(cast(GtkSnapshot*)this._cPtr, bounds ? cast(const(graphene_rect_t)*)bounds._cPtr(No.Dup) : null);
  }

  /**
      Modifies the colors of an image by applying an affine transformation
      in RGB space.
      
      In particular, the colors will be transformed by applying
      
          pixel = transpose(color_matrix) * pixel + color_offset
      
      for every pixel. The transformation operates on unpremultiplied
      colors, with color components ordered R, G, B, A.
      
      The image is recorded until the next call to [gtk.snapshot.Snapshot.pop].
  
      Params:
        colorMatrix = the color matrix to use
        colorOffset = the color offset to use
  */
  void pushColorMatrix(graphene.matrix.Matrix colorMatrix, graphene.vec4.Vec4 colorOffset)
  {
    gtk_snapshot_push_color_matrix(cast(GtkSnapshot*)this._cPtr, colorMatrix ? cast(const(graphene_matrix_t)*)colorMatrix._cPtr(No.Dup) : null, colorOffset ? cast(const(graphene_vec4_t)*)colorOffset._cPtr(No.Dup) : null);
  }

  /**
      Snapshots a cross-fade operation between two images with the
      given progress.
      
      Until the first call to [gtk.snapshot.Snapshot.pop], the start image
      will be snapshot. After that call, the end image will be recorded
      until the second call to [gtk.snapshot.Snapshot.pop].
      
      Calling this function requires two subsequent calls
      to [gtk.snapshot.Snapshot.pop].
  
      Params:
        progress = progress between 0.0 and 1.0
  */
  void pushCrossFade(double progress)
  {
    gtk_snapshot_push_cross_fade(cast(GtkSnapshot*)this._cPtr, progress);
  }

  /**
      Fills the area given by path and fill_rule with an image and discards everything
      outside of it.
      
      The image is recorded until the next call to [gtk.snapshot.Snapshot.pop].
      
      If you want to fill the path with a color, [gtk.snapshot.Snapshot.appendFill]
      may be more convenient.
  
      Params:
        path = The path describing the area to fill
        fillRule = The fill rule to use
  */
  void pushFill(gsk.path.Path path, gsk.types.FillRule fillRule)
  {
    gtk_snapshot_push_fill(cast(GtkSnapshot*)this._cPtr, path ? cast(GskPath*)path._cPtr(No.Dup) : null, fillRule);
  }

  /**
      Push a [gsk.glshader_node.GLShaderNode].
      
      The node uses the given [gsk.glshader.GLShader] and uniform values
      Additionally this takes a list of n_children other nodes
      which will be passed to the [gsk.glshader_node.GLShaderNode].
      
      The take_args argument is a block of data to use for uniform
      arguments, as per types and offsets defined by the shader.
      Normally this is generated by [gsk.glshader.GLShader.formatArgs]
      or [gsk.shader_args_builder.ShaderArgsBuilder].
      
      The snapshotter takes ownership of take_args, so the caller should
      not free it after this.
      
      If the renderer doesn't support GL shaders, or if there is any
      problem when compiling the shader, then the node will draw pink.
      You should use [gsk.glshader.GLShader.compile] to ensure the shader
      will work for the renderer before using it.
      
      If the shader requires textures (see [gsk.glshader.GLShader.getNTextures]),
      then it is expected that you call [gtk.snapshot.Snapshot.glShaderPopTexture]
      the number of times that are required. Each of these calls will generate
      a node that is added as a child to the [gsk.glshader_node.GLShaderNode], which in turn
      will render these offscreen and pass as a texture to the shader.
      
      Once all textures (if any) are pop:ed, you must call the regular
      [gtk.snapshot.Snapshot.pop].
      
      If you want to use pre-existing textures as input to the shader rather
      than rendering new ones, use [gtk.snapshot.Snapshot.appendTexture] to
      push a texture node. These will be used directly rather than being
      re-rendered.
      
      For details on how to write shaders, see [gsk.glshader.GLShader].
  
      Params:
        shader = The code to run
        bounds = the rectangle to render into
        takeArgs = Data block with arguments for the shader.
  */
  void pushGlShader(gsk.glshader.GLShader shader, graphene.rect.Rect bounds, glib.bytes.Bytes takeArgs)
  {
    gtk_snapshot_push_gl_shader(cast(GtkSnapshot*)this._cPtr, shader ? cast(GskGLShader*)shader._cPtr(No.Dup) : null, bounds ? cast(const(graphene_rect_t)*)bounds._cPtr(No.Dup) : null, takeArgs ? cast(GBytes*)takeArgs._cPtr(Yes.Dup) : null);
  }

  /**
      Until the first call to [gtk.snapshot.Snapshot.pop], the
      mask image for the mask operation will be recorded.
      
      After that call, the source image will be recorded until
      the second call to [gtk.snapshot.Snapshot.pop].
      
      Calling this function requires 2 subsequent calls to [gtk.snapshot.Snapshot.pop].
  
      Params:
        maskMode = mask mode to use
  */
  void pushMask(gsk.types.MaskMode maskMode)
  {
    gtk_snapshot_push_mask(cast(GtkSnapshot*)this._cPtr, maskMode);
  }

  /**
      Modifies the opacity of an image.
      
      The image is recorded until the next call to [gtk.snapshot.Snapshot.pop].
  
      Params:
        opacity = the opacity to use
  */
  void pushOpacity(double opacity)
  {
    gtk_snapshot_push_opacity(cast(GtkSnapshot*)this._cPtr, opacity);
  }

  /**
      Creates a node that repeats the child node.
      
      The child is recorded until the next call to [gtk.snapshot.Snapshot.pop].
  
      Params:
        bounds = the bounds within which to repeat
        childBounds = the bounds of the child or null
            to use the full size of the collected child node
  */
  void pushRepeat(graphene.rect.Rect bounds, graphene.rect.Rect childBounds = null)
  {
    gtk_snapshot_push_repeat(cast(GtkSnapshot*)this._cPtr, bounds ? cast(const(graphene_rect_t)*)bounds._cPtr(No.Dup) : null, childBounds ? cast(const(graphene_rect_t)*)childBounds._cPtr(No.Dup) : null);
  }

  /**
      Clips an image to a rounded rectangle.
      
      The image is recorded until the next call to [gtk.snapshot.Snapshot.pop].
  
      Params:
        bounds = the rounded rectangle to clip to
  */
  void pushRoundedClip(gsk.rounded_rect.RoundedRect bounds)
  {
    gtk_snapshot_push_rounded_clip(cast(GtkSnapshot*)this._cPtr, bounds ? cast(const(GskRoundedRect)*)bounds._cPtr : null);
  }

  /**
      Strokes the given path with the attributes given by stroke and
      an image.
      
      The image is recorded until the next call to [gtk.snapshot.Snapshot.pop].
      
      Note that the strokes are subject to the same transformation as
      everything else, so uneven scaling will cause horizontal and vertical
      strokes to have different widths.
      
      If you want to stroke the path with a color, [gtk.snapshot.Snapshot.appendStroke]
      may be more convenient.
  
      Params:
        path = The path to stroke
        stroke = The stroke attributes
  */
  void pushStroke(gsk.path.Path path, gsk.stroke.Stroke stroke)
  {
    gtk_snapshot_push_stroke(cast(GtkSnapshot*)this._cPtr, path ? cast(GskPath*)path._cPtr(No.Dup) : null, stroke ? cast(const(GskStroke)*)stroke._cPtr(No.Dup) : null);
  }

  /**
      Creates a render node for the CSS background according to context,
      and appends it to the current node of snapshot, without changing
      the current node.
  
      Params:
        context = the style context that defines the background
        x = X origin of the rectangle
        y = Y origin of the rectangle
        width = rectangle width
        height = rectangle height
  */
  void renderBackground(gtk.style_context.StyleContext context, double x, double y, double width, double height)
  {
    gtk_snapshot_render_background(cast(GtkSnapshot*)this._cPtr, context ? cast(GtkStyleContext*)context._cPtr(No.Dup) : null, x, y, width, height);
  }

  /**
      Creates a render node for the focus outline according to context,
      and appends it to the current node of snapshot, without changing
      the current node.
  
      Params:
        context = the style context that defines the focus ring
        x = X origin of the rectangle
        y = Y origin of the rectangle
        width = rectangle width
        height = rectangle height
  */
  void renderFocus(gtk.style_context.StyleContext context, double x, double y, double width, double height)
  {
    gtk_snapshot_render_focus(cast(GtkSnapshot*)this._cPtr, context ? cast(GtkStyleContext*)context._cPtr(No.Dup) : null, x, y, width, height);
  }

  /**
      Creates a render node for the CSS border according to context,
      and appends it to the current node of snapshot, without changing
      the current node.
  
      Params:
        context = the style context that defines the frame
        x = X origin of the rectangle
        y = Y origin of the rectangle
        width = rectangle width
        height = rectangle height
  */
  void renderFrame(gtk.style_context.StyleContext context, double x, double y, double width, double height)
  {
    gtk_snapshot_render_frame(cast(GtkSnapshot*)this._cPtr, context ? cast(GtkStyleContext*)context._cPtr(No.Dup) : null, x, y, width, height);
  }

  /**
      Draws a text caret using snapshot at the specified index of layout.
  
      Params:
        context = a [gtk.style_context.StyleContext]
        x = X origin
        y = Y origin
        layout = the [pango.layout.Layout] of the text
        index = the index in the [pango.layout.Layout]
        direction = the [pango.types.Direction] of the text
  */
  void renderInsertionCursor(gtk.style_context.StyleContext context, double x, double y, pango.layout.Layout layout, int index, pango.types.Direction direction)
  {
    gtk_snapshot_render_insertion_cursor(cast(GtkSnapshot*)this._cPtr, context ? cast(GtkStyleContext*)context._cPtr(No.Dup) : null, x, y, layout ? cast(PangoLayout*)layout._cPtr(No.Dup) : null, index, direction);
  }

  /**
      Creates a render node for rendering layout according to the style
      information in context, and appends it to the current node of snapshot,
      without changing the current node.
  
      Params:
        context = the style context that defines the text
        x = X origin of the rectangle
        y = Y origin of the rectangle
        layout = the [pango.layout.Layout] to render
  */
  void renderLayout(gtk.style_context.StyleContext context, double x, double y, pango.layout.Layout layout)
  {
    gtk_snapshot_render_layout(cast(GtkSnapshot*)this._cPtr, context ? cast(GtkStyleContext*)context._cPtr(No.Dup) : null, x, y, layout ? cast(PangoLayout*)layout._cPtr(No.Dup) : null);
  }

  /**
      Restores snapshot to the state saved by a preceding call to
      [gtk.snapshot.Snapshot.save] and removes that state from the stack of
      saved states.
  */
  void restore()
  {
    gtk_snapshot_restore(cast(GtkSnapshot*)this._cPtr);
  }

  /**
      Rotates @snapshot's coordinate system by angle degrees in 2D space -
      or in 3D speak, rotates around the Z axis. The rotation happens around
      the origin point of (0, 0) in the snapshot's current coordinate system.
      
      To rotate around axes other than the Z axis, use [gsk.transform.Transform.rotate3d].
  
      Params:
        angle = the rotation angle, in degrees (clockwise)
  */
  void rotate(float angle)
  {
    gtk_snapshot_rotate(cast(GtkSnapshot*)this._cPtr, angle);
  }

  /**
      Rotates snapshot's coordinate system by angle degrees around axis.
      
      For a rotation in 2D space, use [gsk.transform.Transform.rotate].
  
      Params:
        angle = the rotation angle, in degrees (clockwise)
        axis = The rotation axis
  */
  void rotate3d(float angle, graphene.vec3.Vec3 axis)
  {
    gtk_snapshot_rotate_3d(cast(GtkSnapshot*)this._cPtr, angle, axis ? cast(const(graphene_vec3_t)*)axis._cPtr(No.Dup) : null);
  }

  /**
      Makes a copy of the current state of snapshot and saves it
      on an internal stack.
      
      When [gtk.snapshot.Snapshot.restore] is called, snapshot will
      be restored to the saved state.
      
      Multiple calls to [gtk.snapshot.Snapshot.save] and [gtk.snapshot.Snapshot.restore]
      can be nested; each call to `[gtk.snapshot.Snapshot.restore]` restores the state from
      the matching paired `[gtk.snapshot.Snapshot.save]`.
      
      It is necessary to clear all saved states with corresponding
      calls to `[gtk.snapshot.Snapshot.restore]`.
  */
  void save()
  {
    gtk_snapshot_save(cast(GtkSnapshot*)this._cPtr);
  }

  /**
      Scales snapshot's coordinate system in 2-dimensional space by
      the given factors.
      
      Use [gtk.snapshot.Snapshot.scale3d] to scale in all 3 dimensions.
  
      Params:
        factorX = scaling factor on the X axis
        factorY = scaling factor on the Y axis
  */
  void scale(float factorX, float factorY)
  {
    gtk_snapshot_scale(cast(GtkSnapshot*)this._cPtr, factorX, factorY);
  }

  /**
      Scales snapshot's coordinate system by the given factors.
  
      Params:
        factorX = scaling factor on the X axis
        factorY = scaling factor on the Y axis
        factorZ = scaling factor on the Z axis
  */
  void scale3d(float factorX, float factorY, float factorZ)
  {
    gtk_snapshot_scale_3d(cast(GtkSnapshot*)this._cPtr, factorX, factorY, factorZ);
  }

  /**
      Returns the render node that was constructed
      by snapshot.
      
      Note that this function may return null if nothing has been
      added to the snapshot or if its content does not produce pixels
      to be rendered.
      
      After calling this function, it is no longer possible to
      add more nodes to snapshot. The only function that should
      be called after this is [gobject.object.ObjectWrap.unref].
      Returns: the constructed [gsk.render_node.RenderNode] or
          null if there are no nodes to render.
  */
  gsk.render_node.RenderNode toNode()
  {
    GskRenderNode* _cretval;
    _cretval = gtk_snapshot_to_node(cast(GtkSnapshot*)this._cPtr);
    auto _retval = _cretval ? new gsk.render_node.RenderNode(cast(GskRenderNode*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns a paintable encapsulating the render node
      that was constructed by snapshot.
      
      After calling this function, it is no longer possible to
      add more nodes to snapshot. The only function that should
      be called after this is [gobject.object.ObjectWrap.unref].
  
      Params:
        size = The size of the resulting paintable
            or null to use the bounds of the snapshot
      Returns: a new [gdk.paintable.Paintable]
  */
  gdk.paintable.Paintable toPaintable(graphene.size.Size size)
  {
    GdkPaintable* _cretval;
    _cretval = gtk_snapshot_to_paintable(cast(GtkSnapshot*)this._cPtr, cast(const(graphene_size_t)*)&size);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.paintable.Paintable)(cast(GdkPaintable*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Transforms snapshot's coordinate system with the given transform.
  
      Params:
        transform = the transform to apply
  */
  void transform(gsk.transform.Transform transform = null)
  {
    gtk_snapshot_transform(cast(GtkSnapshot*)this._cPtr, transform ? cast(GskTransform*)transform._cPtr(No.Dup) : null);
  }

  /**
      Transforms snapshot's coordinate system with the given matrix.
  
      Params:
        matrix = the matrix to multiply the transform with
  */
  void transformMatrix(graphene.matrix.Matrix matrix)
  {
    gtk_snapshot_transform_matrix(cast(GtkSnapshot*)this._cPtr, matrix ? cast(const(graphene_matrix_t)*)matrix._cPtr(No.Dup) : null);
  }

  /**
      Translates snapshot's coordinate system by point in 2-dimensional space.
  
      Params:
        point = the point to translate the snapshot by
  */
  void translate(graphene.point.Point point)
  {
    gtk_snapshot_translate(cast(GtkSnapshot*)this._cPtr, cast(const(graphene_point_t)*)&point);
  }

  /**
      Translates snapshot's coordinate system by point.
  
      Params:
        point = the point to translate the snapshot by
  */
  void translate3d(graphene.point3_d.Point3D point)
  {
    gtk_snapshot_translate_3d(cast(GtkSnapshot*)this._cPtr, cast(const(graphene_point3d_t)*)&point);
  }
}
