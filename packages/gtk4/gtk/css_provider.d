/// Module for [CssProvider] class
module gtk.css_provider;

public import gid.basictypes;
import gid.gid;
import gio.file;
import glib.bytes;
import glib.error;
import gobject.dclosure;
import gobject.gid_builder;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.css_section;
import gtk.style_provider;
import gtk.style_provider_mixin;
import gtk.types;

/**
    [gtk.css_provider.CssProvider] is an object implementing the [gtk.style_provider.StyleProvider] interface
    for CSS.
    
    It is able to parse CSS-like input in order to style widgets.
    
    An application can make GTK parse a specific CSS style sheet by calling
    [gtk.css_provider.CssProvider.loadFromFile] or
    [gtk.css_provider.CssProvider.loadFromResource]
    and adding the provider with [gtk.style_context.StyleContext.addProvider] or
    [gtk.style_context.StyleContext.addProviderForDisplay].
    
    In addition, certain files will be read when GTK is initialized.
    First, the file `$XDG_CONFIG_HOME/gtk-4.0/gtk.css` is loaded if it
    exists. Then, GTK loads the first existing file among
    `XDG_DATA_HOME/themes/THEME/gtk-VERSION/gtk-VARIANT.css`,
    `$HOME/.themes/THEME/gtk-VERSION/gtk-VARIANT.css`,
    `$XDG_DATA_DIRS/themes/THEME/gtk-VERSION/gtk-VARIANT.css` and
    `DATADIR/share/themes/THEME/gtk-VERSION/gtk-VARIANT.css`,
    where `THEME` is the name of the current theme (see the
    [gtk.settings.Settings.gtkThemeName] setting), `VARIANT` is the
    variant to load (see the
    [gtk.settings.Settings.gtkApplicationPreferDarkTheme] setting),
    `DATADIR` is the prefix configured when GTK was compiled (unless
    overridden by the `GTK_DATA_PREFIX` environment variable), and
    `VERSION` is the GTK version number. If no file is found for the
    current version, GTK tries older versions all the way back to 4.0.
    
    To track errors while loading CSS, connect to the
    [gtk.css_provider.CssProvider.parsingError] signal.
*/
class CssProvider : gobject.object.ObjectWrap, gtk.style_provider.StyleProvider
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_css_provider_get_type != &gidSymbolNotFound ? gtk_css_provider_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CssProvider self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtk.css_provider.CssProvider]
      Returns: New builder object
  */
  static CssProviderGidBuilder builder() nothrow
  {
    return new CssProviderGidBuilder;
  }

  mixin StyleProviderT!();

  /**
      Returns a newly created [gtk.css_provider.CssProvider].
      Returns: A new [gtk.css_provider.CssProvider]
  */
  this() nothrow
  {
    GtkCssProvider* _cretval;
    _cretval = gtk_css_provider_new();
    this(_cretval, Yes.Take);
  }

  /**
      Loads data into css_provider.
      
      This clears any previously loaded information.
  
      Params:
        data = [glib.bytes.Bytes] containing the data to load
  */
  void loadFromBytes(glib.bytes.Bytes data) nothrow
  {
    gtk_css_provider_load_from_bytes(cast(GtkCssProvider*)this._cPtr, data ? cast(GBytes*)data._cPtr(No.Dup) : null);
  }

  /**
      Loads data into css_provider.
      
      This clears any previously loaded information.
  
      Params:
        data = CSS data to be parsed
  
      Deprecated: Use [gtk.css_provider.CssProvider.loadFromString]
          or [gtk.css_provider.CssProvider.loadFromBytes] instead
  */
  void loadFromData(string data) nothrow
  {
    ptrdiff_t _length;
    if (data)
      _length = cast(ptrdiff_t)data.length;

    auto _data = data.ptr ? cast(const(char)*)data.ptr : [char.init].ptr;
    gtk_css_provider_load_from_data(cast(GtkCssProvider*)this._cPtr, _data, _length);
  }

  /**
      Loads the data contained in file into css_provider.
      
      This clears any previously loaded information.
  
      Params:
        file = [gio.file.File] pointing to a file to load
  */
  void loadFromFile(gio.file.File file) nothrow
  {
    gtk_css_provider_load_from_file(cast(GtkCssProvider*)this._cPtr, file ? cast(GFile*)(cast(gobject.object.ObjectWrap)file)._cPtr(No.Dup) : null);
  }

  /**
      Loads the data contained in path into css_provider.
      
      This clears any previously loaded information.
  
      Params:
        path = the path of a filename to load, in the GLib filename encoding
  */
  void loadFromPath(string path) nothrow
  {
    const(char)* _path = path.toCString!(No.Malloc, No.Nullable);
    gtk_css_provider_load_from_path(cast(GtkCssProvider*)this._cPtr, _path);
  }

  /**
      Loads the data contained in the resource at resource_path into
      the css_provider.
      
      This clears any previously loaded information.
  
      Params:
        resourcePath = a [gio.resource.Resource] resource path
  */
  void loadFromResource(string resourcePath) nothrow
  {
    const(char)* _resourcePath = resourcePath.toCString!(No.Malloc, No.Nullable);
    gtk_css_provider_load_from_resource(cast(GtkCssProvider*)this._cPtr, _resourcePath);
  }

  /**
      Loads string into css_provider.
      
      This clears any previously loaded information.
  
      Params:
        string_ = the CSS to load
  */
  void loadFromString(string string_) nothrow
  {
    const(char)* _string_ = string_.toCString!(No.Malloc, No.Nullable);
    gtk_css_provider_load_from_string(cast(GtkCssProvider*)this._cPtr, _string_);
  }

  /**
      Loads a theme from the usual theme paths.
      
      The actual process of finding the theme might change between
      releases, but it is guaranteed that this function uses the same
      mechanism to load the theme that GTK uses for loading its own theme.
  
      Params:
        name = A theme name
        variant = variant to load, for example, "dark", or
            null for the default
  */
  void loadNamed(string name, string variant = null) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    const(char)* _variant = variant.toCString!(No.Malloc, Yes.Nullable);
    gtk_css_provider_load_named(cast(GtkCssProvider*)this._cPtr, _name, _variant);
  }

  /**
      Converts the provider into a string representation in CSS
      format.
      
      Using [gtk.css_provider.CssProvider.loadFromString] with the return
      value from this function on a new provider created with
      [gtk.css_provider.CssProvider.new_] will basically create a duplicate
      of this provider.
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
  
      Signals that a parsing error occurred.
        
        The path, line and position describe the actual location of
        the error as accurately as possible.
        
        Parsing errors are never fatal, so the parsing will resume after
        the error. Errors may however cause parts of the given data or
        even all of it to not be parsed at all. So it is a useful idea
        to check that the parsing succeeds by connecting to this signal.
        
        Note that this signal may be emitted at any time as the css provider
        may opt to defer parsing parts or all of the input to a later time
        than when a loading function was called.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gtk.css_section.CssSection section, glib.error.ErrorWrap error, gtk.css_provider.CssProvider cssProvider)`
  
          `section` section the error happened in (optional)
  
          `error` The parsing error (optional)
  
          `cssProvider` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectParsingError(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.css_section.CssSection)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == glib.error.ErrorWrap)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.css_provider.CssProvider)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
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

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gtk.css_provider.CssProvider.parsingError");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("parsing-error", closure, after);
  }
}

/// Fluent builder implementation template for [gtk.css_provider.CssProvider]
class CssProviderGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T, gtk.style_provider.StyleProviderGidBuilderImpl!T
{

  mixin StyleProviderGidBuilderT!();
}

/// Fluent builder for [gtk.css_provider.CssProvider]
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
