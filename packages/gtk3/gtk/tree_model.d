module gtk.tree_model;

public import gtk.tree_model_iface_proxy;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gobject.types;
import gobject.value;
import gtk.c.functions;
import gtk.c.types;
import gtk.tree_iter;
import gtk.tree_path;
import gtk.types;

/**
 * The #GtkTreeModel interface defines a generic tree interface for
 * use by the #GtkTreeView widget. It is an abstract interface, and
 * is designed to be usable with any appropriate data structure. The
 * programmer just has to implement this interface on their own data
 * type for it to be viewable by a #GtkTreeView widget.
 * The model is represented as a hierarchical tree of strongly-typed,
 * columned data. In other words, the model can be seen as a tree where
 * every node has different values depending on which column is being
 * queried. The type of data found in a column is determined by using
 * the GType system $(LPAREN)ie. #G_TYPE_INT, #GTK_TYPE_BUTTON, #G_TYPE_POINTER,
 * etc$(RPAREN). The types are homogeneous per column across all nodes. It is
 * important to note that this interface only provides a way of examining
 * a model and observing changes. The implementation of each individual
 * model decides how and if changes are made.
 * In order to make life simpler for programmers who do not need to
 * write their own specialized model, two generic models are provided
 * — the #GtkTreeStore and the #GtkListStore. To use these, the
 * developer simply pushes data into these models as necessary. These
 * models provide the data structure as well as all appropriate tree
 * interfaces. As a result, implementing drag and drop, sorting, and
 * storing data is trivial. For the vast majority of trees and lists,
 * these two models are sufficient.
 * Models are accessed on a node/column level of granularity. One can
 * query for the value of a model at a certain node and a certain
 * column on that node. There are two structures used to reference a
 * particular node in a model. They are the #GtkTreePath-struct and
 * the #GtkTreeIter-struct $(LPAREN)“iter” is short for iterator$(RPAREN). Most of the
 * interface consists of operations on a #GtkTreeIter-struct.
 * A path is essentially a potential node. It is a location on a model
 * that may or may not actually correspond to a node on a specific
 * model. The #GtkTreePath-struct can be converted into either an
 * array of unsigned integers or a string. The string form is a list
 * of numbers separated by a colon. Each number refers to the offset
 * at that level. Thus, the path `0` refers to the root
 * node and the path `2:4` refers to the fifth child of
 * the third node.
 * By contrast, a #GtkTreeIter-struct is a reference to a specific node on
 * a specific model. It is a generic struct with an integer and three
 * generic pointers. These are filled in by the model in a model-specific
 * way. One can convert a path to an iterator by calling
 * [gtk.tree_model.TreeModel.getIter]. These iterators are the primary way
 * of accessing a model and are similar to the iterators used by
 * #GtkTextBuffer. They are generally statically allocated on the
 * stack and only used for a short time. The model interface defines
 * a set of operations using them for navigating the model.
 * It is expected that models fill in the iterator with private data.
 * For example, the #GtkListStore model, which is internally a simple
 * linked list, stores a list node in one of the pointers. The
 * #GtkTreeModelSort stores an array and an offset in two of the
 * pointers. Additionally, there is an integer field. This field is
 * generally filled with a unique stamp per model. This stamp is for
 * catching errors resulting from using invalid iterators with a model.
 * The lifecycle of an iterator can be a little confusing at first.
 * Iterators are expected to always be valid for as long as the model
 * is unchanged $(LPAREN)and doesn’t emit a signal$(RPAREN). The model is considered
 * to own all outstanding iterators and nothing needs to be done to
 * free them from the user’s point of view. Additionally, some models
 * guarantee that an iterator is valid for as long as the node it refers
 * to is valid $(LPAREN)most notably the #GtkTreeStore and #GtkListStore$(RPAREN).
 * Although generally uninteresting, as one always has to allow for
 * the case where iterators do not persist beyond a signal, some very
 * important performance enhancements were made in the sort model.
 * As a result, the #GTK_TREE_MODEL_ITERS_PERSIST flag was added to
 * indicate this behavior.
 * To help show some common operation of a model, some examples are
 * provided. The first example shows three ways of getting the iter at
 * the location `3:2:5`. While the first method shown is
 * easier, the second is much more common, as you often get paths from
 * callbacks.
 * ## Acquiring a #GtkTreeIter-struct
 * |[<!-- language\="C" -->
 * // Three ways of getting the iter pointing to the location
 * GtkTreePath *path;
 * GtkTreeIter iter;
 * GtkTreeIter parent_iter;
 * // get the iterator from a string
 * gtk_tree_model_get_iter_from_string $(LPAREN)model,
 * &iter,
 * "3:2:5"$(RPAREN);
 * // get the iterator from a path
 * path \= gtk_tree_path_new_from_string $(LPAREN)"3:2:5"$(RPAREN);
 * gtk_tree_model_get_iter $(LPAREN)model, &iter, path$(RPAREN);
 * gtk_tree_path_free $(LPAREN)path$(RPAREN);
 * // walk the tree to find the iterator
 * gtk_tree_model_iter_nth_child $(LPAREN)model, &iter,
 * NULL, 3$(RPAREN);
 * parent_iter \= iter;
 * gtk_tree_model_iter_nth_child $(LPAREN)model, &iter,
 * &parent_iter, 2$(RPAREN);
 * parent_iter \= iter;
 * gtk_tree_model_iter_nth_child $(LPAREN)model, &iter,
 * &parent_iter, 5$(RPAREN);
 * ]|
 * This second example shows a quick way of iterating through a list
 * and getting a string and an integer from each row. The
 * populate_model$(LPAREN)$(RPAREN) function used below is not
 * shown, as it is specific to the #GtkListStore. For information on
 * how to write such a function, see the #GtkListStore documentation.
 * ## Reading data from a #GtkTreeModel
 * |[<!-- language\="C" -->
 * enum
 * {
 * STRING_COLUMN,
 * INT_COLUMN,
 * N_COLUMNS
 * };
 * ...
 * GtkTreeModel *list_store;
 * GtkTreeIter iter;
 * gboolean valid;
 * gint row_count \= 0;
 * // make a new list_store
 * list_store \= gtk_list_store_new $(LPAREN)N_COLUMNS,
 * G_TYPE_STRING,
 * G_TYPE_INT$(RPAREN);
 * // Fill the list store with data
 * populate_model $(LPAREN)list_store$(RPAREN);
 * // Get the first iter in the list, check it is valid and walk
 * // through the list, reading each row.
 * valid \= gtk_tree_model_get_iter_first $(LPAREN)list_store,
 * &iter$(RPAREN);
 * while $(LPAREN)valid$(RPAREN)
 * {
 * gchar *str_data;
 * gint   int_data;
 * // Make sure you terminate calls to [gtk.tree_model.TreeModel.get] with a “-1” value
 * gtk_tree_model_get $(LPAREN)list_store, &iter,
 * STRING_COLUMN, &str_data,
 * INT_COLUMN, &int_data,
 * -1$(RPAREN);
 * // Do something with the data
 * g_print $(LPAREN)"Row %d: $(LPAREN)%s,%d$(RPAREN)\n",
 * row_count, str_data, int_data$(RPAREN);
 * g_free $(LPAREN)str_data$(RPAREN);
 * valid \= gtk_tree_model_iter_next $(LPAREN)list_store,
 * &iter$(RPAREN);
 * row_count++;
 * }
 * ]|
 * The #GtkTreeModel interface contains two methods for reference
 * counting: [gtk.tree_model.TreeModel.refNode] and [gtk.tree_model.TreeModel.unrefNode].
 * These two methods are optional to implement. The reference counting
 * is meant as a way for views to let models know when nodes are being
 * displayed. #GtkTreeView will take a reference on a node when it is
 * visible, which means the node is either in the toplevel or expanded.
 * Being displayed does not mean that the node is currently directly
 * visible to the user in the viewport. Based on this reference counting
 * scheme a caching model, for example, can decide whether or not to cache
 * a node based on the reference count. A file-system based model would
 * not want to keep the entire file hierarchy in memory, but just the
 * folders that are currently expanded in every current view.
 * When working with reference counting, the following rules must be taken
 * into account:
 * - Never take a reference on a node without owning a reference on its parent.
 * This means that all parent nodes of a referenced node must be referenced
 * as well.
 * - Outstanding references on a deleted node are not released. This is not
 * possible because the node has already been deleted by the time the
 * row-deleted signal is received.
 * - Models are not obligated to emit a signal on rows of which none of its
 * siblings are referenced. To phrase this differently, signals are only
 * required for levels in which nodes are referenced. For the root level
 * however, signals must be emitted at all times $(LPAREN)however the root level
 * is always referenced when any view is attached$(RPAREN).
 */
