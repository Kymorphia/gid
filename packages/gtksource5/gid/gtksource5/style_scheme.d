/// Module for [StyleScheme] class
module gid.gtksource5.style_scheme;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtksource5.c.functions;
import gid.gtksource5.c.types;
import gid.gtksource5.style;
import gid.gtksource5.types;

/**
    Controls the appearance of [gid.gtksource5.view.View].
    
    #GtkSourceStyleScheme contains all the text styles to be used in
    [gid.gtksource5.view.View] and [gid.gtksource5.buffer.Buffer]. For instance, it contains text styles
    for syntax highlighting, it may contain foreground and background color for
    non-highlighted text, color for the line numbers, current line highlighting,
    bracket matching, etc.
    
    Style schemes are stored in XML files. The format of a scheme file is
    documented in the [style scheme reference](./style-reference.html).
    
    The two style schemes with IDs "classic" and "tango" follow more closely the
    GTK theme (for example for the background color).
*/
class StyleScheme : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_style_scheme_get_type != &gidSymbolNotFound ? gtk_source_style_scheme_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkSourceStyleScheme";
  }

  /** Returns `this`, for use in `with` statements. */
  override StyleScheme self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtksource5.style_scheme.StyleScheme]
      Returns: New builder object
  */
  static StyleSchemeGidBuilder builder() nothrow
  {
    return new StyleSchemeGidBuilder;
  }

  /**
      Get `description` property.
      Returns: Style scheme description, a translatable string to present to the user.
  */
  @property string description() nothrow
  {
    return getDescription();
  }

  /**
      Get `filename` property.
      Returns: Style scheme filename or null.
  */
  @property string filename() nothrow
  {
    return getFilename();
  }

  /**
      Get `id` property.
      Returns: Style scheme id, a unique string used to identify the style scheme
        in [gid.gtksource5.style_scheme_manager.StyleSchemeManager].
  */
  @property string id() nothrow
  {
    return getId();
  }

  /**
      Get `name` property.
      Returns: Style scheme name, a translatable string to present to the user.
  */
  @property string name() nothrow
  {
    return getName();
  }

  /** */
  string[] getAuthors() nothrow
  {
    const(char*)* _cretval;
    _cretval = gtk_source_style_scheme_get_authors(cast(GtkSourceStyleScheme*)this._cPtr);
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

  /** */
  string getDescription() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_source_style_scheme_get_description(cast(GtkSourceStyleScheme*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /** */
  string getFilename() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_source_style_scheme_get_filename(cast(GtkSourceStyleScheme*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /** */
  string getId() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_source_style_scheme_get_id(cast(GtkSourceStyleScheme*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets a metadata property from the style scheme.
  
      Params:
        name = metadata property name.
      Returns: value of property name stored in
          the metadata of scheme or null if scheme does not contain the
          specified metadata property.
  */
  string getMetadata(string name) nothrow
  {
    const(char)* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_source_style_scheme_get_metadata(cast(GtkSourceStyleScheme*)this._cPtr, _name);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /** */
  string getName() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_source_style_scheme_get_name(cast(GtkSourceStyleScheme*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /** */
  gid.gtksource5.style.Style getStyle(string styleId) nothrow
  {
    GtkSourceStyle* _cretval;
    const(char)* _styleId = styleId.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_source_style_scheme_get_style(cast(GtkSourceStyleScheme*)this._cPtr, _styleId);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource5.style.Style)(cast(GtkSourceStyle*)_cretval, No.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gtksource5.style_scheme.StyleScheme]
class StyleSchemeGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `id` property.
      Params:
        propval = Style scheme id, a unique string used to identify the style scheme
          in [gid.gtksource5.style_scheme_manager.StyleSchemeManager].
      Returns: Builder instance for fluent chaining
  */
  T id(string propval) nothrow
  {
    return setProperty("id", propval);
  }
}

/// Fluent builder for [gid.gtksource5.style_scheme.StyleScheme]
final class StyleSchemeGidBuilder : StyleSchemeGidBuilderImpl!StyleSchemeGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  StyleScheme build() nothrow
  {
    return new StyleScheme(cast(void*)createGObject(StyleScheme._getGType), Yes.Take);
  }
}
