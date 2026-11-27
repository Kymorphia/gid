/// Module for [CssProvider] class
module gid.gtk3.css_provider;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.file;
import gid.glib2.error;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.css_section;
import gid.gtk3.style_provider;
import gid.gtk3.style_provider_mixin;
import gid.gtk3.types;

/**
    GtkCssProvider is an object implementing the #GtkStyleProvider interface.
    It is able to parse [CSS-like][css-overview] input in order to style widgets.
    
    An application can make GTK+ parse a specific CSS style sheet by calling
    [gid.gtk4.css_provider.CssProvider.loadFromFile] or [gid.gtk4.css_provider.CssProvider.loadFromResource]
    and adding the provider with [gid.gtk4.style_context.StyleContext.addProvider] or
    [gid.gtk3.style_context.StyleContext.addProviderForScreen].
    
    In addition, certain files will be read when GTK+ is initialized. First, the
    file `$XDG_CONFIG_HOME/gtk-3.0/gtk.css` is loaded if it exists. Then, GTK+
    loads the first existing file among
    `XDG_DATA_HOME/themes/THEME/gtk-VERSION/gtk.css`,
    `$HOME/.themes/THEME/gtk-VERSION/gtk.css`,
    `$XDG_DATA_DIRS/themes/THEME/gtk-VERSION/gtk.css` and
    `DATADIR/share/themes/THEME/gtk-VERSION/gtk.css`, where `THEME` is the name of
    the current theme (see the #GtkSettings:gtk-theme-name setting), `DATADIR`
    is the prefix configured when GTK+ was compiled (unless overridden by the
    `GTK_DATA_PREFIX` environment variable), and `VERSION` is the GTK+ version number.
    If no file is found for the current version, GTK+ tries older versions all the
    way back to 3.0.
    
    In the same way, GTK+ tries to load a gtk-keys.css file for the current
    key theme, as defined by #GtkSettings:gtk-key-theme-name.
*/
@gidGir("CssProvider", "CssProviderClass")
class CssProvider : gid.gobject2.object.ObjectWrap, gid.gtk3.style_provider.StyleProvider
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
    return cast(void function())gtk_css_provider_get_type != &gidSymbolNotFound ? gtk_css_provider_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkCssProvider";
  }

  /** Returns `this`, for use in `with` statements. */
  override CssProvider self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.css_provider.CssProvider]
      Returns: New builder object
  */
  static CssProviderGidBuilder builder() nothrow
  {
    return new CssProviderGidBuilder;
  }

  mixin StyleProviderT!();

  /**
      Returns a newly created #GtkCssProvider.
      Returns: A new #GtkCssProvider
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkCssProvider* _cretval;
      _cretval = gtk_css_provider_new();
      this(_cretval, Yes.Take);
    }
  }

  /**
      Returns the provider containing the style settings used as a
      fallback for all widgets.
      Returns: The provider used for fallback styling.
                 This memory is owned by GTK+, and you must not free it.
  
      Deprecated: Use [gid.gtk4.css_provider.CssProvider.new_] instead.
  */
  static gid.gtk3.css_provider.CssProvider getDefault() nothrow
  {
    GtkCssProvider* _cretval;
    _cretval = gtk_css_provider_get_default();
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.css_provider.CssProvider)(cast(GtkCssProvider*)_cretval, No.Take);
    return _retval;
  }

  /**
      Loads a theme from the usual theme paths
  
      Params:
        name = A theme name
        variant = variant to load, for example, "dark", or
              null for the default
      Returns: a #GtkCssProvider with the theme loaded.
            This memory is owned by GTK+, and you must not free it.
  */
  static gid.gtk3.css_provider.CssProvider getNamed(string name, string variant = null) nothrow
  {
    GtkCssProvider* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    const(char)* _variant = variant.toCString!(No.Malloc, Yes.Nullable);
    _cretval = gtk_css_provider_get_named(_name, _variant);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.css_provider.CssProvider)(cast(GtkCssProvider*)_cretval, No.Take);
    return _retval;
  }

  /** */
  protected void vfuncParsingError(gid.gtk3.css_section.CssSection section, gid.glib2.error.ErrorWrap error)
  {
    auto _klass = cast(GtkCssProviderClass*)_vfuncClass;
    if (!_klass.parsingError)
      return;

    _klass.parsingError(cast(GtkCssProvider*)this._cPtr, section ? cast(GtkCssSection*)section._cPtr(No.Dup) : null, error ? cast(const(GError)*)error._cPtr(No.Dup) : null);
  }

  /**
      Loads data into css_provider, and by doing so clears any previously loaded
      information.
  
      Params:
        data = CSS data loaded in memory
      Returns: true. The return value is deprecated and false will only be
            returned for backwards compatibility reasons if an error is not
            null and a loading error occurred. To track errors while loading
            CSS, connect to the #GtkCssProvider::parsing-error signal.
      Throws: [ErrorWrap]
  */
  bool loadFromData(ubyte[] data)
  {
    bool _retval;
    ptrdiff_t _length;
    if (data)
      _length = cast(ptrdiff_t)data.length;

    auto _data = cast(ubyte*)data.ptr;
    GError *_err;
    _retval = cast(bool)gtk_css_provider_load_from_data(cast(GtkCssProvider*)this._cPtr, _data, _length, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Loads the data contained in file into css_provider, making it
      clear any previously loaded information.
  
      Params:
        file = #GFile pointing to a file to load
      Returns: true. The return value is deprecated and false will only be
            returned for backwards compatibility reasons if an error is not
            null and a loading error occurred. To track errors while loading
            CSS, connect to the #GtkCssProvider::parsing-error signal.
      Throws: [ErrorWrap]
  */
  bool loadFromFile(gid.gio2.file.File file)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gtk_css_provider_load_from_file(cast(GtkCssProvider*)this._cPtr, file ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)file)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Loads the data contained in path into css_provider, making it clear
      any previously loaded information.
  
      Params:
        path = the path of a filename to load, in the GLib filename encoding
      Returns: true. The return value is deprecated and false will only be
            returned for backwards compatibility reasons if an error is not
            null and a loading error occurred. To track errors while loading
            CSS, connect to the #GtkCssProvider::parsing-error signal.
      Throws: [ErrorWrap]
  */
  bool loadFromPath(string path)
  {
    bool _retval;
    const(char)* _path = path.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _retval = cast(bool)gtk_css_provider_load_from_path(cast(GtkCssProvider*)this._cPtr, _path, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Loads the data contained in the resource at resource_path into
      the #GtkCssProvider, clearing any previously loaded information.
      
      To track errors while loading CSS, connect to the
      #GtkCssProvider::parsing-error signal.
  
      Params:
        resourcePath = a #GResource resource path
  */
  void loadFromResource(string resourcePath) nothrow
  {
    const(char)* _resourcePath = resourcePath.toCString!(No.Malloc, No.Nullable);
    gtk_css_provider_load_from_resource(cast(GtkCssProvider*)this._cPtr, _resourcePath);
  }

  /**
      Converts the provider into a string representation in CSS
      format.
      
      Using [gid.gtk4.css_provider.CssProvider.loadFromData] with the return value
      from this function on a new provider created with
      [gid.gtk4.css_provider.CssProvider.new_] will basically create a duplicate of
      this provider.
      Returns: a new string representing the provider.
  */
  string toString_() nothrow
  {
    char* _cretval;
    _cretval = gtk_css_provider_to_string(cast(GtkCssProvider*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Connect to `ParsingError` signal.
  
      Signals that a parsing error occurred. the path, line and position
        describe the actual location of the error as accurately as possible.
        
        Parsing errors are never fatal, so the parsing will resume after
        the error. Errors may however cause parts of the given
        data or even all of it to not be parsed at all. So it is a useful idea
        to check that the parsing succeeds by connecting to this signal.
        
        Note that this signal may be emitted at any time as the css provider
        may opt to defer parsing parts or all of the input to a later time
        than when a loading function was called.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.css_section.CssSection section, gid.glib2.error.ErrorWrap error, gid.gtk3.css_provider.CssProvider cssProvider)`
  
          `section` section the error happened in (optional)
  
          `error` The parsing error (optional)
  
          `cssProvider` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectParsingError(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk3.css_section.CssSection)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gid.glib2.error.ErrorWrap)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk3.css_provider.CssProvider)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.css_provider.CssProvider.parsingError");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("parsing-error", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from CssProvider
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk3.css_provider.CssProvider), T.stringof ~ " is not derived from gid.gtk3.css_provider.CssProvider");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncParsingError", true)[0]) == gid.gtk3.css_provider.CssProvider))
      _installVfunc(klass, "parsing_error");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkCssProviderClass*)klass;

    switch (vfunc)
    {
      case "parsing_error":
      {
        static extern(C) void _vfuncParsingErrorTramp(GtkCssProvider* provider, GtkCssSection* section, const(GError)* error) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.css_provider.CssProvider)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)provider);
          if (!_obj)
          {
            auto _klass = cast(GtkCssProviderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)provider);
            if (_klass.parsingError)
              return (cast(typeof(&_vfuncParsingErrorTramp))_klass.parsingError)(provider, section, error);
            return;
          }

          auto _section = section ? new gid.gtk3.css_section.CssSection(cast(void*)section, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncParsingError(_section, error ? new gid.glib2.error.ErrorWrap(cast(void*)error, No.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.css_provider.CssProvider.vfuncParsingError");
          }
          if (_section)
            _section._cUnborrow;

        }

        _klass.parsingError = cast(typeof(_klass.parsingError))&_vfuncParsingErrorTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.css_provider.CssProvider]
class CssProviderGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gtk3.style_provider.StyleProviderGidBuilderImpl!T
{

  mixin StyleProviderGidBuilderT!();
}

/// Fluent builder for [gid.gtk3.css_provider.CssProvider]
final class CssProviderGidBuilder : CssProviderGidBuilderImpl!CssProviderGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  CssProvider build() nothrow
  {
    return new CssProvider(cast(void*)createGObject(CssProvider._getGType), Yes.Take);
  }
}
