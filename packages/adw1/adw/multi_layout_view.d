/// Module for [MultiLayoutView] class
module adw.multi_layout_view;

public import gid.basictypes;
import adw.c.functions;
import adw.c.types;
import adw.layout;
import adw.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.widget;

/**
    A widget for switching between different layouts.
    
    [adw.multi_layout_view.MultiLayoutView] contains layouts and children. Each child has
    an ID, each layout has slots inside it, each slot also has an ID. When
    switching layouts, children are inserted into slots with matching IDs. The
    [gtk.widget.Widget.visible] property of each slot is updated to match
    that of the inserted child.
    
    This can be useful for rearranging children when it's difficult to do so
    otherwise, for example to move a child from a sidebar to a bottom bar.
    
    The currently used layout can be switched using the
    [adw.multi_layout_view.MultiLayoutView.layout] or [adw.multi_layout_view.MultiLayoutView.layoutName]
    properties. For example, it can be done via a [adw.breakpoint.Breakpoint] setter
    to change layouts depending on the window size.
    
    ## AdwMultiLayoutView as GtkBuildable
    
    The [adw.multi_layout_view.MultiLayoutView] implementation of the [gtk.buildable.Buildable]
    interface supports adding layouts via `<child>` element with the `type`
    attribute omitted.
    
    It also supports setting children via `<child type="ID">`.
    
    Example of an [adw.multi_layout_view.MultiLayoutView] UI definition that can display a secondary
    child as either a sidebar or a bottom sheet.
    
    ```xml
    <object class="AdwMultiLayoutView">
      <child>
        <object class="AdwLayout">
          <property name="name">sidebar</property>
          <property name="content">
            <object class="AdwOverlaySplitView">
              <property name="sidebar">
                <object class="AdwLayoutSlot">
                  <property name="id">secondary</property>
                </object>
              </property>
              <property name="content">
                <object class="AdwLayoutSlot">
                  <property name="id">primary</property>
                </object>
              </property>
            </object>
          </property>
        </object>
      </child>
      <child>
        <object class="AdwLayout">
          <property name="name">bottom-sheet</property>
          <property name="content">
            <object class="AdwBottomSheet">
              <property name="open">True</property>
              <property name="content">
                <object class="AdwLayoutSlot">
                  <property name="id">primary</property>
                </object>
              </property>
              <property name="sheet">
                <object class="AdwLayoutSlot">
                  <property name="id">secondary</property>
                </object>
              </property>
            </object>
          </property>
        </object>
      </child>
      <child type="primary">
        <!-- ... -->
      </child>
      <child type="secondary">
        <!-- ... -->
      </child>
    </object>
    ```
    
    ## CSS nodes
    
    [adw.multi_layout_view.MultiLayoutView] has a single CSS node with name `multi-layout-view`.
*/
class MultiLayoutView : gtk.widget.Widget
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())adw_multi_layout_view_get_type != &gidSymbolNotFound ? adw_multi_layout_view_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AdwMultiLayoutView";
  }

  /** Returns `this`, for use in `with` statements. */
  override MultiLayoutView self() nothrow
  {
    return this;
  }

  /**
      Get builder for [adw.multi_layout_view.MultiLayoutView]
      Returns: New builder object
  */
  static MultiLayoutViewGidBuilder builder() nothrow
  {
    return new MultiLayoutViewGidBuilder;
  }

  /**
      Get `layout` property.
      Returns: The currently used layout.
  */
  @property adw.layout.Layout layout() nothrow
  {
    return getLayout();
  }

  /**
      Set `layout` property.
      Params:
        propval = The currently used layout.
  */
  @property void layout(adw.layout.Layout propval) nothrow
  {
    setLayout(propval);
  }

  /**
      Get `layoutName` property.
      Returns: The name of the currently used layout.
        
        See [adw.layout.Layout.name].
  */
  @property string layoutName() nothrow
  {
    return getLayoutName();
  }

  /**
      Set `layoutName` property.
      Params:
        propval = The name of the currently used layout.
          
          See [adw.layout.Layout.name].
  */
  @property void layoutName(string propval) nothrow
  {
    setLayoutName(propval);
  }

  /**
      Creates a new [adw.multi_layout_view.MultiLayoutView].
      Returns: the newly created [adw.multi_layout_view.MultiLayoutView]
  */
  this() nothrow
  {
    GtkWidget* _cretval;
    _cretval = adw_multi_layout_view_new();
    this(_cretval, No.Take);
  }

  /**
      Adds layout to self.
  
      Params:
        layout = the layout to add
  */
  void addLayout(adw.layout.Layout layout) nothrow
  {
    adw_multi_layout_view_add_layout(cast(AdwMultiLayoutView*)this._cPtr, layout ? cast(AdwLayout*)layout._cPtr(Yes.Dup) : null);
  }

  /**
      Gets the child for id to self.
  
      Params:
        id = the id of the child
      Returns: the child for id
  */
  gtk.widget.Widget getChild(string id) nothrow
  {
    GtkWidget* _cretval;
    const(char)* _id = id.toCString!(No.Malloc, No.Nullable);
    _cretval = adw_multi_layout_view_get_child(cast(AdwMultiLayoutView*)this._cPtr, _id);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the currently used layout of self.
      Returns: the current layout
  */
  adw.layout.Layout getLayout() nothrow
  {
    AdwLayout* _cretval;
    _cretval = adw_multi_layout_view_get_layout(cast(AdwMultiLayoutView*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(adw.layout.Layout)(cast(AdwLayout*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets layout with the name name from self, or `NULL` if it doesn't exist.
      
      See [adw.layout.Layout.name].
  
      Params:
        name = the name of the layout
      Returns: the layout with name
  */
  adw.layout.Layout getLayoutByName(string name) nothrow
  {
    AdwLayout* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _cretval = adw_multi_layout_view_get_layout_by_name(cast(AdwMultiLayoutView*)this._cPtr, _name);
    auto _retval = gobject.object.ObjectWrap._getDObject!(adw.layout.Layout)(cast(AdwLayout*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the name of the currently used layout of self.
      Returns: the name of the current layout
  */
  string getLayoutName() nothrow
  {
    const(char)* _cretval;
    _cretval = adw_multi_layout_view_get_layout_name(cast(AdwMultiLayoutView*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Removes layout from self.
  
      Params:
        layout = the layout to add
  */
  void removeLayout(adw.layout.Layout layout) nothrow
  {
    adw_multi_layout_view_remove_layout(cast(AdwMultiLayoutView*)this._cPtr, layout ? cast(AdwLayout*)layout._cPtr(No.Dup) : null);
  }

  /**
      Sets child as the child for id in self.
      
      When changing layouts, it will be inserted into the slot with id.
  
      Params:
        id = the id of the child
        child = the child to set
  */
  void setChild(string id, gtk.widget.Widget child) nothrow
  {
    const(char)* _id = id.toCString!(No.Malloc, No.Nullable);
    adw_multi_layout_view_set_child(cast(AdwMultiLayoutView*)this._cPtr, _id, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Makes layout the current layout of self.
  
      Params:
        layout = a layout in self
  */
  void setLayout(adw.layout.Layout layout) nothrow
  {
    adw_multi_layout_view_set_layout(cast(AdwMultiLayoutView*)this._cPtr, layout ? cast(AdwLayout*)layout._cPtr(No.Dup) : null);
  }

  /**
      Makes the layout with name the current layout of self.
      
      See [adw.layout.Layout.name].
  
      Params:
        name = the name of the layout
  */
  void setLayoutName(string name) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    adw_multi_layout_view_set_layout_name(cast(AdwMultiLayoutView*)this._cPtr, _name);
  }
}

/// Fluent builder implementation template for [adw.multi_layout_view.MultiLayoutView]
class MultiLayoutViewGidBuilderImpl(T) : gtk.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `layout` property.
      Params:
        propval = The currently used layout.
      Returns: Builder instance for fluent chaining
  */
  T layout(adw.layout.Layout propval) nothrow
  {
    return setProperty("layout", propval);
  }

  /**
      Set `layoutName` property.
      Params:
        propval = The name of the currently used layout.
          
          See [adw.layout.Layout.name].
      Returns: Builder instance for fluent chaining
  */
  T layoutName(string propval) nothrow
  {
    return setProperty("layout-name", propval);
  }
}

/// Fluent builder for [adw.multi_layout_view.MultiLayoutView]
final class MultiLayoutViewGidBuilder : MultiLayoutViewGidBuilderImpl!MultiLayoutViewGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  MultiLayoutView build() nothrow
  {
    return new MultiLayoutView(cast(void*)createGObject(MultiLayoutView._getGType), Yes.Take);
  }
}