interface TreeModel
{

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_tree_model_get_type != &gidSymbolNotFound ? gtk_tree_model_get_type() : cast(GType)0;
  }

  /**
   * Creates a new #GtkTreeModel, with child_model as the child_model
   * and root as the virtual root.
   * Params:
   *   root = A #GtkTreePath or %NULL.
   * Returns: A new #GtkTreeModel.
   */
  gtk.tree_model.TreeModel filterNew(gtk.tree_path.TreePath root = null);

  /**
   * Calls func on each node in model in a depth-first fashion.
   * If func returns %TRUE, then the tree ceases to be walked,
   * and [gtk.tree_model.TreeModel.foreach_] returns.
   * Params:
   *   func = a function to be called on each row
   */
  void foreach_(gtk.types.TreeModelForeachFunc func);

  /**
   * Returns the type of the column.
   * Params:
   *   index = the column index
   * Returns: the type of the column
   */
  gobject.types.GType getColumnType(int index);

  /**
   * Returns a set of flags supported by this interface.
   * The flags are a bitwise combination of #GtkTreeModelFlags.
   * The flags supported should not change during the lifetime
   * of the tree_model.
   * Returns: the flags supported by this interface
   */
  gtk.types.TreeModelFlags getFlags();

  /**
   * Sets iter to a valid iterator pointing to path.  If path does
   * not exist, iter is set to an invalid iterator and %FALSE is returned.
   * Params:
   *   iter = the uninitialized #GtkTreeIter-struct
   *   path = the #GtkTreePath-struct
   * Returns: %TRUE, if iter was set
   */
  bool getIter(out gtk.tree_iter.TreeIter iter, gtk.tree_path.TreePath path);

  /**
   * Initializes iter with the first iterator in the tree
   * $(LPAREN)the one at the path "0"$(RPAREN) and returns %TRUE. Returns
   * %FALSE if the tree is empty.
   * Params:
   *   iter = the uninitialized #GtkTreeIter-struct
   * Returns: %TRUE, if iter was set
   */
  bool getIterFirst(out gtk.tree_iter.TreeIter iter);

  /**
   * Sets iter to a valid iterator pointing to path_string, if it
   * exists. Otherwise, iter is left invalid and %FALSE is returned.
   * Params:
   *   iter = an uninitialized #GtkTreeIter-struct
   *   pathString = a string representation of a #GtkTreePath-struct
   * Returns: %TRUE, if iter was set
   */
  bool getIterFromString(out gtk.tree_iter.TreeIter iter, string pathString);

  /**
   * Returns the number of columns supported by tree_model.
   * Returns: the number of columns
   */
  int getNColumns();

  /**
   * Returns a newly-created #GtkTreePath-struct referenced by iter.
   * This path should be freed with [gtk.tree_path.TreePath.free].
   * Params:
   *   iter = the #GtkTreeIter-struct
   * Returns: a newly-created #GtkTreePath-struct
   */
  gtk.tree_path.TreePath getPath(gtk.tree_iter.TreeIter iter);

  /**
   * Generates a string representation of the iter.
   * This string is a “:” separated list of numbers.
   * For example, “4:10:0:3” would be an acceptable
   * return value for this string.
   * Params:
   *   iter = a #GtkTreeIter-struct
   * Returns: a newly-allocated string.
   *   Must be freed with [glib.global.gfree].
   */
  string getStringFromIter(gtk.tree_iter.TreeIter iter);

  /**
   * Initializes and sets value to that at column.
   * When done with value, [gobject.value.Value.unset] needs to be called
   * to free any allocated memory.
   * Params:
   *   iter = the #GtkTreeIter-struct
   *   column = the column to lookup the value at
   *   value = an empty #GValue to set
   */
  void getValue(gtk.tree_iter.TreeIter iter, int column, out gobject.value.Value value);

  /**
   * Sets iter to point to the first child of parent.
   * If parent has no children, %FALSE is returned and iter is
   * set to be invalid. parent will remain a valid node after this
   * function has been called.
   * If parent is %NULL returns the first node, equivalent to
   * `gtk_tree_model_get_iter_first $(LPAREN)tree_model, iter$(RPAREN);`
   * Params:
   *   iter = the new #GtkTreeIter-struct to be set to the child
   *   parent = the #GtkTreeIter-struct, or %NULL
   * Returns: %TRUE, if iter has been set to the first child
   */
  bool iterChildren(out gtk.tree_iter.TreeIter iter, gtk.tree_iter.TreeIter parent = null);

  /**
   * Returns %TRUE if iter has children, %FALSE otherwise.
   * Params:
   *   iter = the #GtkTreeIter-struct to test for children
   * Returns: %TRUE if iter has children
   */
  bool iterHasChild(gtk.tree_iter.TreeIter iter);

  /**
   * Returns the number of children that iter has.
   * As a special case, if iter is %NULL, then the number
   * of toplevel nodes is returned.
   * Params:
   *   iter = the #GtkTreeIter-struct, or %NULL
   * Returns: the number of children of iter
   */
  int iterNChildren(gtk.tree_iter.TreeIter iter = null);

  /**
   * Sets iter to point to the node following it at the current level.
   * If there is no next iter, %FALSE is returned and iter is set
   * to be invalid.
   * Params:
   *   iter = the #GtkTreeIter-struct
   * Returns: %TRUE if iter has been changed to the next node
   */
  bool iterNext(gtk.tree_iter.TreeIter iter);

  /**
   * Sets iter to be the child of parent, using the given index.
   * The first index is 0. If n is too big, or parent has no children,
   * iter is set to an invalid iterator and %FALSE is returned. parent
   * will remain a valid node after this function has been called. As a
   * special case, if parent is %NULL, then the n-th root node
   * is set.
   * Params:
   *   iter = the #GtkTreeIter-struct to set to the nth child
   *   parent = the #GtkTreeIter-struct to get the child from, or %NULL.
   *   n = the index of the desired child
   * Returns: %TRUE, if parent has an n-th child
   */
  bool iterNthChild(out gtk.tree_iter.TreeIter iter, gtk.tree_iter.TreeIter parent, int n);

  /**
   * Sets iter to be the parent of child.
   * If child is at the toplevel, and doesn’t have a parent, then
   * iter is set to an invalid iterator and %FALSE is returned.
   * child will remain a valid node after this function has been
   * called.
   * iter will be initialized before the lookup is performed, so child
   * and iter cannot point to the same memory location.
   * Params:
   *   iter = the new #GtkTreeIter-struct to set to the parent
   *   child = the #GtkTreeIter-struct
   * Returns: %TRUE, if iter is set to the parent of child
   */
  bool iterParent(out gtk.tree_iter.TreeIter iter, gtk.tree_iter.TreeIter child);

  /**
   * Sets iter to point to the previous node at the current level.
   * If there is no previous iter, %FALSE is returned and iter is
   * set to be invalid.
   * Params:
   *   iter = the #GtkTreeIter-struct
   * Returns: %TRUE if iter has been changed to the previous node
   */
  bool iterPrevious(gtk.tree_iter.TreeIter iter);

  /**
   * Lets the tree ref the node.
   * This is an optional method for models to implement.
   * To be more specific, models may ignore this call as it exists
   * primarily for performance reasons.
   * This function is primarily meant as a way for views to let
   * caching models know when nodes are being displayed $(LPAREN)and hence,
   * whether or not to cache that node$(RPAREN). Being displayed means a node
   * is in an expanded branch, regardless of whether the node is currently
   * visible in the viewport. For example, a file-system based model
   * would not want to keep the entire file-hierarchy in memory,
   * just the sections that are currently being displayed by
   * every current view.
   * A model should be expected to be able to get an iter independent
   * of its reffed state.
   * Params:
   *   iter = the #GtkTreeIter-struct
   */
  void refNode(gtk.tree_iter.TreeIter iter);

  /**
   * Emits the #GtkTreeModel::row-changed signal on tree_model.
   * Params:
   *   path = a #GtkTreePath-struct pointing to the changed row
   *   iter = a valid #GtkTreeIter-struct pointing to the changed row
   */
  void rowChanged(gtk.tree_path.TreePath path, gtk.tree_iter.TreeIter iter);

  /**
   * Emits the #GtkTreeModel::row-deleted signal on tree_model.
   * This should be called by models after a row has been removed.
   * The location pointed to by path should be the location that
   * the row previously was at. It may not be a valid location anymore.
   * Nodes that are deleted are not unreffed, this means that any
   * outstanding references on the deleted node should not be released.
   * Params:
   *   path = a #GtkTreePath-struct pointing to the previous location of
   *     the deleted row
   */
  void rowDeleted(gtk.tree_path.TreePath path);

  /**
   * Emits the #GtkTreeModel::row-has-child-toggled signal on
   * tree_model. This should be called by models after the child
   * state of a node changes.
   * Params:
   *   path = a #GtkTreePath-struct pointing to the changed row
   *   iter = a valid #GtkTreeIter-struct pointing to the changed row
   */
  void rowHasChildToggled(gtk.tree_path.TreePath path, gtk.tree_iter.TreeIter iter);

  /**
   * Emits the #GtkTreeModel::row-inserted signal on tree_model.
   * Params:
   *   path = a #GtkTreePath-struct pointing to the inserted row
   *   iter = a valid #GtkTreeIter-struct pointing to the inserted row
   */
  void rowInserted(gtk.tree_path.TreePath path, gtk.tree_iter.TreeIter iter);

  /**
   * Emits the #GtkTreeModel::rows-reordered signal on tree_model.
   * This should be called by models when their rows have been
   * reordered.
   * Params:
   *   path = a #GtkTreePath-struct pointing to the tree node whose children
   *     have been reordered
   *   iter = a valid #GtkTreeIter-struct pointing to the node
   *     whose children have been reordered, or %NULL if the depth
   *     of path is 0
   *   newOrder = an array of integers
   *     mapping the current position of each child to its old
   *     position before the re-ordering,
   *     i.e. new_order`[newpos] \= oldpos`
   */
  void rowsReordered(gtk.tree_path.TreePath path, gtk.tree_iter.TreeIter iter, int[] newOrder);

  /**
   * Lets the tree unref the node.
   * This is an optional method for models to implement.
   * To be more specific, models may ignore this call as it exists
   * primarily for performance reasons. For more information on what
   * this means, see [gtk.tree_model.TreeModel.refNode].
   * Please note that nodes that are deleted are not unreffed.
   * Params:
   *   iter = the #GtkTreeIter-struct
   */
  void unrefNode(gtk.tree_iter.TreeIter iter);

  /**
   * This signal is emitted when a row in the model has changed.
   * Params
   *   path = a #GtkTreePath-struct identifying the changed row
   *   iter = a valid #GtkTreeIter-struct pointing to the changed row
   *   treeModel = the instance the signal is connected to
   */
  alias RowChangedCallbackDlg = void delegate(gtk.tree_path.TreePath path, gtk.tree_iter.TreeIter iter, gtk.tree_model.TreeModel treeModel);
  alias RowChangedCallbackFunc = void function(gtk.tree_path.TreePath path, gtk.tree_iter.TreeIter iter, gtk.tree_model.TreeModel treeModel);

  /**
   * Connect to RowChanged signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectRowChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : RowChangedCallbackDlg) || is(T : RowChangedCallbackFunc));

  /**
   * This signal is emitted when a row has been deleted.
   * Note that no iterator is passed to the signal handler,
   * since the row is already deleted.
   * This should be called by models after a row has been removed.
   * The location pointed to by path should be the location that
   * the row previously was at. It may not be a valid location anymore.
   * Params
   *   path = a #GtkTreePath-struct identifying the row
   *   treeModel = the instance the signal is connected to
   */
  alias RowDeletedCallbackDlg = void delegate(gtk.tree_path.TreePath path, gtk.tree_model.TreeModel treeModel);
  alias RowDeletedCallbackFunc = void function(gtk.tree_path.TreePath path, gtk.tree_model.TreeModel treeModel);

  /**
   * Connect to RowDeleted signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectRowDeleted(T)(T callback, Flag!"After" after = No.After)
  if (is(T : RowDeletedCallbackDlg) || is(T : RowDeletedCallbackFunc));

  /**
   * This signal is emitted when a row has gotten the first child
   * row or lost its last child row.
   * Params
   *   path = a #GtkTreePath-struct identifying the row
   *   iter = a valid #GtkTreeIter-struct pointing to the row
   *   treeModel = the instance the signal is connected to
   */
  alias RowHasChildToggledCallbackDlg = void delegate(gtk.tree_path.TreePath path, gtk.tree_iter.TreeIter iter, gtk.tree_model.TreeModel treeModel);
  alias RowHasChildToggledCallbackFunc = void function(gtk.tree_path.TreePath path, gtk.tree_iter.TreeIter iter, gtk.tree_model.TreeModel treeModel);

  /**
   * Connect to RowHasChildToggled signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectRowHasChildToggled(T)(T callback, Flag!"After" after = No.After)
  if (is(T : RowHasChildToggledCallbackDlg) || is(T : RowHasChildToggledCallbackFunc));

  /**
   * This signal is emitted when a new row has been inserted in
   * the model.
   * Note that the row may still be empty at this point, since
   * it is a common pattern to first insert an empty row, and
   * then fill it with the desired values.
   * Params
   *   path = a #GtkTreePath-struct identifying the new row
   *   iter = a valid #GtkTreeIter-struct pointing to the new row
   *   treeModel = the instance the signal is connected to
   */
  alias RowInsertedCallbackDlg = void delegate(gtk.tree_path.TreePath path, gtk.tree_iter.TreeIter iter, gtk.tree_model.TreeModel treeModel);
  alias RowInsertedCallbackFunc = void function(gtk.tree_path.TreePath path, gtk.tree_iter.TreeIter iter, gtk.tree_model.TreeModel treeModel);

  /**
   * Connect to RowInserted signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectRowInserted(T)(T callback, Flag!"After" after = No.After)
  if (is(T : RowInsertedCallbackDlg) || is(T : RowInsertedCallbackFunc));
  }
