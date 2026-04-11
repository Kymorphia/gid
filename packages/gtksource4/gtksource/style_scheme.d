/// Module for [StyleScheme] class
module gtksource.style_scheme;

import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.style;
import gtksource.types;

/** */
class StyleScheme : gobject.object.ObjectWrap
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
    return cast(void function())gtk_source_style_scheme_get_type != &gidSymbolNotFound ? gtk_source_style_scheme_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override StyleScheme self()
  {
    return this;
  }

  /**
      Get builder for [gtksource.style_scheme.StyleScheme]
      Returns: New builder object
  */
  static StyleSchemeGidBuilder builder()
  {
    return new StyleSchemeGidBuilder;
  }

  /**
      Get `description` property.
      Returns: Style scheme description, a translatable string to present to the user.
  */
  @property string description()
  {
    return getDescription();
  }

  /**
      Get `filename` property.
      Returns: Style scheme filename or null.
  */
  @property string filename()
  {
    return getFilename();
  }

  /**
      Get `id` property.
      Returns: Style scheme id, a unique string used to identify the style scheme
        in #GtkSourceStyleSchemeManager.
  */
  @property string id()
  {
    return getId();
  }

  /**
      Get `name` property.
      Returns: Style scheme name, a translatable string to present to the user.
  */
  @property string name()
  {
    return getName();
  }

  /** */
  string[] getAuthors()
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
        _retval[i] = _cretval[i].fromCString(No.Free);
    }
    return _retval;
  }

  /** */
  string getDescription()
  {
    const(char)* _cretval;
    _cretval = gtk_source_style_scheme_get_description(cast(GtkSourceStyleScheme*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /** */
  string getFilename()
  {
    const(char)* _cretval;
    _cretval = gtk_source_style_scheme_get_filename(cast(GtkSourceStyleScheme*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /** */
  string getId()
  {
    const(char)* _cretval;
    _cretval = gtk_source_style_scheme_get_id(cast(GtkSourceStyleScheme*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /** */
  string getName()
  {
    const(char)* _cretval;
    _cretval = gtk_source_style_scheme_get_name(cast(GtkSourceStyleScheme*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /** */
  gtksource.style.Style getStyle(string styleId)
  {
    GtkSourceStyle* _cretval;
    const(char)* _styleId = styleId.toCString(No.Alloc);
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
          in #GtkSourceStyleSchemeManager.
      Returns: Builder instance for fluent chaining
  */
  T id(string propval)
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
  StyleScheme build()
  {
    return new StyleScheme(cast(void*)createGObject(StyleScheme._getGType), No.Take);
  }
}
