/// Module for [Svg] class
module gtk.svg;

public import gid.basictypes;
import gdk.frame_clock;
import gdk.paintable;
import gdk.paintable_mixin;
import gid.gid;
import glib.bytes;
import glib.error;
import gobject.dclosure;
import gobject.gid_builder;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.symbolic_paintable;
import gtk.symbolic_paintable_mixin;
import gtk.types;

/**
    A paintable implementation that renders SVG, with animations.
    
    [gtk.svg.Svg] objects are created by parsing a subset of SVG,
    including SVG animations.
    
    [gtk.svg.Svg] fills or strokes paths with symbolic or fixed colors.
    It can have multiple states, and paths can be included in a subset
    of the states. States can have animations, and the transition
    between different states can also be animated.
    
    To show a static SVG image, it is enough to load the
    the SVG and use it like any other paintable.
    
    To play an SVG animation, use [gtk.svg.Svg.setFrameClock]
    to connect the paintable to a frame clock, and call
    [gtk.svg.Svg.play] after loading the SVG. The animation can
    be paused using [gtk.svg.Svg.pause].
    
    To set the current state, use [gtk.svg.Svg.setState].
    
    
    ## Error handling
    
    Loading an SVG into [gtk.svg.Svg] will always produce a (possibly empty)
    paintable. GTK will drop things that it can't handle and try to make
    sense of the rest.
    
    To track errors during parsing or rendering, connect to the
    [gtk.svg.Svg.error] signal.
    
    For parsing errors in the `GTK_SVG_ERROR` domain, the functions
    `func@Gtk.SvgError.get_start`, `func@Gtk.SvgError.get_end`,
    `func@Gtk.SvgError.get_element` and `func@Gtk.SvgError.get_attribute`
    can be used to obtain information about where the error occurred.
    
    
    ## The supported subset of SVG
    
    The paintable supports much of SVG 2, with some exceptions.
    
    Among the graphical elements, `<textPath>` and `<foreignObject>`
    are not supported.
    
    Among the structural elements, `<a>` and `<view>` are not supported.
    
    In the `<filter>` element, the following primitives are not
    supported: feConvolveMatrix, feDiffuseLighting,
    feMorphology, feSpecularLighting and feTurbulence.
    
    Support for the `mask` attribute is limited to just a url
    referring to the `<mask>` element by ID.
    
    In animation elements, the parsing of `begin` and `end` attributes
    is limited, and the `min` and `max` attributes are not supported.
    
    Lastly, there is only minimal CSS support (the style attribute,
    but not `<style>`), and no interactivity.
    
    
    ## SVG Extensions
    
    The paintable supports a number of [custom attributes](icon-format.html)
    that offer a convenient way to define states, transitions and animations.
    For example,
    
        <circle cx='5' cy='5' r='5'
                gpa:states='0 1'
                gpa:animation-type='automatic'
                gpa:animation-direction='segment'
                gpa:animation-duration='600ms'/>
    
    defines the circle to be shown in states 0 and 1, and animates a segment
    of the circle.
    
    <image src="svg-renderer1.svg">
    
    Note that the generated animations are implemented using standard
    SVG attributes (`visibility`, `stroke-dasharray, `stroke-dashoffset`,
    `pathLength` and `filter`). Setting these attributes in your SVG
    is therefore going to interfere with generated animations.
    
    To connect general SVG animations to the states of the paintable,
    use the custom `gpa:states(...)` condition in the `begin` and `end`
    attributes of SVG animation elements. For example,
    
        <animate href='path1'
                 attributeName='fill'
                 begin='gpa:states(0).begin'
                 dur='300ms'
                 fill='freeze'
                 from='black'
                 to='magenta'/>
    
    will make the fill color of path1 transition from black to
    magenta when the renderer enters state 0.
    
    <image src="svg-renderer2.svg">
    
    The `gpa:states(...)` condition triggers for upcoming state changes
    as well, to support fade-out transitions. For example,
    
        <animate href='path1'
                 attributeName='opacity'
                 begin='gpa:states(0).end -300ms'
                 dur='300ms'
                 fill='freeze'
                 from='1'
                 to='0'/>
    
    will start a fade-out of path1 300ms before state 0 ends.
    
    A variant of the `gpa:states(...)` condition allows specifying
    both before and after states:
    
        <animate href='path1'
                 attributeName='opacity'
                 begin='gpa:states(0, 1 2)'
                 dur='300ms'
                 fill='freeze'
                 from='1'
                 to='0'/>
    
    will start the animation when the state changes from 0 to 1 or
    from 0 to 2, but not when it changes from 0 to 3.
    
    In addition to the `gpa:fill` and `gpa:stroke` attributes, symbolic
    colors can also be specified as a custom paint server reference,
    like this: `url(#gpa:warning)`. This works in `fill` and `stroke`
    attributes, but also when specifying colors in SVG animation
    attributes like `to` or `values`.
    
    Note that the SVG syntax allows for a fallback RGB color to be
    specified after the url, for compatibility with other SVG consumers:
    
        fill='url(#gpa:warning) orange'
    
    In contrast to SVG 1.1 and 2.0, we allow the `transform` attribute
    to be animated with `<animate>`.
*/
class Svg : gobject.object.ObjectWrap, gdk.paintable.Paintable, gtk.symbolic_paintable.SymbolicPaintable
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_svg_get_type != &gidSymbolNotFound ? gtk_svg_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkSvg";
  }

  /** Returns `this`, for use in `with` statements. */
  override Svg self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtk.svg.Svg]
      Returns: New builder object
  */
  static SvgGidBuilder builder() nothrow
  {
    return new SvgGidBuilder;
  }

  /**
      Get `features` property.
      Returns: Enabled features for this paintable.
        
        Note that features have to be set before
        loading SVG data to take effect.
  */
  @property gtk.types.SvgFeatures features() nothrow
  {
    return getFeatures();
  }

  /**
      Set `features` property.
      Params:
        propval = Enabled features for this paintable.
          
          Note that features have to be set before
          loading SVG data to take effect.
  */
  @property void features(gtk.types.SvgFeatures propval) nothrow
  {
    setFeatures(propval);
  }

  /**
      Get `playing` property.
      Returns: Whether the paintable is currently animating its content.
        
        To set this property, use the [gtk.svg.Svg.play] and
        [gtk.svg.Svg.pause] functions.
  */
  @property bool playing() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("playing");
  }

  /**
      Set `playing` property.
      Params:
        propval = Whether the paintable is currently animating its content.
          
          To set this property, use the [gtk.svg.Svg.play] and
          [gtk.svg.Svg.pause] functions.
  */
  @property void playing(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("playing", propval);
  }

  /**
      Get `resource` property.
      Returns: Resource to load SVG data from.
        
        This property is meant to create a paintable
        from a resource in ui files.
  */
  @property string resource() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(string)("resource");
  }

  /**
      Set `resource` property.
      Params:
        propval = Resource to load SVG data from.
          
          This property is meant to create a paintable
          from a resource in ui files.
  */
  @property void resource(string propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(string)("resource", propval);
  }

  /**
      Get `state` property.
      Returns: The current state of the renderer.
        
        This can be a number between 0 and 63.
  */
  @property uint state() nothrow
  {
    return getState();
  }

  /**
      Set `state` property.
      Params:
        propval = The current state of the renderer.
          
          This can be a number between 0 and 63.
  */
  @property void state(uint propval) nothrow
  {
    setState(propval);
  }

  /**
      Get `weight` property.
      Returns: If not set to -1, this value overrides the weight used
        when rendering the paintable.
  */
  @property double weight() nothrow
  {
    return getWeight();
  }

  /**
      Set `weight` property.
      Params:
        propval = If not set to -1, this value overrides the weight used
          when rendering the paintable.
  */
  @property void weight(double propval) nothrow
  {
    setWeight(propval);
  }

  mixin PaintableT!();
  mixin SymbolicPaintableT!();

  /**
      Creates a new, empty SVG paintable.
      Returns: the paintable
  */
  this() nothrow
  {
    GtkSvg* _cretval;
    _cretval = gtk_svg_new();
    this(_cretval, Yes.Take);
  }

  /**
      Parses the SVG data in bytes and creates a paintable.
  
      Params:
        bytes = the data
      Returns: the paintable
  */
  static gtk.svg.Svg newFromBytes(glib.bytes.Bytes bytes) nothrow
  {
    GtkSvg* _cretval;
    _cretval = gtk_svg_new_from_bytes(bytes ? cast(GBytes*)bytes._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.svg.Svg)(cast(GtkSvg*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Parses the SVG data in the resource and creates a paintable.
  
      Params:
        path = the resource path
      Returns: the paintable
  */
  static gtk.svg.Svg newFromResource(string path) nothrow
  {
    GtkSvg* _cretval;
    const(char)* _path = path.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_svg_new_from_resource(_path);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.svg.Svg)(cast(GtkSvg*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Returns the currently enabled features.
      Returns: the enabled features
  */
  gtk.types.SvgFeatures getFeatures() nothrow
  {
    GtkSvgFeatures _cretval;
    _cretval = gtk_svg_get_features(cast(GtkSvg*)this._cPtr);
    gtk.types.SvgFeatures _retval = cast(gtk.types.SvgFeatures)_cretval;
    return _retval;
  }

  /**
      Gets the current state of the paintable.
      Returns: the state
  */
  uint getState() nothrow
  {
    uint _retval;
    _retval = gtk_svg_get_state(cast(GtkSvg*)this._cPtr);
    return _retval;
  }

  /**
      Returns a `NULL`-terminated array of
      state names, if available.
      
      Note that the returned array and the strings
      contained in it will only be valid until the
      [gtk.svg.Svg] is cleared or reloaded, so if you
      want to keep it around, you should make a copy.
  
      Params:
        length = return location for the number
            of strings that are returned
      Returns: the state names
  */
  string[] getStateNames(out uint length) nothrow
  {
    const(char*)* _cretval;
    _cretval = gtk_svg_get_state_names(cast(GtkSvg*)this._cPtr, cast(uint*)&length);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString!(No.Free);
    }
    return _retval;
  }

  /**
      Gets the value of the weight property.
      Returns: the weight
  */
  double getWeight() nothrow
  {
    double _retval;
    _retval = gtk_svg_get_weight(cast(GtkSvg*)this._cPtr);
    return _retval;
  }

  /**
      Loads SVG content into an existing SVG paintable.
      
      To track errors while loading SVG content,
      connect to the [gtk.svg.Svg.error] signal.
      
      This clears any previously loaded content.
  
      Params:
        bytes = the data to load
  */
  void loadFromBytes(glib.bytes.Bytes bytes) nothrow
  {
    gtk_svg_load_from_bytes(cast(GtkSvg*)this._cPtr, bytes ? cast(GBytes*)bytes._cPtr(No.Dup) : null);
  }

  /**
      Loads SVG content into an existing SVG paintable.
      
      To track errors while loading SVG content,
      connect to the [gtk.svg.Svg.error] signal.
      
      This clears any previously loaded content.
  
      Params:
        path = the resource path
  */
  void loadFromResource(string path) nothrow
  {
    const(char)* _path = path.toCString!(No.Malloc, No.Nullable);
    gtk_svg_load_from_resource(cast(GtkSvg*)this._cPtr, _path);
  }

  /**
      Stop any playing animations and state transitions.
      
      Animations can be paused and started repeatedly.
  */
  void pause() nothrow
  {
    gtk_svg_pause(cast(GtkSvg*)this._cPtr);
  }

  /**
      Start playing animations and state transitions.
      
      Animations can be paused and started repeatedly.
  */
  void play() nothrow
  {
    gtk_svg_play(cast(GtkSvg*)this._cPtr);
  }

  /**
      Serializes the content of the renderer as SVG.
      
      The SVG will be similar to the orignally loaded one,
      but is not guaranteed to be 100% identical.
      
      This function serializes the DOM, i.e. the results
      of parsing the SVG. It does not reflect the effect
      of applying animations.
      Returns: the serialized contents
  */
  glib.bytes.Bytes serialize() nothrow
  {
    GBytes* _cretval;
    _cretval = gtk_svg_serialize(cast(GtkSvg*)this._cPtr);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Enables or disables features of the SVG paintable.
      
      By default, all features are enabled.
      
      Note that this call only has an effect before the
      SVG is loaded.
  
      Params:
        features = features to enable
  */
  void setFeatures(gtk.types.SvgFeatures features) nothrow
  {
    gtk_svg_set_features(cast(GtkSvg*)this._cPtr, features);
  }

  /**
      Sets a frame clock.
      
      Without a frame clock, GtkSvg will not advance animations.
  
      Params:
        clock = the frame clock
  */
  void setFrameClock(gdk.frame_clock.FrameClock clock) nothrow
  {
    gtk_svg_set_frame_clock(cast(GtkSvg*)this._cPtr, clock ? cast(GdkFrameClock*)clock._cPtr(No.Dup) : null);
  }

  /**
      Sets the state of the paintable.
      
      If the paintable is currently playing, the state change
      will apply transitions that are defined in the SVG. If
      the paintable is not playing, the state change will take
      effect instantaneously.
  
      Params:
        state = the state to set, as a value between 0 and 63
  */
  void setState(uint state) nothrow
  {
    gtk_svg_set_state(cast(GtkSvg*)this._cPtr, state);
  }

  /**
      Sets the weight that is used when rendering.
      
      The weight affects the effective linewidth when stroking
      paths.
      
      The default value of -1 means to use the font weight
      from CSS.
  
      Params:
        weight = the font weight, as a value between -1 and 1000
  */
  void setWeight(double weight) nothrow
  {
    gtk_svg_set_weight(cast(GtkSvg*)this._cPtr, weight);
  }

  /**
      Serializes the paintable, and saves the result to a file.
  
      Params:
        filename = the file to save to
      Returns: true, unless an error occurred
      Throws: [ErrorWrap]
  */
  bool writeToFile(string filename)
  {
    bool _retval;
    const(char)* _filename = filename.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _retval = cast(bool)gtk_svg_write_to_file(cast(GtkSvg*)this._cPtr, _filename, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Connect to `Error` signal.
  
      Signals that an error occurred.
        
        Errors can occur both during parsing and during rendering.
        
        The expected error values are in the [gtk.types.SvgError] enumeration,
        context information about the location of parsing errors can
        be obtained with the various `gtk_svg_error` functions.
        
        Parsing errors are never fatal, so the parsing will resume after
        the error. Errors may however cause parts of the given data or
        even all of it to not be parsed at all. So it is a useful idea
        to check that the parsing succeeds by connecting to this signal.
        
        ::: note
            This signal is emitted in the middle of parsing or rendering,
            and if you handle it, you must be careful. Logging the errors
            you receive is fine, but modifying the widget hierarchy or
            changing the paintable state definitively isn't.
        
            If in doubt, defer to an idle.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(glib.error.ErrorWrap error, gtk.svg.Svg svg)`
  
          `error` the error (optional)
  
          `svg` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectError(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == glib.error.ErrorWrap)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.svg.Svg)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gtk.svg.Svg.error");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("error", closure, after);
  }
}

/// Fluent builder implementation template for [gtk.svg.Svg]
class SvgGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T, gdk.paintable.PaintableGidBuilderImpl!T, gtk.symbolic_paintable.SymbolicPaintableGidBuilderImpl!T
{

  mixin PaintableGidBuilderT!();
  mixin SymbolicPaintableGidBuilderT!();

  /**
      Set `features` property.
      Params:
        propval = Enabled features for this paintable.
          
          Note that features have to be set before
          loading SVG data to take effect.
      Returns: Builder instance for fluent chaining
  */
  T features(gtk.types.SvgFeatures propval) nothrow
  {
    return setProperty("features", propval);
  }

  /**
      Set `playing` property.
      Params:
        propval = Whether the paintable is currently animating its content.
          
          To set this property, use the [gtk.svg.Svg.play] and
          [gtk.svg.Svg.pause] functions.
      Returns: Builder instance for fluent chaining
  */
  T playing(bool propval) nothrow
  {
    return setProperty("playing", propval);
  }

  /**
      Set `resource` property.
      Params:
        propval = Resource to load SVG data from.
          
          This property is meant to create a paintable
          from a resource in ui files.
      Returns: Builder instance for fluent chaining
  */
  T resource(string propval) nothrow
  {
    return setProperty("resource", propval);
  }

  /**
      Set `state` property.
      Params:
        propval = The current state of the renderer.
          
          This can be a number between 0 and 63.
      Returns: Builder instance for fluent chaining
  */
  T state(uint propval) nothrow
  {
    return setProperty("state", propval);
  }

  /**
      Set `weight` property.
      Params:
        propval = If not set to -1, this value overrides the weight used
          when rendering the paintable.
      Returns: Builder instance for fluent chaining
  */
  T weight(double propval) nothrow
  {
    return setProperty("weight", propval);
  }
}

/// Fluent builder for [gtk.svg.Svg]
final class SvgGidBuilder : SvgGidBuilderImpl!SvgGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Svg build() nothrow
  {
    return new Svg(cast(void*)createGObject(Svg._getGType), Yes.Take);
  }
}
