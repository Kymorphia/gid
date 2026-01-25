/// Module for [EntryCompletion] class
module gtk.entry_completion;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.cell_area;
import gtk.cell_layout;
import gtk.cell_layout_mixin;
import gtk.tree_iter;
import gtk.tree_model;
import gtk.types;
import gtk.widget;

/**
    [gtk.entry_completion.EntryCompletion] is an auxiliary object to provide completion functionality
    for [gtk.entry.Entry].
    
    It implements the [gtk.cell_layout.CellLayout] interface, to allow the user
    to add extra cells to the [gtk.tree_view.TreeView] with completion matches.
    
    “Completion functionality” means that when the user modifies the text
    in the entry, [gtk.entry_completion.EntryCompletion] checks which rows in the model match
    the current content of the entry, and displays a list of matches.
    By default, the matching is done by comparing the entry text
    case-insensitively against the text column of the model (see
    [gtk.entry_completion.EntryCompletion.setTextColumn]), but this can be overridden
    with a custom match function (see [gtk.entry_completion.EntryCompletion.setMatchFunc]).
    
    When the user selects a completion, the content of the entry is
    updated. By default, the content of the entry is replaced by the
    text column of the model, but this can be overridden by connecting
    to the `signal@Gtk.EntryCompletion::match-selected` signal and updating the
    entry in the signal handler. Note that you should return true from
    the signal handler to suppress the default behaviour.
    
    To add completion functionality to an entry, use
    [gtk.entry.Entry.setCompletion].
    
    [gtk.entry_completion.EntryCompletion] uses a [gtk.tree_model_filter.TreeModelFilter] model to
    represent the subset of the entire model that is currently matching.
    While the [gtk.entry_completion.EntryCompletion] signals
    `signal@Gtk.EntryCompletion::match-selected` and
    `signal@Gtk.EntryCompletion::cursor-on-match` take the original model
    and an iter pointing to that model as arguments, other callbacks and
    signals (such as [gtk.types.CellLayoutDataFunc] or
    `signal@Gtk.CellArea::apply-attributes)`
    will generally take the filter model as argument. As long as you are
    only calling [gtk.tree_model.TreeModel.get], this will make no difference to
    you. If for some reason, you need the original model, use
    [gtk.tree_model_filter.TreeModelFilter.getModel]. Don’t forget to use
    [gtk.tree_model_filter.TreeModelFilter.convertIterToChildIter] to obtain a
    matching iter.
*/
class EntryCompletion : gobject.object.ObjectWrap, gtk.buildable.Buildable, gtk.cell_layout.CellLayout
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
    return cast(void function())gtk_entry_completion_get_type != &gidSymbolNotFound ? gtk_entry_completion_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override EntryCompletion self()
  {
    return this;
  }

  /**
      Get `inlineCompletion` property.
      Returns: Determines whether the common prefix of the possible completions
        should be inserted automatically in the entry.
        
        Note that this requires text-column to be set, even if you are
        using a custom match function.
  */
  @property bool inlineCompletion()
  {
    return getInlineCompletion();
  }

  /**
      Set `inlineCompletion` property.
      Params:
        propval = Determines whether the common prefix of the possible completions
          should be inserted automatically in the entry.
          
          Note that this requires text-column to be set, even if you are
          using a custom match function.
  */
  @property void inlineCompletion(bool propval)
  {
    return setInlineCompletion(propval);
  }

  /**
      Get `inlineSelection` property.
      Returns: Determines whether the possible completions on the popup
        will appear in the entry as you navigate through them.
  */
  @property bool inlineSelection()
  {
    return getInlineSelection();
  }

  /**
      Set `inlineSelection` property.
      Params:
        propval = Determines whether the possible completions on the popup
          will appear in the entry as you navigate through them.
  */
  @property void inlineSelection(bool propval)
  {
    return setInlineSelection(propval);
  }

  /** */
  @property int minimumKeyLength()
  {
    return getMinimumKeyLength();
  }

  /** */
  @property void minimumKeyLength(int propval)
  {
    return setMinimumKeyLength(propval);
  }

  /** */
  @property gtk.tree_model.TreeModel model()
  {
    return getModel();
  }

  /** */
  @property void model(gtk.tree_model.TreeModel propval)
  {
    return setModel(propval);
  }

  /**
      Get `popupCompletion` property.
      Returns: Determines whether the possible completions should be
        shown in a popup window.
  */
  @property bool popupCompletion()
  {
    return getPopupCompletion();
  }

  /**
      Set `popupCompletion` property.
      Params:
        propval = Determines whether the possible completions should be
          shown in a popup window.
  */
  @property void popupCompletion(bool propval)
  {
    return setPopupCompletion(propval);
  }

  /**
      Get `popupSetWidth` property.
      Returns: Determines whether the completions popup window will be
        resized to the width of the entry.
  */
  @property bool popupSetWidth()
  {
    return getPopupSetWidth();
  }

  /**
      Set `popupSetWidth` property.
      Params:
        propval = Determines whether the completions popup window will be
          resized to the width of the entry.
  */
  @property void popupSetWidth(bool propval)
  {
    return setPopupSetWidth(propval);
  }

  /**
      Get `popupSingleMatch` property.
      Returns: Determines whether the completions popup window will shown
        for a single possible completion.
        
        You probably want to set this to false if you are using
        `property@Gtk.EntryCompletion:inline-completion`.
  */
  @property bool popupSingleMatch()
  {
    return getPopupSingleMatch();
  }

  /**
      Set `popupSingleMatch` property.
      Params:
        propval = Determines whether the completions popup window will shown
          for a single possible completion.
          
          You probably want to set this to false if you are using
          `property@Gtk.EntryCompletion:inline-completion`.
  */
  @property void popupSingleMatch(bool propval)
  {
    return setPopupSingleMatch(propval);
  }

  /**
      Get `textColumn` property.
      Returns: The column of the model containing the strings.
        
        Note that the strings must be UTF-8.
  */
  @property int textColumn()
  {
    return getTextColumn();
  }

  /**
      Set `textColumn` property.
      Params:
        propval = The column of the model containing the strings.
          
          Note that the strings must be UTF-8.
  */
  @property void textColumn(int propval)
  {
    return setTextColumn(propval);
  }

  mixin BuildableT!();
  mixin CellLayoutT!();

  /**
      Creates a new [gtk.entry_completion.EntryCompletion] object.
      Returns: A newly created [gtk.entry_completion.EntryCompletion] object
  
      Deprecated: GtkEntryCompletion will be removed in GTK 5.
  */
  this()
  {
    GtkEntryCompletion* _cretval;
    _cretval = gtk_entry_completion_new();
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new [gtk.entry_completion.EntryCompletion] object using the
      specified area.
      
      The [gtk.cell_area.CellArea] is used to layout cells in the underlying
      [gtk.tree_view_column.TreeViewColumn] for the drop-down menu.
  
      Params:
        area = the [gtk.cell_area.CellArea] used to layout cells
      Returns: A newly created [gtk.entry_completion.EntryCompletion] object
  
      Deprecated: GtkEntryCompletion will be removed in GTK 5.
  */
  static gtk.entry_completion.EntryCompletion newWithArea(gtk.cell_area.CellArea area)
  {
    GtkEntryCompletion* _cretval;
    _cretval = gtk_entry_completion_new_with_area(area ? cast(GtkCellArea*)area._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.entry_completion.EntryCompletion)(cast(GtkEntryCompletion*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Requests a completion operation, or in other words a refiltering of the
      current list with completions, using the current key.
      
      The completion list view will be updated accordingly.
  
      Deprecated: GtkEntryCompletion will be removed in GTK 5.
  */
  void complete()
  {
    gtk_entry_completion_complete(cast(GtkEntryCompletion*)this._cPtr);
  }

  /**
      Computes the common prefix that is shared by all rows in completion
      that start with key.
      
      If no row matches key, null will be returned.
      Note that a text column must have been set for this function to work,
      see [gtk.entry_completion.EntryCompletion.setTextColumn] for details.
  
      Params:
        key = The text to complete for
      Returns: The common prefix all rows
          starting with key
  
      Deprecated: GtkEntryCompletion will be removed in GTK 5.
  */
  string computePrefix(string key)
  {
    char* _cretval;
    const(char)* _key = key.toCString(No.Alloc);
    _cretval = gtk_entry_completion_compute_prefix(cast(GtkEntryCompletion*)this._cPtr, _key);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Get the original text entered by the user that triggered
      the completion or null if there’s no completion ongoing.
      Returns: the prefix for the current completion
  
      Deprecated: GtkEntryCompletion will be removed in GTK 5.
  */
  string getCompletionPrefix()
  {
    const(char)* _cretval;
    _cretval = gtk_entry_completion_get_completion_prefix(cast(GtkEntryCompletion*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the entry completion has been attached to.
      Returns: The entry completion has been attached to
  
      Deprecated: GtkEntryCompletion will be removed in GTK 5.
  */
  gtk.widget.Widget getEntry()
  {
    GtkWidget* _cretval;
    _cretval = gtk_entry_completion_get_entry(cast(GtkEntryCompletion*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether the common prefix of the possible completions should
      be automatically inserted in the entry.
      Returns: true if inline completion is turned on
  
      Deprecated: GtkEntryCompletion will be removed in GTK 5.
  */
  bool getInlineCompletion()
  {
    bool _retval;
    _retval = cast(bool)gtk_entry_completion_get_inline_completion(cast(GtkEntryCompletion*)this._cPtr);
    return _retval;
  }

  /**
      Returns true if inline-selection mode is turned on.
      Returns: true if inline-selection mode is on
  
      Deprecated: GtkEntryCompletion will be removed in GTK 5.
  */
  bool getInlineSelection()
  {
    bool _retval;
    _retval = cast(bool)gtk_entry_completion_get_inline_selection(cast(GtkEntryCompletion*)this._cPtr);
    return _retval;
  }

  /**
      Returns the minimum key length as set for completion.
      Returns: The currently used minimum key length
  
      Deprecated: GtkEntryCompletion will be removed in GTK 5.
  */
  int getMinimumKeyLength()
  {
    int _retval;
    _retval = gtk_entry_completion_get_minimum_key_length(cast(GtkEntryCompletion*)this._cPtr);
    return _retval;
  }

  /**
      Returns the model the [gtk.entry_completion.EntryCompletion] is using as data source.
      
      Returns null if the model is unset.
      Returns: A [gtk.tree_model.TreeModel]
  
      Deprecated: GtkEntryCompletion will be removed in GTK 5.
  */
  gtk.tree_model.TreeModel getModel()
  {
    GtkTreeModel* _cretval;
    _cretval = gtk_entry_completion_get_model(cast(GtkEntryCompletion*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.tree_model.TreeModel)(cast(GtkTreeModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether the completions should be presented in a popup window.
      Returns: true if popup completion is turned on
  
      Deprecated: GtkEntryCompletion will be removed in GTK 5.
  */
  bool getPopupCompletion()
  {
    bool _retval;
    _retval = cast(bool)gtk_entry_completion_get_popup_completion(cast(GtkEntryCompletion*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the completion popup window will be resized to the
      width of the entry.
      Returns: true if the popup window will be resized to the width of
          the entry
  
      Deprecated: GtkEntryCompletion will be removed in GTK 5.
  */
  bool getPopupSetWidth()
  {
    bool _retval;
    _retval = cast(bool)gtk_entry_completion_get_popup_set_width(cast(GtkEntryCompletion*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the completion popup window will appear even if there is
      only a single match.
      Returns: true if the popup window will appear regardless of the
           number of matches
  
      Deprecated: GtkEntryCompletion will be removed in GTK 5.
  */
  bool getPopupSingleMatch()
  {
    bool _retval;
    _retval = cast(bool)gtk_entry_completion_get_popup_single_match(cast(GtkEntryCompletion*)this._cPtr);
    return _retval;
  }

  /**
      Returns the column in the model of completion to get strings from.
      Returns: the column containing the strings
  
      Deprecated: GtkEntryCompletion will be removed in GTK 5.
  */
  int getTextColumn()
  {
    int _retval;
    _retval = gtk_entry_completion_get_text_column(cast(GtkEntryCompletion*)this._cPtr);
    return _retval;
  }

  /**
      Requests a prefix insertion.
  
      Deprecated: GtkEntryCompletion will be removed in GTK 5.
  */
  void insertPrefix()
  {
    gtk_entry_completion_insert_prefix(cast(GtkEntryCompletion*)this._cPtr);
  }

  /**
      Sets whether the common prefix of the possible completions should
      be automatically inserted in the entry.
  
      Params:
        inlineCompletion = true to do inline completion
  
      Deprecated: GtkEntryCompletion will be removed in GTK 5.
  */
  void setInlineCompletion(bool inlineCompletion)
  {
    gtk_entry_completion_set_inline_completion(cast(GtkEntryCompletion*)this._cPtr, inlineCompletion);
  }

  /**
      Sets whether it is possible to cycle through the possible completions
      inside the entry.
  
      Params:
        inlineSelection = true to do inline selection
  
      Deprecated: GtkEntryCompletion will be removed in GTK 5.
  */
  void setInlineSelection(bool inlineSelection)
  {
    gtk_entry_completion_set_inline_selection(cast(GtkEntryCompletion*)this._cPtr, inlineSelection);
  }

  /**
      Sets the match function for completion to be func.
      
      The match function is used to determine if a row should or
      should not be in the completion list.
  
      Params:
        func = the [gtk.entry_completion.EntryCompletion]MatchFunc to use
  
      Deprecated: GtkEntryCompletion will be removed in GTK 5.
  */
  void setMatchFunc(gtk.types.EntryCompletionMatchFunc func)
  {
    extern(C) gboolean _funcCallback(GtkEntryCompletion* completion, const(char)* key, GtkTreeIter* iter, void* userData)
    {
      bool _dretval;
      auto _dlg = cast(gtk.types.EntryCompletionMatchFunc*)userData;
      string _key = key.fromCString(No.Free);

      _dretval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gtk.entry_completion.EntryCompletion)(cast(void*)completion, No.Take), _key, iter ? new gtk.tree_iter.TreeIter(cast(void*)iter, No.Take) : null);
      auto _retval = cast(gboolean)_dretval;

      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? freezeDelegate(cast(void*)&func) : null;
    GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
    gtk_entry_completion_set_match_func(cast(GtkEntryCompletion*)this._cPtr, _funcCB, _func, _funcDestroyCB);
  }

  /**
      Requires the length of the search key for completion to be at least
      length.
      
      This is useful for long lists, where completing using a small
      key takes a lot of time and will come up with meaningless results anyway
      (ie, a too large dataset).
  
      Params:
        length = the minimum length of the key in order to start completing
  
      Deprecated: GtkEntryCompletion will be removed in GTK 5.
  */
  void setMinimumKeyLength(int length)
  {
    gtk_entry_completion_set_minimum_key_length(cast(GtkEntryCompletion*)this._cPtr, length);
  }

  /**
      Sets the model for a [gtk.entry_completion.EntryCompletion].
      
      If completion already has a model set, it will remove it
      before setting the new model. If model is null, then it
      will unset the model.
  
      Params:
        model = the [gtk.tree_model.TreeModel]
  
      Deprecated: GtkEntryCompletion will be removed in GTK 5.
  */
  void setModel(gtk.tree_model.TreeModel model = null)
  {
    gtk_entry_completion_set_model(cast(GtkEntryCompletion*)this._cPtr, model ? cast(GtkTreeModel*)(cast(gobject.object.ObjectWrap)model)._cPtr(No.Dup) : null);
  }

  /**
      Sets whether the completions should be presented in a popup window.
  
      Params:
        popupCompletion = true to do popup completion
  
      Deprecated: GtkEntryCompletion will be removed in GTK 5.
  */
  void setPopupCompletion(bool popupCompletion)
  {
    gtk_entry_completion_set_popup_completion(cast(GtkEntryCompletion*)this._cPtr, popupCompletion);
  }

  /**
      Sets whether the completion popup window will be resized to be the same
      width as the entry.
  
      Params:
        popupSetWidth = true to make the width of the popup the same as the entry
  
      Deprecated: GtkEntryCompletion will be removed in GTK 5.
  */
  void setPopupSetWidth(bool popupSetWidth)
  {
    gtk_entry_completion_set_popup_set_width(cast(GtkEntryCompletion*)this._cPtr, popupSetWidth);
  }

  /**
      Sets whether the completion popup window will appear even if there is
      only a single match.
      
      You may want to set this to false if you
      are using `propertyGtk.EntryCompletion:inline-completion`.
  
      Params:
        popupSingleMatch = true if the popup should appear even for a single match
  
      Deprecated: GtkEntryCompletion will be removed in GTK 5.
  */
  void setPopupSingleMatch(bool popupSingleMatch)
  {
    gtk_entry_completion_set_popup_single_match(cast(GtkEntryCompletion*)this._cPtr, popupSingleMatch);
  }

  /**
      Convenience function for setting up the most used case of this code: a
      completion list with just strings.
      
      This function will set up completion
      to have a list displaying all (and just) strings in the completion list,
      and to get those strings from column in the model of completion.
      
      This functions creates and adds a [gtk.cell_renderer_text.CellRendererText] for the selected
      column. If you need to set the text column, but don't want the cell
      renderer, use [gobject.object.ObjectWrap.set] to set the
      `propertyGtk.EntryCompletion:text-column` property directly.
  
      Params:
        column = the column in the model of completion to get strings from
  
      Deprecated: GtkEntryCompletion will be removed in GTK 5.
  */
  void setTextColumn(int column)
  {
    gtk_entry_completion_set_text_column(cast(GtkEntryCompletion*)this._cPtr, column);
  }

  /**
      Connect to `CursorOnMatch` signal.
  
      Emitted when a match from the cursor is on a match of the list.
        
        The default behaviour is to replace the contents
        of the entry with the contents of the text column in the row
        pointed to by iter.
        
        Note that model is the model that was passed to
        [gtk.entry_completion.EntryCompletion.setModel].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gtk.tree_model.TreeModel model, gtk.tree_iter.TreeIter iter, gtk.entry_completion.EntryCompletion entryCompletion))
  
          `model` the [gtk.tree_model.TreeModel] containing the matches (optional)
  
          `iter` a [gtk.tree_iter.TreeIter] positioned at the selected match (optional)
  
          `entryCompletion` the instance the signal is connected to (optional)
  
          `Returns` true if the signal has been handled
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectCursorOnMatch(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.tree_model.TreeModel)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gtk.tree_iter.TreeIter)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.entry_completion.EntryCompletion)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("cursor-on-match", closure, after);
  }

  /**
      Connect to `InsertPrefix` signal.
  
      Emitted when the inline autocompletion is triggered.
        
        The default behaviour is to make the entry display the
        whole prefix and select the newly inserted part.
        
        Applications may connect to this signal in order to insert only a
        smaller part of the prefix into the entry - e.g. the entry used in
        the [gtk.file_chooser.FileChooser] inserts only the part of the prefix up to the
        next '/'.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(string prefix, gtk.entry_completion.EntryCompletion entryCompletion))
  
          `prefix` the common prefix of all possible completions (optional)
  
          `entryCompletion` the instance the signal is connected to (optional)
  
          `Returns` true if the signal has been handled
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectInsertPrefix(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.entry_completion.EntryCompletion)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("insert-prefix", closure, after);
  }

  /**
      Connect to `MatchSelected` signal.
  
      Emitted when a match from the list is selected.
        
        The default behaviour is to replace the contents of the
        entry with the contents of the text column in the row
        pointed to by iter.
        
        Note that model is the model that was passed to
        [gtk.entry_completion.EntryCompletion.setModel].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gtk.tree_model.TreeModel model, gtk.tree_iter.TreeIter iter, gtk.entry_completion.EntryCompletion entryCompletion))
  
          `model` the [gtk.tree_model.TreeModel] containing the matches (optional)
  
          `iter` a [gtk.tree_iter.TreeIter] positioned at the selected match (optional)
  
          `entryCompletion` the instance the signal is connected to (optional)
  
          `Returns` true if the signal has been handled
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectMatchSelected(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.tree_model.TreeModel)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gtk.tree_iter.TreeIter)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.entry_completion.EntryCompletion)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("match-selected", closure, after);
  }

  /**
      Connect to `NoMatches` signal.
  
      Emitted when the filter model has zero
        number of rows in completion_complete method.
        
        In other words when [gtk.entry_completion.EntryCompletion] is out of suggestions.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.entry_completion.EntryCompletion entryCompletion))
  
          `entryCompletion` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectNoMatches(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.entry_completion.EntryCompletion)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("no-matches", closure, after);
  }
}
