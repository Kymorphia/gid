/// Module for [TreeListModel] class
module gtk.tree_list_model;

import gid.gid;
import gio.list_model;
import gio.list_model_mixin;
import gobject.object;
import gobject.types;
import gtk.c.functions;
import gtk.c.types;
import gtk.tree_list_row;
import gtk.types;

/**
    [gtk.tree_list_model.TreeListModel] is a list model that can create child models on demand.
*/
class TreeListModel : gobject.object.ObjectWrap, gio.list_model.ListModel
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
    return cast(void function())gtk_tree_list_model_get_type != &gidSymbolNotFound ? gtk_tree_list_model_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TreeListModel self()
  {
    return this;
  }

  /**
      Get `autoexpand` property.
      Returns: If all rows should be expanded by default.
  */
  @property bool autoexpand()
  {
    return getAutoexpand();
  }

  /**
      Set `autoexpand` property.
      Params:
        propval = If all rows should be expanded by default.
  */
  @property void autoexpand(bool propval)
  {
    return setAutoexpand(propval);
  }

  /**
      Get `itemType` property.
      Returns: The type of items. See [gio.list_model.ListModel.getItemType].
  */
  @property gobject.types.GType itemType()
  {
    return gobject.object.ObjectWrap.getProperty!(gobject.types.GType)("item-type");
  }

  /**
      Get `model` property.
      Returns: The root model displayed.
  */
  @property gio.list_model.ListModel model()
  {
    return getModel();
  }

  /**
      Get `nItems` property.
      Returns: The number of items. See [gio.list_model.ListModel.getNItems].
  */
  @property uint nItems()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("n-items");
  }

  mixin ListModelT!();

  /**
      Creates a new empty [gtk.tree_list_model.TreeListModel] displaying root
      with all rows collapsed.
  
      Params:
        root = The [gio.list_model.ListModel] to use as root
        passthrough = true to pass through items from the models
        autoexpand = true to set the autoexpand property and expand the root model
        createFunc = Function to call to create the [gio.list_model.ListModel] for the children
            of an item
      Returns: a newly created [gtk.tree_list_model.TreeListModel].
  */
  this(gio.list_model.ListModel root, bool passthrough, bool autoexpand, gtk.types.TreeListModelCreateModelFunc createFunc)
  {
    extern(C) GListModel* _createFuncCallback(GObject* item, void* userData)
    {
      gio.list_model.ListModel _dretval;
      auto _dlg = cast(gtk.types.TreeListModelCreateModelFunc*)userData;

      _dretval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)item, No.Take));
      GListModel* _retval = cast(GListModel*)(cast(gobject.object.ObjectWrap)_dretval)._cPtr(Yes.Dup);

      return _retval;
    }
    auto _createFuncCB = createFunc ? &_createFuncCallback : null;

    GtkTreeListModel* _cretval;
    auto _createFunc = createFunc ? freezeDelegate(cast(void*)&createFunc) : null;
    GDestroyNotify _createFuncDestroyCB = createFunc ? &thawDelegate : null;
    _cretval = gtk_tree_list_model_new(root ? cast(GListModel*)(cast(gobject.object.ObjectWrap)root)._cPtr(Yes.Dup) : null, passthrough, autoexpand, _createFuncCB, _createFunc, _createFuncDestroyCB);
    this(_cretval, Yes.Take);
  }

  /**
      Gets whether the model is set to automatically expand new rows
      that get added.
      
      This can be either rows added by changes to the underlying
      models or via [gtk.tree_list_row.TreeListRow.setExpanded].
      Returns: true if the model is set to autoexpand
  */
  bool getAutoexpand()
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
      
      Do not confuse this function with [gtk.tree_list_model.TreeListModel.getRow].
  
      Params:
        position = position of the child to get
      Returns: the child in position
  */
  gtk.tree_list_row.TreeListRow getChildRow(uint position)
  {
    GtkTreeListRow* _cretval;
    _cretval = gtk_tree_list_model_get_child_row(cast(GtkTreeListModel*)this._cPtr, position);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.tree_list_row.TreeListRow)(cast(GtkTreeListRow*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the root model that self was created with.
      Returns: the root model
  */
  gio.list_model.ListModel getModel()
  {
    GListModel* _cretval;
    _cretval = gtk_tree_list_model_get_model(cast(GtkTreeListModel*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.list_model.ListModel)(cast(GListModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether the model is passing through original row items.
      
      If this function returns false, the [gio.list_model.ListModel] functions for self
      return custom [gtk.tree_list_row.TreeListRow] objects. You need to call
      [gtk.tree_list_row.TreeListRow.getItem] on these objects to get the original
      item.
      
      If true, the values of the child models are passed through in their
      original state. You then need to call [gtk.tree_list_model.TreeListModel.getRow]
      to get the custom [gtk.tree_list_row.TreeListRow]s.
      Returns: true if the model is passing through original row items
  */
  bool getPassthrough()
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
      equivalent to calling [gio.list_model.ListModel.getItem].
      
      Do not confuse this function with [gtk.tree_list_model.TreeListModel.getChildRow].
  
      Params:
        position = the position of the row to fetch
      Returns: The row item
  */
  gtk.tree_list_row.TreeListRow getRow(uint position)
  {
    GtkTreeListRow* _cretval;
    _cretval = gtk_tree_list_model_get_row(cast(GtkTreeListModel*)this._cPtr, position);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.tree_list_row.TreeListRow)(cast(GtkTreeListRow*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Sets whether the model should autoexpand.
      
      If set to true, the model will recursively expand all rows that
      get added to the model. This can be either rows added by changes
      to the underlying models or via [gtk.tree_list_row.TreeListRow.setExpanded].
  
      Params:
        autoexpand = true to make the model autoexpand its rows
  */
  void setAutoexpand(bool autoexpand)
  {
    gtk_tree_list_model_set_autoexpand(cast(GtkTreeListModel*)this._cPtr, autoexpand);
  }
}
