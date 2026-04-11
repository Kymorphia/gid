/// Module for [NumerableIcon] class
module gtk.numerable_icon;

import gid.gid;
import gio.emblemed_icon;
import gio.icon;
import gio.icon_mixin;
import gobject.gid_builder;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.style_context;
import gtk.types;

/**
    GtkNumerableIcon is a subclass of #GEmblemedIcon that can
    show a number or short string as an emblem. The number can
    be overlayed on top of another emblem, if desired.
    
    It supports theming by taking font and color information
    from a provided #GtkStyleContext; see
    [gtk.numerable_icon.NumerableIcon.setStyleContext].
    
    Typical numerable icons:
    ![](numerableicon.png)
    ![](numerableicon2.png)
*/
class NumerableIcon : gio.emblemed_icon.EmblemedIcon
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
    return cast(void function())gtk_numerable_icon_get_type != &gidSymbolNotFound ? gtk_numerable_icon_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override NumerableIcon self()
  {
    return this;
  }

  /**
      Get builder for [gtk.numerable_icon.NumerableIcon]
      Returns: New builder object
  */
  static NumerableIconGidBuilder builder()
  {
    return new NumerableIconGidBuilder;
  }

  /** */
  @property gio.icon.Icon backgroundIcon()
  {
    return gobject.object.ObjectWrap.getProperty!(gio.icon.Icon)("background-icon");
  }

  /** */
  @property void backgroundIcon(gio.icon.Icon propval)
  {
    gobject.object.ObjectWrap.setProperty!(gio.icon.Icon)("background-icon", propval);
  }

  /** */
  @property string backgroundIconName()
  {
    return getBackgroundIconName();
  }

  /** */
  @property void backgroundIconName(string propval)
  {
    setBackgroundIconName(propval);
  }

  /** */
  @property int count()
  {
    return getCount();
  }

  /** */
  @property void count(int propval)
  {
    setCount(propval);
  }

  /** */
  @property string label()
  {
    return getLabel();
  }

  /** */
  @property void label(string propval)
  {
    setLabel(propval);
  }

  /** */
  @property gtk.style_context.StyleContext styleContext()
  {
    return getStyleContext();
  }

  /** */
  @property void styleContext(gtk.style_context.StyleContext propval)
  {
    setStyleContext(propval);
  }

  /**
      Creates a new unthemed #GtkNumerableIcon.
  
      Params:
        baseIcon = a #GIcon to overlay on
      Returns: a new #GIcon
  */
  static gio.icon.Icon new_(gio.icon.Icon baseIcon)
  {
    GIcon* _cretval;
    _cretval = gtk_numerable_icon_new(baseIcon ? cast(GIcon*)(cast(gobject.object.ObjectWrap)baseIcon)._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.icon.Icon)(cast(GIcon*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new #GtkNumerableIcon which will themed according
      to the passed #GtkStyleContext. This is a convenience constructor
      that calls [gtk.numerable_icon.NumerableIcon.setStyleContext] internally.
  
      Params:
        baseIcon = a #GIcon to overlay on
        context = a #GtkStyleContext
      Returns: a new #GIcon
  */
  static gio.icon.Icon newWithStyleContext(gio.icon.Icon baseIcon, gtk.style_context.StyleContext context)
  {
    GIcon* _cretval;
    _cretval = gtk_numerable_icon_new_with_style_context(baseIcon ? cast(GIcon*)(cast(gobject.object.ObjectWrap)baseIcon)._cPtr(No.Dup) : null, context ? cast(GtkStyleContext*)context._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.icon.Icon)(cast(GIcon*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Returns the #GIcon that was set as the base background image, or
      null if there’s none. The caller of this function does not own
      a reference to the returned #GIcon.
      Returns: a #GIcon, or null
  */
  gio.icon.Icon getBackgroundGicon()
  {
    GIcon* _cretval;
    _cretval = gtk_numerable_icon_get_background_gicon(cast(GtkNumerableIcon*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.icon.Icon)(cast(GIcon*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the icon name used as the base background image,
      or null if there’s none.
      Returns: an icon name, or null
  */
  string getBackgroundIconName()
  {
    const(char)* _cretval;
    _cretval = gtk_numerable_icon_get_background_icon_name(cast(GtkNumerableIcon*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns the value currently displayed by self.
      Returns: the currently displayed value
  */
  int getCount()
  {
    int _retval;
    _retval = gtk_numerable_icon_get_count(cast(GtkNumerableIcon*)this._cPtr);
    return _retval;
  }

  /**
      Returns the currently displayed label of the icon, or null.
      Returns: the currently displayed label
  */
  string getLabel()
  {
    const(char)* _cretval;
    _cretval = gtk_numerable_icon_get_label(cast(GtkNumerableIcon*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns the #GtkStyleContext used by the icon for theming,
      or null if there’s none.
      Returns: a #GtkStyleContext, or null.
            This object is internal to GTK+ and should not be unreffed.
            Use [gobject.object.ObjectWrap.ref_] if you want to keep it around
  */
  gtk.style_context.StyleContext getStyleContext()
  {
    GtkStyleContext* _cretval;
    _cretval = gtk_numerable_icon_get_style_context(cast(GtkNumerableIcon*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.style_context.StyleContext)(cast(GtkStyleContext*)_cretval, No.Take);
    return _retval;
  }

  /**
      Updates the icon to use icon as the base background image.
      If icon is null, self will go back using style information
      or default theming for its background image.
      
      If this method is called and an icon name was already set as
      background for the icon, icon will be used, i.e. the last method
      called between [gtk.numerable_icon.NumerableIcon.setBackgroundGicon] and
      [gtk.numerable_icon.NumerableIcon.setBackgroundIconName] has always priority.
  
      Params:
        icon = a #GIcon, or null
  */
  void setBackgroundGicon(gio.icon.Icon icon = null)
  {
    gtk_numerable_icon_set_background_gicon(cast(GtkNumerableIcon*)this._cPtr, icon ? cast(GIcon*)(cast(gobject.object.ObjectWrap)icon)._cPtr(No.Dup) : null);
  }

  /**
      Updates the icon to use the icon named icon_name from the
      current icon theme as the base background image. If icon_name
      is null, self will go back using style information or default
      theming for its background image.
      
      If this method is called and a #GIcon was already set as
      background for the icon, icon_name will be used, i.e. the
      last method called between [gtk.numerable_icon.NumerableIcon.setBackgroundIconName]
      and [gtk.numerable_icon.NumerableIcon.setBackgroundGicon] has always priority.
  
      Params:
        iconName = an icon name, or null
  */
  void setBackgroundIconName(string iconName = null)
  {
    const(char)* _iconName = iconName.toCString(No.Alloc);
    gtk_numerable_icon_set_background_icon_name(cast(GtkNumerableIcon*)this._cPtr, _iconName);
  }

  /**
      Sets the currently displayed value of self to count.
      
      The numeric value is always clamped to make it two digits, i.e.
      between -99 and 99. Setting a count of zero removes the emblem.
      If this method is called, and a label was already set on the icon,
      it will automatically be reset to null before rendering the number,
      i.e. the last method called between [gtk.numerable_icon.NumerableIcon.setCount]
      and [gtk.numerable_icon.NumerableIcon.setLabel] has always priority.
  
      Params:
        count = a number between -99 and 99
  */
  void setCount(int count)
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
      [gtk.numerable_icon.NumerableIcon.setLabel] and [gtk.numerable_icon.NumerableIcon.setCount]
      has always priority.
  
      Params:
        label = a short label, or null
  */
  void setLabel(string label = null)
  {
    const(char)* _label = label.toCString(No.Alloc);
    gtk_numerable_icon_set_label(cast(GtkNumerableIcon*)this._cPtr, _label);
  }

  /**
      Updates the icon to fetch theme information from the
      given #GtkStyleContext.
  
      Params:
        style = a #GtkStyleContext
  */
  void setStyleContext(gtk.style_context.StyleContext style)
  {
    gtk_numerable_icon_set_style_context(cast(GtkNumerableIcon*)this._cPtr, style ? cast(GtkStyleContext*)style._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gtk.numerable_icon.NumerableIcon]
class NumerableIconGidBuilderImpl(T) : gio.emblemed_icon.EmblemedIconGidBuilderImpl!T
{


  /** */
  T backgroundIcon(gio.icon.Icon propval)
  {
    return setProperty("background-icon", propval);
  }

  /** */
  T backgroundIconName(string propval)
  {
    return setProperty("background-icon-name", propval);
  }

  /** */
  T count(int propval)
  {
    return setProperty("count", propval);
  }

  /** */
  T label(string propval)
  {
    return setProperty("label", propval);
  }

  /** */
  T styleContext(gtk.style_context.StyleContext propval)
  {
    return setProperty("style-context", propval);
  }
}

/// Fluent builder for [gtk.numerable_icon.NumerableIcon]
final class NumerableIconGidBuilder : NumerableIconGidBuilderImpl!NumerableIconGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  NumerableIcon build()
  {
    return new NumerableIcon(cast(void*)createGObject(NumerableIcon._getGType), No.Take);
  }
}
