/// Module for [GLArea] class
module gtk.glarea;

import gdk.glcontext;
import gdk.types;
import gid.gid;
import glib.error;
import gobject.dclosure;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.types;
import gtk.widget;

/**
    [gtk.glarea.GLArea] is a widget that allows drawing with OpenGL.
    
    ![An example GtkGLArea](glarea.png)
    
    [gtk.glarea.GLArea] sets up its own [gdk.glcontext.GLContext], and creates a custom
    GL framebuffer that the widget will do GL rendering onto. It also ensures
    that this framebuffer is the default GL rendering target when rendering.
    The completed rendering is integrated into the larger GTK scene graph as
    a texture.
    
    In order to draw, you have to connect to the [gtk.glarea.GLArea.render]
    signal, or subclass [gtk.glarea.GLArea] and override the GtkGLAreaClass.render
    virtual function.
    
    The [gtk.glarea.GLArea] widget ensures that the [gdk.glcontext.GLContext] is associated with
    the widget's drawing area, and it is kept updated when the size and
    position of the drawing area changes.
    
    ## Drawing with GtkGLArea
    
    The simplest way to draw using OpenGL commands in a [gtk.glarea.GLArea] is to
    create a widget instance and connect to the [gtk.glarea.GLArea.render] signal:
    
    The `render()` function will be called when the [gtk.glarea.GLArea] is ready
    for you to draw its content:
    
    The initial contents of the framebuffer are transparent.
    
    ```c
    static gboolean
    render (GtkGLArea *area, GdkGLContext *context)
    {
      // inside this function it's safe to use GL; the given
      // GdkGLContext has been made current to the drawable
      // surface used by the `GtkGLArea` and the viewport has
      // already been set to be the size of the allocation
    
      // we can start by clearing the buffer
      glClearColor (0, 0, 0, 0);
      glClear (GL_COLOR_BUFFER_BIT);
    
      // draw your object
      // draw_an_object ();
    
      // we completed our drawing; the draw commands will be
      // flushed at the end of the signal emission chain, and
      // the buffers will be drawn on the window
      return TRUE;
    }
    
    void setup_glarea (void)
    {
      // create a GtkGLArea instance
      GtkWidget *gl_area = gtk_gl_area_new ();
    
      // connect to the "render" signal
      g_signal_connect (gl_area, "render", G_CALLBACK (render), NULL);
    }
    ```
    
    If you need to initialize OpenGL state, e.g. buffer objects or
    shaders, you should use the [gtk.widget.Widget.realize] signal;
    you can use the [gtk.widget.Widget.unrealize] signal to clean up.
    Since the [gdk.glcontext.GLContext] creation and initialization may fail, you
    will need to check for errors, using [gtk.glarea.GLArea.getError].
    
    An example of how to safely initialize the GL state is:
    
    ```c
    static void
    on_realize (GtkGLarea *area)
    {
      // We need to make the context current if we want to
      // call GL API
      gtk_gl_area_make_current (area);
    
      // If there were errors during the initialization or
      // when trying to make the context current, this
      // function will return a GError for you to catch
      if (gtk_gl_area_get_error (area) != NULL)
        return;
    
      // You can also use gtk_gl_area_set_error() in order
      // to show eventual initialization errors on the
      // GtkGLArea widget itself
      GError *internal_error = NULL;
      init_buffer_objects (&error);
      if (error != NULL)
        {
          gtk_gl_area_set_error (area, error);
          g_error_free (error);
          return;
        }
    
      init_shaders (&error);
      if (error != NULL)
        {
          gtk_gl_area_set_error (area, error);
          g_error_free (error);
          return;
        }
    }
    ```
    
    If you need to change the options for creating the [gdk.glcontext.GLContext]
    you should use the `signal@Gtk.GLArea::create-context` signal.
*/
class GLArea : gtk.widget.Widget
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
    return cast(void function())gtk_gl_area_get_type != &gidSymbolNotFound ? gtk_gl_area_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GLArea self()
  {
    return this;
  }

  /**
      Get `allowedApis` property.
      Returns: The allowed APIs.
  */
  @property gdk.types.GLAPI allowedApis()
  {
    return getAllowedApis();
  }

  /**
      Set `allowedApis` property.
      Params:
        propval = The allowed APIs.
  */
  @property void allowedApis(gdk.types.GLAPI propval)
  {
    return setAllowedApis(propval);
  }

  /**
      Get `api` property.
      Returns: The API currently in use.
  */
  @property gdk.types.GLAPI api()
  {
    return getApi();
  }

  /**
      Get `autoRender` property.
      Returns: If set to true the ::render signal will be emitted every time
        the widget draws.
        
        This is the default and is useful if drawing the widget is faster.
        
        If set to false the data from previous rendering is kept around and will
        be used for drawing the widget the next time, unless the window is resized.
        In order to force a rendering [gtk.glarea.GLArea.queueRender] must be called.
        This mode is useful when the scene changes seldom, but takes a long time
        to redraw.
  */
  @property bool autoRender()
  {
    return getAutoRender();
  }

  /**
      Set `autoRender` property.
      Params:
        propval = If set to true the ::render signal will be emitted every time
          the widget draws.
          
          This is the default and is useful if drawing the widget is faster.
          
          If set to false the data from previous rendering is kept around and will
          be used for drawing the widget the next time, unless the window is resized.
          In order to force a rendering [gtk.glarea.GLArea.queueRender] must be called.
          This mode is useful when the scene changes seldom, but takes a long time
          to redraw.
  */
  @property void autoRender(bool propval)
  {
    return setAutoRender(propval);
  }

  /**
      Get `context` property.
      Returns: The [gdk.glcontext.GLContext] used by the [gtk.glarea.GLArea] widget.
        
        The [gtk.glarea.GLArea] widget is responsible for creating the [gdk.glcontext.GLContext]
        instance. If you need to render with other kinds of buffers (stencil,
        depth, etc), use render buffers.
  */
  @property gdk.glcontext.GLContext context()
  {
    return getContext();
  }

  /**
      Get `hasDepthBuffer` property.
      Returns: If set to true the widget will allocate and enable a depth buffer for the
        target framebuffer.
        
        Setting this property will enable GL's depth testing as a side effect. If
        you don't need depth testing, you should call `glDisable(GL_DEPTH_TEST)`
        in your `GtkGLArea::render` handler.
  */
  @property bool hasDepthBuffer()
  {
    return getHasDepthBuffer();
  }

  /**
      Set `hasDepthBuffer` property.
      Params:
        propval = If set to true the widget will allocate and enable a depth buffer for the
          target framebuffer.
          
          Setting this property will enable GL's depth testing as a side effect. If
          you don't need depth testing, you should call `glDisable(GL_DEPTH_TEST)`
          in your `GtkGLArea::render` handler.
  */
  @property void hasDepthBuffer(bool propval)
  {
    return setHasDepthBuffer(propval);
  }

  /**
      Get `hasStencilBuffer` property.
      Returns: If set to true the widget will allocate and enable a stencil buffer for the
        target framebuffer.
  */
  @property bool hasStencilBuffer()
  {
    return getHasStencilBuffer();
  }

  /**
      Set `hasStencilBuffer` property.
      Params:
        propval = If set to true the widget will allocate and enable a stencil buffer for the
          target framebuffer.
  */
  @property void hasStencilBuffer(bool propval)
  {
    return setHasStencilBuffer(propval);
  }

  /**
      Get `useEs` property.
      Returns: If set to true the widget will try to create a [gdk.glcontext.GLContext] using
        OpenGL ES instead of OpenGL.
  
      Deprecated: Use `property@Gtk.GLArea:allowed-apis`
  */
  @property bool useEs()
  {
    return getUseEs();
  }

  /**
      Set `useEs` property.
      Params:
        propval = If set to true the widget will try to create a [gdk.glcontext.GLContext] using
          OpenGL ES instead of OpenGL.
  
      Deprecated: Use `property@Gtk.GLArea:allowed-apis`
  */
  @property void useEs(bool propval)
  {
    return setUseEs(propval);
  }

  /**
      Creates a new [gtk.glarea.GLArea] widget.
      Returns: a new [gtk.glarea.GLArea]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_gl_area_new();
    this(_cretval, No.Take);
  }

  /**
      Binds buffers to the framebuffer.
      
      Ensures that the area framebuffer object is made the current draw
      and read target, and that all the required buffers for the area
      are created and bound to the framebuffer.
      
      This function is automatically called before emitting the
      [gtk.glarea.GLArea.render] signal, and doesn't normally need to be
      called by application code.
  */
  void attachBuffers()
  {
    gtk_gl_area_attach_buffers(cast(GtkGLArea*)this._cPtr);
  }

  /**
      Gets the allowed APIs.
      
      See [gtk.glarea.GLArea.setAllowedApis].
      Returns: the allowed APIs
  */
  gdk.types.GLAPI getAllowedApis()
  {
    GdkGLAPI _cretval;
    _cretval = gtk_gl_area_get_allowed_apis(cast(GtkGLArea*)this._cPtr);
    gdk.types.GLAPI _retval = cast(gdk.types.GLAPI)_cretval;
    return _retval;
  }

  /**
      Gets the API that is currently in use.
      
      If the GL area has not been realized yet, 0 is returned.
      Returns: the currently used API
  */
  gdk.types.GLAPI getApi()
  {
    GdkGLAPI _cretval;
    _cretval = gtk_gl_area_get_api(cast(GtkGLArea*)this._cPtr);
    gdk.types.GLAPI _retval = cast(gdk.types.GLAPI)_cretval;
    return _retval;
  }

  /**
      Returns whether the area is in auto render mode or not.
      Returns: true if the area is auto rendering, false otherwise
  */
  bool getAutoRender()
  {
    bool _retval;
    _retval = cast(bool)gtk_gl_area_get_auto_render(cast(GtkGLArea*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the [gdk.glcontext.GLContext] used by area.
      Returns: the [gdk.glcontext.GLContext]
  */
  gdk.glcontext.GLContext getContext()
  {
    GdkGLContext* _cretval;
    _cretval = gtk_gl_area_get_context(cast(GtkGLArea*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.glcontext.GLContext)(cast(GdkGLContext*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the current error set on the area.
      Returns: the [glib.error.ErrorWrap]
  */
  glib.error.ErrorWrap getError()
  {
    GError* _cretval;
    _cretval = gtk_gl_area_get_error(cast(GtkGLArea*)this._cPtr);
    auto _retval = _cretval ? new glib.error.ErrorWrap(cast(GError*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Returns whether the area has a depth buffer.
      Returns: true if the area has a depth buffer, false otherwise
  */
  bool getHasDepthBuffer()
  {
    bool _retval;
    _retval = cast(bool)gtk_gl_area_get_has_depth_buffer(cast(GtkGLArea*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the area has a stencil buffer.
      Returns: true if the area has a stencil buffer, false otherwise
  */
  bool getHasStencilBuffer()
  {
    bool _retval;
    _retval = cast(bool)gtk_gl_area_get_has_stencil_buffer(cast(GtkGLArea*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the required version of OpenGL.
      
      See [gtk.glarea.GLArea.setRequiredVersion].
  
      Params:
        major = return location for the required major version
        minor = return location for the required minor version
  */
  void getRequiredVersion(out int major, out int minor)
  {
    gtk_gl_area_get_required_version(cast(GtkGLArea*)this._cPtr, cast(int*)&major, cast(int*)&minor);
  }

  /**
      Returns whether the [gtk.glarea.GLArea] should use OpenGL ES.
      
      See [gtk.glarea.GLArea.setUseEs].
      Returns: true if the [gtk.glarea.GLArea] should create an OpenGL ES context
          and false otherwise
  
      Deprecated: Use [gtk.glarea.GLArea.getApi]
  */
  bool getUseEs()
  {
    bool _retval;
    _retval = cast(bool)gtk_gl_area_get_use_es(cast(GtkGLArea*)this._cPtr);
    return _retval;
  }

  /**
      Ensures that the [gdk.glcontext.GLContext] used by area is associated with
      the [gtk.glarea.GLArea].
      
      This function is automatically called before emitting the
      [gtk.glarea.GLArea.render] signal, and doesn't normally need
      to be called by application code.
  */
  void makeCurrent()
  {
    gtk_gl_area_make_current(cast(GtkGLArea*)this._cPtr);
  }

  /**
      Marks the currently rendered data (if any) as invalid, and queues
      a redraw of the widget.
      
      This ensures that the [gtk.glarea.GLArea.render] signal
      is emitted during the draw.
      
      This is only needed when [gtk.glarea.GLArea.setAutoRender] has
      been called with a false value. The default behaviour is to
      emit [gtk.glarea.GLArea.render] on each draw.
  */
  void queueRender()
  {
    gtk_gl_area_queue_render(cast(GtkGLArea*)this._cPtr);
  }

  /**
      Sets the allowed APIs to create a context with.
      
      You should check [gtk.glarea.GLArea.api] before drawing
      with either API.
      
      By default, all APIs are allowed.
  
      Params:
        apis = the allowed APIs
  */
  void setAllowedApis(gdk.types.GLAPI apis)
  {
    gtk_gl_area_set_allowed_apis(cast(GtkGLArea*)this._cPtr, apis);
  }

  /**
      Sets whether the [gtk.glarea.GLArea] is in auto render mode.
      
      If auto_render is true the [gtk.glarea.GLArea.render] signal will
      be emitted every time the widget draws. This is the default and is
      useful if drawing the widget is faster.
      
      If auto_render is false the data from previous rendering is kept
      around and will be used for drawing the widget the next time,
      unless the window is resized. In order to force a rendering
      [gtk.glarea.GLArea.queueRender] must be called. This mode is
      useful when the scene changes seldom, but takes a long time to redraw.
  
      Params:
        autoRender = a boolean
  */
  void setAutoRender(bool autoRender)
  {
    gtk_gl_area_set_auto_render(cast(GtkGLArea*)this._cPtr, autoRender);
  }

  /**
      Sets an error on the area which will be shown instead of the
      GL rendering.
      
      This is useful in the `signalGtk.GLArea::create-context`
      signal if GL context creation fails.
  
      Params:
        error = a new [glib.error.ErrorWrap], or null to unset the error
  */
  void setError(glib.error.ErrorWrap error = null)
  {
    gtk_gl_area_set_error(cast(GtkGLArea*)this._cPtr, error ? cast(const(GError)*)error._cPtr : null);
  }

  /**
      Sets whether the [gtk.glarea.GLArea] should use a depth buffer.
      
      If has_depth_buffer is true the widget will allocate and
      enable a depth buffer for the target framebuffer. Otherwise
      there will be none.
  
      Params:
        hasDepthBuffer = true to add a depth buffer
  */
  void setHasDepthBuffer(bool hasDepthBuffer)
  {
    gtk_gl_area_set_has_depth_buffer(cast(GtkGLArea*)this._cPtr, hasDepthBuffer);
  }

  /**
      Sets whether the [gtk.glarea.GLArea] should use a stencil buffer.
      
      If has_stencil_buffer is true the widget will allocate and
      enable a stencil buffer for the target framebuffer. Otherwise
      there will be none.
  
      Params:
        hasStencilBuffer = true to add a stencil buffer
  */
  void setHasStencilBuffer(bool hasStencilBuffer)
  {
    gtk_gl_area_set_has_stencil_buffer(cast(GtkGLArea*)this._cPtr, hasStencilBuffer);
  }

  /**
      Sets the required version of OpenGL to be used when creating
      the context for the widget.
      
      This function must be called before the area has been realized.
  
      Params:
        major = the major version
        minor = the minor version
  */
  void setRequiredVersion(int major, int minor)
  {
    gtk_gl_area_set_required_version(cast(GtkGLArea*)this._cPtr, major, minor);
  }

  /**
      Sets whether the area should create an OpenGL or an OpenGL ES context.
      
      You should check the capabilities of the [gdk.glcontext.GLContext] before drawing
      with either API.
  
      Params:
        useEs = whether to use OpenGL or OpenGL ES
  
      Deprecated: Use [gtk.glarea.GLArea.setAllowedApis]
  */
  void setUseEs(bool useEs)
  {
    gtk_gl_area_set_use_es(cast(GtkGLArea*)this._cPtr, useEs);
  }

  /**
      Connect to `CreateContext` signal.
  
      Emitted when the widget is being realized.
        
        This allows you to override how the GL context is created.
        This is useful when you want to reuse an existing GL context,
        or if you want to try creating different kinds of GL options.
        
        If context creation fails then the signal handler can use
        [gtk.glarea.GLArea.setError] to register a more detailed error
        of how the construction failed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D gdk.glcontext.GLContext callback(gtk.glarea.GLArea gLArea))
  
          `gLArea` the instance the signal is connected to (optional)
  
          `Returns` a newly created [gdk.glcontext.GLContext];
                the [gtk.glarea.GLArea] widget will take ownership of the returned value.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectCreateContext(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T : gdk.glcontext.GLContext)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.glarea.GLArea)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(gdk.glcontext.GLContext)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("create-context", closure, after);
  }

  /**
      Connect to `Render` signal.
  
      Emitted every time the contents of the [gtk.glarea.GLArea] should be redrawn.
        
        The context is bound to the area prior to emitting this function,
        and the buffers are painted to the window once the emission terminates.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gdk.glcontext.GLContext context, gtk.glarea.GLArea gLArea))
  
          `context` the [gdk.glcontext.GLContext] used by area (optional)
  
          `gLArea` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
              false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectRender(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gdk.glcontext.GLContext)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.glarea.GLArea)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("render", closure, after);
  }

  /**
      Connect to `Resize` signal.
  
      Emitted once when the widget is realized, and then each time the widget
        is changed while realized.
        
        This is useful in order to keep GL state up to date with the widget size,
        like for instance camera properties which may depend on the width/height
        ratio.
        
        The GL context for the area is guaranteed to be current when this signal
        is emitted.
        
        The default handler sets up the GL viewport.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(int width, int height, gtk.glarea.GLArea gLArea))
  
          `width` the width of the viewport (optional)
  
          `height` the height of the viewport (optional)
  
          `gLArea` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectResize(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.glarea.GLArea)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("resize", closure, after);
  }
}
