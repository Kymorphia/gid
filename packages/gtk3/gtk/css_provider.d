/// Module for [CssProvider] class
module gtk.css_provider;

import gid.gid;
import gio.file;
import glib.error;
import gobject.dclosure;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.css_section;
import gtk.style_provider;
import gtk.style_provider_mixin;
import gtk.types;

/**
    GtkCssProvider is an object implementing the #GtkStyleProvider interface.
    It is able to parse [CSS-like][css-overview] input in order to style widgets.
    
    An application can make GTK+ parse a specific CSS style sheet by calling
    [gtk.css_provider.CssProvider.loadFromFile] or [gtk.css_provider.CssProvider.loadFromResource]
    and adding the provider with [gtk.style_context.StyleContext.addProvider] or
    [gtk.style_context.StyleContext.addProviderForScreen].
    
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
class CssProvider : gobject.object.ObjectWrap, gtk.style_provider.StyleProvider
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
    return cast(void function())gtk_css_provider_get_type != &gidSymbolNotFound ? gtk_css_provider_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CssProvider self()
  {
    return this;
  }

  mixin StyleProviderT!();

  /**
      Returns a newly created #GtkCssProvider.
      Returns: A new #GtkCssProvider
  */
  this()
  {
    GtkCssProvider* _cretval;
    _cretval = gtk_css_provider_new();
    this(_cretval, Yes.Take);
  }

  /**
      Returns the provider containing the style settings used as a
      fallback for all widgets.
      Returns: The provider used for fallback styling.
                 This memory is owned by GTK+, and you must not free it.
  
      Deprecated: Use [gtk.css_provider.CssProvider.new_] instead.
  */
  static gtk.css_provider.CssProvider getDefault()
  {
    GtkCssProvider* _cretval;
    _cretval = gtk_css_provider_get_default();
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.css_provider.CssProvider)(cast(GtkCssProvider*)_cretval, No.Take);
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
  static gtk.css_provider.CssProvider getNamed(string name, string variant = null)
  {
    GtkCssProvider* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _variant = variant.toCString(No.Alloc);
    _cretval = gtk_css_provider_get_named(_name, _variant);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.css_provider.CssProvider)(cast(GtkCssProvider*)_cretval, No.Take);
    return _retval;
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

    auto _data = cast(const(ubyte)*)data.ptr;
    GError *_err;
    _retval = cast(bool)gtk_css_provider_load_from_data(cast(GtkCssProvider*)this._cPtr, _data, _length, &_err);
    if (_err)
      throw new ErrorWrap(_err);
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
  bool loadFromFile(gio.file.File file)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gtk_css_provider_load_from_file(cast(GtkCssProvider*)this._cPtr, file ? cast(GFile*)(cast(gobject.object.ObjectWrap)file)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
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
    const(char)* _path = path.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)gtk_css_provider_load_from_path(cast(GtkCssProvider*)this._cPtr, _path, &_err);
    if (_err)
      throw new ErrorWrap(_err);
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
  void loadFromResource(string resourcePath)
  {
    const(char)* _resourcePath = resourcePath.toCString(No.Alloc);
    gtk_css_provider_load_from_resource(cast(GtkCssProvider*)this._cPtr, _resourcePath);
  }

  /**
      Converts the provider into a string representation in CSS
      format.
      
      Using [gtk.css_provider.CssProvider.loadFromData] with the return value
      from this function on a new provider created with
      [gtk.css_provider.CssProvider.new_] will basically create a duplicate of
      this provider.
      Returns: a new string representing the provider.
  */
  string toString_()
  {
    char* _cretval;
    _cretval = gtk_css_provider_to_string(cast(GtkCssProvider*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
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
  
          $(D void callback(gtk.css_section.CssSection section, glib.error.ErrorWrap error, gtk.css_provider.CssProvider cssProvider))
  
          `section` section the error happened in (optional)
  
          `error` The parsing error (optional)
  
          `cssProvider` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectParsingError(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.css_section.CssSection)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == glib.error.ErrorWrap)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.css_provider.CssProvider)))
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
    return connectSignalClosure("parsing-error", closure, after);
  }
}
