/// Module for [CompletionProvider] interface
module gtksource.completion_provider;

public import gtksource.completion_provider_iface_proxy;
import gdk.types;
import gid.gid;
import gio.async_result;
import gio.cancellable;
import gio.list_model;
import gio.types;
import glib.error;
import gobject.gid_builder;
import gobject.object;
import gtk.text_iter;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.completion_cell;
import gtksource.completion_context;
import gtksource.completion_proposal;
import gtksource.types;

/**
    Completion provider interface.
    
    You must implement this interface to provide proposals to `class@Completion`.
    
    In most cases, implementations of this interface will want to use
    `vfunc@CompletionProvider.populate_async` to asynchronously populate the results
    to avoid blocking the main loop.
*/
interface CompletionProvider
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_completion_provider_get_type != &gidSymbolNotFound ? gtk_source_completion_provider_get_type() : cast(GType)0;
  }

  /**
      This function requests proposal to be activated by the
      #GtkSourceCompletionProvider.
      
      What the provider does to activate the proposal is specific to that
      provider. Many providers may choose to insert a #GtkSourceSnippet with
      edit points the user may cycle through.
      
      See also: `classSnippet`, `classSnippetChunk`, [gtksource.view.View.pushSnippet]
  
      Params:
        context = a #GtkSourceCompletionContext
        proposal = a #GtkSourceCompletionProposal
  */
  void activate(gtksource.completion_context.CompletionContext context, gtksource.completion_proposal.CompletionProposal proposal);

  /**
      This function requests that the #GtkSourceCompletionProvider prepares
      cell to display the contents of proposal.
      
      Based on cells column type, you may want to display different information.
      
      This allows for columns of information among completion proposals
      resulting in better alignment of similar content (icons, return types,
      method names, and parameter lists).
  
      Params:
        context = a #GtkSourceCompletionContext
        proposal = a #GtkSourceCompletionProposal
        cell = a #GtkSourceCompletionCell
  */
  void display(gtksource.completion_context.CompletionContext context, gtksource.completion_proposal.CompletionProposal proposal, gtksource.completion_cell.CompletionCell cell);

  /**
      This function should return the priority of self in context.
      
      The priority is used to sort groups of completion proposals by
      provider so that higher priority providers results are shown
      above lower priority providers.
      
      Higher value indicates higher priority.
  
      Params:
        context = a #GtkSourceCompletionContext
      Returns: 
  */
  int getPriority(gtksource.completion_context.CompletionContext context);

  /**
      Gets the title of the completion provider, if any.
      
      Currently, titles are not displayed in the completion results, but may be
      at some point in the future when non-null.
      Returns: a title for the provider or null
  */
  string getTitle();

  /**
      This function is used to determine if a character inserted into the text
      editor should cause a new completion request to be triggered.
      
      An example would be period '.' which might indicate that the user wants
      to complete method or field names of an object.
      
      This method will only trigger when text is inserted into the #GtkTextBuffer
      while the completion list is visible and a proposal is selected. Incremental
      key-presses (like shift, control, or alt) are not triggerable.
  
      Params:
        iter = a #GtkTextIter
        ch = a #gunichar of the character inserted
      Returns: 
  */
  bool isTrigger(gtk.text_iter.TextIter iter, dchar ch);

  /**
      This function is used to determine if a key typed by the user should
      activate proposal (resulting in committing the text to the editor).
      
      This is useful when using languages where convention may lead to less
      typing by the user. One example may be the use of "." or "-" to expand
      a field access in the C programming language.
  
      Params:
        context = a #GtkSourceCompletionContext
        proposal = a #GtkSourceCompletionProposal
        keyval = a keyval such as [gdk.types.KEY_period]
        state = a #GdkModifierType or 0
      Returns: 
  */
  bool keyActivates(gtksource.completion_context.CompletionContext context, gtksource.completion_proposal.CompletionProposal proposal, uint keyval, gdk.types.ModifierType state);

  /**
      Providers should return a list of alternates to proposal or null if
      there are no alternates available.
      
      This can be used by the completion view to allow the user to move laterally
      through similar proposals, such as overrides of methods by the same name.
  
      Params:
        context = a #GtkSourceCompletionContext
        proposal = a #GtkSourceCompletionProposal
      Returns: a #GPtrArray of #GtkSourceCompletionProposal or null.
  */
  gtksource.completion_proposal.CompletionProposal[] listAlternates(gtksource.completion_context.CompletionContext context, gtksource.completion_proposal.CompletionProposal proposal);

  /**
      Asynchronously requests that the provider populates the completion
      results for context.
      
      For providers that would like to populate a [gio.list_model.ListModel] while those
      results are displayed to the user,
      [gtksource.completion_context.CompletionContext.setProposalsForProvider] may be used
      to reduce latency until the user sees results.
  
      Params:
        context = a #GtkSourceCompletionContext
        cancellable = a #GCancellable or null
        callback = a callback to execute upon completion
  */
  void populateAsync(gtksource.completion_context.CompletionContext context, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null);

  /**
      Completes an asynchronous operation to populate a completion provider.
  
      Params:
        result = a #GAsyncResult provided to callback
      Returns: a #GListModel of #GtkSourceCompletionProposal
      Throws: [ErrorWrap]
  */
  gio.list_model.ListModel populateFinish(gio.async_result.AsyncResult result);

  /**
      This function can be used to filter results previously provided to
      the `classCompletionContext` by the #GtkSourceCompletionProvider.
      
      This can happen as the user types additional text onto the word so
      that previously matched items may be removed from the list instead of
      generating new [gio.list_model.ListModel] of results.
  
      Params:
        context = a #GtkSourceCompletionContext
        model = a #GListModel
  */
  void refilter(gtksource.completion_context.CompletionContext context, gio.list_model.ListModel model);
}

/// Fluent builder implementation template for [gtksource.completion_provider.CompletionProvider]
interface CompletionProviderGidBuilderImpl(T)
{
}
