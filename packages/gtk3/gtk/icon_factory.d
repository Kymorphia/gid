/// Module for [IconFactory] class
module gtk.icon_factory;

import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.icon_set;
import gtk.types;

/**
    An icon factory manages a collection of #GtkIconSet; a #GtkIconSet manages a
    set of variants of a particular icon (i.e. a #GtkIconSet contains variants for
    different sizes and widget states). Icons in an icon factory are named by a
    stock ID, which is a simple string identifying the icon. Each #GtkStyle has a
    list of #GtkIconFactory derived from the current theme; those icon factories
    are consulted first when searching for an icon. If the theme doesn’t set a
    particular icon, GTK+ looks for the icon in a list of default icon factories,
    maintained by [gtk.icon_factory.IconFactory.addDefault] and
    [gtk.icon_factory.IconFactory.removeDefault]. Applications with icons should add a default
    icon factory with their icons, which will allow themes to override the icons
    for the application.
    
    To display an icon, always use [gtk.style.Style.lookupIconSet] on the widget that
    will display the icon, or the convenience function
    [gtk.widget.Widget.renderIcon]. These functions take the theme into account when
    looking up the icon to use for a given stock ID.
    
    # GtkIconFactory as GtkBuildable # {#GtkIconFactory-BUILDER-UI}
    
    GtkIconFactory supports a custom `<sources>` element, which can contain
    multiple `<source>` elements. The following attributes are allowed:
    
    - stock-id
    
        The stock id of the source, a string. This attribute is
        mandatory
    
    - filename
    
        The filename of the source, a string.  This attribute is
        optional
    
    - icon-name
    
        The icon name for the source, a string.  This attribute is
        optional.
    
    - size
    
        Size of the icon, a #GtkIconSize enum value.  This attribute is
        optional.
    
    - direction
    
        Direction of the source, a #GtkTextDirection enum value.  This
        attribute is optional.
    
    - state
    
        State of the source, a #GtkStateType enum value.  This
        attribute is optional.
    
    
    ## A #GtkIconFactory UI definition fragment. ##
    
    ```
    <object class="GtkIconFactory" id="iconfactory1">
      <sources>
        <source stock-id="apple-red" filename="apple-red.png"/>
      </sources>
    </object>
    <object class="GtkWindow" id="window1">
      <child>
        <object class="GtkButton" id="apple_button">
          <property name="label">apple-red</property>
          <property name="use-stock">True</property>
        </object>
      </child>
    </object>
    ```
*/
class IconFactory : gobject.object.ObjectWrap, gtk.buildable.Buildable
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
    return cast(void function())gtk_icon_factory_get_type != &gidSymbolNotFound ? gtk_icon_factory_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override IconFactory self()
  {
    return this;
  }

  /**
      Get builder for [gtk.icon_factory.IconFactory]
      Returns: New builder object
  */
  static IconFactoryGidBuilder builder()
  {
    return new IconFactoryGidBuilder;
  }

  mixin BuildableT!();

  /**
      Creates a new #GtkIconFactory. An icon factory manages a collection
      of #GtkIconSets; a #GtkIconSet manages a set of variants of a
      particular icon (i.e. a #GtkIconSet contains variants for different
      sizes and widget states). Icons in an icon factory are named by a
      stock ID, which is a simple string identifying the icon. Each
      #GtkStyle has a list of #GtkIconFactorys derived from the current
      theme; those icon factories are consulted first when searching for
      an icon. If the theme doesn’t set a particular icon, GTK+ looks for
      the icon in a list of default icon factories, maintained by
      [gtk.icon_factory.IconFactory.addDefault] and
      [gtk.icon_factory.IconFactory.removeDefault]. Applications with icons should
      add a default icon factory with their icons, which will allow
      themes to override the icons for the application.
      Returns: a new #GtkIconFactory
  
      Deprecated: Use #GtkIconTheme instead.
  */
  this()
  {
    GtkIconFactory* _cretval;
    _cretval = gtk_icon_factory_new();
    this(_cretval, Yes.Take);
  }

  /**
      Looks for an icon in the list of default icon factories.  For
      display to the user, you should use [gtk.style.Style.lookupIconSet] on
      the #GtkStyle for the widget that will display the icon, instead of
      using this function directly, so that themes are taken into
      account.
  
      Params:
        stockId = an icon name
      Returns: a #GtkIconSet, or null
  
      Deprecated: Use #GtkIconTheme instead.
  */
  static gtk.icon_set.IconSet lookupDefault(string stockId)
  {
    GtkIconSet* _cretval;
    const(char)* _stockId = stockId.toCString(No.Alloc);
    _cretval = gtk_icon_factory_lookup_default(_stockId);
    auto _retval = _cretval ? new gtk.icon_set.IconSet(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Adds the given icon_set to the icon factory, under the name
      stock_id.  stock_id should be namespaced for your application,
      e.g. “myapp-whatever-icon”.  Normally applications create a
      #GtkIconFactory, then add it to the list of default factories with
      [gtk.icon_factory.IconFactory.addDefault]. Then they pass the stock_id to
      widgets such as #GtkImage to display the icon. Themes can provide
      an icon with the same name (such as "myapp-whatever-icon") to
      override your application’s default icons. If an icon already
      existed in factory for stock_id, it is unreferenced and replaced
      with the new icon_set.
  
      Params:
        stockId = icon name
        iconSet = icon set
  
      Deprecated: Use #GtkIconTheme instead.
  */
  void add(string stockId, gtk.icon_set.IconSet iconSet)
  {
    const(char)* _stockId = stockId.toCString(No.Alloc);
    gtk_icon_factory_add(cast(GtkIconFactory*)this._cPtr, _stockId, iconSet ? cast(GtkIconSet*)iconSet._cPtr(No.Dup) : null);
  }

  /**
      Adds an icon factory to the list of icon factories searched by
      [gtk.style.Style.lookupIconSet]. This means that, for example,
      [gtk.image.Image.newFromStock] will be able to find icons in factory.
      There will normally be an icon factory added for each library or
      application that comes with icons. The default icon factories
      can be overridden by themes.
  
      Deprecated: Use #GtkIconTheme instead.
  */
  void addDefault()
  {
    gtk_icon_factory_add_default(cast(GtkIconFactory*)this._cPtr);
  }

  /**
      Looks up stock_id in the icon factory, returning an icon set
      if found, otherwise null. For display to the user, you should
      use [gtk.style.Style.lookupIconSet] on the #GtkStyle for the
      widget that will display the icon, instead of using this
      function directly, so that themes are taken into account.
  
      Params:
        stockId = an icon name
      Returns: icon set of stock_id.
  
      Deprecated: Use #GtkIconTheme instead.
  */
  gtk.icon_set.IconSet lookup(string stockId)
  {
    GtkIconSet* _cretval;
    const(char)* _stockId = stockId.toCString(No.Alloc);
    _cretval = gtk_icon_factory_lookup(cast(GtkIconFactory*)this._cPtr, _stockId);
    auto _retval = _cretval ? new gtk.icon_set.IconSet(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Removes an icon factory from the list of default icon
      factories. Not normally used; you might use it for a library that
      can be unloaded or shut down.
  
      Deprecated: Use #GtkIconTheme instead.
  */
  void removeDefault()
  {
    gtk_icon_factory_remove_default(cast(GtkIconFactory*)this._cPtr);
  }
}

/// Fluent builder implementation template for [gtk.icon_factory.IconFactory]
class IconFactoryGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T, gtk.buildable.BuildableGidBuilderImpl!T
{

  mixin BuildableGidBuilderT!();
}

/// Fluent builder for [gtk.icon_factory.IconFactory]
final class IconFactoryGidBuilder : IconFactoryGidBuilderImpl!IconFactoryGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  IconFactory build()
  {
    return new IconFactory(cast(void*)createGObject(IconFactory._getGType), Yes.Take);
  }
}
