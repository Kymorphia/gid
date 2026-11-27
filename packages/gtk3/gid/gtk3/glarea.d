/// Module for [GLArea] class
module gid.gtk3.glarea;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gdk3.glcontext;
import gid.glib2.error;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.types;
import gid.gtk3.widget;

/**
    #GtkGLArea is a widget that allows drawing with OpenGL.
    
    #GtkGLArea sets up its own #GdkGLContext for the window it creates, and
    creates a custom GL framebuffer that the widget will do GL rendering onto.
    It also ensures that this framebuffer is the default GL rendering target
    when rendering.
    
    In order to draw, you have to connect to the #GtkGLArea::render signal,
    or subclass #GtkGLArea and override the @GtkGLAreaClass.render() virtual
    function.
    
    The #GtkGLArea widget ensures that the #GdkGLContext is associated with
    the widget's drawing area, and it is kept updated when the size and
    position of the drawing area changes.
    
    ## Drawing with GtkGLArea ##
    
    The simplest way to draw using OpenGL commands in a #GtkGLArea is to
    create a widget instance and connect to the #GtkGLArea::render signal:
    
    ```c
      // create a GtkGLArea instance
      GtkWidget *gl_area = gtk_gl_area_new ();
    
      // connect to the "render" signal
      g_signal_connect (gl_area, "render", G_CALLBACK (render), NULL);
    ```
    
    The `render()` function will be called when the #GtkGLArea is ready
    for you to draw its content:
    
    ```c
      static gboolean
      render (GtkGLArea *area, GdkGLContext *context)
      {
        // inside this function it's safe to use GL; the given
        // #GdkGLContext has been made current to the drawable
        // surface used by the #GtkGLArea and the viewport has
        // already been set to be the size of the allocation
    
        // we can start by clearing the buffer
        glClearColor (0, 0, 0, 0);
        glClear (GL_COLOR_BUFFER_BIT);
    
        // draw your object
        draw_an_object ();
    
        // we completed our drawing; the draw commands will be
        // flushed at the end of the signal emission chain, and
        // the buffers will be drawn on the window
        return TRUE;
      }
    ```
    
    If you need to initialize OpenGL state, e.g. buffer objects or
    shaders, you should use the #GtkWidget::realize signal; you
    can use the #GtkWidget::unrealize signal to clean up. Since the
    #GdkGLContext creation and initialization may fail, you will
    need to check for errors, using [gid.gtk4.glarea.GLArea.getError]. An example
    of how to safely initialize the GL state is:
    
    ```c
      static void
      on_realize (GtkGLarea *area)
      {
        // We need to make the context current if we want to
        // call GL API
        gtk_gl_area_make_current (area);
    
        // If there were errors during the initialization or
        // when trying to make the context current, this
        // function will return a #GError for you to catch
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
    
    If you need to change the options for creating the #GdkGLContext
    you should use the #GtkGLArea::create-context signal.
*/
@gidGir("GLArea", "GLAreaClass")
class GLArea : gid.gtk3.widget.Widget
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_gl_area_get_type != &gidSymbolNotFound ? gtk_gl_area_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkGLArea";
  }

  /** Returns `this`, for use in `with` statements. */
  override GLArea self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.glarea.GLArea]
      Returns: New builder object
  */
  static GLAreaGidBuilder builder() nothrow
  {
    return new GLAreaGidBuilder;
  }

  /**
      Get `autoRender` property.
      Returns: If set to true the #GtkGLArea::render signal will be emitted every time
        the widget draws. This is the default and is useful if drawing the widget
        is faster.
        
        If set to false the data from previous rendering is kept around and will
        be used for drawing the widget the next time, unless the window is resized.
        In order to force a rendering [gid.gtk4.glarea.GLArea.queueRender] must be called.
        This mode is useful when the scene changes seldomly, but takes a long time
        to redraw.
  */
  @property bool autoRender() nothrow
  {
    return getAutoRender();
  }

  /**
      Set `autoRender` property.
      Params:
        propval = If set to true the #GtkGLArea::render signal will be emitted every time
          the widget draws. This is the default and is useful if drawing the widget
          is faster.
          
          If set to false the data from previous rendering is kept around and will
          be used for drawing the widget the next time, unless the window is resized.
          In order to force a rendering [gid.gtk4.glarea.GLArea.queueRender] must be called.
          This mode is useful when the scene changes seldomly, but takes a long time
          to redraw.
  */
  @property void autoRender(bool propval) nothrow
  {
    setAutoRender(propval);
  }

  /**
      Get `context` property.
      Returns: The #GdkGLContext used by the #GtkGLArea widget.
        
        The #GtkGLArea widget is responsible for creating the #GdkGLContext
        instance. If you need to render with other kinds of buffers (stencil,
        depth, etc), use render buffers.
  */
  @property gid.gdk3.glcontext.GLContext context() nothrow
  {
    return getContext();
  }

  /**
      Get `hasAlpha` property.
      Returns: If set to true the buffer allocated by the widget will have an alpha channel
        component, and when rendering to the window the result will be composited over
        whatever is below the widget.
        
        If set to false there will be no alpha channel, and the buffer will fully
        replace anything below the widget.
  */
  @property bool hasAlpha() nothrow
  {
    return getHasAlpha();
  }

  /**
      Set `hasAlpha` property.
      Params:
        propval = If set to true the buffer allocated by the widget will have an alpha channel
          component, and when rendering to the window the result will be composited over
          whatever is below the widget.
          
          If set to false there will be no alpha channel, and the buffer will fully
          replace anything below the widget.
  */
  @property void hasAlpha(bool propval) nothrow
  {
    setHasAlpha(propval);
  }

  /**
      Get `hasDepthBuffer` property.
      Returns: If set to true the widget will allocate and enable a depth buffer for the
        target framebuffer.
  */
  @property bool hasDepthBuffer() nothrow
  {
    return getHasDepthBuffer();
  }

  /**
      Set `hasDepthBuffer` property.
      Params:
        propval = If set to true the widget will allocate and enable a depth buffer for the
          target framebuffer.
  */
  @property void hasDepthBuffer(bool propval) nothrow
  {
    setHasDepthBuffer(propval);
  }

  /**
      Get `hasStencilBuffer` property.
      Returns: If set to true the widget will allocate and enable a stencil buffer for the
        target framebuffer.
  */
  @property bool hasStencilBuffer() nothrow
  {
    return getHasStencilBuffer();
  }

  /**
      Set `hasStencilBuffer` property.
      Params:
        propval = If set to true the widget will allocate and enable a stencil buffer for the
          target framebuffer.
  */
  @property void hasStencilBuffer(bool propval) nothrow
  {
    setHasStencilBuffer(propval);
  }

  /**
      Get `useEs` property.
      Returns: If set to true the widget will try to create a #GdkGLContext using
        OpenGL ES instead of OpenGL.
        
        See also: [gid.gdk4.glcontext.GLContext.setUseEs]
  */
  @property bool useEs() nothrow
  {
    return getUseEs();
  }

  /**
      Set `useEs` property.
      Params:
        propval = If set to true the widget will try to create a #GdkGLContext using
          OpenGL ES instead of OpenGL.
          
          See also: [gid.gdk4.glcontext.GLContext.setUseEs]
  */
  @property void useEs(bool propval) nothrow
  {
    setUseEs(propval);
  }

  /**
      Creates a new #GtkGLArea widget.
      Returns: a new #GtkGLArea
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = gtk_gl_area_new();
      this(_cretval, No.Take);
    }
  }

  /**
      class closure for the #GtkGLArea::render signal
  
      Params:
        context = 
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncRender` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncRender(gid.gdk3.glcontext.GLContext context)
  {
    auto _klass = cast(GtkGLAreaClass*)_vfuncClass;
    if (!_klass.render)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.render(cast(GtkGLArea*)this._cPtr, context ? cast(GdkGLContext*)context._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      class closeure for the #GtkGLArea::resize signal
  
      Params:
        width = 
        height = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncResize` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncResize(int width, int height)
  {
    auto _klass = cast(GtkGLAreaClass*)_vfuncClass;
    if (!_klass.resize)
      return;

    _klass.resize(cast(GtkGLArea*)this._cPtr, width, height);
  }

  /**
      Ensures that the area framebuffer object is made the current draw
      and read target, and that all the required buffers for the area
      are created and bound to the frambuffer.
      
      This function is automatically called before emitting the
      #GtkGLArea::render signal, and doesn't normally need to be called
      by application code.
  */
  void attachBuffers() nothrow
  {
    gtk_gl_area_attach_buffers(cast(GtkGLArea*)this._cPtr);
  }

  /**
      Returns whether the area is in auto render mode or not.
      Returns: true if the area is auto rendering, false otherwise
  */
  bool getAutoRender() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_gl_area_get_auto_render(cast(GtkGLArea*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the #GdkGLContext used by area.
      Returns: the #GdkGLContext
  */
  gid.gdk3.glcontext.GLContext getContext() nothrow
  {
    GdkGLContext* _cretval;
    _cretval = gtk_gl_area_get_context(cast(GtkGLArea*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.glcontext.GLContext)(cast(GdkGLContext*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the current error set on the area.
      Returns: the #GError or null
  */
  gid.glib2.error.ErrorWrap getError() nothrow
  {
    GError* _cretval;
    _cretval = gtk_gl_area_get_error(cast(GtkGLArea*)this._cPtr);
    auto _retval = _cretval ? new gid.glib2.error.ErrorWrap(cast(GError*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Returns whether the area has an alpha component.
      Returns: true if the area has an alpha component, false otherwise
  */
  bool getHasAlpha() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_gl_area_get_has_alpha(cast(GtkGLArea*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the area has a depth buffer.
      Returns: true if the area has a depth buffer, false otherwise
  */
  bool getHasDepthBuffer() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_gl_area_get_has_depth_buffer(cast(GtkGLArea*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the area has a stencil buffer.
      Returns: true if the area has a stencil buffer, false otherwise
  */
  bool getHasStencilBuffer() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_gl_area_get_has_stencil_buffer(cast(GtkGLArea*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the required version of OpenGL set
      using [gid.gtk4.glarea.GLArea.setRequiredVersion].
  
      Params:
        major = return location for the required major version
        minor = return location for the required minor version
  */
  void getRequiredVersion(out int major, out int minor) nothrow
  {
    gtk_gl_area_get_required_version(cast(GtkGLArea*)this._cPtr, cast(int*)&major, cast(int*)&minor);
  }

  /**
      Retrieves the value set by [gid.gtk4.glarea.GLArea.setUseEs].
      Returns: true if the #GtkGLArea should create an OpenGL ES context
          and false otherwise
  */
  bool getUseEs() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_gl_area_get_use_es(cast(GtkGLArea*)this._cPtr);
    return _retval;
  }

  /**
      Ensures that the #GdkGLContext used by area is associated with
      the #GtkGLArea.
      
      This function is automatically called before emitting the
      #GtkGLArea::render signal, and doesn't normally need to be called
      by application code.
  */
  void makeCurrent() nothrow
  {
    gtk_gl_area_make_current(cast(GtkGLArea*)this._cPtr);
  }

  /**
      Marks the currently rendered data (if any) as invalid, and queues
      a redraw of the widget, ensuring that the #GtkGLArea::render signal
      is emitted during the draw.
      
      This is only needed when the [gid.gtk4.glarea.GLArea.setAutoRender] has
      been called with a false value. The default behaviour is to
      emit #GtkGLArea::render on each draw.
  */
  void queueRender() nothrow
  {
    gtk_gl_area_queue_render(cast(GtkGLArea*)this._cPtr);
  }

  /**
      If auto_render is true the #GtkGLArea::render signal will be
      emitted every time the widget draws. This is the default and is
      useful if drawing the widget is faster.
      
      If auto_render is false the data from previous rendering is kept
      around and will be used for drawing the widget the next time,
      unless the window is resized. In order to force a rendering
      [gid.gtk4.glarea.GLArea.queueRender] must be called. This mode is useful when
      the scene changes seldomly, but takes a long time to redraw.
  
      Params:
        autoRender = a boolean
  */
  void setAutoRender(bool autoRender) nothrow
  {
    gtk_gl_area_set_auto_render(cast(GtkGLArea*)this._cPtr, autoRender);
  }

  /**
      Sets an error on the area which will be shown instead of the
      GL rendering. This is useful in the #GtkGLArea::create-context
      signal if GL context creation fails.
  
      Params:
        error = a new #GError, or null to unset the error
  */
  void setError(gid.glib2.error.ErrorWrap error = null) nothrow
  {
    gtk_gl_area_set_error(cast(GtkGLArea*)this._cPtr, error ? cast(const(GError)*)error._cPtr(No.Dup) : null);
  }

  /**
      If has_alpha is true the buffer allocated by the widget will have
      an alpha channel component, and when rendering to the window the
      result will be composited over whatever is below the widget.
      
      If has_alpha is false there will be no alpha channel, and the
      buffer will fully replace anything below the widget.
  
      Params:
        hasAlpha = true to add an alpha component
  */
  void setHasAlpha(bool hasAlpha) nothrow
  {
    gtk_gl_area_set_has_alpha(cast(GtkGLArea*)this._cPtr, hasAlpha);
  }

  /**
      If has_depth_buffer is true the widget will allocate and
      enable a depth buffer for the target framebuffer. Otherwise
      there will be none.
  
      Params:
        hasDepthBuffer = true to add a depth buffer
  */
  void setHasDepthBuffer(bool hasDepthBuffer) nothrow
  {
    gtk_gl_area_set_has_depth_buffer(cast(GtkGLArea*)this._cPtr, hasDepthBuffer);
  }

  /**
      If has_stencil_buffer is true the widget will allocate and
      enable a stencil buffer for the target framebuffer. Otherwise
      there will be none.
  
      Params:
        hasStencilBuffer = true to add a stencil buffer
  */
  void setHasStencilBuffer(bool hasStencilBuffer) nothrow
  {
    gtk_gl_area_set_has_stencil_buffer(cast(GtkGLArea*)this._cPtr, hasStencilBuffer);
  }

  /**
      Sets the required version of OpenGL to be used when creating the context
      for the widget.
      
      This function must be called before the area has been realized.
  
      Params:
        major = the major version
        minor = the minor version
  */
  void setRequiredVersion(int major, int minor) nothrow
  {
    gtk_gl_area_set_required_version(cast(GtkGLArea*)this._cPtr, major, minor);
  }

  /**
      Sets whether the area should create an OpenGL or an OpenGL ES context.
      
      You should check the capabilities of the #GdkGLContext before drawing
      with either API.
  
      Params:
        useEs = whether to use OpenGL or OpenGL ES
  */
  void setUseEs(bool useEs) nothrow
  {
    gtk_gl_area_set_use_es(cast(GtkGLArea*)this._cPtr, useEs);
  }

  /**
      Connect to `CreateContext` signal.
  
      The ::create-context signal is emitted when the widget is being
        realized, and allows you to override how the GL context is
        created. This is useful when you want to reuse an existing GL
        context, or if you want to try creating different kinds of GL
        options.
        
        If context creation fails then the signal handler can use
        [gid.gtk4.glarea.GLArea.setError] to register a more detailed error
        of how the construction failed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `gid.gdk3.glcontext.GLContext callback(gid.gtk3.glarea.GLArea gLArea)`
  
          `gLArea` the instance the signal is connected to (optional)
  
          `Returns` a newly created #GdkGLContext;
                the #GtkGLArea widget will take ownership of the returned value.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectCreateContext(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T : gid.gdk3.glcontext.GLContext)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.glarea.GLArea)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      gid.gdk3.glcontext.GLContext _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.glarea.GLArea.createContext");
      }

      setVal!(gid.gdk3.glcontext.GLContext)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("create-context", closure, after);
  }

  /**
      Connect to `Render` signal.
  
      The ::render signal is emitted every time the contents
        of the #GtkGLArea should be redrawn.
        
        The context is bound to the area prior to emitting this function,
        and the buffers are painted to the window once the emission terminates.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(gid.gdk3.glcontext.GLContext context, gid.gtk3.glarea.GLArea gLArea)`
  
          `context` the #GdkGLContext used by area (optional)
  
          `gLArea` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
              false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectRender(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gdk3.glcontext.GLContext)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.glarea.GLArea)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.glarea.GLArea.render");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("render", closure, after);
  }

  /**
      Connect to `Resize` signal.
  
      The ::resize signal is emitted once when the widget is realized, and
        then each time the widget is changed while realized. This is useful
        in order to keep GL state up to date with the widget size, like for
        instance camera properties which may depend on the width/height ratio.
        
        The GL context for the area is guaranteed to be current when this signal
        is emitted.
        
        The default handler sets up the GL viewport.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(int width, int height, gid.gtk3.glarea.GLArea gLArea)`
  
          `width` the width of the viewport (optional)
  
          `height` the height of the viewport (optional)
  
          `gLArea` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectResize(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk3.glarea.GLArea)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.glarea.GLArea.resize");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("resize", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from GLArea
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk3.glarea.GLArea), T.stringof ~ " is not derived from gid.gtk3.glarea.GLArea");

    gid.gtk3.widget.Widget._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncRender", true)[0]) == gid.gtk3.glarea.GLArea))
      _installVfunc(klass, "render");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncResize", true)[0]) == gid.gtk3.glarea.GLArea))
      _installVfunc(klass, "resize");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkGLAreaClass*)klass;

    switch (vfunc)
    {
      case "render":
      {
        static extern(C) gboolean _vfuncRenderTramp(GtkGLArea* area, GdkGLContext* context) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.glarea.GLArea)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)area);
          if (!_obj)
          {
            auto _klass = cast(GtkGLAreaClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)area);
            if (_klass.render)
              return (cast(typeof(&_vfuncRenderTramp))_klass.render)(area, context);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncRender(gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.glcontext.GLContext)(cast(void*)context, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.glarea.GLArea.vfuncRender");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.render = cast(typeof(_klass.render))&_vfuncRenderTramp;
        break;
      }
      case "resize":
      {
        static extern(C) void _vfuncResizeTramp(GtkGLArea* area, int width, int height) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.glarea.GLArea)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)area);
          if (!_obj)
          {
            auto _klass = cast(GtkGLAreaClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)area);
            if (_klass.resize)
              return (cast(typeof(&_vfuncResizeTramp))_klass.resize)(area, width, height);
            return;
          }

          try
          {
            _obj.vfuncResize(width, height);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.glarea.GLArea.vfuncResize");
          }
        }

        _klass.resize = cast(typeof(_klass.resize))&_vfuncResizeTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.glarea.GLArea]
class GLAreaGidBuilderImpl(T) : gid.gtk3.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `autoRender` property.
      Params:
        propval = If set to true the #GtkGLArea::render signal will be emitted every time
          the widget draws. This is the default and is useful if drawing the widget
          is faster.
          
          If set to false the data from previous rendering is kept around and will
          be used for drawing the widget the next time, unless the window is resized.
          In order to force a rendering [gid.gtk4.glarea.GLArea.queueRender] must be called.
          This mode is useful when the scene changes seldomly, but takes a long time
          to redraw.
      Returns: Builder instance for fluent chaining
  */
  T autoRender(bool propval) nothrow
  {
    return setProperty("auto-render", propval);
  }

  /**
      Set `hasAlpha` property.
      Params:
        propval = If set to true the buffer allocated by the widget will have an alpha channel
          component, and when rendering to the window the result will be composited over
          whatever is below the widget.
          
          If set to false there will be no alpha channel, and the buffer will fully
          replace anything below the widget.
      Returns: Builder instance for fluent chaining
  */
  T hasAlpha(bool propval) nothrow
  {
    return setProperty("has-alpha", propval);
  }

  /**
      Set `hasDepthBuffer` property.
      Params:
        propval = If set to true the widget will allocate and enable a depth buffer for the
          target framebuffer.
      Returns: Builder instance for fluent chaining
  */
  T hasDepthBuffer(bool propval) nothrow
  {
    return setProperty("has-depth-buffer", propval);
  }

  /**
      Set `hasStencilBuffer` property.
      Params:
        propval = If set to true the widget will allocate and enable a stencil buffer for the
          target framebuffer.
      Returns: Builder instance for fluent chaining
  */
  T hasStencilBuffer(bool propval) nothrow
  {
    return setProperty("has-stencil-buffer", propval);
  }

  /**
      Set `useEs` property.
      Params:
        propval = If set to true the widget will try to create a #GdkGLContext using
          OpenGL ES instead of OpenGL.
          
          See also: [gid.gdk4.glcontext.GLContext.setUseEs]
      Returns: Builder instance for fluent chaining
  */
  T useEs(bool propval) nothrow
  {
    return setProperty("use-es", propval);
  }
}

/// Fluent builder for [gid.gtk3.glarea.GLArea]
final class GLAreaGidBuilder : GLAreaGidBuilderImpl!GLAreaGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  GLArea build() nothrow
  {
    return new GLArea(cast(void*)createGObject(GLArea._getGType), Yes.Take);
  }
}
