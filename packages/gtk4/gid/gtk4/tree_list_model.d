/// Module for [TreeListModel] class
module gid.gtk4.tree_list_model;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.list_model;
import gid.gio2.list_model_mixin;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gobject2.types;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.tree_list_row;
import gid.gtk4.types;

/**
    A list model that can create child models on demand.
*/
class TreeListModel : gid.gobject2.object.ObjectWrap, gid.gio2.list_model.ListModel
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
    return cast(void function())gtk_tree_list_model_get_type != &gidSymbolNotFound ? gtk_tree_list_model_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkTreeListModel";
  }

  /** Returns `this`, for use in `with` statements. */
  override TreeListModel self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.tree_list_model.TreeListModel]
      Returns: New builder object
  */
  static TreeListModelGidBuilder builder() nothrow
  {
    return new TreeListModelGidBuilder;
  }

  /**
      Get `autoexpand` property.
      Returns: If all rows should be expanded by default.
  */
  @property bool autoexpand() nothrow
  {
    return getAutoexpand();
  }

  /**
      Set `autoexpand` property.
      Params:
        propval = If all rows should be expanded by default.
  */
  @property void autoexpand(bool propval) nothrow
  {
    setAutoexpand(propval);
  }

  /**
      Get `itemType` property.
      Returns: The type of items. See [gid.gio2.list_model.ListModel.getItemType].
  */
  @property gid.gobject2.types.GType itemType() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gobject2.types.GType)("item-type");
  }

  /**
      Get `model` property.
      Returns: The root model displayed.
  */
  @property gid.gio2.list_model.ListModel model() nothrow
  {
    return getModel();
  }

  /**
      Get `nItems` property.
      Returns: The number of items. See [gid.gio2.list_model.ListModel.getNItems].
  */
  @property uint nItems() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(uint)("n-items");
  }

  /**
      Get `passthrough` property.
      Returns: Gets whether the model is in passthrough mode.
        
        If false, the [gid.gio2.list_model.ListModel] functions for this object return custom
        [gid.gtk4.tree_list_row.TreeListRow] objects. If true, the values of the child
        models are pass through unmodified.
  */
  @property bool passthrough() nothrow
  {
    return getPassthrough();
  }

  mixin ListModelT!();

  /**
      Creates a new empty [gid.gtk4.tree_list_model.TreeListModel] displaying root
      with all rows collapsed.
  
      Params:
        root = The [gid.gio2.list_model.ListModel] to use as root
        passthrough = true to pass through items from the models
        autoexpand = true to set the autoexpand property and expand the root model
        createFunc = function to
            call to create the [gid.gio2.list_model.ListModel] for the children of an item
      Returns: a newly created [gid.gtk4.tree_list_model.TreeListModel].
  */
  this(gid.gio2.list_model.ListModel root, bool passthrough, bool autoexpand, gid.gtk4.types.TreeListModelCreateModelFunc createFunc) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      extern(C) GListModel* _createFuncCallback(GObject* item, void* userData) nothrow
      {
        gidAttachThread();
        gid.gio2.list_model.ListModel _dretval;
        auto _dlg = cast(gid.gtk4.types.TreeListModelCreateModelFunc*)userData;

        try
        {
          _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)item, No.Take));
        }
        catch (Exception e)
        {
          gidInvokeCallbackExceptionHandler(e, "gid.gtk4.types.TreeListModelCreateModelFunc");
        }
        auto _retval = _dretval ? cast(GListModel*)(cast(gid.gobject2.object.ObjectWrap)_dretval)._cPtr(Yes.Dup) : null;

        return _retval;
      }
      auto _createFuncCB = createFunc ? &_createFuncCallback : null;
      GtkTreeListModel* _cretval;
      auto _createFunc = createFunc ? freezeDelegate(cast(void*)&createFunc) : null;
      GDestroyNotify _createFuncDestroyCB = createFunc ? &thawDelegate : null;
      _cretval = gtk_tree_list_model_new(root ? cast(GListModel*)(cast(gid.gobject2.object.ObjectWrap)root)._cPtr(Yes.Dup) : null, passthrough, autoexpand, _createFuncCB, _createFunc, _createFuncDestroyCB);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Gets whether the model is set to automatically expand new rows
      that get added.
      
      This can be either rows added by changes to the underlying
      models or via [gid.gtk4.tree_list_row.TreeListRow.setExpanded].
      Returns: true if the model is set to autoexpand
  */
  bool getAutoexpand() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_list_model_get_autoexpand(cast(GtkTreeListModel*)this._cPtr);
    return _retval;
  }

  /**
      Gets the row item corresponding to the child at index position for
      self's root model.
      
      If position is greater than the number of children in the root model,
      null is returned.
      
      Do not confuse this function with [gid.gtk4.tree_list_model.TreeListModel.getRow].
  
      Params:
        position = position of the child to get
      Returns: the child in position
  */
  gid.gtk4.tree_list_row.TreeListRow getChildRow(uint position) nothrow
  {
    GtkTreeListRow* _cretval;
    _cretval = gtk_tree_list_model_get_child_row(cast(GtkTreeListModel*)this._cPtr, position);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.tree_list_row.TreeListRow)(cast(GtkTreeListRow*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the root model that self was created with.
      Returns: the root model
  */
  gid.gio2.list_model.ListModel getModel() nothrow
  {
    GListModel* _cretval;
    _cretval = gtk_tree_list_model_get_model(cast(GtkTreeListModel*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.list_model.ListModel)(cast(GListModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether the model is passing through original row items.
      
      If this function returns false, the [gid.gio2.list_model.ListModel] functions for self
      return custom [gid.gtk4.tree_list_row.TreeListRow] objects. You need to call
      [gid.gtk4.tree_list_row.TreeListRow.getItem] on these objects to get the original
      item.
      
      If true, the values of the child models are passed through in their
      original state. You then need to call [gid.gtk4.tree_list_model.TreeListModel.getRow]
      to get the custom [gid.gtk4.tree_list_row.TreeListRow]s.
      Returns: true if the model is passing through original row items
  */
  bool getPassthrough() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_list_model_get_passthrough(cast(GtkTreeListModel*)this._cPtr);
    return _retval;
  }

  /**
      Gets the row object for the given row.
      
      If position is greater than the number of items in self,
      null is returned.
      
      The row object can be used to expand and collapse rows as
      well as to inspect its position in the tree. See its
      documentation for details.
      
      This row object is persistent and will refer to the current
      item as long as the row is present in self, independent of
      other rows being added or removed.
      
      If self is set to not be passthrough, this function is
      equivalent to calling [gid.gio2.list_model.ListModel.getItem].
      
      Do not confuse this function with [gid.gtk4.tree_list_model.TreeListModel.getChildRow].
  
      Params:
        position = the position of the row to fetch
      Returns: The row item
  */
  gid.gtk4.tree_list_row.TreeListRow getRow(uint position) nothrow
  {
    GtkTreeListRow* _cretval;
    _cretval = gtk_tree_list_model_get_row(cast(GtkTreeListModel*)this._cPtr, position);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.tree_list_row.TreeListRow)(cast(GtkTreeListRow*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Sets whether the model should autoexpand.
      
      If set to true, the model will recursively expand all rows that
      get added to the model. This can be either rows added by changes
      to the underlying models or via [gid.gtk4.tree_list_row.TreeListRow.setExpanded].
  
      Params:
        autoexpand = true to make the model autoexpand its rows
  */
  void setAutoexpand(bool autoexpand) nothrow
  {
    gtk_tree_list_model_set_autoexpand(cast(GtkTreeListModel*)this._cPtr, autoexpand);
  }
}

/// Fluent builder implementation template for [gid.gtk4.tree_list_model.TreeListModel]
class TreeListModelGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gio2.list_model.ListModelGidBuilderImpl!T
{

  mixin ListModelGidBuilderT!();

  /**
      Set `autoexpand` property.
      Params:
        propval = If all rows should be expanded by default.
      Returns: Builder instance for fluent chaining
  */
  T autoexpand(bool propval) nothrow
  {
    return setProperty("autoexpand", propval);
  }

  /**
      Set `passthrough` property.
      Params:
        propval = Gets whether the model is in passthrough mode.
          
          If false, the [gid.gio2.list_model.ListModel] functions for this object return custom
          [gid.gtk4.tree_list_row.TreeListRow] objects. If true, the values of the child
          models are pass through unmodified.
      Returns: Builder instance for fluent chaining
  */
  T passthrough(bool propval) nothrow
  {
    return setProperty("passthrough", propval);
  }
}

/// Fluent builder for [gid.gtk4.tree_list_model.TreeListModel]
final class TreeListModelGidBuilder : TreeListModelGidBuilderImpl!TreeListModelGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  TreeListModel build() nothrow
  {
    return new TreeListModel(cast(void*)createGObject(TreeListModel._getGType), Yes.Take);
  }
}
