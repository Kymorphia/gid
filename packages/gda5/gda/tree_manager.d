/// Module for [TreeManager] class
module gda.tree_manager;

import gda.c.functions;
import gda.c.types;
import gda.tree_node;
import gda.types;
import gid.gid;
import glib.error;
import glib.types;
import gobject.object;
import gobject.value;

/** */
class TreeManager : gobject.object.ObjectWrap
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
    return cast(void function())gda_tree_manager_get_type != &gidSymbolNotFound ? gda_tree_manager_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TreeManager self()
  {
    return this;
  }

  /**
      Get `func` property.
      Returns: This property specifies the function which needs to be called when the list of #GdaTreeNode nodes
        managed has to be updated
  */
  @property void* func()
  {
    return gobject.object.ObjectWrap.getProperty!(void*)("func");
  }

  /**
      Set `func` property.
      Params:
        propval = This property specifies the function which needs to be called when the list of #GdaTreeNode nodes
          managed has to be updated
  */
  @property void func(void* propval)
  {
    gobject.object.ObjectWrap.setProperty!(void*)("func", propval);
  }

  /**
      Get `recursive` property.
      Returns: This property specifies if, when initially creating nodes or updating the list of nodes,
        the tree manager shoud also request that each node it has created or updated also
        initially create or update their children.
        
        This property can typically set to FALSE if the process of creating children nodes is lenghty
        and needs to be postponed while an event occurs.
  */
  @property bool recursive()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("recursive");
  }

  /**
      Set `recursive` property.
      Params:
        propval = This property specifies if, when initially creating nodes or updating the list of nodes,
          the tree manager shoud also request that each node it has created or updated also
          initially create or update their children.
          
          This property can typically set to FALSE if the process of creating children nodes is lenghty
          and needs to be postponed while an event occurs.
  */
  @property void recursive(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("recursive", propval);
  }

  /** */
  static glib.types.Quark errorQuark()
  {
    glib.types.Quark _retval;
    _retval = gda_tree_manager_error_quark();
    return _retval;
  }

  /**
      Adds a sub manager to manager. Use this method to create the skeleton structure
      of a #GdaTree. Note that a single #GdaTreeManager can be used by several #GdaTree objects
      or several times in the same #GdaTree's structure.
      
      Please note that it's possible for mgr and sub to be the same object, but beware of the possible
      infinite recursive behaviour in this case when creating children nodes
      (depending on the actual implementation of the #GdaTreeManager).
  
      Params:
        sub = a #GdaTreeManager object to add
  */
  void addManager(gda.tree_manager.TreeManager sub)
  {
    gda_tree_manager_add_manager(cast(GdaTreeManager*)this._cPtr, sub ? cast(GdaTreeManager*)sub._cPtr(No.Dup) : null);
  }

  /**
      Requests that for any new node managed (eg. created) by manager, a new attribute will be set. This allows
      one to customize the attributes of new nodes created by an existing #GdaTreeManager.
      
      As a side effect, if value is null, then the corresponding attribute, if it was set, is unset.
  
      Params:
        attribute = an attribute name
        value = the attribute's value, or null
  */
  void addNewNodeAttribute(string attribute, gobject.value.Value value = null)
  {
    const(char)* _attribute = attribute.toCString(No.Alloc);
    gda_tree_manager_add_new_node_attribute(cast(GdaTreeManager*)this._cPtr, _attribute, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
  }

  /**
      Requests that manager creates a new #GdaTreeNode. The new node is not in any
      way linked to manager yet, consider this method as a #GdaTreeNode factory.
      
      This method is usually used when implementing a #GdaTreeManagerNodesFunc function (to create nodes),
      or when subclassing the #GdaTreeManager.
  
      Params:
        parent = the parent the new node may have, or null
        name = name given to the new node, or null
      Returns: a new #GdaTreeNode
  */
  gda.tree_node.TreeNode createNode(gda.tree_node.TreeNode parent = null, string name = null)
  {
    GdaTreeNode* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gda_tree_manager_create_node(cast(GdaTreeManager*)this._cPtr, parent ? cast(GdaTreeNode*)parent._cPtr(No.Dup) : null, _name);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.tree_node.TreeNode)(cast(GdaTreeNode*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Get the list of sub managers which have already been added using [gda.tree_manager.TreeManager.addManager]
      Returns: a list of #GdaTreeMenager which should not be modified.
  */
  gda.tree_manager.TreeManager[] getManagers()
  {
    const(GSList)* _cretval;
    _cretval = gda_tree_manager_get_managers(cast(GdaTreeManager*)this._cPtr);
    auto _retval = gSListToD!(gda.tree_manager.TreeManager, GidOwnership.None)(cast(GSList*)_cretval);
    return _retval;
  }
}

class TreeManagerException : ErrorWrap
{
  this(GError* err)
  {
    super(err);
  }

  this(Code code, string msg)
  {
    super(gda.tree_manager.TreeManager.errorQuark, cast(int)code, msg);
  }

  alias Code = TreeManagerError;
}
