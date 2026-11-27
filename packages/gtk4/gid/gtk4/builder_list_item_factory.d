/// Module for [BuilderListItemFactory] class
module gid.gtk4.builder_list_item_factory;

public import gid.core.basictypes;
import gid.core.utils;
import gid.glib2.bytes;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.builder_scope;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.list_item_factory;
import gid.gtk4.types;

/**
    Creates widgets by instantiating [gid.gtk4.builder.Builder] UI templates.
    
    The templates must extend the class that the parent widget expects.
    For example, a factory provided to [gid.gtk4.list_view.ListView.factory] must have
    a template that extends [gid.gtk4.list_item.ListItem].
    
    Templates typically use [gid.gtk4.expression.Expression] to obtain data from the items
    in the model.
    
    Example:
    ```xml
      <interface>
        <template class="GtkListItem">
          <property name="child">
            <object class="GtkLabel">
              <property name="xalign">0</property>
              <binding name="label">
                <lookup name="name" type="SettingsKey">
                  <lookup name="item">GtkListItem</lookup>
                </lookup>
              </binding>
            </object>
          </property>
        </template>
      </interface>
    ```
    
    A common approach is to embed such templates as CDATA marked sections into
    a surrounding UI file. Note that if you use this approach, extracting
    translatable strings with xgettext will not work for strings inside the
    marked section.
*/
@gidGir("BuilderListItemFactory", "BuilderListItemFactoryClass")
class BuilderListItemFactory : gid.gtk4.list_item_factory.ListItemFactory
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_builder_list_item_factory_get_type != &gidSymbolNotFound ? gtk_builder_list_item_factory_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkBuilderListItemFactory";
  }

  /** Returns `this`, for use in `with` statements. */
  override BuilderListItemFactory self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.builder_list_item_factory.BuilderListItemFactory]
      Returns: New builder object
  */
  static BuilderListItemFactoryGidBuilder builder() nothrow
  {
    return new BuilderListItemFactoryGidBuilder;
  }

  /**
      Get `bytes` property.
      Returns: [gid.glib2.bytes.Bytes] containing the UI definition.
  */
  @property gid.glib2.bytes.Bytes bytes() nothrow
  {
    return getBytes();
  }

  /**
      Get `resource` property.
      Returns: Path of the resource containing the UI definition.
  */
  @property string resource() nothrow
  {
    return getResource();
  }

  /**
      Get `scope_` property.
      Returns: [gid.gtk4.builder_scope.BuilderScope] to use when instantiating listitems
  */
  @property gid.gtk4.builder_scope.BuilderScope scope_() nothrow
  {
    return getScope();
  }

  /**
      Creates a new [gid.gtk4.builder_list_item_factory.BuilderListItemFactory] that instantiates widgets
      using bytes as the data to pass to [gid.gtk4.builder.Builder].
  
      Params:
        scope_ = A scope to use when instantiating
        bytes = the [gid.glib2.bytes.Bytes] containing the UI definition to instantiate
      Returns: a new [gid.gtk4.builder_list_item_factory.BuilderListItemFactory]
  */
  static gid.gtk4.builder_list_item_factory.BuilderListItemFactory newFromBytes(gid.gtk4.builder_scope.BuilderScope scope_, gid.glib2.bytes.Bytes bytes) nothrow
  {
    GtkListItemFactory* _cretval;
    _cretval = gtk_builder_list_item_factory_new_from_bytes(scope_ ? cast(GtkBuilderScope*)(cast(gid.gobject2.object.ObjectWrap)scope_)._cPtr(No.Dup) : null, bytes ? cast(GBytes*)bytes._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.builder_list_item_factory.BuilderListItemFactory)(cast(GtkListItemFactory*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new [gid.gtk4.builder_list_item_factory.BuilderListItemFactory] that instantiates widgets
      using data read from the given resource_path to pass to [gid.gtk4.builder.Builder].
  
      Params:
        scope_ = A scope to use when instantiating
        resourcePath = valid path to a resource that contains the UI definition
      Returns: a new [gid.gtk4.builder_list_item_factory.BuilderListItemFactory]
  */
  static gid.gtk4.builder_list_item_factory.BuilderListItemFactory newFromResource(gid.gtk4.builder_scope.BuilderScope scope_, string resourcePath) nothrow
  {
    GtkListItemFactory* _cretval;
    const(char)* _resourcePath = resourcePath.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_builder_list_item_factory_new_from_resource(scope_ ? cast(GtkBuilderScope*)(cast(gid.gobject2.object.ObjectWrap)scope_)._cPtr(No.Dup) : null, _resourcePath);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.builder_list_item_factory.BuilderListItemFactory)(cast(GtkListItemFactory*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the data used as the [gid.gtk4.builder.Builder] UI template for constructing
      listitems.
      Returns: The [gid.gtk4.builder.Builder] data
  */
  gid.glib2.bytes.Bytes getBytes() nothrow
  {
    GBytes* _cretval;
    _cretval = gtk_builder_list_item_factory_get_bytes(cast(GtkBuilderListItemFactory*)this._cPtr);
    auto _retval = _cretval ? new gid.glib2.bytes.Bytes(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      If the data references a resource, gets the path of that resource.
      Returns: The path to the resource
  */
  string getResource() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_builder_list_item_factory_get_resource(cast(GtkBuilderListItemFactory*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the scope used when constructing listitems.
      Returns: The scope used when constructing listitems
  */
  gid.gtk4.builder_scope.BuilderScope getScope() nothrow
  {
    GtkBuilderScope* _cretval;
    _cretval = gtk_builder_list_item_factory_get_scope(cast(GtkBuilderListItemFactory*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.builder_scope.BuilderScope)(cast(GtkBuilderScope*)_cretval, No.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gtk4.builder_list_item_factory.BuilderListItemFactory]
class BuilderListItemFactoryGidBuilderImpl(T) : gid.gtk4.list_item_factory.ListItemFactoryGidBuilderImpl!T
{

  /**
      Set `bytes` property.
      Params:
        propval = [gid.glib2.bytes.Bytes] containing the UI definition.
      Returns: Builder instance for fluent chaining
  */
  T bytes(gid.glib2.bytes.Bytes propval) nothrow
  {
    return setProperty("bytes", propval);
  }

  /**
      Set `resource` property.
      Params:
        propval = Path of the resource containing the UI definition.
      Returns: Builder instance for fluent chaining
  */
  T resource(string propval) nothrow
  {
    return setProperty("resource", propval);
  }

  /**
      Set `scope_` property.
      Params:
        propval = [gid.gtk4.builder_scope.BuilderScope] to use when instantiating listitems
      Returns: Builder instance for fluent chaining
  */
  T scope_(gid.gtk4.builder_scope.BuilderScope propval) nothrow
  {
    return setProperty("scope", propval);
  }
}

/// Fluent builder for [gid.gtk4.builder_list_item_factory.BuilderListItemFactory]
final class BuilderListItemFactoryGidBuilder : BuilderListItemFactoryGidBuilderImpl!BuilderListItemFactoryGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  BuilderListItemFactory build() nothrow
  {
    return new BuilderListItemFactory(cast(void*)createGObject(BuilderListItemFactory._getGType), Yes.Take);
  }
}
