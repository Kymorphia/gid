/// Module for [StyleScheme] class
module gtksource.style_scheme;

public import gid.basictypes;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.style;
import gtksource.types;

/**
    Controls the appearance of [gtksource.view.View].
    
    #GtkSourceStyleScheme contains all the text styles to be used in
    [gtksource.view.View] and [gtksource.buffer.Buffer]. For instance, it contains text styles
    for syntax highlighting, it may contain foreground and background color for
    non-highlighted text, color for the line numbers, current line highlighting,
    bracket matching, etc.
    
    Style schemes are stored in XML files. The format of a scheme file is
    documented in the [style scheme reference](./style-reference.html).
    
    The two style schemes with IDs "classic" and "tango" follow more closely the
    GTK theme (for example for the background color).
*/
class StyleScheme : gobject.object.ObjectWrap
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
    return cast(void function())gtk_source_style_scheme_get_type != &gidSymbolNotFound ? gtk_source_style_scheme_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override StyleScheme self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtksource.style_scheme.StyleScheme]
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
        in [gtksource.style_scheme_manager.StyleSchemeManager].
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
  gtksource.style.Style getStyle(string styleId) nothrow
  {
    GtkSourceStyle* _cretval;
    const(char)* _styleId = styleId.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_source_style_scheme_get_style(cast(GtkSourceStyleScheme*)this._cPtr, _styleId);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtksource.style.Style)(cast(GtkSourceStyle*)_cretval, No.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gtksource.style_scheme.StyleScheme]
class StyleSchemeGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `id` property.
      Params:
        propval = Style scheme id, a unique string used to identify the style scheme
          in [gtksource.style_scheme_manager.StyleSchemeManager].
      Returns: Builder instance for fluent chaining
  */
  T id(string propval) nothrow
  {
    return setProperty("id", propval);
  }
}

/// Fluent builder for [gtksource.style_scheme.StyleScheme]
final class StyleSchemeGidBuilder : StyleSchemeGidBuilderImpl!StyleSchemeGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  StyleScheme build() nothrow
  {
    return new StyleScheme(cast(void*)createGObject(StyleScheme._getGType), No.Take);
  }
}
