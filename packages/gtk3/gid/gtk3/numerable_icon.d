/// Module for [NumerableIcon] class
module gid.gtk3.numerable_icon;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.emblemed_icon;
import gid.gio2.icon;
import gid.gio2.icon_mixin;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.style_context;
import gid.gtk3.types;

/**
    GtkNumerableIcon is a subclass of #GEmblemedIcon that can
    show a number or short string as an emblem. The number can
    be overlayed on top of another emblem, if desired.
    
    It supports theming by taking font and color information
    from a provided #GtkStyleContext; see
    [gid.gtk3.numerable_icon.NumerableIcon.setStyleContext].
    
    Typical numerable icons:
    ![](numerableicon.png)
    ![](numerableicon2.png)
*/
class NumerableIcon : gid.gio2.emblemed_icon.EmblemedIcon
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
    return cast(void function())gtk_numerable_icon_get_type != &gidSymbolNotFound ? gtk_numerable_icon_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkNumerableIcon";
  }

  /** Returns `this`, for use in `with` statements. */
  override NumerableIcon self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.numerable_icon.NumerableIcon]
      Returns: New builder object
  */
  static NumerableIconGidBuilder builder() nothrow
  {
    return new NumerableIconGidBuilder;
  }

  /** */
  @property gid.gio2.icon.Icon backgroundIcon() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gio2.icon.Icon)("background-icon");
  }

  /** */
  @property void backgroundIcon(gid.gio2.icon.Icon propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gio2.icon.Icon)("background-icon", propval);
  }

  /** */
  @property string backgroundIconName() nothrow
  {
    return getBackgroundIconName();
  }

  /** */
  @property void backgroundIconName(string propval) nothrow
  {
    setBackgroundIconName(propval);
  }

  /** */
  @property int count() nothrow
  {
    return getCount();
  }

  /** */
  @property void count(int propval) nothrow
  {
    setCount(propval);
  }

  /** */
  @property string label() nothrow
  {
    return getLabel();
  }

  /** */
  @property void label(string propval) nothrow
  {
    setLabel(propval);
  }

  /** */
  @property gid.gtk3.style_context.StyleContext styleContext() nothrow
  {
    return getStyleContext();
  }

  /** */
  @property void styleContext(gid.gtk3.style_context.StyleContext propval) nothrow
  {
    setStyleContext(propval);
  }

  /**
      Creates a new unthemed #GtkNumerableIcon.
  
      Params:
        baseIcon = a #GIcon to overlay on
      Returns: a new #GIcon
  */
  static gid.gio2.icon.Icon new_(gid.gio2.icon.Icon baseIcon) nothrow
  {
    GIcon* _cretval;
    _cretval = gtk_numerable_icon_new(baseIcon ? cast(GIcon*)(cast(gid.gobject2.object.ObjectWrap)baseIcon)._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.icon.Icon)(cast(GIcon*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new #GtkNumerableIcon which will themed according
      to the passed #GtkStyleContext. This is a convenience constructor
      that calls [gid.gtk3.numerable_icon.NumerableIcon.setStyleContext] internally.
  
      Params:
        baseIcon = a #GIcon to overlay on
        context = a #GtkStyleContext
      Returns: a new #GIcon
  */
  static gid.gio2.icon.Icon newWithStyleContext(gid.gio2.icon.Icon baseIcon, gid.gtk3.style_context.StyleContext context) nothrow
  {
    GIcon* _cretval;
    _cretval = gtk_numerable_icon_new_with_style_context(baseIcon ? cast(GIcon*)(cast(gid.gobject2.object.ObjectWrap)baseIcon)._cPtr(No.Dup) : null, context ? cast(GtkStyleContext*)context._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.icon.Icon)(cast(GIcon*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Returns the #GIcon that was set as the base background image, or
      null if there’s none. The caller of this function does not own
      a reference to the returned #GIcon.
      Returns: a #GIcon, or null
  */
  gid.gio2.icon.Icon getBackgroundGicon() nothrow
  {
    GIcon* _cretval;
    _cretval = gtk_numerable_icon_get_background_gicon(cast(GtkNumerableIcon*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.icon.Icon)(cast(GIcon*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the icon name used as the base background image,
      or null if there’s none.
      Returns: an icon name, or null
  */
  string getBackgroundIconName() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_numerable_icon_get_background_icon_name(cast(GtkNumerableIcon*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Returns the value currently displayed by self.
      Returns: the currently displayed value
  */
  int getCount() nothrow
  {
    int _retval;
    _retval = gtk_numerable_icon_get_count(cast(GtkNumerableIcon*)this._cPtr);
    return _retval;
  }

  /**
      Returns the currently displayed label of the icon, or null.
      Returns: the currently displayed label
  */
  string getLabel() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_numerable_icon_get_label(cast(GtkNumerableIcon*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Returns the #GtkStyleContext used by the icon for theming,
      or null if there’s none.
      Returns: a #GtkStyleContext, or null.
            This object is internal to GTK+ and should not be unreffed.
            Use [gid.gobject2.object.ObjectWrap.ref_] if you want to keep it around
  */
  gid.gtk3.style_context.StyleContext getStyleContext() nothrow
  {
    GtkStyleContext* _cretval;
    _cretval = gtk_numerable_icon_get_style_context(cast(GtkNumerableIcon*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.style_context.StyleContext)(cast(GtkStyleContext*)_cretval, No.Take);
    return _retval;
  }

  /**
      Updates the icon to use icon as the base background image.
      If icon is null, self will go back using style information
      or default theming for its background image.
      
      If this method is called and an icon name was already set as
      background for the icon, icon will be used, i.e. the last method
      called between [gid.gtk3.numerable_icon.NumerableIcon.setBackgroundGicon] and
      [gid.gtk3.numerable_icon.NumerableIcon.setBackgroundIconName] has always priority.
  
      Params:
        icon = a #GIcon, or null
  */
  void setBackgroundGicon(gid.gio2.icon.Icon icon = null) nothrow
  {
    gtk_numerable_icon_set_background_gicon(cast(GtkNumerableIcon*)this._cPtr, icon ? cast(GIcon*)(cast(gid.gobject2.object.ObjectWrap)icon)._cPtr(No.Dup) : null);
  }

  /**
      Updates the icon to use the icon named icon_name from the
      current icon theme as the base background image. If icon_name
      is null, self will go back using style information or default
      theming for its background image.
      
      If this method is called and a #GIcon was already set as
      background for the icon, icon_name will be used, i.e. the
      last method called between [gid.gtk3.numerable_icon.NumerableIcon.setBackgroundIconName]
      and [gid.gtk3.numerable_icon.NumerableIcon.setBackgroundGicon] has always priority.
  
      Params:
        iconName = an icon name, or null
  */
  void setBackgroundIconName(string iconName = null) nothrow
  {
    const(char)* _iconName = iconName.toCString!(No.Malloc, Yes.Nullable);
    gtk_numerable_icon_set_background_icon_name(cast(GtkNumerableIcon*)this._cPtr, _iconName);
  }

  /**
      Sets the currently displayed value of self to count.
      
      The numeric value is always clamped to make it two digits, i.e.
      between -99 and 99. Setting a count of zero removes the emblem.
      If this method is called, and a label was already set on the icon,
      it will automatically be reset to null before rendering the number,
      i.e. the last method called between [gid.gtk3.numerable_icon.NumerableIcon.setCount]
      and [gid.gtk3.numerable_icon.NumerableIcon.setLabel] has always priority.
  
      Params:
        count = a number between -99 and 99
  */
  void setCount(int count) nothrow
  {
    gtk_numerable_icon_set_count(cast(GtkNumerableIcon*)this._cPtr, count);
  }

  /**
      Sets the currently displayed value of self to the string
      in label. Setting an empty label removes the emblem.
      
      Note that this is meant for displaying short labels, such as
      roman numbers, or single letters. For roman numbers, consider
      using the Unicode characters U+2160 - U+217F. Strings longer
      than two characters will likely not be rendered very well.
      
      If this method is called, and a number was already set on the
      icon, it will automatically be reset to zero before rendering
      the label, i.e. the last method called between
      [gid.gtk3.numerable_icon.NumerableIcon.setLabel] and [gid.gtk3.numerable_icon.NumerableIcon.setCount]
      has always priority.
  
      Params:
        label = a short label, or null
  */
  void setLabel(string label = null) nothrow
  {
    const(char)* _label = label.toCString!(No.Malloc, Yes.Nullable);
    gtk_numerable_icon_set_label(cast(GtkNumerableIcon*)this._cPtr, _label);
  }

  /**
      Updates the icon to fetch theme information from the
      given #GtkStyleContext.
  
      Params:
        style = a #GtkStyleContext
  */
  void setStyleContext(gid.gtk3.style_context.StyleContext style) nothrow
  {
    gtk_numerable_icon_set_style_context(cast(GtkNumerableIcon*)this._cPtr, style ? cast(GtkStyleContext*)style._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gtk3.numerable_icon.NumerableIcon]
class NumerableIconGidBuilderImpl(T) : gid.gio2.emblemed_icon.EmblemedIconGidBuilderImpl!T
{


  /** */
  T backgroundIcon(gid.gio2.icon.Icon propval) nothrow
  {
    return setProperty("background-icon", propval);
  }

  /** */
  T backgroundIconName(string propval) nothrow
  {
    return setProperty("background-icon-name", propval);
  }

  /** */
  T count(int propval) nothrow
  {
    return setProperty("count", propval);
  }

  /** */
  T label(string propval) nothrow
  {
    return setProperty("label", propval);
  }

  /** */
  T styleContext(gid.gtk3.style_context.StyleContext propval) nothrow
  {
    return setProperty("style-context", propval);
  }
}

/// Fluent builder for [gid.gtk3.numerable_icon.NumerableIcon]
final class NumerableIconGidBuilder : NumerableIconGidBuilderImpl!NumerableIconGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  NumerableIcon build() nothrow
  {
    return new NumerableIcon(cast(void*)createGObject(NumerableIcon._getGType), Yes.Take);
  }
}
