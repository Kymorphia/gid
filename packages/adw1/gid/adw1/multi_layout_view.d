/// Module for [MultiLayoutView] class
module gid.adw1.multi_layout_view;

public import gid.core.basictypes;
import gid.adw1.c.functions;
import gid.adw1.c.types;
import gid.adw1.layout;
import gid.adw1.types;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.widget;

/**
    A widget for switching between different layouts.
    
    [gid.adw1.multi_layout_view.MultiLayoutView] contains layouts and children. Each child has
    an ID, each layout has slots inside it, each slot also has an ID. When
    switching layouts, children are inserted into slots with matching IDs. The
    [gid.gtk4.widget.Widget.visible] property of each slot is updated to match
    that of the inserted child.
    
    This can be useful for rearranging children when it's difficult to do so
    otherwise, for example to move a child from a sidebar to a bottom bar.
    
    The currently used layout can be switched using the
    [gid.adw1.multi_layout_view.MultiLayoutView.layout] or [gid.adw1.multi_layout_view.MultiLayoutView.layoutName]
    properties. For example, it can be done via a [gid.adw1.breakpoint.Breakpoint] setter
    to change layouts depending on the window size.
    
    ## AdwMultiLayoutView as GtkBuildable
    
    The [gid.adw1.multi_layout_view.MultiLayoutView] implementation of the [gid.gtk4.buildable.Buildable]
    interface supports adding layouts via `<child>` element with the `type`
    attribute omitted.
    
    It also supports setting children via `<child type="ID">`.
    
    Example of an [gid.adw1.multi_layout_view.MultiLayoutView] UI definition that can display a secondary
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
    
    [gid.adw1.multi_layout_view.MultiLayoutView] has a single CSS node with name `multi-layout-view`.
*/
class MultiLayoutView : gid.gtk4.widget.Widget
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
      Get builder for [gid.adw1.multi_layout_view.MultiLayoutView]
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
  @property gid.adw1.layout.Layout layout() nothrow
  {
    return getLayout();
  }

  /**
      Set `layout` property.
      Params:
        propval = The currently used layout.
  */
  @property void layout(gid.adw1.layout.Layout propval) nothrow
  {
    setLayout(propval);
  }

  /**
      Get `layoutName` property.
      Returns: The name of the currently used layout.
        
        See [gid.adw1.layout.Layout.name].
  */
  @property string layoutName() nothrow
  {
    return getLayoutName();
  }

  /**
      Set `layoutName` property.
      Params:
        propval = The name of the currently used layout.
          
          See [gid.adw1.layout.Layout.name].
  */
  @property void layoutName(string propval) nothrow
  {
    setLayoutName(propval);
  }

  /**
      Creates a new [gid.adw1.multi_layout_view.MultiLayoutView].
      Returns: the newly created [gid.adw1.multi_layout_view.MultiLayoutView]
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = adw_multi_layout_view_new();
      this(_cretval, No.Take);
    }
  }

  /**
      Adds layout to self.
  
      Params:
        layout = the layout to add
  */
  void addLayout(gid.adw1.layout.Layout layout) nothrow
  {
    adw_multi_layout_view_add_layout(cast(AdwMultiLayoutView*)this._cPtr, layout ? cast(AdwLayout*)layout._cPtr(Yes.Dup) : null);
  }

  /**
      Gets the child for id to self.
  
      Params:
        id = the id of the child
      Returns: the child for id
  */
  gid.gtk4.widget.Widget getChild(string id) nothrow
  {
    GtkWidget* _cretval;
    const(char)* _id = id.toCString!(No.Malloc, No.Nullable);
    _cretval = adw_multi_layout_view_get_child(cast(AdwMultiLayoutView*)this._cPtr, _id);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the currently used layout of self.
      Returns: the current layout
  */
  gid.adw1.layout.Layout getLayout() nothrow
  {
    AdwLayout* _cretval;
    _cretval = adw_multi_layout_view_get_layout(cast(AdwMultiLayoutView*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.adw1.layout.Layout)(cast(AdwLayout*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets layout with the name name from self, or `NULL` if it doesn't exist.
      
      See [gid.adw1.layout.Layout.name].
  
      Params:
        name = the name of the layout
      Returns: the layout with name
  */
  gid.adw1.layout.Layout getLayoutByName(string name) nothrow
  {
    AdwLayout* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _cretval = adw_multi_layout_view_get_layout_by_name(cast(AdwMultiLayoutView*)this._cPtr, _name);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.adw1.layout.Layout)(cast(AdwLayout*)_cretval, No.Take);
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
  void removeLayout(gid.adw1.layout.Layout layout) nothrow
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
  void setChild(string id, gid.gtk4.widget.Widget child) nothrow
  {
    const(char)* _id = id.toCString!(No.Malloc, No.Nullable);
    adw_multi_layout_view_set_child(cast(AdwMultiLayoutView*)this._cPtr, _id, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Makes layout the current layout of self.
  
      Params:
        layout = a layout in self
  */
  void setLayout(gid.adw1.layout.Layout layout) nothrow
  {
    adw_multi_layout_view_set_layout(cast(AdwMultiLayoutView*)this._cPtr, layout ? cast(AdwLayout*)layout._cPtr(No.Dup) : null);
  }

  /**
      Makes the layout with name the current layout of self.
      
      See [gid.adw1.layout.Layout.name].
  
      Params:
        name = the name of the layout
  */
  void setLayoutName(string name) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    adw_multi_layout_view_set_layout_name(cast(AdwMultiLayoutView*)this._cPtr, _name);
  }
}

/// Fluent builder implementation template for [gid.adw1.multi_layout_view.MultiLayoutView]
class MultiLayoutViewGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `layout` property.
      Params:
        propval = The currently used layout.
      Returns: Builder instance for fluent chaining
  */
  T layout(gid.adw1.layout.Layout propval) nothrow
  {
    return setProperty("layout", propval);
  }

  /**
      Set `layoutName` property.
      Params:
        propval = The name of the currently used layout.
          
          See [gid.adw1.layout.Layout.name].
      Returns: Builder instance for fluent chaining
  */
  T layoutName(string propval) nothrow
  {
    return setProperty("layout-name", propval);
  }
}

/// Fluent builder for [gid.adw1.multi_layout_view.MultiLayoutView]
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
