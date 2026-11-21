/// C functions for adw1 library
module gid.adw1.c.functions;

public import gid.core.basictypes;
import gid.core.loader;
import gid.adw1.c.types;
public import gid.gio2.c.types;
public import gid.gtk4.c.types;

private immutable LIBS = ["adwaita-1_0"];

// AboutDialog
private alias c_adw_about_dialog_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_about_dialog_get_typeFn c_adw_about_dialog_get_type; ///
private alias c_adw_about_dialog_newFn = extern(C) AdwDialog* function() nothrow;
__gshared c_adw_about_dialog_newFn c_adw_about_dialog_new; ///
private alias c_adw_about_dialog_new_from_appdataFn = extern(C) AdwDialog* function(const(char)* resourcePath, const(char)* releaseNotesVersion) nothrow;
__gshared c_adw_about_dialog_new_from_appdataFn c_adw_about_dialog_new_from_appdata; ///
private alias c_adw_about_dialog_add_acknowledgement_sectionFn = extern(C) void function(AdwAboutDialog* self, const(char)* name, const(char*)* people) nothrow;
__gshared c_adw_about_dialog_add_acknowledgement_sectionFn c_adw_about_dialog_add_acknowledgement_section; ///
private alias c_adw_about_dialog_add_credit_sectionFn = extern(C) void function(AdwAboutDialog* self, const(char)* name, const(char*)* people) nothrow;
__gshared c_adw_about_dialog_add_credit_sectionFn c_adw_about_dialog_add_credit_section; ///
private alias c_adw_about_dialog_add_legal_sectionFn = extern(C) void function(AdwAboutDialog* self, const(char)* title, const(char)* copyright, GtkLicense licenseType, const(char)* license) nothrow;
__gshared c_adw_about_dialog_add_legal_sectionFn c_adw_about_dialog_add_legal_section; ///
private alias c_adw_about_dialog_add_linkFn = extern(C) void function(AdwAboutDialog* self, const(char)* title, const(char)* url) nothrow;
__gshared c_adw_about_dialog_add_linkFn c_adw_about_dialog_add_link; ///
private alias c_adw_about_dialog_add_other_appFn = extern(C) void function(AdwAboutDialog* self, const(char)* appid, const(char)* name, const(char)* summary) nothrow;
__gshared c_adw_about_dialog_add_other_appFn c_adw_about_dialog_add_other_app; ///
private alias c_adw_about_dialog_get_appdata_resource_pathFn = extern(C) const(char)* function(AdwAboutDialog* self) nothrow;
__gshared c_adw_about_dialog_get_appdata_resource_pathFn c_adw_about_dialog_get_appdata_resource_path; ///
private alias c_adw_about_dialog_get_application_iconFn = extern(C) const(char)* function(AdwAboutDialog* self) nothrow;
__gshared c_adw_about_dialog_get_application_iconFn c_adw_about_dialog_get_application_icon; ///
private alias c_adw_about_dialog_get_application_nameFn = extern(C) const(char)* function(AdwAboutDialog* self) nothrow;
__gshared c_adw_about_dialog_get_application_nameFn c_adw_about_dialog_get_application_name; ///
private alias c_adw_about_dialog_get_artistsFn = extern(C) const(char*)* function(AdwAboutDialog* self) nothrow;
__gshared c_adw_about_dialog_get_artistsFn c_adw_about_dialog_get_artists; ///
private alias c_adw_about_dialog_get_commentsFn = extern(C) const(char)* function(AdwAboutDialog* self) nothrow;
__gshared c_adw_about_dialog_get_commentsFn c_adw_about_dialog_get_comments; ///
private alias c_adw_about_dialog_get_copyrightFn = extern(C) const(char)* function(AdwAboutDialog* self) nothrow;
__gshared c_adw_about_dialog_get_copyrightFn c_adw_about_dialog_get_copyright; ///
private alias c_adw_about_dialog_get_debug_infoFn = extern(C) const(char)* function(AdwAboutDialog* self) nothrow;
__gshared c_adw_about_dialog_get_debug_infoFn c_adw_about_dialog_get_debug_info; ///
private alias c_adw_about_dialog_get_debug_info_filenameFn = extern(C) const(char)* function(AdwAboutDialog* self) nothrow;
__gshared c_adw_about_dialog_get_debug_info_filenameFn c_adw_about_dialog_get_debug_info_filename; ///
private alias c_adw_about_dialog_get_designersFn = extern(C) const(char*)* function(AdwAboutDialog* self) nothrow;
__gshared c_adw_about_dialog_get_designersFn c_adw_about_dialog_get_designers; ///
private alias c_adw_about_dialog_get_developer_nameFn = extern(C) const(char)* function(AdwAboutDialog* self) nothrow;
__gshared c_adw_about_dialog_get_developer_nameFn c_adw_about_dialog_get_developer_name; ///
private alias c_adw_about_dialog_get_developersFn = extern(C) const(char*)* function(AdwAboutDialog* self) nothrow;
__gshared c_adw_about_dialog_get_developersFn c_adw_about_dialog_get_developers; ///
private alias c_adw_about_dialog_get_documentersFn = extern(C) const(char*)* function(AdwAboutDialog* self) nothrow;
__gshared c_adw_about_dialog_get_documentersFn c_adw_about_dialog_get_documenters; ///
private alias c_adw_about_dialog_get_issue_urlFn = extern(C) const(char)* function(AdwAboutDialog* self) nothrow;
__gshared c_adw_about_dialog_get_issue_urlFn c_adw_about_dialog_get_issue_url; ///
private alias c_adw_about_dialog_get_licenseFn = extern(C) const(char)* function(AdwAboutDialog* self) nothrow;
__gshared c_adw_about_dialog_get_licenseFn c_adw_about_dialog_get_license; ///
private alias c_adw_about_dialog_get_license_typeFn = extern(C) GtkLicense function(AdwAboutDialog* self) nothrow;
__gshared c_adw_about_dialog_get_license_typeFn c_adw_about_dialog_get_license_type; ///
private alias c_adw_about_dialog_get_release_notesFn = extern(C) const(char)* function(AdwAboutDialog* self) nothrow;
__gshared c_adw_about_dialog_get_release_notesFn c_adw_about_dialog_get_release_notes; ///
private alias c_adw_about_dialog_get_release_notes_versionFn = extern(C) const(char)* function(AdwAboutDialog* self) nothrow;
__gshared c_adw_about_dialog_get_release_notes_versionFn c_adw_about_dialog_get_release_notes_version; ///
private alias c_adw_about_dialog_get_support_urlFn = extern(C) const(char)* function(AdwAboutDialog* self) nothrow;
__gshared c_adw_about_dialog_get_support_urlFn c_adw_about_dialog_get_support_url; ///
private alias c_adw_about_dialog_get_translator_creditsFn = extern(C) const(char)* function(AdwAboutDialog* self) nothrow;
__gshared c_adw_about_dialog_get_translator_creditsFn c_adw_about_dialog_get_translator_credits; ///
private alias c_adw_about_dialog_get_versionFn = extern(C) const(char)* function(AdwAboutDialog* self) nothrow;
__gshared c_adw_about_dialog_get_versionFn c_adw_about_dialog_get_version; ///
private alias c_adw_about_dialog_get_websiteFn = extern(C) const(char)* function(AdwAboutDialog* self) nothrow;
__gshared c_adw_about_dialog_get_websiteFn c_adw_about_dialog_get_website; ///
private alias c_adw_about_dialog_set_application_iconFn = extern(C) void function(AdwAboutDialog* self, const(char)* applicationIcon) nothrow;
__gshared c_adw_about_dialog_set_application_iconFn c_adw_about_dialog_set_application_icon; ///
private alias c_adw_about_dialog_set_application_nameFn = extern(C) void function(AdwAboutDialog* self, const(char)* applicationName) nothrow;
__gshared c_adw_about_dialog_set_application_nameFn c_adw_about_dialog_set_application_name; ///
private alias c_adw_about_dialog_set_artistsFn = extern(C) void function(AdwAboutDialog* self, const(char*)* artists) nothrow;
__gshared c_adw_about_dialog_set_artistsFn c_adw_about_dialog_set_artists; ///
private alias c_adw_about_dialog_set_commentsFn = extern(C) void function(AdwAboutDialog* self, const(char)* comments) nothrow;
__gshared c_adw_about_dialog_set_commentsFn c_adw_about_dialog_set_comments; ///
private alias c_adw_about_dialog_set_copyrightFn = extern(C) void function(AdwAboutDialog* self, const(char)* copyright) nothrow;
__gshared c_adw_about_dialog_set_copyrightFn c_adw_about_dialog_set_copyright; ///
private alias c_adw_about_dialog_set_debug_infoFn = extern(C) void function(AdwAboutDialog* self, const(char)* debugInfo) nothrow;
__gshared c_adw_about_dialog_set_debug_infoFn c_adw_about_dialog_set_debug_info; ///
private alias c_adw_about_dialog_set_debug_info_filenameFn = extern(C) void function(AdwAboutDialog* self, const(char)* filename) nothrow;
__gshared c_adw_about_dialog_set_debug_info_filenameFn c_adw_about_dialog_set_debug_info_filename; ///
private alias c_adw_about_dialog_set_designersFn = extern(C) void function(AdwAboutDialog* self, const(char*)* designers) nothrow;
__gshared c_adw_about_dialog_set_designersFn c_adw_about_dialog_set_designers; ///
private alias c_adw_about_dialog_set_developer_nameFn = extern(C) void function(AdwAboutDialog* self, const(char)* developerName) nothrow;
__gshared c_adw_about_dialog_set_developer_nameFn c_adw_about_dialog_set_developer_name; ///
private alias c_adw_about_dialog_set_developersFn = extern(C) void function(AdwAboutDialog* self, const(char*)* developers) nothrow;
__gshared c_adw_about_dialog_set_developersFn c_adw_about_dialog_set_developers; ///
private alias c_adw_about_dialog_set_documentersFn = extern(C) void function(AdwAboutDialog* self, const(char*)* documenters) nothrow;
__gshared c_adw_about_dialog_set_documentersFn c_adw_about_dialog_set_documenters; ///
private alias c_adw_about_dialog_set_issue_urlFn = extern(C) void function(AdwAboutDialog* self, const(char)* issueUrl) nothrow;
__gshared c_adw_about_dialog_set_issue_urlFn c_adw_about_dialog_set_issue_url; ///
private alias c_adw_about_dialog_set_licenseFn = extern(C) void function(AdwAboutDialog* self, const(char)* license) nothrow;
__gshared c_adw_about_dialog_set_licenseFn c_adw_about_dialog_set_license; ///
private alias c_adw_about_dialog_set_license_typeFn = extern(C) void function(AdwAboutDialog* self, GtkLicense licenseType) nothrow;
__gshared c_adw_about_dialog_set_license_typeFn c_adw_about_dialog_set_license_type; ///
private alias c_adw_about_dialog_set_release_notesFn = extern(C) void function(AdwAboutDialog* self, const(char)* releaseNotes) nothrow;
__gshared c_adw_about_dialog_set_release_notesFn c_adw_about_dialog_set_release_notes; ///
private alias c_adw_about_dialog_set_release_notes_versionFn = extern(C) void function(AdwAboutDialog* self, const(char)* version_) nothrow;
__gshared c_adw_about_dialog_set_release_notes_versionFn c_adw_about_dialog_set_release_notes_version; ///
private alias c_adw_about_dialog_set_support_urlFn = extern(C) void function(AdwAboutDialog* self, const(char)* supportUrl) nothrow;
__gshared c_adw_about_dialog_set_support_urlFn c_adw_about_dialog_set_support_url; ///
private alias c_adw_about_dialog_set_translator_creditsFn = extern(C) void function(AdwAboutDialog* self, const(char)* translatorCredits) nothrow;
__gshared c_adw_about_dialog_set_translator_creditsFn c_adw_about_dialog_set_translator_credits; ///
private alias c_adw_about_dialog_set_versionFn = extern(C) void function(AdwAboutDialog* self, const(char)* version_) nothrow;
__gshared c_adw_about_dialog_set_versionFn c_adw_about_dialog_set_version; ///
private alias c_adw_about_dialog_set_websiteFn = extern(C) void function(AdwAboutDialog* self, const(char)* website) nothrow;
__gshared c_adw_about_dialog_set_websiteFn c_adw_about_dialog_set_website; ///

// AboutWindow
private alias c_adw_about_window_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_about_window_get_typeFn c_adw_about_window_get_type; ///
private alias c_adw_about_window_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_adw_about_window_newFn c_adw_about_window_new; ///
private alias c_adw_about_window_new_from_appdataFn = extern(C) GtkWidget* function(const(char)* resourcePath, const(char)* releaseNotesVersion) nothrow;
__gshared c_adw_about_window_new_from_appdataFn c_adw_about_window_new_from_appdata; ///
private alias c_adw_about_window_add_acknowledgement_sectionFn = extern(C) void function(AdwAboutWindow* self, const(char)* name, const(char*)* people) nothrow;
__gshared c_adw_about_window_add_acknowledgement_sectionFn c_adw_about_window_add_acknowledgement_section; ///
private alias c_adw_about_window_add_credit_sectionFn = extern(C) void function(AdwAboutWindow* self, const(char)* name, const(char*)* people) nothrow;
__gshared c_adw_about_window_add_credit_sectionFn c_adw_about_window_add_credit_section; ///
private alias c_adw_about_window_add_legal_sectionFn = extern(C) void function(AdwAboutWindow* self, const(char)* title, const(char)* copyright, GtkLicense licenseType, const(char)* license) nothrow;
__gshared c_adw_about_window_add_legal_sectionFn c_adw_about_window_add_legal_section; ///
private alias c_adw_about_window_add_linkFn = extern(C) void function(AdwAboutWindow* self, const(char)* title, const(char)* url) nothrow;
__gshared c_adw_about_window_add_linkFn c_adw_about_window_add_link; ///
private alias c_adw_about_window_get_application_iconFn = extern(C) const(char)* function(AdwAboutWindow* self) nothrow;
__gshared c_adw_about_window_get_application_iconFn c_adw_about_window_get_application_icon; ///
private alias c_adw_about_window_get_application_nameFn = extern(C) const(char)* function(AdwAboutWindow* self) nothrow;
__gshared c_adw_about_window_get_application_nameFn c_adw_about_window_get_application_name; ///
private alias c_adw_about_window_get_artistsFn = extern(C) const(char*)* function(AdwAboutWindow* self) nothrow;
__gshared c_adw_about_window_get_artistsFn c_adw_about_window_get_artists; ///
private alias c_adw_about_window_get_commentsFn = extern(C) const(char)* function(AdwAboutWindow* self) nothrow;
__gshared c_adw_about_window_get_commentsFn c_adw_about_window_get_comments; ///
private alias c_adw_about_window_get_copyrightFn = extern(C) const(char)* function(AdwAboutWindow* self) nothrow;
__gshared c_adw_about_window_get_copyrightFn c_adw_about_window_get_copyright; ///
private alias c_adw_about_window_get_debug_infoFn = extern(C) const(char)* function(AdwAboutWindow* self) nothrow;
__gshared c_adw_about_window_get_debug_infoFn c_adw_about_window_get_debug_info; ///
private alias c_adw_about_window_get_debug_info_filenameFn = extern(C) const(char)* function(AdwAboutWindow* self) nothrow;
__gshared c_adw_about_window_get_debug_info_filenameFn c_adw_about_window_get_debug_info_filename; ///
private alias c_adw_about_window_get_designersFn = extern(C) const(char*)* function(AdwAboutWindow* self) nothrow;
__gshared c_adw_about_window_get_designersFn c_adw_about_window_get_designers; ///
private alias c_adw_about_window_get_developer_nameFn = extern(C) const(char)* function(AdwAboutWindow* self) nothrow;
__gshared c_adw_about_window_get_developer_nameFn c_adw_about_window_get_developer_name; ///
private alias c_adw_about_window_get_developersFn = extern(C) const(char*)* function(AdwAboutWindow* self) nothrow;
__gshared c_adw_about_window_get_developersFn c_adw_about_window_get_developers; ///
private alias c_adw_about_window_get_documentersFn = extern(C) const(char*)* function(AdwAboutWindow* self) nothrow;
__gshared c_adw_about_window_get_documentersFn c_adw_about_window_get_documenters; ///
private alias c_adw_about_window_get_issue_urlFn = extern(C) const(char)* function(AdwAboutWindow* self) nothrow;
__gshared c_adw_about_window_get_issue_urlFn c_adw_about_window_get_issue_url; ///
private alias c_adw_about_window_get_licenseFn = extern(C) const(char)* function(AdwAboutWindow* self) nothrow;
__gshared c_adw_about_window_get_licenseFn c_adw_about_window_get_license; ///
private alias c_adw_about_window_get_license_typeFn = extern(C) GtkLicense function(AdwAboutWindow* self) nothrow;
__gshared c_adw_about_window_get_license_typeFn c_adw_about_window_get_license_type; ///
private alias c_adw_about_window_get_release_notesFn = extern(C) const(char)* function(AdwAboutWindow* self) nothrow;
__gshared c_adw_about_window_get_release_notesFn c_adw_about_window_get_release_notes; ///
private alias c_adw_about_window_get_release_notes_versionFn = extern(C) const(char)* function(AdwAboutWindow* self) nothrow;
__gshared c_adw_about_window_get_release_notes_versionFn c_adw_about_window_get_release_notes_version; ///
private alias c_adw_about_window_get_support_urlFn = extern(C) const(char)* function(AdwAboutWindow* self) nothrow;
__gshared c_adw_about_window_get_support_urlFn c_adw_about_window_get_support_url; ///
private alias c_adw_about_window_get_translator_creditsFn = extern(C) const(char)* function(AdwAboutWindow* self) nothrow;
__gshared c_adw_about_window_get_translator_creditsFn c_adw_about_window_get_translator_credits; ///
private alias c_adw_about_window_get_versionFn = extern(C) const(char)* function(AdwAboutWindow* self) nothrow;
__gshared c_adw_about_window_get_versionFn c_adw_about_window_get_version; ///
private alias c_adw_about_window_get_websiteFn = extern(C) const(char)* function(AdwAboutWindow* self) nothrow;
__gshared c_adw_about_window_get_websiteFn c_adw_about_window_get_website; ///
private alias c_adw_about_window_set_application_iconFn = extern(C) void function(AdwAboutWindow* self, const(char)* applicationIcon) nothrow;
__gshared c_adw_about_window_set_application_iconFn c_adw_about_window_set_application_icon; ///
private alias c_adw_about_window_set_application_nameFn = extern(C) void function(AdwAboutWindow* self, const(char)* applicationName) nothrow;
__gshared c_adw_about_window_set_application_nameFn c_adw_about_window_set_application_name; ///
private alias c_adw_about_window_set_artistsFn = extern(C) void function(AdwAboutWindow* self, const(char*)* artists) nothrow;
__gshared c_adw_about_window_set_artistsFn c_adw_about_window_set_artists; ///
private alias c_adw_about_window_set_commentsFn = extern(C) void function(AdwAboutWindow* self, const(char)* comments) nothrow;
__gshared c_adw_about_window_set_commentsFn c_adw_about_window_set_comments; ///
private alias c_adw_about_window_set_copyrightFn = extern(C) void function(AdwAboutWindow* self, const(char)* copyright) nothrow;
__gshared c_adw_about_window_set_copyrightFn c_adw_about_window_set_copyright; ///
private alias c_adw_about_window_set_debug_infoFn = extern(C) void function(AdwAboutWindow* self, const(char)* debugInfo) nothrow;
__gshared c_adw_about_window_set_debug_infoFn c_adw_about_window_set_debug_info; ///
private alias c_adw_about_window_set_debug_info_filenameFn = extern(C) void function(AdwAboutWindow* self, const(char)* filename) nothrow;
__gshared c_adw_about_window_set_debug_info_filenameFn c_adw_about_window_set_debug_info_filename; ///
private alias c_adw_about_window_set_designersFn = extern(C) void function(AdwAboutWindow* self, const(char*)* designers) nothrow;
__gshared c_adw_about_window_set_designersFn c_adw_about_window_set_designers; ///
private alias c_adw_about_window_set_developer_nameFn = extern(C) void function(AdwAboutWindow* self, const(char)* developerName) nothrow;
__gshared c_adw_about_window_set_developer_nameFn c_adw_about_window_set_developer_name; ///
private alias c_adw_about_window_set_developersFn = extern(C) void function(AdwAboutWindow* self, const(char*)* developers) nothrow;
__gshared c_adw_about_window_set_developersFn c_adw_about_window_set_developers; ///
private alias c_adw_about_window_set_documentersFn = extern(C) void function(AdwAboutWindow* self, const(char*)* documenters) nothrow;
__gshared c_adw_about_window_set_documentersFn c_adw_about_window_set_documenters; ///
private alias c_adw_about_window_set_issue_urlFn = extern(C) void function(AdwAboutWindow* self, const(char)* issueUrl) nothrow;
__gshared c_adw_about_window_set_issue_urlFn c_adw_about_window_set_issue_url; ///
private alias c_adw_about_window_set_licenseFn = extern(C) void function(AdwAboutWindow* self, const(char)* license) nothrow;
__gshared c_adw_about_window_set_licenseFn c_adw_about_window_set_license; ///
private alias c_adw_about_window_set_license_typeFn = extern(C) void function(AdwAboutWindow* self, GtkLicense licenseType) nothrow;
__gshared c_adw_about_window_set_license_typeFn c_adw_about_window_set_license_type; ///
private alias c_adw_about_window_set_release_notesFn = extern(C) void function(AdwAboutWindow* self, const(char)* releaseNotes) nothrow;
__gshared c_adw_about_window_set_release_notesFn c_adw_about_window_set_release_notes; ///
private alias c_adw_about_window_set_release_notes_versionFn = extern(C) void function(AdwAboutWindow* self, const(char)* version_) nothrow;
__gshared c_adw_about_window_set_release_notes_versionFn c_adw_about_window_set_release_notes_version; ///
private alias c_adw_about_window_set_support_urlFn = extern(C) void function(AdwAboutWindow* self, const(char)* supportUrl) nothrow;
__gshared c_adw_about_window_set_support_urlFn c_adw_about_window_set_support_url; ///
private alias c_adw_about_window_set_translator_creditsFn = extern(C) void function(AdwAboutWindow* self, const(char)* translatorCredits) nothrow;
__gshared c_adw_about_window_set_translator_creditsFn c_adw_about_window_set_translator_credits; ///
private alias c_adw_about_window_set_versionFn = extern(C) void function(AdwAboutWindow* self, const(char)* version_) nothrow;
__gshared c_adw_about_window_set_versionFn c_adw_about_window_set_version; ///
private alias c_adw_about_window_set_websiteFn = extern(C) void function(AdwAboutWindow* self, const(char)* website) nothrow;
__gshared c_adw_about_window_set_websiteFn c_adw_about_window_set_website; ///

// ActionRow
private alias c_adw_action_row_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_action_row_get_typeFn c_adw_action_row_get_type; ///
private alias c_adw_action_row_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_adw_action_row_newFn c_adw_action_row_new; ///
private alias c_adw_action_row_activateFn = extern(C) void function(AdwActionRow* self) nothrow;
__gshared c_adw_action_row_activateFn c_adw_action_row_activate; ///
private alias c_adw_action_row_add_prefixFn = extern(C) void function(AdwActionRow* self, GtkWidget* widget) nothrow;
__gshared c_adw_action_row_add_prefixFn c_adw_action_row_add_prefix; ///
private alias c_adw_action_row_add_suffixFn = extern(C) void function(AdwActionRow* self, GtkWidget* widget) nothrow;
__gshared c_adw_action_row_add_suffixFn c_adw_action_row_add_suffix; ///
private alias c_adw_action_row_get_activatable_widgetFn = extern(C) GtkWidget* function(AdwActionRow* self) nothrow;
__gshared c_adw_action_row_get_activatable_widgetFn c_adw_action_row_get_activatable_widget; ///
private alias c_adw_action_row_get_icon_nameFn = extern(C) const(char)* function(AdwActionRow* self) nothrow;
__gshared c_adw_action_row_get_icon_nameFn c_adw_action_row_get_icon_name; ///
private alias c_adw_action_row_get_subtitleFn = extern(C) const(char)* function(AdwActionRow* self) nothrow;
__gshared c_adw_action_row_get_subtitleFn c_adw_action_row_get_subtitle; ///
private alias c_adw_action_row_get_subtitle_linesFn = extern(C) int function(AdwActionRow* self) nothrow;
__gshared c_adw_action_row_get_subtitle_linesFn c_adw_action_row_get_subtitle_lines; ///
private alias c_adw_action_row_get_subtitle_selectableFn = extern(C) gboolean function(AdwActionRow* self) nothrow;
__gshared c_adw_action_row_get_subtitle_selectableFn c_adw_action_row_get_subtitle_selectable; ///
private alias c_adw_action_row_get_title_linesFn = extern(C) int function(AdwActionRow* self) nothrow;
__gshared c_adw_action_row_get_title_linesFn c_adw_action_row_get_title_lines; ///
private alias c_adw_action_row_removeFn = extern(C) void function(AdwActionRow* self, GtkWidget* widget) nothrow;
__gshared c_adw_action_row_removeFn c_adw_action_row_remove; ///
private alias c_adw_action_row_set_activatable_widgetFn = extern(C) void function(AdwActionRow* self, GtkWidget* widget) nothrow;
__gshared c_adw_action_row_set_activatable_widgetFn c_adw_action_row_set_activatable_widget; ///
private alias c_adw_action_row_set_icon_nameFn = extern(C) void function(AdwActionRow* self, const(char)* iconName) nothrow;
__gshared c_adw_action_row_set_icon_nameFn c_adw_action_row_set_icon_name; ///
private alias c_adw_action_row_set_subtitleFn = extern(C) void function(AdwActionRow* self, const(char)* subtitle) nothrow;
__gshared c_adw_action_row_set_subtitleFn c_adw_action_row_set_subtitle; ///
private alias c_adw_action_row_set_subtitle_linesFn = extern(C) void function(AdwActionRow* self, int subtitleLines) nothrow;
__gshared c_adw_action_row_set_subtitle_linesFn c_adw_action_row_set_subtitle_lines; ///
private alias c_adw_action_row_set_subtitle_selectableFn = extern(C) void function(AdwActionRow* self, gboolean subtitleSelectable) nothrow;
__gshared c_adw_action_row_set_subtitle_selectableFn c_adw_action_row_set_subtitle_selectable; ///
private alias c_adw_action_row_set_title_linesFn = extern(C) void function(AdwActionRow* self, int titleLines) nothrow;
__gshared c_adw_action_row_set_title_linesFn c_adw_action_row_set_title_lines; ///

// AlertDialog
private alias c_adw_alert_dialog_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_alert_dialog_get_typeFn c_adw_alert_dialog_get_type; ///
private alias c_adw_alert_dialog_newFn = extern(C) AdwDialog* function(const(char)* heading, const(char)* body_) nothrow;
__gshared c_adw_alert_dialog_newFn c_adw_alert_dialog_new; ///
private alias c_adw_alert_dialog_add_responseFn = extern(C) void function(AdwAlertDialog* self, const(char)* id, const(char)* label) nothrow;
__gshared c_adw_alert_dialog_add_responseFn c_adw_alert_dialog_add_response; ///
private alias c_adw_alert_dialog_add_responsesFn = extern(C) void function(AdwAlertDialog* self, const(char)* firstId,  ...) nothrow;
__gshared c_adw_alert_dialog_add_responsesFn c_adw_alert_dialog_add_responses; ///
private alias c_adw_alert_dialog_chooseFn = extern(C) void function(AdwAlertDialog* self, GtkWidget* parent, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_adw_alert_dialog_chooseFn c_adw_alert_dialog_choose; ///
private alias c_adw_alert_dialog_choose_finishFn = extern(C) const(char)* function(AdwAlertDialog* self, GAsyncResult* result) nothrow;
__gshared c_adw_alert_dialog_choose_finishFn c_adw_alert_dialog_choose_finish; ///
private alias c_adw_alert_dialog_format_bodyFn = extern(C) void function(AdwAlertDialog* self, const(char)* format,  ...) nothrow;
__gshared c_adw_alert_dialog_format_bodyFn c_adw_alert_dialog_format_body; ///
private alias c_adw_alert_dialog_format_body_markupFn = extern(C) void function(AdwAlertDialog* self, const(char)* format,  ...) nothrow;
__gshared c_adw_alert_dialog_format_body_markupFn c_adw_alert_dialog_format_body_markup; ///
private alias c_adw_alert_dialog_format_headingFn = extern(C) void function(AdwAlertDialog* self, const(char)* format,  ...) nothrow;
__gshared c_adw_alert_dialog_format_headingFn c_adw_alert_dialog_format_heading; ///
private alias c_adw_alert_dialog_format_heading_markupFn = extern(C) void function(AdwAlertDialog* self, const(char)* format,  ...) nothrow;
__gshared c_adw_alert_dialog_format_heading_markupFn c_adw_alert_dialog_format_heading_markup; ///
private alias c_adw_alert_dialog_get_bodyFn = extern(C) const(char)* function(AdwAlertDialog* self) nothrow;
__gshared c_adw_alert_dialog_get_bodyFn c_adw_alert_dialog_get_body; ///
private alias c_adw_alert_dialog_get_body_use_markupFn = extern(C) gboolean function(AdwAlertDialog* self) nothrow;
__gshared c_adw_alert_dialog_get_body_use_markupFn c_adw_alert_dialog_get_body_use_markup; ///
private alias c_adw_alert_dialog_get_close_responseFn = extern(C) const(char)* function(AdwAlertDialog* self) nothrow;
__gshared c_adw_alert_dialog_get_close_responseFn c_adw_alert_dialog_get_close_response; ///
private alias c_adw_alert_dialog_get_default_responseFn = extern(C) const(char)* function(AdwAlertDialog* self) nothrow;
__gshared c_adw_alert_dialog_get_default_responseFn c_adw_alert_dialog_get_default_response; ///
private alias c_adw_alert_dialog_get_extra_childFn = extern(C) GtkWidget* function(AdwAlertDialog* self) nothrow;
__gshared c_adw_alert_dialog_get_extra_childFn c_adw_alert_dialog_get_extra_child; ///
private alias c_adw_alert_dialog_get_headingFn = extern(C) const(char)* function(AdwAlertDialog* self) nothrow;
__gshared c_adw_alert_dialog_get_headingFn c_adw_alert_dialog_get_heading; ///
private alias c_adw_alert_dialog_get_heading_use_markupFn = extern(C) gboolean function(AdwAlertDialog* self) nothrow;
__gshared c_adw_alert_dialog_get_heading_use_markupFn c_adw_alert_dialog_get_heading_use_markup; ///
private alias c_adw_alert_dialog_get_prefer_wide_layoutFn = extern(C) gboolean function(AdwAlertDialog* self) nothrow;
__gshared c_adw_alert_dialog_get_prefer_wide_layoutFn c_adw_alert_dialog_get_prefer_wide_layout; ///
private alias c_adw_alert_dialog_get_response_appearanceFn = extern(C) AdwResponseAppearance function(AdwAlertDialog* self, const(char)* response) nothrow;
__gshared c_adw_alert_dialog_get_response_appearanceFn c_adw_alert_dialog_get_response_appearance; ///
private alias c_adw_alert_dialog_get_response_enabledFn = extern(C) gboolean function(AdwAlertDialog* self, const(char)* response) nothrow;
__gshared c_adw_alert_dialog_get_response_enabledFn c_adw_alert_dialog_get_response_enabled; ///
private alias c_adw_alert_dialog_get_response_labelFn = extern(C) const(char)* function(AdwAlertDialog* self, const(char)* response) nothrow;
__gshared c_adw_alert_dialog_get_response_labelFn c_adw_alert_dialog_get_response_label; ///
private alias c_adw_alert_dialog_has_responseFn = extern(C) gboolean function(AdwAlertDialog* self, const(char)* response) nothrow;
__gshared c_adw_alert_dialog_has_responseFn c_adw_alert_dialog_has_response; ///
private alias c_adw_alert_dialog_remove_responseFn = extern(C) void function(AdwAlertDialog* self, const(char)* id) nothrow;
__gshared c_adw_alert_dialog_remove_responseFn c_adw_alert_dialog_remove_response; ///
private alias c_adw_alert_dialog_set_bodyFn = extern(C) void function(AdwAlertDialog* self, const(char)* body_) nothrow;
__gshared c_adw_alert_dialog_set_bodyFn c_adw_alert_dialog_set_body; ///
private alias c_adw_alert_dialog_set_body_use_markupFn = extern(C) void function(AdwAlertDialog* self, gboolean useMarkup) nothrow;
__gshared c_adw_alert_dialog_set_body_use_markupFn c_adw_alert_dialog_set_body_use_markup; ///
private alias c_adw_alert_dialog_set_close_responseFn = extern(C) void function(AdwAlertDialog* self, const(char)* response) nothrow;
__gshared c_adw_alert_dialog_set_close_responseFn c_adw_alert_dialog_set_close_response; ///
private alias c_adw_alert_dialog_set_default_responseFn = extern(C) void function(AdwAlertDialog* self, const(char)* response) nothrow;
__gshared c_adw_alert_dialog_set_default_responseFn c_adw_alert_dialog_set_default_response; ///
private alias c_adw_alert_dialog_set_extra_childFn = extern(C) void function(AdwAlertDialog* self, GtkWidget* child) nothrow;
__gshared c_adw_alert_dialog_set_extra_childFn c_adw_alert_dialog_set_extra_child; ///
private alias c_adw_alert_dialog_set_headingFn = extern(C) void function(AdwAlertDialog* self, const(char)* heading) nothrow;
__gshared c_adw_alert_dialog_set_headingFn c_adw_alert_dialog_set_heading; ///
private alias c_adw_alert_dialog_set_heading_use_markupFn = extern(C) void function(AdwAlertDialog* self, gboolean useMarkup) nothrow;
__gshared c_adw_alert_dialog_set_heading_use_markupFn c_adw_alert_dialog_set_heading_use_markup; ///
private alias c_adw_alert_dialog_set_prefer_wide_layoutFn = extern(C) void function(AdwAlertDialog* self, gboolean preferWideLayout) nothrow;
__gshared c_adw_alert_dialog_set_prefer_wide_layoutFn c_adw_alert_dialog_set_prefer_wide_layout; ///
private alias c_adw_alert_dialog_set_response_appearanceFn = extern(C) void function(AdwAlertDialog* self, const(char)* response, AdwResponseAppearance appearance) nothrow;
__gshared c_adw_alert_dialog_set_response_appearanceFn c_adw_alert_dialog_set_response_appearance; ///
private alias c_adw_alert_dialog_set_response_enabledFn = extern(C) void function(AdwAlertDialog* self, const(char)* response, gboolean enabled) nothrow;
__gshared c_adw_alert_dialog_set_response_enabledFn c_adw_alert_dialog_set_response_enabled; ///
private alias c_adw_alert_dialog_set_response_labelFn = extern(C) void function(AdwAlertDialog* self, const(char)* response, const(char)* label) nothrow;
__gshared c_adw_alert_dialog_set_response_labelFn c_adw_alert_dialog_set_response_label; ///

// Animation
private alias c_adw_animation_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_animation_get_typeFn c_adw_animation_get_type; ///
private alias c_adw_animation_get_follow_enable_animations_settingFn = extern(C) gboolean function(AdwAnimation* self) nothrow;
__gshared c_adw_animation_get_follow_enable_animations_settingFn c_adw_animation_get_follow_enable_animations_setting; ///
private alias c_adw_animation_get_stateFn = extern(C) AdwAnimationState function(AdwAnimation* self) nothrow;
__gshared c_adw_animation_get_stateFn c_adw_animation_get_state; ///
private alias c_adw_animation_get_targetFn = extern(C) AdwAnimationTarget* function(AdwAnimation* self) nothrow;
__gshared c_adw_animation_get_targetFn c_adw_animation_get_target; ///
private alias c_adw_animation_get_valueFn = extern(C) double function(AdwAnimation* self) nothrow;
__gshared c_adw_animation_get_valueFn c_adw_animation_get_value; ///
private alias c_adw_animation_get_widgetFn = extern(C) GtkWidget* function(AdwAnimation* self) nothrow;
__gshared c_adw_animation_get_widgetFn c_adw_animation_get_widget; ///
private alias c_adw_animation_pauseFn = extern(C) void function(AdwAnimation* self) nothrow;
__gshared c_adw_animation_pauseFn c_adw_animation_pause; ///
private alias c_adw_animation_playFn = extern(C) void function(AdwAnimation* self) nothrow;
__gshared c_adw_animation_playFn c_adw_animation_play; ///
private alias c_adw_animation_resetFn = extern(C) void function(AdwAnimation* self) nothrow;
__gshared c_adw_animation_resetFn c_adw_animation_reset; ///
private alias c_adw_animation_resumeFn = extern(C) void function(AdwAnimation* self) nothrow;
__gshared c_adw_animation_resumeFn c_adw_animation_resume; ///
private alias c_adw_animation_set_follow_enable_animations_settingFn = extern(C) void function(AdwAnimation* self, gboolean setting) nothrow;
__gshared c_adw_animation_set_follow_enable_animations_settingFn c_adw_animation_set_follow_enable_animations_setting; ///
private alias c_adw_animation_set_targetFn = extern(C) void function(AdwAnimation* self, AdwAnimationTarget* target) nothrow;
__gshared c_adw_animation_set_targetFn c_adw_animation_set_target; ///
private alias c_adw_animation_skipFn = extern(C) void function(AdwAnimation* self) nothrow;
__gshared c_adw_animation_skipFn c_adw_animation_skip; ///

// AnimationTarget
private alias c_adw_animation_target_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_animation_target_get_typeFn c_adw_animation_target_get_type; ///

// Application
private alias c_adw_application_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_application_get_typeFn c_adw_application_get_type; ///
private alias c_adw_application_newFn = extern(C) AdwApplication* function(const(char)* applicationId, GApplicationFlags flags) nothrow;
__gshared c_adw_application_newFn c_adw_application_new; ///
private alias c_adw_application_get_style_managerFn = extern(C) AdwStyleManager* function(AdwApplication* self) nothrow;
__gshared c_adw_application_get_style_managerFn c_adw_application_get_style_manager; ///

// ApplicationWindow
private alias c_adw_application_window_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_application_window_get_typeFn c_adw_application_window_get_type; ///
private alias c_adw_application_window_newFn = extern(C) GtkWidget* function(GtkApplication* app) nothrow;
__gshared c_adw_application_window_newFn c_adw_application_window_new; ///
private alias c_adw_application_window_add_breakpointFn = extern(C) void function(AdwApplicationWindow* self, AdwBreakpoint* breakpoint) nothrow;
__gshared c_adw_application_window_add_breakpointFn c_adw_application_window_add_breakpoint; ///
private alias c_adw_application_window_get_adaptive_previewFn = extern(C) gboolean function(AdwApplicationWindow* self) nothrow;
__gshared c_adw_application_window_get_adaptive_previewFn c_adw_application_window_get_adaptive_preview; ///
private alias c_adw_application_window_get_contentFn = extern(C) GtkWidget* function(AdwApplicationWindow* self) nothrow;
__gshared c_adw_application_window_get_contentFn c_adw_application_window_get_content; ///
private alias c_adw_application_window_get_current_breakpointFn = extern(C) AdwBreakpoint* function(AdwApplicationWindow* self) nothrow;
__gshared c_adw_application_window_get_current_breakpointFn c_adw_application_window_get_current_breakpoint; ///
private alias c_adw_application_window_get_dialogsFn = extern(C) GListModel* function(AdwApplicationWindow* self) nothrow;
__gshared c_adw_application_window_get_dialogsFn c_adw_application_window_get_dialogs; ///
private alias c_adw_application_window_get_visible_dialogFn = extern(C) AdwDialog* function(AdwApplicationWindow* self) nothrow;
__gshared c_adw_application_window_get_visible_dialogFn c_adw_application_window_get_visible_dialog; ///
private alias c_adw_application_window_set_adaptive_previewFn = extern(C) void function(AdwApplicationWindow* self, gboolean adaptivePreview) nothrow;
__gshared c_adw_application_window_set_adaptive_previewFn c_adw_application_window_set_adaptive_preview; ///
private alias c_adw_application_window_set_contentFn = extern(C) void function(AdwApplicationWindow* self, GtkWidget* content) nothrow;
__gshared c_adw_application_window_set_contentFn c_adw_application_window_set_content; ///

// Avatar
private alias c_adw_avatar_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_avatar_get_typeFn c_adw_avatar_get_type; ///
private alias c_adw_avatar_newFn = extern(C) GtkWidget* function(int size, const(char)* text, gboolean showInitials) nothrow;
__gshared c_adw_avatar_newFn c_adw_avatar_new; ///
private alias c_adw_avatar_draw_to_textureFn = extern(C) GdkTexture* function(AdwAvatar* self, int scaleFactor) nothrow;
__gshared c_adw_avatar_draw_to_textureFn c_adw_avatar_draw_to_texture; ///
private alias c_adw_avatar_get_custom_imageFn = extern(C) GdkPaintable* function(AdwAvatar* self) nothrow;
__gshared c_adw_avatar_get_custom_imageFn c_adw_avatar_get_custom_image; ///
private alias c_adw_avatar_get_icon_nameFn = extern(C) const(char)* function(AdwAvatar* self) nothrow;
__gshared c_adw_avatar_get_icon_nameFn c_adw_avatar_get_icon_name; ///
private alias c_adw_avatar_get_show_initialsFn = extern(C) gboolean function(AdwAvatar* self) nothrow;
__gshared c_adw_avatar_get_show_initialsFn c_adw_avatar_get_show_initials; ///
private alias c_adw_avatar_get_sizeFn = extern(C) int function(AdwAvatar* self) nothrow;
__gshared c_adw_avatar_get_sizeFn c_adw_avatar_get_size; ///
private alias c_adw_avatar_get_textFn = extern(C) const(char)* function(AdwAvatar* self) nothrow;
__gshared c_adw_avatar_get_textFn c_adw_avatar_get_text; ///
private alias c_adw_avatar_set_custom_imageFn = extern(C) void function(AdwAvatar* self, GdkPaintable* customImage) nothrow;
__gshared c_adw_avatar_set_custom_imageFn c_adw_avatar_set_custom_image; ///
private alias c_adw_avatar_set_icon_nameFn = extern(C) void function(AdwAvatar* self, const(char)* iconName) nothrow;
__gshared c_adw_avatar_set_icon_nameFn c_adw_avatar_set_icon_name; ///
private alias c_adw_avatar_set_show_initialsFn = extern(C) void function(AdwAvatar* self, gboolean showInitials) nothrow;
__gshared c_adw_avatar_set_show_initialsFn c_adw_avatar_set_show_initials; ///
private alias c_adw_avatar_set_sizeFn = extern(C) void function(AdwAvatar* self, int size) nothrow;
__gshared c_adw_avatar_set_sizeFn c_adw_avatar_set_size; ///
private alias c_adw_avatar_set_textFn = extern(C) void function(AdwAvatar* self, const(char)* text) nothrow;
__gshared c_adw_avatar_set_textFn c_adw_avatar_set_text; ///

// Banner
private alias c_adw_banner_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_banner_get_typeFn c_adw_banner_get_type; ///
private alias c_adw_banner_newFn = extern(C) GtkWidget* function(const(char)* title) nothrow;
__gshared c_adw_banner_newFn c_adw_banner_new; ///
private alias c_adw_banner_get_button_labelFn = extern(C) const(char)* function(AdwBanner* self) nothrow;
__gshared c_adw_banner_get_button_labelFn c_adw_banner_get_button_label; ///
private alias c_adw_banner_get_button_styleFn = extern(C) AdwBannerButtonStyle function(AdwBanner* self) nothrow;
__gshared c_adw_banner_get_button_styleFn c_adw_banner_get_button_style; ///
private alias c_adw_banner_get_revealedFn = extern(C) gboolean function(AdwBanner* self) nothrow;
__gshared c_adw_banner_get_revealedFn c_adw_banner_get_revealed; ///
private alias c_adw_banner_get_titleFn = extern(C) const(char)* function(AdwBanner* self) nothrow;
__gshared c_adw_banner_get_titleFn c_adw_banner_get_title; ///
private alias c_adw_banner_get_use_markupFn = extern(C) gboolean function(AdwBanner* self) nothrow;
__gshared c_adw_banner_get_use_markupFn c_adw_banner_get_use_markup; ///
private alias c_adw_banner_set_button_labelFn = extern(C) void function(AdwBanner* self, const(char)* label) nothrow;
__gshared c_adw_banner_set_button_labelFn c_adw_banner_set_button_label; ///
private alias c_adw_banner_set_button_styleFn = extern(C) void function(AdwBanner* self, AdwBannerButtonStyle style) nothrow;
__gshared c_adw_banner_set_button_styleFn c_adw_banner_set_button_style; ///
private alias c_adw_banner_set_revealedFn = extern(C) void function(AdwBanner* self, gboolean revealed) nothrow;
__gshared c_adw_banner_set_revealedFn c_adw_banner_set_revealed; ///
private alias c_adw_banner_set_titleFn = extern(C) void function(AdwBanner* self, const(char)* title) nothrow;
__gshared c_adw_banner_set_titleFn c_adw_banner_set_title; ///
private alias c_adw_banner_set_use_markupFn = extern(C) void function(AdwBanner* self, gboolean useMarkup) nothrow;
__gshared c_adw_banner_set_use_markupFn c_adw_banner_set_use_markup; ///

// Bin
private alias c_adw_bin_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_bin_get_typeFn c_adw_bin_get_type; ///
private alias c_adw_bin_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_adw_bin_newFn c_adw_bin_new; ///
private alias c_adw_bin_get_childFn = extern(C) GtkWidget* function(AdwBin* self) nothrow;
__gshared c_adw_bin_get_childFn c_adw_bin_get_child; ///
private alias c_adw_bin_set_childFn = extern(C) void function(AdwBin* self, GtkWidget* child) nothrow;
__gshared c_adw_bin_set_childFn c_adw_bin_set_child; ///

// BottomSheet
private alias c_adw_bottom_sheet_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_bottom_sheet_get_typeFn c_adw_bottom_sheet_get_type; ///
private alias c_adw_bottom_sheet_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_adw_bottom_sheet_newFn c_adw_bottom_sheet_new; ///
private alias c_adw_bottom_sheet_get_alignFn = extern(C) float function(AdwBottomSheet* self) nothrow;
__gshared c_adw_bottom_sheet_get_alignFn c_adw_bottom_sheet_get_align; ///
private alias c_adw_bottom_sheet_get_bottom_barFn = extern(C) GtkWidget* function(AdwBottomSheet* self) nothrow;
__gshared c_adw_bottom_sheet_get_bottom_barFn c_adw_bottom_sheet_get_bottom_bar; ///
private alias c_adw_bottom_sheet_get_bottom_bar_heightFn = extern(C) int function(AdwBottomSheet* self) nothrow;
__gshared c_adw_bottom_sheet_get_bottom_bar_heightFn c_adw_bottom_sheet_get_bottom_bar_height; ///
private alias c_adw_bottom_sheet_get_can_closeFn = extern(C) gboolean function(AdwBottomSheet* self) nothrow;
__gshared c_adw_bottom_sheet_get_can_closeFn c_adw_bottom_sheet_get_can_close; ///
private alias c_adw_bottom_sheet_get_can_openFn = extern(C) gboolean function(AdwBottomSheet* self) nothrow;
__gshared c_adw_bottom_sheet_get_can_openFn c_adw_bottom_sheet_get_can_open; ///
private alias c_adw_bottom_sheet_get_contentFn = extern(C) GtkWidget* function(AdwBottomSheet* self) nothrow;
__gshared c_adw_bottom_sheet_get_contentFn c_adw_bottom_sheet_get_content; ///
private alias c_adw_bottom_sheet_get_full_widthFn = extern(C) gboolean function(AdwBottomSheet* self) nothrow;
__gshared c_adw_bottom_sheet_get_full_widthFn c_adw_bottom_sheet_get_full_width; ///
private alias c_adw_bottom_sheet_get_modalFn = extern(C) gboolean function(AdwBottomSheet* self) nothrow;
__gshared c_adw_bottom_sheet_get_modalFn c_adw_bottom_sheet_get_modal; ///
private alias c_adw_bottom_sheet_get_openFn = extern(C) gboolean function(AdwBottomSheet* self) nothrow;
__gshared c_adw_bottom_sheet_get_openFn c_adw_bottom_sheet_get_open; ///
private alias c_adw_bottom_sheet_get_reveal_bottom_barFn = extern(C) gboolean function(AdwBottomSheet* self) nothrow;
__gshared c_adw_bottom_sheet_get_reveal_bottom_barFn c_adw_bottom_sheet_get_reveal_bottom_bar; ///
private alias c_adw_bottom_sheet_get_sheetFn = extern(C) GtkWidget* function(AdwBottomSheet* self) nothrow;
__gshared c_adw_bottom_sheet_get_sheetFn c_adw_bottom_sheet_get_sheet; ///
private alias c_adw_bottom_sheet_get_sheet_heightFn = extern(C) int function(AdwBottomSheet* self) nothrow;
__gshared c_adw_bottom_sheet_get_sheet_heightFn c_adw_bottom_sheet_get_sheet_height; ///
private alias c_adw_bottom_sheet_get_show_drag_handleFn = extern(C) gboolean function(AdwBottomSheet* self) nothrow;
__gshared c_adw_bottom_sheet_get_show_drag_handleFn c_adw_bottom_sheet_get_show_drag_handle; ///
private alias c_adw_bottom_sheet_set_alignFn = extern(C) void function(AdwBottomSheet* self, float align_) nothrow;
__gshared c_adw_bottom_sheet_set_alignFn c_adw_bottom_sheet_set_align; ///
private alias c_adw_bottom_sheet_set_bottom_barFn = extern(C) void function(AdwBottomSheet* self, GtkWidget* bottomBar) nothrow;
__gshared c_adw_bottom_sheet_set_bottom_barFn c_adw_bottom_sheet_set_bottom_bar; ///
private alias c_adw_bottom_sheet_set_can_closeFn = extern(C) void function(AdwBottomSheet* self, gboolean canClose) nothrow;
__gshared c_adw_bottom_sheet_set_can_closeFn c_adw_bottom_sheet_set_can_close; ///
private alias c_adw_bottom_sheet_set_can_openFn = extern(C) void function(AdwBottomSheet* self, gboolean canOpen) nothrow;
__gshared c_adw_bottom_sheet_set_can_openFn c_adw_bottom_sheet_set_can_open; ///
private alias c_adw_bottom_sheet_set_contentFn = extern(C) void function(AdwBottomSheet* self, GtkWidget* content) nothrow;
__gshared c_adw_bottom_sheet_set_contentFn c_adw_bottom_sheet_set_content; ///
private alias c_adw_bottom_sheet_set_full_widthFn = extern(C) void function(AdwBottomSheet* self, gboolean fullWidth) nothrow;
__gshared c_adw_bottom_sheet_set_full_widthFn c_adw_bottom_sheet_set_full_width; ///
private alias c_adw_bottom_sheet_set_modalFn = extern(C) void function(AdwBottomSheet* self, gboolean modal) nothrow;
__gshared c_adw_bottom_sheet_set_modalFn c_adw_bottom_sheet_set_modal; ///
private alias c_adw_bottom_sheet_set_openFn = extern(C) void function(AdwBottomSheet* self, gboolean open) nothrow;
__gshared c_adw_bottom_sheet_set_openFn c_adw_bottom_sheet_set_open; ///
private alias c_adw_bottom_sheet_set_reveal_bottom_barFn = extern(C) void function(AdwBottomSheet* self, gboolean reveal) nothrow;
__gshared c_adw_bottom_sheet_set_reveal_bottom_barFn c_adw_bottom_sheet_set_reveal_bottom_bar; ///
private alias c_adw_bottom_sheet_set_sheetFn = extern(C) void function(AdwBottomSheet* self, GtkWidget* sheet) nothrow;
__gshared c_adw_bottom_sheet_set_sheetFn c_adw_bottom_sheet_set_sheet; ///
private alias c_adw_bottom_sheet_set_show_drag_handleFn = extern(C) void function(AdwBottomSheet* self, gboolean showDragHandle) nothrow;
__gshared c_adw_bottom_sheet_set_show_drag_handleFn c_adw_bottom_sheet_set_show_drag_handle; ///

// Breakpoint
private alias c_adw_breakpoint_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_breakpoint_get_typeFn c_adw_breakpoint_get_type; ///
private alias c_adw_breakpoint_newFn = extern(C) AdwBreakpoint* function(AdwBreakpointCondition* condition) nothrow;
__gshared c_adw_breakpoint_newFn c_adw_breakpoint_new; ///
private alias c_adw_breakpoint_add_setterFn = extern(C) void function(AdwBreakpoint* self, GObject* object, const(char)* property, const(GValue)* value) nothrow;
__gshared c_adw_breakpoint_add_setterFn c_adw_breakpoint_add_setter; ///
private alias c_adw_breakpoint_add_settersFn = extern(C) void function(AdwBreakpoint* self, GObject* firstObject, const(char)* firstProperty,  ...) nothrow;
__gshared c_adw_breakpoint_add_settersFn c_adw_breakpoint_add_setters; ///
private alias c_adw_breakpoint_add_setters_valistFn = extern(C) void function(AdwBreakpoint* self, GObject* firstObject, const(char)* firstProperty, void* args) nothrow;
__gshared c_adw_breakpoint_add_setters_valistFn c_adw_breakpoint_add_setters_valist; ///
private alias c_adw_breakpoint_add_settersvFn = extern(C) void function(AdwBreakpoint* self, int nSetters, GObject** objects, const(char*)* names, const(GValue*)* values) nothrow;
__gshared c_adw_breakpoint_add_settersvFn c_adw_breakpoint_add_settersv; ///
private alias c_adw_breakpoint_get_conditionFn = extern(C) AdwBreakpointCondition* function(AdwBreakpoint* self) nothrow;
__gshared c_adw_breakpoint_get_conditionFn c_adw_breakpoint_get_condition; ///
private alias c_adw_breakpoint_set_conditionFn = extern(C) void function(AdwBreakpoint* self, AdwBreakpointCondition* condition) nothrow;
__gshared c_adw_breakpoint_set_conditionFn c_adw_breakpoint_set_condition; ///

// BreakpointBin
private alias c_adw_breakpoint_bin_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_breakpoint_bin_get_typeFn c_adw_breakpoint_bin_get_type; ///
private alias c_adw_breakpoint_bin_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_adw_breakpoint_bin_newFn c_adw_breakpoint_bin_new; ///
private alias c_adw_breakpoint_bin_add_breakpointFn = extern(C) void function(AdwBreakpointBin* self, AdwBreakpoint* breakpoint) nothrow;
__gshared c_adw_breakpoint_bin_add_breakpointFn c_adw_breakpoint_bin_add_breakpoint; ///
private alias c_adw_breakpoint_bin_get_childFn = extern(C) GtkWidget* function(AdwBreakpointBin* self) nothrow;
__gshared c_adw_breakpoint_bin_get_childFn c_adw_breakpoint_bin_get_child; ///
private alias c_adw_breakpoint_bin_get_current_breakpointFn = extern(C) AdwBreakpoint* function(AdwBreakpointBin* self) nothrow;
__gshared c_adw_breakpoint_bin_get_current_breakpointFn c_adw_breakpoint_bin_get_current_breakpoint; ///
private alias c_adw_breakpoint_bin_remove_breakpointFn = extern(C) void function(AdwBreakpointBin* self, AdwBreakpoint* breakpoint) nothrow;
__gshared c_adw_breakpoint_bin_remove_breakpointFn c_adw_breakpoint_bin_remove_breakpoint; ///
private alias c_adw_breakpoint_bin_set_childFn = extern(C) void function(AdwBreakpointBin* self, GtkWidget* child) nothrow;
__gshared c_adw_breakpoint_bin_set_childFn c_adw_breakpoint_bin_set_child; ///

// BreakpointCondition
private alias c_adw_breakpoint_condition_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_breakpoint_condition_get_typeFn c_adw_breakpoint_condition_get_type; ///
private alias c_adw_breakpoint_condition_new_andFn = extern(C) AdwBreakpointCondition* function(AdwBreakpointCondition* condition1, AdwBreakpointCondition* condition2) nothrow;
__gshared c_adw_breakpoint_condition_new_andFn c_adw_breakpoint_condition_new_and; ///
private alias c_adw_breakpoint_condition_new_lengthFn = extern(C) AdwBreakpointCondition* function(AdwBreakpointConditionLengthType type, double value, AdwLengthUnit unit) nothrow;
__gshared c_adw_breakpoint_condition_new_lengthFn c_adw_breakpoint_condition_new_length; ///
private alias c_adw_breakpoint_condition_new_orFn = extern(C) AdwBreakpointCondition* function(AdwBreakpointCondition* condition1, AdwBreakpointCondition* condition2) nothrow;
__gshared c_adw_breakpoint_condition_new_orFn c_adw_breakpoint_condition_new_or; ///
private alias c_adw_breakpoint_condition_new_ratioFn = extern(C) AdwBreakpointCondition* function(AdwBreakpointConditionRatioType type, int width, int height) nothrow;
__gshared c_adw_breakpoint_condition_new_ratioFn c_adw_breakpoint_condition_new_ratio; ///
private alias c_adw_breakpoint_condition_copyFn = extern(C) AdwBreakpointCondition* function(AdwBreakpointCondition* self) nothrow;
__gshared c_adw_breakpoint_condition_copyFn c_adw_breakpoint_condition_copy; ///
private alias c_adw_breakpoint_condition_freeFn = extern(C) void function(AdwBreakpointCondition* self) nothrow;
__gshared c_adw_breakpoint_condition_freeFn c_adw_breakpoint_condition_free; ///
private alias c_adw_breakpoint_condition_to_stringFn = extern(C) char* function(AdwBreakpointCondition* self) nothrow;
__gshared c_adw_breakpoint_condition_to_stringFn c_adw_breakpoint_condition_to_string; ///
private alias c_adw_breakpoint_condition_parseFn = extern(C) AdwBreakpointCondition* function(const(char)* str) nothrow;
__gshared c_adw_breakpoint_condition_parseFn c_adw_breakpoint_condition_parse; ///

// ButtonContent
private alias c_adw_button_content_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_button_content_get_typeFn c_adw_button_content_get_type; ///
private alias c_adw_button_content_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_adw_button_content_newFn c_adw_button_content_new; ///
private alias c_adw_button_content_get_can_shrinkFn = extern(C) gboolean function(AdwButtonContent* self) nothrow;
__gshared c_adw_button_content_get_can_shrinkFn c_adw_button_content_get_can_shrink; ///
private alias c_adw_button_content_get_icon_nameFn = extern(C) const(char)* function(AdwButtonContent* self) nothrow;
__gshared c_adw_button_content_get_icon_nameFn c_adw_button_content_get_icon_name; ///
private alias c_adw_button_content_get_labelFn = extern(C) const(char)* function(AdwButtonContent* self) nothrow;
__gshared c_adw_button_content_get_labelFn c_adw_button_content_get_label; ///
private alias c_adw_button_content_get_use_underlineFn = extern(C) gboolean function(AdwButtonContent* self) nothrow;
__gshared c_adw_button_content_get_use_underlineFn c_adw_button_content_get_use_underline; ///
private alias c_adw_button_content_set_can_shrinkFn = extern(C) void function(AdwButtonContent* self, gboolean canShrink) nothrow;
__gshared c_adw_button_content_set_can_shrinkFn c_adw_button_content_set_can_shrink; ///
private alias c_adw_button_content_set_icon_nameFn = extern(C) void function(AdwButtonContent* self, const(char)* iconName) nothrow;
__gshared c_adw_button_content_set_icon_nameFn c_adw_button_content_set_icon_name; ///
private alias c_adw_button_content_set_labelFn = extern(C) void function(AdwButtonContent* self, const(char)* label) nothrow;
__gshared c_adw_button_content_set_labelFn c_adw_button_content_set_label; ///
private alias c_adw_button_content_set_use_underlineFn = extern(C) void function(AdwButtonContent* self, gboolean useUnderline) nothrow;
__gshared c_adw_button_content_set_use_underlineFn c_adw_button_content_set_use_underline; ///

// ButtonRow
private alias c_adw_button_row_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_button_row_get_typeFn c_adw_button_row_get_type; ///
private alias c_adw_button_row_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_adw_button_row_newFn c_adw_button_row_new; ///
private alias c_adw_button_row_get_end_icon_nameFn = extern(C) const(char)* function(AdwButtonRow* self) nothrow;
__gshared c_adw_button_row_get_end_icon_nameFn c_adw_button_row_get_end_icon_name; ///
private alias c_adw_button_row_get_start_icon_nameFn = extern(C) const(char)* function(AdwButtonRow* self) nothrow;
__gshared c_adw_button_row_get_start_icon_nameFn c_adw_button_row_get_start_icon_name; ///
private alias c_adw_button_row_set_end_icon_nameFn = extern(C) void function(AdwButtonRow* self, const(char)* iconName) nothrow;
__gshared c_adw_button_row_set_end_icon_nameFn c_adw_button_row_set_end_icon_name; ///
private alias c_adw_button_row_set_start_icon_nameFn = extern(C) void function(AdwButtonRow* self, const(char)* iconName) nothrow;
__gshared c_adw_button_row_set_start_icon_nameFn c_adw_button_row_set_start_icon_name; ///

// CallbackAnimationTarget
private alias c_adw_callback_animation_target_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_callback_animation_target_get_typeFn c_adw_callback_animation_target_get_type; ///
private alias c_adw_callback_animation_target_newFn = extern(C) AdwAnimationTarget* function(AdwAnimationTargetFunc callback, void* userData, GDestroyNotify destroy) nothrow;
__gshared c_adw_callback_animation_target_newFn c_adw_callback_animation_target_new; ///

// Carousel
private alias c_adw_carousel_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_carousel_get_typeFn c_adw_carousel_get_type; ///
private alias c_adw_carousel_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_adw_carousel_newFn c_adw_carousel_new; ///
private alias c_adw_carousel_appendFn = extern(C) void function(AdwCarousel* self, GtkWidget* child) nothrow;
__gshared c_adw_carousel_appendFn c_adw_carousel_append; ///
private alias c_adw_carousel_get_allow_long_swipesFn = extern(C) gboolean function(AdwCarousel* self) nothrow;
__gshared c_adw_carousel_get_allow_long_swipesFn c_adw_carousel_get_allow_long_swipes; ///
private alias c_adw_carousel_get_allow_mouse_dragFn = extern(C) gboolean function(AdwCarousel* self) nothrow;
__gshared c_adw_carousel_get_allow_mouse_dragFn c_adw_carousel_get_allow_mouse_drag; ///
private alias c_adw_carousel_get_allow_scroll_wheelFn = extern(C) gboolean function(AdwCarousel* self) nothrow;
__gshared c_adw_carousel_get_allow_scroll_wheelFn c_adw_carousel_get_allow_scroll_wheel; ///
private alias c_adw_carousel_get_interactiveFn = extern(C) gboolean function(AdwCarousel* self) nothrow;
__gshared c_adw_carousel_get_interactiveFn c_adw_carousel_get_interactive; ///
private alias c_adw_carousel_get_n_pagesFn = extern(C) uint function(AdwCarousel* self) nothrow;
__gshared c_adw_carousel_get_n_pagesFn c_adw_carousel_get_n_pages; ///
private alias c_adw_carousel_get_nth_pageFn = extern(C) GtkWidget* function(AdwCarousel* self, uint n) nothrow;
__gshared c_adw_carousel_get_nth_pageFn c_adw_carousel_get_nth_page; ///
private alias c_adw_carousel_get_positionFn = extern(C) double function(AdwCarousel* self) nothrow;
__gshared c_adw_carousel_get_positionFn c_adw_carousel_get_position; ///
private alias c_adw_carousel_get_reveal_durationFn = extern(C) uint function(AdwCarousel* self) nothrow;
__gshared c_adw_carousel_get_reveal_durationFn c_adw_carousel_get_reveal_duration; ///
private alias c_adw_carousel_get_scroll_paramsFn = extern(C) AdwSpringParams* function(AdwCarousel* self) nothrow;
__gshared c_adw_carousel_get_scroll_paramsFn c_adw_carousel_get_scroll_params; ///
private alias c_adw_carousel_get_spacingFn = extern(C) uint function(AdwCarousel* self) nothrow;
__gshared c_adw_carousel_get_spacingFn c_adw_carousel_get_spacing; ///
private alias c_adw_carousel_insertFn = extern(C) void function(AdwCarousel* self, GtkWidget* child, int position) nothrow;
__gshared c_adw_carousel_insertFn c_adw_carousel_insert; ///
private alias c_adw_carousel_prependFn = extern(C) void function(AdwCarousel* self, GtkWidget* child) nothrow;
__gshared c_adw_carousel_prependFn c_adw_carousel_prepend; ///
private alias c_adw_carousel_removeFn = extern(C) void function(AdwCarousel* self, GtkWidget* child) nothrow;
__gshared c_adw_carousel_removeFn c_adw_carousel_remove; ///
private alias c_adw_carousel_reorderFn = extern(C) void function(AdwCarousel* self, GtkWidget* child, int position) nothrow;
__gshared c_adw_carousel_reorderFn c_adw_carousel_reorder; ///
private alias c_adw_carousel_scroll_toFn = extern(C) void function(AdwCarousel* self, GtkWidget* widget, gboolean animate) nothrow;
__gshared c_adw_carousel_scroll_toFn c_adw_carousel_scroll_to; ///
private alias c_adw_carousel_set_allow_long_swipesFn = extern(C) void function(AdwCarousel* self, gboolean allowLongSwipes) nothrow;
__gshared c_adw_carousel_set_allow_long_swipesFn c_adw_carousel_set_allow_long_swipes; ///
private alias c_adw_carousel_set_allow_mouse_dragFn = extern(C) void function(AdwCarousel* self, gboolean allowMouseDrag) nothrow;
__gshared c_adw_carousel_set_allow_mouse_dragFn c_adw_carousel_set_allow_mouse_drag; ///
private alias c_adw_carousel_set_allow_scroll_wheelFn = extern(C) void function(AdwCarousel* self, gboolean allowScrollWheel) nothrow;
__gshared c_adw_carousel_set_allow_scroll_wheelFn c_adw_carousel_set_allow_scroll_wheel; ///
private alias c_adw_carousel_set_interactiveFn = extern(C) void function(AdwCarousel* self, gboolean interactive) nothrow;
__gshared c_adw_carousel_set_interactiveFn c_adw_carousel_set_interactive; ///
private alias c_adw_carousel_set_reveal_durationFn = extern(C) void function(AdwCarousel* self, uint revealDuration) nothrow;
__gshared c_adw_carousel_set_reveal_durationFn c_adw_carousel_set_reveal_duration; ///
private alias c_adw_carousel_set_scroll_paramsFn = extern(C) void function(AdwCarousel* self, AdwSpringParams* params) nothrow;
__gshared c_adw_carousel_set_scroll_paramsFn c_adw_carousel_set_scroll_params; ///
private alias c_adw_carousel_set_spacingFn = extern(C) void function(AdwCarousel* self, uint spacing) nothrow;
__gshared c_adw_carousel_set_spacingFn c_adw_carousel_set_spacing; ///

// CarouselIndicatorDots
private alias c_adw_carousel_indicator_dots_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_carousel_indicator_dots_get_typeFn c_adw_carousel_indicator_dots_get_type; ///
private alias c_adw_carousel_indicator_dots_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_adw_carousel_indicator_dots_newFn c_adw_carousel_indicator_dots_new; ///
private alias c_adw_carousel_indicator_dots_get_carouselFn = extern(C) AdwCarousel* function(AdwCarouselIndicatorDots* self) nothrow;
__gshared c_adw_carousel_indicator_dots_get_carouselFn c_adw_carousel_indicator_dots_get_carousel; ///
private alias c_adw_carousel_indicator_dots_set_carouselFn = extern(C) void function(AdwCarouselIndicatorDots* self, AdwCarousel* carousel) nothrow;
__gshared c_adw_carousel_indicator_dots_set_carouselFn c_adw_carousel_indicator_dots_set_carousel; ///

// CarouselIndicatorLines
private alias c_adw_carousel_indicator_lines_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_carousel_indicator_lines_get_typeFn c_adw_carousel_indicator_lines_get_type; ///
private alias c_adw_carousel_indicator_lines_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_adw_carousel_indicator_lines_newFn c_adw_carousel_indicator_lines_new; ///
private alias c_adw_carousel_indicator_lines_get_carouselFn = extern(C) AdwCarousel* function(AdwCarouselIndicatorLines* self) nothrow;
__gshared c_adw_carousel_indicator_lines_get_carouselFn c_adw_carousel_indicator_lines_get_carousel; ///
private alias c_adw_carousel_indicator_lines_set_carouselFn = extern(C) void function(AdwCarouselIndicatorLines* self, AdwCarousel* carousel) nothrow;
__gshared c_adw_carousel_indicator_lines_set_carouselFn c_adw_carousel_indicator_lines_set_carousel; ///

// Clamp
private alias c_adw_clamp_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_clamp_get_typeFn c_adw_clamp_get_type; ///
private alias c_adw_clamp_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_adw_clamp_newFn c_adw_clamp_new; ///
private alias c_adw_clamp_get_childFn = extern(C) GtkWidget* function(AdwClamp* self) nothrow;
__gshared c_adw_clamp_get_childFn c_adw_clamp_get_child; ///
private alias c_adw_clamp_get_maximum_sizeFn = extern(C) int function(AdwClamp* self) nothrow;
__gshared c_adw_clamp_get_maximum_sizeFn c_adw_clamp_get_maximum_size; ///
private alias c_adw_clamp_get_tightening_thresholdFn = extern(C) int function(AdwClamp* self) nothrow;
__gshared c_adw_clamp_get_tightening_thresholdFn c_adw_clamp_get_tightening_threshold; ///
private alias c_adw_clamp_get_unitFn = extern(C) AdwLengthUnit function(AdwClamp* self) nothrow;
__gshared c_adw_clamp_get_unitFn c_adw_clamp_get_unit; ///
private alias c_adw_clamp_set_childFn = extern(C) void function(AdwClamp* self, GtkWidget* child) nothrow;
__gshared c_adw_clamp_set_childFn c_adw_clamp_set_child; ///
private alias c_adw_clamp_set_maximum_sizeFn = extern(C) void function(AdwClamp* self, int maximumSize) nothrow;
__gshared c_adw_clamp_set_maximum_sizeFn c_adw_clamp_set_maximum_size; ///
private alias c_adw_clamp_set_tightening_thresholdFn = extern(C) void function(AdwClamp* self, int tighteningThreshold) nothrow;
__gshared c_adw_clamp_set_tightening_thresholdFn c_adw_clamp_set_tightening_threshold; ///
private alias c_adw_clamp_set_unitFn = extern(C) void function(AdwClamp* self, AdwLengthUnit unit) nothrow;
__gshared c_adw_clamp_set_unitFn c_adw_clamp_set_unit; ///

// ClampLayout
private alias c_adw_clamp_layout_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_clamp_layout_get_typeFn c_adw_clamp_layout_get_type; ///
private alias c_adw_clamp_layout_newFn = extern(C) GtkLayoutManager* function() nothrow;
__gshared c_adw_clamp_layout_newFn c_adw_clamp_layout_new; ///
private alias c_adw_clamp_layout_get_maximum_sizeFn = extern(C) int function(AdwClampLayout* self) nothrow;
__gshared c_adw_clamp_layout_get_maximum_sizeFn c_adw_clamp_layout_get_maximum_size; ///
private alias c_adw_clamp_layout_get_tightening_thresholdFn = extern(C) int function(AdwClampLayout* self) nothrow;
__gshared c_adw_clamp_layout_get_tightening_thresholdFn c_adw_clamp_layout_get_tightening_threshold; ///
private alias c_adw_clamp_layout_get_unitFn = extern(C) AdwLengthUnit function(AdwClampLayout* self) nothrow;
__gshared c_adw_clamp_layout_get_unitFn c_adw_clamp_layout_get_unit; ///
private alias c_adw_clamp_layout_set_maximum_sizeFn = extern(C) void function(AdwClampLayout* self, int maximumSize) nothrow;
__gshared c_adw_clamp_layout_set_maximum_sizeFn c_adw_clamp_layout_set_maximum_size; ///
private alias c_adw_clamp_layout_set_tightening_thresholdFn = extern(C) void function(AdwClampLayout* self, int tighteningThreshold) nothrow;
__gshared c_adw_clamp_layout_set_tightening_thresholdFn c_adw_clamp_layout_set_tightening_threshold; ///
private alias c_adw_clamp_layout_set_unitFn = extern(C) void function(AdwClampLayout* self, AdwLengthUnit unit) nothrow;
__gshared c_adw_clamp_layout_set_unitFn c_adw_clamp_layout_set_unit; ///

// ClampScrollable
private alias c_adw_clamp_scrollable_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_clamp_scrollable_get_typeFn c_adw_clamp_scrollable_get_type; ///
private alias c_adw_clamp_scrollable_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_adw_clamp_scrollable_newFn c_adw_clamp_scrollable_new; ///
private alias c_adw_clamp_scrollable_get_childFn = extern(C) GtkWidget* function(AdwClampScrollable* self) nothrow;
__gshared c_adw_clamp_scrollable_get_childFn c_adw_clamp_scrollable_get_child; ///
private alias c_adw_clamp_scrollable_get_maximum_sizeFn = extern(C) int function(AdwClampScrollable* self) nothrow;
__gshared c_adw_clamp_scrollable_get_maximum_sizeFn c_adw_clamp_scrollable_get_maximum_size; ///
private alias c_adw_clamp_scrollable_get_tightening_thresholdFn = extern(C) int function(AdwClampScrollable* self) nothrow;
__gshared c_adw_clamp_scrollable_get_tightening_thresholdFn c_adw_clamp_scrollable_get_tightening_threshold; ///
private alias c_adw_clamp_scrollable_get_unitFn = extern(C) AdwLengthUnit function(AdwClampScrollable* self) nothrow;
__gshared c_adw_clamp_scrollable_get_unitFn c_adw_clamp_scrollable_get_unit; ///
private alias c_adw_clamp_scrollable_set_childFn = extern(C) void function(AdwClampScrollable* self, GtkWidget* child) nothrow;
__gshared c_adw_clamp_scrollable_set_childFn c_adw_clamp_scrollable_set_child; ///
private alias c_adw_clamp_scrollable_set_maximum_sizeFn = extern(C) void function(AdwClampScrollable* self, int maximumSize) nothrow;
__gshared c_adw_clamp_scrollable_set_maximum_sizeFn c_adw_clamp_scrollable_set_maximum_size; ///
private alias c_adw_clamp_scrollable_set_tightening_thresholdFn = extern(C) void function(AdwClampScrollable* self, int tighteningThreshold) nothrow;
__gshared c_adw_clamp_scrollable_set_tightening_thresholdFn c_adw_clamp_scrollable_set_tightening_threshold; ///
private alias c_adw_clamp_scrollable_set_unitFn = extern(C) void function(AdwClampScrollable* self, AdwLengthUnit unit) nothrow;
__gshared c_adw_clamp_scrollable_set_unitFn c_adw_clamp_scrollable_set_unit; ///

// ComboRow
private alias c_adw_combo_row_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_combo_row_get_typeFn c_adw_combo_row_get_type; ///
private alias c_adw_combo_row_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_adw_combo_row_newFn c_adw_combo_row_new; ///
private alias c_adw_combo_row_get_enable_searchFn = extern(C) gboolean function(AdwComboRow* self) nothrow;
__gshared c_adw_combo_row_get_enable_searchFn c_adw_combo_row_get_enable_search; ///
private alias c_adw_combo_row_get_expressionFn = extern(C) GtkExpression* function(AdwComboRow* self) nothrow;
__gshared c_adw_combo_row_get_expressionFn c_adw_combo_row_get_expression; ///
private alias c_adw_combo_row_get_factoryFn = extern(C) GtkListItemFactory* function(AdwComboRow* self) nothrow;
__gshared c_adw_combo_row_get_factoryFn c_adw_combo_row_get_factory; ///
private alias c_adw_combo_row_get_header_factoryFn = extern(C) GtkListItemFactory* function(AdwComboRow* self) nothrow;
__gshared c_adw_combo_row_get_header_factoryFn c_adw_combo_row_get_header_factory; ///
private alias c_adw_combo_row_get_list_factoryFn = extern(C) GtkListItemFactory* function(AdwComboRow* self) nothrow;
__gshared c_adw_combo_row_get_list_factoryFn c_adw_combo_row_get_list_factory; ///
private alias c_adw_combo_row_get_modelFn = extern(C) GListModel* function(AdwComboRow* self) nothrow;
__gshared c_adw_combo_row_get_modelFn c_adw_combo_row_get_model; ///
private alias c_adw_combo_row_get_search_match_modeFn = extern(C) GtkStringFilterMatchMode function(AdwComboRow* self) nothrow;
__gshared c_adw_combo_row_get_search_match_modeFn c_adw_combo_row_get_search_match_mode; ///
private alias c_adw_combo_row_get_selectedFn = extern(C) uint function(AdwComboRow* self) nothrow;
__gshared c_adw_combo_row_get_selectedFn c_adw_combo_row_get_selected; ///
private alias c_adw_combo_row_get_selected_itemFn = extern(C) GObject* function(AdwComboRow* self) nothrow;
__gshared c_adw_combo_row_get_selected_itemFn c_adw_combo_row_get_selected_item; ///
private alias c_adw_combo_row_get_use_subtitleFn = extern(C) gboolean function(AdwComboRow* self) nothrow;
__gshared c_adw_combo_row_get_use_subtitleFn c_adw_combo_row_get_use_subtitle; ///
private alias c_adw_combo_row_set_enable_searchFn = extern(C) void function(AdwComboRow* self, gboolean enableSearch) nothrow;
__gshared c_adw_combo_row_set_enable_searchFn c_adw_combo_row_set_enable_search; ///
private alias c_adw_combo_row_set_expressionFn = extern(C) void function(AdwComboRow* self, GtkExpression* expression) nothrow;
__gshared c_adw_combo_row_set_expressionFn c_adw_combo_row_set_expression; ///
private alias c_adw_combo_row_set_factoryFn = extern(C) void function(AdwComboRow* self, GtkListItemFactory* factory) nothrow;
__gshared c_adw_combo_row_set_factoryFn c_adw_combo_row_set_factory; ///
private alias c_adw_combo_row_set_header_factoryFn = extern(C) void function(AdwComboRow* self, GtkListItemFactory* factory) nothrow;
__gshared c_adw_combo_row_set_header_factoryFn c_adw_combo_row_set_header_factory; ///
private alias c_adw_combo_row_set_list_factoryFn = extern(C) void function(AdwComboRow* self, GtkListItemFactory* factory) nothrow;
__gshared c_adw_combo_row_set_list_factoryFn c_adw_combo_row_set_list_factory; ///
private alias c_adw_combo_row_set_modelFn = extern(C) void function(AdwComboRow* self, GListModel* model) nothrow;
__gshared c_adw_combo_row_set_modelFn c_adw_combo_row_set_model; ///
private alias c_adw_combo_row_set_search_match_modeFn = extern(C) void function(AdwComboRow* self, GtkStringFilterMatchMode searchMatchMode) nothrow;
__gshared c_adw_combo_row_set_search_match_modeFn c_adw_combo_row_set_search_match_mode; ///
private alias c_adw_combo_row_set_selectedFn = extern(C) void function(AdwComboRow* self, uint position) nothrow;
__gshared c_adw_combo_row_set_selectedFn c_adw_combo_row_set_selected; ///
private alias c_adw_combo_row_set_use_subtitleFn = extern(C) void function(AdwComboRow* self, gboolean useSubtitle) nothrow;
__gshared c_adw_combo_row_set_use_subtitleFn c_adw_combo_row_set_use_subtitle; ///

// Dialog
private alias c_adw_dialog_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_dialog_get_typeFn c_adw_dialog_get_type; ///
private alias c_adw_dialog_newFn = extern(C) AdwDialog* function() nothrow;
__gshared c_adw_dialog_newFn c_adw_dialog_new; ///
private alias c_adw_dialog_add_breakpointFn = extern(C) void function(AdwDialog* self, AdwBreakpoint* breakpoint) nothrow;
__gshared c_adw_dialog_add_breakpointFn c_adw_dialog_add_breakpoint; ///
private alias c_adw_dialog_closeFn = extern(C) gboolean function(AdwDialog* self) nothrow;
__gshared c_adw_dialog_closeFn c_adw_dialog_close; ///
private alias c_adw_dialog_force_closeFn = extern(C) void function(AdwDialog* self) nothrow;
__gshared c_adw_dialog_force_closeFn c_adw_dialog_force_close; ///
private alias c_adw_dialog_get_can_closeFn = extern(C) gboolean function(AdwDialog* self) nothrow;
__gshared c_adw_dialog_get_can_closeFn c_adw_dialog_get_can_close; ///
private alias c_adw_dialog_get_childFn = extern(C) GtkWidget* function(AdwDialog* self) nothrow;
__gshared c_adw_dialog_get_childFn c_adw_dialog_get_child; ///
private alias c_adw_dialog_get_content_heightFn = extern(C) int function(AdwDialog* self) nothrow;
__gshared c_adw_dialog_get_content_heightFn c_adw_dialog_get_content_height; ///
private alias c_adw_dialog_get_content_widthFn = extern(C) int function(AdwDialog* self) nothrow;
__gshared c_adw_dialog_get_content_widthFn c_adw_dialog_get_content_width; ///
private alias c_adw_dialog_get_current_breakpointFn = extern(C) AdwBreakpoint* function(AdwDialog* self) nothrow;
__gshared c_adw_dialog_get_current_breakpointFn c_adw_dialog_get_current_breakpoint; ///
private alias c_adw_dialog_get_default_widgetFn = extern(C) GtkWidget* function(AdwDialog* self) nothrow;
__gshared c_adw_dialog_get_default_widgetFn c_adw_dialog_get_default_widget; ///
private alias c_adw_dialog_get_focusFn = extern(C) GtkWidget* function(AdwDialog* self) nothrow;
__gshared c_adw_dialog_get_focusFn c_adw_dialog_get_focus; ///
private alias c_adw_dialog_get_follows_content_sizeFn = extern(C) gboolean function(AdwDialog* self) nothrow;
__gshared c_adw_dialog_get_follows_content_sizeFn c_adw_dialog_get_follows_content_size; ///
private alias c_adw_dialog_get_presentation_modeFn = extern(C) AdwDialogPresentationMode function(AdwDialog* self) nothrow;
__gshared c_adw_dialog_get_presentation_modeFn c_adw_dialog_get_presentation_mode; ///
private alias c_adw_dialog_get_titleFn = extern(C) const(char)* function(AdwDialog* self) nothrow;
__gshared c_adw_dialog_get_titleFn c_adw_dialog_get_title; ///
private alias c_adw_dialog_presentFn = extern(C) void function(AdwDialog* self, GtkWidget* parent) nothrow;
__gshared c_adw_dialog_presentFn c_adw_dialog_present; ///
private alias c_adw_dialog_set_can_closeFn = extern(C) void function(AdwDialog* self, gboolean canClose) nothrow;
__gshared c_adw_dialog_set_can_closeFn c_adw_dialog_set_can_close; ///
private alias c_adw_dialog_set_childFn = extern(C) void function(AdwDialog* self, GtkWidget* child) nothrow;
__gshared c_adw_dialog_set_childFn c_adw_dialog_set_child; ///
private alias c_adw_dialog_set_content_heightFn = extern(C) void function(AdwDialog* self, int contentHeight) nothrow;
__gshared c_adw_dialog_set_content_heightFn c_adw_dialog_set_content_height; ///
private alias c_adw_dialog_set_content_widthFn = extern(C) void function(AdwDialog* self, int contentWidth) nothrow;
__gshared c_adw_dialog_set_content_widthFn c_adw_dialog_set_content_width; ///
private alias c_adw_dialog_set_default_widgetFn = extern(C) void function(AdwDialog* self, GtkWidget* defaultWidget) nothrow;
__gshared c_adw_dialog_set_default_widgetFn c_adw_dialog_set_default_widget; ///
private alias c_adw_dialog_set_focusFn = extern(C) void function(AdwDialog* self, GtkWidget* focus) nothrow;
__gshared c_adw_dialog_set_focusFn c_adw_dialog_set_focus; ///
private alias c_adw_dialog_set_follows_content_sizeFn = extern(C) void function(AdwDialog* self, gboolean followsContentSize) nothrow;
__gshared c_adw_dialog_set_follows_content_sizeFn c_adw_dialog_set_follows_content_size; ///
private alias c_adw_dialog_set_presentation_modeFn = extern(C) void function(AdwDialog* self, AdwDialogPresentationMode presentationMode) nothrow;
__gshared c_adw_dialog_set_presentation_modeFn c_adw_dialog_set_presentation_mode; ///
private alias c_adw_dialog_set_titleFn = extern(C) void function(AdwDialog* self, const(char)* title) nothrow;
__gshared c_adw_dialog_set_titleFn c_adw_dialog_set_title; ///

// EntryRow
private alias c_adw_entry_row_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_entry_row_get_typeFn c_adw_entry_row_get_type; ///
private alias c_adw_entry_row_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_adw_entry_row_newFn c_adw_entry_row_new; ///
private alias c_adw_entry_row_add_prefixFn = extern(C) void function(AdwEntryRow* self, GtkWidget* widget) nothrow;
__gshared c_adw_entry_row_add_prefixFn c_adw_entry_row_add_prefix; ///
private alias c_adw_entry_row_add_suffixFn = extern(C) void function(AdwEntryRow* self, GtkWidget* widget) nothrow;
__gshared c_adw_entry_row_add_suffixFn c_adw_entry_row_add_suffix; ///
private alias c_adw_entry_row_get_activates_defaultFn = extern(C) gboolean function(AdwEntryRow* self) nothrow;
__gshared c_adw_entry_row_get_activates_defaultFn c_adw_entry_row_get_activates_default; ///
private alias c_adw_entry_row_get_attributesFn = extern(C) PangoAttrList* function(AdwEntryRow* self) nothrow;
__gshared c_adw_entry_row_get_attributesFn c_adw_entry_row_get_attributes; ///
private alias c_adw_entry_row_get_enable_emoji_completionFn = extern(C) gboolean function(AdwEntryRow* self) nothrow;
__gshared c_adw_entry_row_get_enable_emoji_completionFn c_adw_entry_row_get_enable_emoji_completion; ///
private alias c_adw_entry_row_get_input_hintsFn = extern(C) GtkInputHints function(AdwEntryRow* self) nothrow;
__gshared c_adw_entry_row_get_input_hintsFn c_adw_entry_row_get_input_hints; ///
private alias c_adw_entry_row_get_input_purposeFn = extern(C) GtkInputPurpose function(AdwEntryRow* self) nothrow;
__gshared c_adw_entry_row_get_input_purposeFn c_adw_entry_row_get_input_purpose; ///
private alias c_adw_entry_row_get_max_lengthFn = extern(C) int function(AdwEntryRow* self) nothrow;
__gshared c_adw_entry_row_get_max_lengthFn c_adw_entry_row_get_max_length; ///
private alias c_adw_entry_row_get_show_apply_buttonFn = extern(C) gboolean function(AdwEntryRow* self) nothrow;
__gshared c_adw_entry_row_get_show_apply_buttonFn c_adw_entry_row_get_show_apply_button; ///
private alias c_adw_entry_row_get_text_lengthFn = extern(C) uint function(AdwEntryRow* self) nothrow;
__gshared c_adw_entry_row_get_text_lengthFn c_adw_entry_row_get_text_length; ///
private alias c_adw_entry_row_grab_focus_without_selectingFn = extern(C) gboolean function(AdwEntryRow* self) nothrow;
__gshared c_adw_entry_row_grab_focus_without_selectingFn c_adw_entry_row_grab_focus_without_selecting; ///
private alias c_adw_entry_row_removeFn = extern(C) void function(AdwEntryRow* self, GtkWidget* widget) nothrow;
__gshared c_adw_entry_row_removeFn c_adw_entry_row_remove; ///
private alias c_adw_entry_row_set_activates_defaultFn = extern(C) void function(AdwEntryRow* self, gboolean activates) nothrow;
__gshared c_adw_entry_row_set_activates_defaultFn c_adw_entry_row_set_activates_default; ///
private alias c_adw_entry_row_set_attributesFn = extern(C) void function(AdwEntryRow* self, PangoAttrList* attributes) nothrow;
__gshared c_adw_entry_row_set_attributesFn c_adw_entry_row_set_attributes; ///
private alias c_adw_entry_row_set_enable_emoji_completionFn = extern(C) void function(AdwEntryRow* self, gboolean enableEmojiCompletion) nothrow;
__gshared c_adw_entry_row_set_enable_emoji_completionFn c_adw_entry_row_set_enable_emoji_completion; ///
private alias c_adw_entry_row_set_input_hintsFn = extern(C) void function(AdwEntryRow* self, GtkInputHints hints) nothrow;
__gshared c_adw_entry_row_set_input_hintsFn c_adw_entry_row_set_input_hints; ///
private alias c_adw_entry_row_set_input_purposeFn = extern(C) void function(AdwEntryRow* self, GtkInputPurpose purpose) nothrow;
__gshared c_adw_entry_row_set_input_purposeFn c_adw_entry_row_set_input_purpose; ///
private alias c_adw_entry_row_set_max_lengthFn = extern(C) void function(AdwEntryRow* self, int maxLength) nothrow;
__gshared c_adw_entry_row_set_max_lengthFn c_adw_entry_row_set_max_length; ///
private alias c_adw_entry_row_set_show_apply_buttonFn = extern(C) void function(AdwEntryRow* self, gboolean showApplyButton) nothrow;
__gshared c_adw_entry_row_set_show_apply_buttonFn c_adw_entry_row_set_show_apply_button; ///

// EnumListItem
private alias c_adw_enum_list_item_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_enum_list_item_get_typeFn c_adw_enum_list_item_get_type; ///
private alias c_adw_enum_list_item_get_nameFn = extern(C) const(char)* function(AdwEnumListItem* self) nothrow;
__gshared c_adw_enum_list_item_get_nameFn c_adw_enum_list_item_get_name; ///
private alias c_adw_enum_list_item_get_nickFn = extern(C) const(char)* function(AdwEnumListItem* self) nothrow;
__gshared c_adw_enum_list_item_get_nickFn c_adw_enum_list_item_get_nick; ///
private alias c_adw_enum_list_item_get_valueFn = extern(C) int function(AdwEnumListItem* self) nothrow;
__gshared c_adw_enum_list_item_get_valueFn c_adw_enum_list_item_get_value; ///

// EnumListModel
private alias c_adw_enum_list_model_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_enum_list_model_get_typeFn c_adw_enum_list_model_get_type; ///
private alias c_adw_enum_list_model_newFn = extern(C) AdwEnumListModel* function(GType enumType) nothrow;
__gshared c_adw_enum_list_model_newFn c_adw_enum_list_model_new; ///
private alias c_adw_enum_list_model_find_positionFn = extern(C) uint function(AdwEnumListModel* self, int value) nothrow;
__gshared c_adw_enum_list_model_find_positionFn c_adw_enum_list_model_find_position; ///
private alias c_adw_enum_list_model_get_enum_typeFn = extern(C) GType function(AdwEnumListModel* self) nothrow;
__gshared c_adw_enum_list_model_get_enum_typeFn c_adw_enum_list_model_get_enum_type; ///

// ExpanderRow
private alias c_adw_expander_row_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_expander_row_get_typeFn c_adw_expander_row_get_type; ///
private alias c_adw_expander_row_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_adw_expander_row_newFn c_adw_expander_row_new; ///
private alias c_adw_expander_row_add_actionFn = extern(C) void function(AdwExpanderRow* self, GtkWidget* widget) nothrow;
__gshared c_adw_expander_row_add_actionFn c_adw_expander_row_add_action; ///
private alias c_adw_expander_row_add_prefixFn = extern(C) void function(AdwExpanderRow* self, GtkWidget* widget) nothrow;
__gshared c_adw_expander_row_add_prefixFn c_adw_expander_row_add_prefix; ///
private alias c_adw_expander_row_add_rowFn = extern(C) void function(AdwExpanderRow* self, GtkWidget* child) nothrow;
__gshared c_adw_expander_row_add_rowFn c_adw_expander_row_add_row; ///
private alias c_adw_expander_row_add_suffixFn = extern(C) void function(AdwExpanderRow* self, GtkWidget* widget) nothrow;
__gshared c_adw_expander_row_add_suffixFn c_adw_expander_row_add_suffix; ///
private alias c_adw_expander_row_get_enable_expansionFn = extern(C) gboolean function(AdwExpanderRow* self) nothrow;
__gshared c_adw_expander_row_get_enable_expansionFn c_adw_expander_row_get_enable_expansion; ///
private alias c_adw_expander_row_get_expandedFn = extern(C) gboolean function(AdwExpanderRow* self) nothrow;
__gshared c_adw_expander_row_get_expandedFn c_adw_expander_row_get_expanded; ///
private alias c_adw_expander_row_get_icon_nameFn = extern(C) const(char)* function(AdwExpanderRow* self) nothrow;
__gshared c_adw_expander_row_get_icon_nameFn c_adw_expander_row_get_icon_name; ///
private alias c_adw_expander_row_get_show_enable_switchFn = extern(C) gboolean function(AdwExpanderRow* self) nothrow;
__gshared c_adw_expander_row_get_show_enable_switchFn c_adw_expander_row_get_show_enable_switch; ///
private alias c_adw_expander_row_get_subtitleFn = extern(C) const(char)* function(AdwExpanderRow* self) nothrow;
__gshared c_adw_expander_row_get_subtitleFn c_adw_expander_row_get_subtitle; ///
private alias c_adw_expander_row_get_subtitle_linesFn = extern(C) int function(AdwExpanderRow* self) nothrow;
__gshared c_adw_expander_row_get_subtitle_linesFn c_adw_expander_row_get_subtitle_lines; ///
private alias c_adw_expander_row_get_title_linesFn = extern(C) int function(AdwExpanderRow* self) nothrow;
__gshared c_adw_expander_row_get_title_linesFn c_adw_expander_row_get_title_lines; ///
private alias c_adw_expander_row_removeFn = extern(C) void function(AdwExpanderRow* self, GtkWidget* child) nothrow;
__gshared c_adw_expander_row_removeFn c_adw_expander_row_remove; ///
private alias c_adw_expander_row_set_enable_expansionFn = extern(C) void function(AdwExpanderRow* self, gboolean enableExpansion) nothrow;
__gshared c_adw_expander_row_set_enable_expansionFn c_adw_expander_row_set_enable_expansion; ///
private alias c_adw_expander_row_set_expandedFn = extern(C) void function(AdwExpanderRow* self, gboolean expanded) nothrow;
__gshared c_adw_expander_row_set_expandedFn c_adw_expander_row_set_expanded; ///
private alias c_adw_expander_row_set_icon_nameFn = extern(C) void function(AdwExpanderRow* self, const(char)* iconName) nothrow;
__gshared c_adw_expander_row_set_icon_nameFn c_adw_expander_row_set_icon_name; ///
private alias c_adw_expander_row_set_show_enable_switchFn = extern(C) void function(AdwExpanderRow* self, gboolean showEnableSwitch) nothrow;
__gshared c_adw_expander_row_set_show_enable_switchFn c_adw_expander_row_set_show_enable_switch; ///
private alias c_adw_expander_row_set_subtitleFn = extern(C) void function(AdwExpanderRow* self, const(char)* subtitle) nothrow;
__gshared c_adw_expander_row_set_subtitleFn c_adw_expander_row_set_subtitle; ///
private alias c_adw_expander_row_set_subtitle_linesFn = extern(C) void function(AdwExpanderRow* self, int subtitleLines) nothrow;
__gshared c_adw_expander_row_set_subtitle_linesFn c_adw_expander_row_set_subtitle_lines; ///
private alias c_adw_expander_row_set_title_linesFn = extern(C) void function(AdwExpanderRow* self, int titleLines) nothrow;
__gshared c_adw_expander_row_set_title_linesFn c_adw_expander_row_set_title_lines; ///

// Flap
private alias c_adw_flap_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_flap_get_typeFn c_adw_flap_get_type; ///
private alias c_adw_flap_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_adw_flap_newFn c_adw_flap_new; ///
private alias c_adw_flap_get_contentFn = extern(C) GtkWidget* function(AdwFlap* self) nothrow;
__gshared c_adw_flap_get_contentFn c_adw_flap_get_content; ///
private alias c_adw_flap_get_flapFn = extern(C) GtkWidget* function(AdwFlap* self) nothrow;
__gshared c_adw_flap_get_flapFn c_adw_flap_get_flap; ///
private alias c_adw_flap_get_flap_positionFn = extern(C) GtkPackType function(AdwFlap* self) nothrow;
__gshared c_adw_flap_get_flap_positionFn c_adw_flap_get_flap_position; ///
private alias c_adw_flap_get_fold_durationFn = extern(C) uint function(AdwFlap* self) nothrow;
__gshared c_adw_flap_get_fold_durationFn c_adw_flap_get_fold_duration; ///
private alias c_adw_flap_get_fold_policyFn = extern(C) AdwFlapFoldPolicy function(AdwFlap* self) nothrow;
__gshared c_adw_flap_get_fold_policyFn c_adw_flap_get_fold_policy; ///
private alias c_adw_flap_get_fold_threshold_policyFn = extern(C) AdwFoldThresholdPolicy function(AdwFlap* self) nothrow;
__gshared c_adw_flap_get_fold_threshold_policyFn c_adw_flap_get_fold_threshold_policy; ///
private alias c_adw_flap_get_foldedFn = extern(C) gboolean function(AdwFlap* self) nothrow;
__gshared c_adw_flap_get_foldedFn c_adw_flap_get_folded; ///
private alias c_adw_flap_get_lockedFn = extern(C) gboolean function(AdwFlap* self) nothrow;
__gshared c_adw_flap_get_lockedFn c_adw_flap_get_locked; ///
private alias c_adw_flap_get_modalFn = extern(C) gboolean function(AdwFlap* self) nothrow;
__gshared c_adw_flap_get_modalFn c_adw_flap_get_modal; ///
private alias c_adw_flap_get_reveal_flapFn = extern(C) gboolean function(AdwFlap* self) nothrow;
__gshared c_adw_flap_get_reveal_flapFn c_adw_flap_get_reveal_flap; ///
private alias c_adw_flap_get_reveal_paramsFn = extern(C) AdwSpringParams* function(AdwFlap* self) nothrow;
__gshared c_adw_flap_get_reveal_paramsFn c_adw_flap_get_reveal_params; ///
private alias c_adw_flap_get_reveal_progressFn = extern(C) double function(AdwFlap* self) nothrow;
__gshared c_adw_flap_get_reveal_progressFn c_adw_flap_get_reveal_progress; ///
private alias c_adw_flap_get_separatorFn = extern(C) GtkWidget* function(AdwFlap* self) nothrow;
__gshared c_adw_flap_get_separatorFn c_adw_flap_get_separator; ///
private alias c_adw_flap_get_swipe_to_closeFn = extern(C) gboolean function(AdwFlap* self) nothrow;
__gshared c_adw_flap_get_swipe_to_closeFn c_adw_flap_get_swipe_to_close; ///
private alias c_adw_flap_get_swipe_to_openFn = extern(C) gboolean function(AdwFlap* self) nothrow;
__gshared c_adw_flap_get_swipe_to_openFn c_adw_flap_get_swipe_to_open; ///
private alias c_adw_flap_get_transition_typeFn = extern(C) AdwFlapTransitionType function(AdwFlap* self) nothrow;
__gshared c_adw_flap_get_transition_typeFn c_adw_flap_get_transition_type; ///
private alias c_adw_flap_set_contentFn = extern(C) void function(AdwFlap* self, GtkWidget* content) nothrow;
__gshared c_adw_flap_set_contentFn c_adw_flap_set_content; ///
private alias c_adw_flap_set_flapFn = extern(C) void function(AdwFlap* self, GtkWidget* flap) nothrow;
__gshared c_adw_flap_set_flapFn c_adw_flap_set_flap; ///
private alias c_adw_flap_set_flap_positionFn = extern(C) void function(AdwFlap* self, GtkPackType position) nothrow;
__gshared c_adw_flap_set_flap_positionFn c_adw_flap_set_flap_position; ///
private alias c_adw_flap_set_fold_durationFn = extern(C) void function(AdwFlap* self, uint duration) nothrow;
__gshared c_adw_flap_set_fold_durationFn c_adw_flap_set_fold_duration; ///
private alias c_adw_flap_set_fold_policyFn = extern(C) void function(AdwFlap* self, AdwFlapFoldPolicy policy) nothrow;
__gshared c_adw_flap_set_fold_policyFn c_adw_flap_set_fold_policy; ///
private alias c_adw_flap_set_fold_threshold_policyFn = extern(C) void function(AdwFlap* self, AdwFoldThresholdPolicy policy) nothrow;
__gshared c_adw_flap_set_fold_threshold_policyFn c_adw_flap_set_fold_threshold_policy; ///
private alias c_adw_flap_set_lockedFn = extern(C) void function(AdwFlap* self, gboolean locked) nothrow;
__gshared c_adw_flap_set_lockedFn c_adw_flap_set_locked; ///
private alias c_adw_flap_set_modalFn = extern(C) void function(AdwFlap* self, gboolean modal) nothrow;
__gshared c_adw_flap_set_modalFn c_adw_flap_set_modal; ///
private alias c_adw_flap_set_reveal_flapFn = extern(C) void function(AdwFlap* self, gboolean revealFlap) nothrow;
__gshared c_adw_flap_set_reveal_flapFn c_adw_flap_set_reveal_flap; ///
private alias c_adw_flap_set_reveal_paramsFn = extern(C) void function(AdwFlap* self, AdwSpringParams* params) nothrow;
__gshared c_adw_flap_set_reveal_paramsFn c_adw_flap_set_reveal_params; ///
private alias c_adw_flap_set_separatorFn = extern(C) void function(AdwFlap* self, GtkWidget* separator) nothrow;
__gshared c_adw_flap_set_separatorFn c_adw_flap_set_separator; ///
private alias c_adw_flap_set_swipe_to_closeFn = extern(C) void function(AdwFlap* self, gboolean swipeToClose) nothrow;
__gshared c_adw_flap_set_swipe_to_closeFn c_adw_flap_set_swipe_to_close; ///
private alias c_adw_flap_set_swipe_to_openFn = extern(C) void function(AdwFlap* self, gboolean swipeToOpen) nothrow;
__gshared c_adw_flap_set_swipe_to_openFn c_adw_flap_set_swipe_to_open; ///
private alias c_adw_flap_set_transition_typeFn = extern(C) void function(AdwFlap* self, AdwFlapTransitionType transitionType) nothrow;
__gshared c_adw_flap_set_transition_typeFn c_adw_flap_set_transition_type; ///

// HeaderBar
private alias c_adw_header_bar_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_header_bar_get_typeFn c_adw_header_bar_get_type; ///
private alias c_adw_header_bar_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_adw_header_bar_newFn c_adw_header_bar_new; ///
private alias c_adw_header_bar_get_centering_policyFn = extern(C) AdwCenteringPolicy function(AdwHeaderBar* self) nothrow;
__gshared c_adw_header_bar_get_centering_policyFn c_adw_header_bar_get_centering_policy; ///
private alias c_adw_header_bar_get_decoration_layoutFn = extern(C) const(char)* function(AdwHeaderBar* self) nothrow;
__gshared c_adw_header_bar_get_decoration_layoutFn c_adw_header_bar_get_decoration_layout; ///
private alias c_adw_header_bar_get_show_back_buttonFn = extern(C) gboolean function(AdwHeaderBar* self) nothrow;
__gshared c_adw_header_bar_get_show_back_buttonFn c_adw_header_bar_get_show_back_button; ///
private alias c_adw_header_bar_get_show_end_title_buttonsFn = extern(C) gboolean function(AdwHeaderBar* self) nothrow;
__gshared c_adw_header_bar_get_show_end_title_buttonsFn c_adw_header_bar_get_show_end_title_buttons; ///
private alias c_adw_header_bar_get_show_start_title_buttonsFn = extern(C) gboolean function(AdwHeaderBar* self) nothrow;
__gshared c_adw_header_bar_get_show_start_title_buttonsFn c_adw_header_bar_get_show_start_title_buttons; ///
private alias c_adw_header_bar_get_show_titleFn = extern(C) gboolean function(AdwHeaderBar* self) nothrow;
__gshared c_adw_header_bar_get_show_titleFn c_adw_header_bar_get_show_title; ///
private alias c_adw_header_bar_get_title_widgetFn = extern(C) GtkWidget* function(AdwHeaderBar* self) nothrow;
__gshared c_adw_header_bar_get_title_widgetFn c_adw_header_bar_get_title_widget; ///
private alias c_adw_header_bar_pack_endFn = extern(C) void function(AdwHeaderBar* self, GtkWidget* child) nothrow;
__gshared c_adw_header_bar_pack_endFn c_adw_header_bar_pack_end; ///
private alias c_adw_header_bar_pack_startFn = extern(C) void function(AdwHeaderBar* self, GtkWidget* child) nothrow;
__gshared c_adw_header_bar_pack_startFn c_adw_header_bar_pack_start; ///
private alias c_adw_header_bar_removeFn = extern(C) void function(AdwHeaderBar* self, GtkWidget* child) nothrow;
__gshared c_adw_header_bar_removeFn c_adw_header_bar_remove; ///
private alias c_adw_header_bar_set_centering_policyFn = extern(C) void function(AdwHeaderBar* self, AdwCenteringPolicy centeringPolicy) nothrow;
__gshared c_adw_header_bar_set_centering_policyFn c_adw_header_bar_set_centering_policy; ///
private alias c_adw_header_bar_set_decoration_layoutFn = extern(C) void function(AdwHeaderBar* self, const(char)* layout) nothrow;
__gshared c_adw_header_bar_set_decoration_layoutFn c_adw_header_bar_set_decoration_layout; ///
private alias c_adw_header_bar_set_show_back_buttonFn = extern(C) void function(AdwHeaderBar* self, gboolean showBackButton) nothrow;
__gshared c_adw_header_bar_set_show_back_buttonFn c_adw_header_bar_set_show_back_button; ///
private alias c_adw_header_bar_set_show_end_title_buttonsFn = extern(C) void function(AdwHeaderBar* self, gboolean setting) nothrow;
__gshared c_adw_header_bar_set_show_end_title_buttonsFn c_adw_header_bar_set_show_end_title_buttons; ///
private alias c_adw_header_bar_set_show_start_title_buttonsFn = extern(C) void function(AdwHeaderBar* self, gboolean setting) nothrow;
__gshared c_adw_header_bar_set_show_start_title_buttonsFn c_adw_header_bar_set_show_start_title_buttons; ///
private alias c_adw_header_bar_set_show_titleFn = extern(C) void function(AdwHeaderBar* self, gboolean showTitle) nothrow;
__gshared c_adw_header_bar_set_show_titleFn c_adw_header_bar_set_show_title; ///
private alias c_adw_header_bar_set_title_widgetFn = extern(C) void function(AdwHeaderBar* self, GtkWidget* titleWidget) nothrow;
__gshared c_adw_header_bar_set_title_widgetFn c_adw_header_bar_set_title_widget; ///

// InlineViewSwitcher
private alias c_adw_inline_view_switcher_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_inline_view_switcher_get_typeFn c_adw_inline_view_switcher_get_type; ///
private alias c_adw_inline_view_switcher_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_adw_inline_view_switcher_newFn c_adw_inline_view_switcher_new; ///
private alias c_adw_inline_view_switcher_get_can_shrinkFn = extern(C) gboolean function(AdwInlineViewSwitcher* self) nothrow;
__gshared c_adw_inline_view_switcher_get_can_shrinkFn c_adw_inline_view_switcher_get_can_shrink; ///
private alias c_adw_inline_view_switcher_get_display_modeFn = extern(C) AdwInlineViewSwitcherDisplayMode function(AdwInlineViewSwitcher* self) nothrow;
__gshared c_adw_inline_view_switcher_get_display_modeFn c_adw_inline_view_switcher_get_display_mode; ///
private alias c_adw_inline_view_switcher_get_homogeneousFn = extern(C) gboolean function(AdwInlineViewSwitcher* self) nothrow;
__gshared c_adw_inline_view_switcher_get_homogeneousFn c_adw_inline_view_switcher_get_homogeneous; ///
private alias c_adw_inline_view_switcher_get_stackFn = extern(C) AdwViewStack* function(AdwInlineViewSwitcher* self) nothrow;
__gshared c_adw_inline_view_switcher_get_stackFn c_adw_inline_view_switcher_get_stack; ///
private alias c_adw_inline_view_switcher_set_can_shrinkFn = extern(C) void function(AdwInlineViewSwitcher* self, gboolean canShrink) nothrow;
__gshared c_adw_inline_view_switcher_set_can_shrinkFn c_adw_inline_view_switcher_set_can_shrink; ///
private alias c_adw_inline_view_switcher_set_display_modeFn = extern(C) void function(AdwInlineViewSwitcher* self, AdwInlineViewSwitcherDisplayMode mode) nothrow;
__gshared c_adw_inline_view_switcher_set_display_modeFn c_adw_inline_view_switcher_set_display_mode; ///
private alias c_adw_inline_view_switcher_set_homogeneousFn = extern(C) void function(AdwInlineViewSwitcher* self, gboolean homogeneous) nothrow;
__gshared c_adw_inline_view_switcher_set_homogeneousFn c_adw_inline_view_switcher_set_homogeneous; ///
private alias c_adw_inline_view_switcher_set_stackFn = extern(C) void function(AdwInlineViewSwitcher* self, AdwViewStack* stack) nothrow;
__gshared c_adw_inline_view_switcher_set_stackFn c_adw_inline_view_switcher_set_stack; ///

// Layout
private alias c_adw_layout_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_layout_get_typeFn c_adw_layout_get_type; ///
private alias c_adw_layout_newFn = extern(C) AdwLayout* function(GtkWidget* content) nothrow;
__gshared c_adw_layout_newFn c_adw_layout_new; ///
private alias c_adw_layout_get_contentFn = extern(C) GtkWidget* function(AdwLayout* self) nothrow;
__gshared c_adw_layout_get_contentFn c_adw_layout_get_content; ///
private alias c_adw_layout_get_nameFn = extern(C) const(char)* function(AdwLayout* self) nothrow;
__gshared c_adw_layout_get_nameFn c_adw_layout_get_name; ///
private alias c_adw_layout_set_nameFn = extern(C) void function(AdwLayout* self, const(char)* name) nothrow;
__gshared c_adw_layout_set_nameFn c_adw_layout_set_name; ///

// LayoutSlot
private alias c_adw_layout_slot_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_layout_slot_get_typeFn c_adw_layout_slot_get_type; ///
private alias c_adw_layout_slot_newFn = extern(C) GtkWidget* function(const(char)* id) nothrow;
__gshared c_adw_layout_slot_newFn c_adw_layout_slot_new; ///
private alias c_adw_layout_slot_get_slot_idFn = extern(C) const(char)* function(AdwLayoutSlot* self) nothrow;
__gshared c_adw_layout_slot_get_slot_idFn c_adw_layout_slot_get_slot_id; ///

// Leaflet
private alias c_adw_leaflet_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_leaflet_get_typeFn c_adw_leaflet_get_type; ///
private alias c_adw_leaflet_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_adw_leaflet_newFn c_adw_leaflet_new; ///
private alias c_adw_leaflet_appendFn = extern(C) AdwLeafletPage* function(AdwLeaflet* self, GtkWidget* child) nothrow;
__gshared c_adw_leaflet_appendFn c_adw_leaflet_append; ///
private alias c_adw_leaflet_get_adjacent_childFn = extern(C) GtkWidget* function(AdwLeaflet* self, AdwNavigationDirection direction) nothrow;
__gshared c_adw_leaflet_get_adjacent_childFn c_adw_leaflet_get_adjacent_child; ///
private alias c_adw_leaflet_get_can_navigate_backFn = extern(C) gboolean function(AdwLeaflet* self) nothrow;
__gshared c_adw_leaflet_get_can_navigate_backFn c_adw_leaflet_get_can_navigate_back; ///
private alias c_adw_leaflet_get_can_navigate_forwardFn = extern(C) gboolean function(AdwLeaflet* self) nothrow;
__gshared c_adw_leaflet_get_can_navigate_forwardFn c_adw_leaflet_get_can_navigate_forward; ///
private alias c_adw_leaflet_get_can_unfoldFn = extern(C) gboolean function(AdwLeaflet* self) nothrow;
__gshared c_adw_leaflet_get_can_unfoldFn c_adw_leaflet_get_can_unfold; ///
private alias c_adw_leaflet_get_child_by_nameFn = extern(C) GtkWidget* function(AdwLeaflet* self, const(char)* name) nothrow;
__gshared c_adw_leaflet_get_child_by_nameFn c_adw_leaflet_get_child_by_name; ///
private alias c_adw_leaflet_get_child_transition_paramsFn = extern(C) AdwSpringParams* function(AdwLeaflet* self) nothrow;
__gshared c_adw_leaflet_get_child_transition_paramsFn c_adw_leaflet_get_child_transition_params; ///
private alias c_adw_leaflet_get_child_transition_runningFn = extern(C) gboolean function(AdwLeaflet* self) nothrow;
__gshared c_adw_leaflet_get_child_transition_runningFn c_adw_leaflet_get_child_transition_running; ///
private alias c_adw_leaflet_get_fold_threshold_policyFn = extern(C) AdwFoldThresholdPolicy function(AdwLeaflet* self) nothrow;
__gshared c_adw_leaflet_get_fold_threshold_policyFn c_adw_leaflet_get_fold_threshold_policy; ///
private alias c_adw_leaflet_get_foldedFn = extern(C) gboolean function(AdwLeaflet* self) nothrow;
__gshared c_adw_leaflet_get_foldedFn c_adw_leaflet_get_folded; ///
private alias c_adw_leaflet_get_homogeneousFn = extern(C) gboolean function(AdwLeaflet* self) nothrow;
__gshared c_adw_leaflet_get_homogeneousFn c_adw_leaflet_get_homogeneous; ///
private alias c_adw_leaflet_get_mode_transition_durationFn = extern(C) uint function(AdwLeaflet* self) nothrow;
__gshared c_adw_leaflet_get_mode_transition_durationFn c_adw_leaflet_get_mode_transition_duration; ///
private alias c_adw_leaflet_get_pageFn = extern(C) AdwLeafletPage* function(AdwLeaflet* self, GtkWidget* child) nothrow;
__gshared c_adw_leaflet_get_pageFn c_adw_leaflet_get_page; ///
private alias c_adw_leaflet_get_pagesFn = extern(C) GtkSelectionModel* function(AdwLeaflet* self) nothrow;
__gshared c_adw_leaflet_get_pagesFn c_adw_leaflet_get_pages; ///
private alias c_adw_leaflet_get_transition_typeFn = extern(C) AdwLeafletTransitionType function(AdwLeaflet* self) nothrow;
__gshared c_adw_leaflet_get_transition_typeFn c_adw_leaflet_get_transition_type; ///
private alias c_adw_leaflet_get_visible_childFn = extern(C) GtkWidget* function(AdwLeaflet* self) nothrow;
__gshared c_adw_leaflet_get_visible_childFn c_adw_leaflet_get_visible_child; ///
private alias c_adw_leaflet_get_visible_child_nameFn = extern(C) const(char)* function(AdwLeaflet* self) nothrow;
__gshared c_adw_leaflet_get_visible_child_nameFn c_adw_leaflet_get_visible_child_name; ///
private alias c_adw_leaflet_insert_child_afterFn = extern(C) AdwLeafletPage* function(AdwLeaflet* self, GtkWidget* child, GtkWidget* sibling) nothrow;
__gshared c_adw_leaflet_insert_child_afterFn c_adw_leaflet_insert_child_after; ///
private alias c_adw_leaflet_navigateFn = extern(C) gboolean function(AdwLeaflet* self, AdwNavigationDirection direction) nothrow;
__gshared c_adw_leaflet_navigateFn c_adw_leaflet_navigate; ///
private alias c_adw_leaflet_prependFn = extern(C) AdwLeafletPage* function(AdwLeaflet* self, GtkWidget* child) nothrow;
__gshared c_adw_leaflet_prependFn c_adw_leaflet_prepend; ///
private alias c_adw_leaflet_removeFn = extern(C) void function(AdwLeaflet* self, GtkWidget* child) nothrow;
__gshared c_adw_leaflet_removeFn c_adw_leaflet_remove; ///
private alias c_adw_leaflet_reorder_child_afterFn = extern(C) void function(AdwLeaflet* self, GtkWidget* child, GtkWidget* sibling) nothrow;
__gshared c_adw_leaflet_reorder_child_afterFn c_adw_leaflet_reorder_child_after; ///
private alias c_adw_leaflet_set_can_navigate_backFn = extern(C) void function(AdwLeaflet* self, gboolean canNavigateBack) nothrow;
__gshared c_adw_leaflet_set_can_navigate_backFn c_adw_leaflet_set_can_navigate_back; ///
private alias c_adw_leaflet_set_can_navigate_forwardFn = extern(C) void function(AdwLeaflet* self, gboolean canNavigateForward) nothrow;
__gshared c_adw_leaflet_set_can_navigate_forwardFn c_adw_leaflet_set_can_navigate_forward; ///
private alias c_adw_leaflet_set_can_unfoldFn = extern(C) void function(AdwLeaflet* self, gboolean canUnfold) nothrow;
__gshared c_adw_leaflet_set_can_unfoldFn c_adw_leaflet_set_can_unfold; ///
private alias c_adw_leaflet_set_child_transition_paramsFn = extern(C) void function(AdwLeaflet* self, AdwSpringParams* params) nothrow;
__gshared c_adw_leaflet_set_child_transition_paramsFn c_adw_leaflet_set_child_transition_params; ///
private alias c_adw_leaflet_set_fold_threshold_policyFn = extern(C) void function(AdwLeaflet* self, AdwFoldThresholdPolicy policy) nothrow;
__gshared c_adw_leaflet_set_fold_threshold_policyFn c_adw_leaflet_set_fold_threshold_policy; ///
private alias c_adw_leaflet_set_homogeneousFn = extern(C) void function(AdwLeaflet* self, gboolean homogeneous) nothrow;
__gshared c_adw_leaflet_set_homogeneousFn c_adw_leaflet_set_homogeneous; ///
private alias c_adw_leaflet_set_mode_transition_durationFn = extern(C) void function(AdwLeaflet* self, uint duration) nothrow;
__gshared c_adw_leaflet_set_mode_transition_durationFn c_adw_leaflet_set_mode_transition_duration; ///
private alias c_adw_leaflet_set_transition_typeFn = extern(C) void function(AdwLeaflet* self, AdwLeafletTransitionType transition) nothrow;
__gshared c_adw_leaflet_set_transition_typeFn c_adw_leaflet_set_transition_type; ///
private alias c_adw_leaflet_set_visible_childFn = extern(C) void function(AdwLeaflet* self, GtkWidget* visibleChild) nothrow;
__gshared c_adw_leaflet_set_visible_childFn c_adw_leaflet_set_visible_child; ///
private alias c_adw_leaflet_set_visible_child_nameFn = extern(C) void function(AdwLeaflet* self, const(char)* name) nothrow;
__gshared c_adw_leaflet_set_visible_child_nameFn c_adw_leaflet_set_visible_child_name; ///

// LeafletPage
private alias c_adw_leaflet_page_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_leaflet_page_get_typeFn c_adw_leaflet_page_get_type; ///
private alias c_adw_leaflet_page_get_childFn = extern(C) GtkWidget* function(AdwLeafletPage* self) nothrow;
__gshared c_adw_leaflet_page_get_childFn c_adw_leaflet_page_get_child; ///
private alias c_adw_leaflet_page_get_nameFn = extern(C) const(char)* function(AdwLeafletPage* self) nothrow;
__gshared c_adw_leaflet_page_get_nameFn c_adw_leaflet_page_get_name; ///
private alias c_adw_leaflet_page_get_navigatableFn = extern(C) gboolean function(AdwLeafletPage* self) nothrow;
__gshared c_adw_leaflet_page_get_navigatableFn c_adw_leaflet_page_get_navigatable; ///
private alias c_adw_leaflet_page_set_nameFn = extern(C) void function(AdwLeafletPage* self, const(char)* name) nothrow;
__gshared c_adw_leaflet_page_set_nameFn c_adw_leaflet_page_set_name; ///
private alias c_adw_leaflet_page_set_navigatableFn = extern(C) void function(AdwLeafletPage* self, gboolean navigatable) nothrow;
__gshared c_adw_leaflet_page_set_navigatableFn c_adw_leaflet_page_set_navigatable; ///

// MessageDialog
private alias c_adw_message_dialog_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_message_dialog_get_typeFn c_adw_message_dialog_get_type; ///
private alias c_adw_message_dialog_newFn = extern(C) GtkWidget* function(GtkWindow* parent, const(char)* heading, const(char)* body_) nothrow;
__gshared c_adw_message_dialog_newFn c_adw_message_dialog_new; ///
private alias c_adw_message_dialog_add_responseFn = extern(C) void function(AdwMessageDialog* self, const(char)* id, const(char)* label) nothrow;
__gshared c_adw_message_dialog_add_responseFn c_adw_message_dialog_add_response; ///
private alias c_adw_message_dialog_add_responsesFn = extern(C) void function(AdwMessageDialog* self, const(char)* firstId,  ...) nothrow;
__gshared c_adw_message_dialog_add_responsesFn c_adw_message_dialog_add_responses; ///
private alias c_adw_message_dialog_chooseFn = extern(C) void function(AdwMessageDialog* self, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_adw_message_dialog_chooseFn c_adw_message_dialog_choose; ///
private alias c_adw_message_dialog_choose_finishFn = extern(C) const(char)* function(AdwMessageDialog* self, GAsyncResult* result) nothrow;
__gshared c_adw_message_dialog_choose_finishFn c_adw_message_dialog_choose_finish; ///
private alias c_adw_message_dialog_format_bodyFn = extern(C) void function(AdwMessageDialog* self, const(char)* format,  ...) nothrow;
__gshared c_adw_message_dialog_format_bodyFn c_adw_message_dialog_format_body; ///
private alias c_adw_message_dialog_format_body_markupFn = extern(C) void function(AdwMessageDialog* self, const(char)* format,  ...) nothrow;
__gshared c_adw_message_dialog_format_body_markupFn c_adw_message_dialog_format_body_markup; ///
private alias c_adw_message_dialog_format_headingFn = extern(C) void function(AdwMessageDialog* self, const(char)* format,  ...) nothrow;
__gshared c_adw_message_dialog_format_headingFn c_adw_message_dialog_format_heading; ///
private alias c_adw_message_dialog_format_heading_markupFn = extern(C) void function(AdwMessageDialog* self, const(char)* format,  ...) nothrow;
__gshared c_adw_message_dialog_format_heading_markupFn c_adw_message_dialog_format_heading_markup; ///
private alias c_adw_message_dialog_get_bodyFn = extern(C) const(char)* function(AdwMessageDialog* self) nothrow;
__gshared c_adw_message_dialog_get_bodyFn c_adw_message_dialog_get_body; ///
private alias c_adw_message_dialog_get_body_use_markupFn = extern(C) gboolean function(AdwMessageDialog* self) nothrow;
__gshared c_adw_message_dialog_get_body_use_markupFn c_adw_message_dialog_get_body_use_markup; ///
private alias c_adw_message_dialog_get_close_responseFn = extern(C) const(char)* function(AdwMessageDialog* self) nothrow;
__gshared c_adw_message_dialog_get_close_responseFn c_adw_message_dialog_get_close_response; ///
private alias c_adw_message_dialog_get_default_responseFn = extern(C) const(char)* function(AdwMessageDialog* self) nothrow;
__gshared c_adw_message_dialog_get_default_responseFn c_adw_message_dialog_get_default_response; ///
private alias c_adw_message_dialog_get_extra_childFn = extern(C) GtkWidget* function(AdwMessageDialog* self) nothrow;
__gshared c_adw_message_dialog_get_extra_childFn c_adw_message_dialog_get_extra_child; ///
private alias c_adw_message_dialog_get_headingFn = extern(C) const(char)* function(AdwMessageDialog* self) nothrow;
__gshared c_adw_message_dialog_get_headingFn c_adw_message_dialog_get_heading; ///
private alias c_adw_message_dialog_get_heading_use_markupFn = extern(C) gboolean function(AdwMessageDialog* self) nothrow;
__gshared c_adw_message_dialog_get_heading_use_markupFn c_adw_message_dialog_get_heading_use_markup; ///
private alias c_adw_message_dialog_get_response_appearanceFn = extern(C) AdwResponseAppearance function(AdwMessageDialog* self, const(char)* response) nothrow;
__gshared c_adw_message_dialog_get_response_appearanceFn c_adw_message_dialog_get_response_appearance; ///
private alias c_adw_message_dialog_get_response_enabledFn = extern(C) gboolean function(AdwMessageDialog* self, const(char)* response) nothrow;
__gshared c_adw_message_dialog_get_response_enabledFn c_adw_message_dialog_get_response_enabled; ///
private alias c_adw_message_dialog_get_response_labelFn = extern(C) const(char)* function(AdwMessageDialog* self, const(char)* response) nothrow;
__gshared c_adw_message_dialog_get_response_labelFn c_adw_message_dialog_get_response_label; ///
private alias c_adw_message_dialog_has_responseFn = extern(C) gboolean function(AdwMessageDialog* self, const(char)* response) nothrow;
__gshared c_adw_message_dialog_has_responseFn c_adw_message_dialog_has_response; ///
private alias c_adw_message_dialog_remove_responseFn = extern(C) void function(AdwMessageDialog* self, const(char)* id) nothrow;
__gshared c_adw_message_dialog_remove_responseFn c_adw_message_dialog_remove_response; ///
private alias c_adw_message_dialog_responseFn = extern(C) void function(AdwMessageDialog* self, const(char)* response) nothrow;
__gshared c_adw_message_dialog_responseFn c_adw_message_dialog_response; ///
private alias c_adw_message_dialog_set_bodyFn = extern(C) void function(AdwMessageDialog* self, const(char)* body_) nothrow;
__gshared c_adw_message_dialog_set_bodyFn c_adw_message_dialog_set_body; ///
private alias c_adw_message_dialog_set_body_use_markupFn = extern(C) void function(AdwMessageDialog* self, gboolean useMarkup) nothrow;
__gshared c_adw_message_dialog_set_body_use_markupFn c_adw_message_dialog_set_body_use_markup; ///
private alias c_adw_message_dialog_set_close_responseFn = extern(C) void function(AdwMessageDialog* self, const(char)* response) nothrow;
__gshared c_adw_message_dialog_set_close_responseFn c_adw_message_dialog_set_close_response; ///
private alias c_adw_message_dialog_set_default_responseFn = extern(C) void function(AdwMessageDialog* self, const(char)* response) nothrow;
__gshared c_adw_message_dialog_set_default_responseFn c_adw_message_dialog_set_default_response; ///
private alias c_adw_message_dialog_set_extra_childFn = extern(C) void function(AdwMessageDialog* self, GtkWidget* child) nothrow;
__gshared c_adw_message_dialog_set_extra_childFn c_adw_message_dialog_set_extra_child; ///
private alias c_adw_message_dialog_set_headingFn = extern(C) void function(AdwMessageDialog* self, const(char)* heading) nothrow;
__gshared c_adw_message_dialog_set_headingFn c_adw_message_dialog_set_heading; ///
private alias c_adw_message_dialog_set_heading_use_markupFn = extern(C) void function(AdwMessageDialog* self, gboolean useMarkup) nothrow;
__gshared c_adw_message_dialog_set_heading_use_markupFn c_adw_message_dialog_set_heading_use_markup; ///
private alias c_adw_message_dialog_set_response_appearanceFn = extern(C) void function(AdwMessageDialog* self, const(char)* response, AdwResponseAppearance appearance) nothrow;
__gshared c_adw_message_dialog_set_response_appearanceFn c_adw_message_dialog_set_response_appearance; ///
private alias c_adw_message_dialog_set_response_enabledFn = extern(C) void function(AdwMessageDialog* self, const(char)* response, gboolean enabled) nothrow;
__gshared c_adw_message_dialog_set_response_enabledFn c_adw_message_dialog_set_response_enabled; ///
private alias c_adw_message_dialog_set_response_labelFn = extern(C) void function(AdwMessageDialog* self, const(char)* response, const(char)* label) nothrow;
__gshared c_adw_message_dialog_set_response_labelFn c_adw_message_dialog_set_response_label; ///

// MultiLayoutView
private alias c_adw_multi_layout_view_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_multi_layout_view_get_typeFn c_adw_multi_layout_view_get_type; ///
private alias c_adw_multi_layout_view_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_adw_multi_layout_view_newFn c_adw_multi_layout_view_new; ///
private alias c_adw_multi_layout_view_add_layoutFn = extern(C) void function(AdwMultiLayoutView* self, AdwLayout* layout) nothrow;
__gshared c_adw_multi_layout_view_add_layoutFn c_adw_multi_layout_view_add_layout; ///
private alias c_adw_multi_layout_view_get_childFn = extern(C) GtkWidget* function(AdwMultiLayoutView* self, const(char)* id) nothrow;
__gshared c_adw_multi_layout_view_get_childFn c_adw_multi_layout_view_get_child; ///
private alias c_adw_multi_layout_view_get_layoutFn = extern(C) AdwLayout* function(AdwMultiLayoutView* self) nothrow;
__gshared c_adw_multi_layout_view_get_layoutFn c_adw_multi_layout_view_get_layout; ///
private alias c_adw_multi_layout_view_get_layout_by_nameFn = extern(C) AdwLayout* function(AdwMultiLayoutView* self, const(char)* name) nothrow;
__gshared c_adw_multi_layout_view_get_layout_by_nameFn c_adw_multi_layout_view_get_layout_by_name; ///
private alias c_adw_multi_layout_view_get_layout_nameFn = extern(C) const(char)* function(AdwMultiLayoutView* self) nothrow;
__gshared c_adw_multi_layout_view_get_layout_nameFn c_adw_multi_layout_view_get_layout_name; ///
private alias c_adw_multi_layout_view_remove_layoutFn = extern(C) void function(AdwMultiLayoutView* self, AdwLayout* layout) nothrow;
__gshared c_adw_multi_layout_view_remove_layoutFn c_adw_multi_layout_view_remove_layout; ///
private alias c_adw_multi_layout_view_set_childFn = extern(C) void function(AdwMultiLayoutView* self, const(char)* id, GtkWidget* child) nothrow;
__gshared c_adw_multi_layout_view_set_childFn c_adw_multi_layout_view_set_child; ///
private alias c_adw_multi_layout_view_set_layoutFn = extern(C) void function(AdwMultiLayoutView* self, AdwLayout* layout) nothrow;
__gshared c_adw_multi_layout_view_set_layoutFn c_adw_multi_layout_view_set_layout; ///
private alias c_adw_multi_layout_view_set_layout_nameFn = extern(C) void function(AdwMultiLayoutView* self, const(char)* name) nothrow;
__gshared c_adw_multi_layout_view_set_layout_nameFn c_adw_multi_layout_view_set_layout_name; ///

// NavigationPage
private alias c_adw_navigation_page_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_navigation_page_get_typeFn c_adw_navigation_page_get_type; ///
private alias c_adw_navigation_page_newFn = extern(C) AdwNavigationPage* function(GtkWidget* child, const(char)* title) nothrow;
__gshared c_adw_navigation_page_newFn c_adw_navigation_page_new; ///
private alias c_adw_navigation_page_new_with_tagFn = extern(C) AdwNavigationPage* function(GtkWidget* child, const(char)* title, const(char)* tag) nothrow;
__gshared c_adw_navigation_page_new_with_tagFn c_adw_navigation_page_new_with_tag; ///
private alias c_adw_navigation_page_get_can_popFn = extern(C) gboolean function(AdwNavigationPage* self) nothrow;
__gshared c_adw_navigation_page_get_can_popFn c_adw_navigation_page_get_can_pop; ///
private alias c_adw_navigation_page_get_childFn = extern(C) GtkWidget* function(AdwNavigationPage* self) nothrow;
__gshared c_adw_navigation_page_get_childFn c_adw_navigation_page_get_child; ///
private alias c_adw_navigation_page_get_tagFn = extern(C) const(char)* function(AdwNavigationPage* self) nothrow;
__gshared c_adw_navigation_page_get_tagFn c_adw_navigation_page_get_tag; ///
private alias c_adw_navigation_page_get_titleFn = extern(C) const(char)* function(AdwNavigationPage* self) nothrow;
__gshared c_adw_navigation_page_get_titleFn c_adw_navigation_page_get_title; ///
private alias c_adw_navigation_page_set_can_popFn = extern(C) void function(AdwNavigationPage* self, gboolean canPop) nothrow;
__gshared c_adw_navigation_page_set_can_popFn c_adw_navigation_page_set_can_pop; ///
private alias c_adw_navigation_page_set_childFn = extern(C) void function(AdwNavigationPage* self, GtkWidget* child) nothrow;
__gshared c_adw_navigation_page_set_childFn c_adw_navigation_page_set_child; ///
private alias c_adw_navigation_page_set_tagFn = extern(C) void function(AdwNavigationPage* self, const(char)* tag) nothrow;
__gshared c_adw_navigation_page_set_tagFn c_adw_navigation_page_set_tag; ///
private alias c_adw_navigation_page_set_titleFn = extern(C) void function(AdwNavigationPage* self, const(char)* title) nothrow;
__gshared c_adw_navigation_page_set_titleFn c_adw_navigation_page_set_title; ///

// NavigationSplitView
private alias c_adw_navigation_split_view_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_navigation_split_view_get_typeFn c_adw_navigation_split_view_get_type; ///
private alias c_adw_navigation_split_view_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_adw_navigation_split_view_newFn c_adw_navigation_split_view_new; ///
private alias c_adw_navigation_split_view_get_collapsedFn = extern(C) gboolean function(AdwNavigationSplitView* self) nothrow;
__gshared c_adw_navigation_split_view_get_collapsedFn c_adw_navigation_split_view_get_collapsed; ///
private alias c_adw_navigation_split_view_get_contentFn = extern(C) AdwNavigationPage* function(AdwNavigationSplitView* self) nothrow;
__gshared c_adw_navigation_split_view_get_contentFn c_adw_navigation_split_view_get_content; ///
private alias c_adw_navigation_split_view_get_max_sidebar_widthFn = extern(C) double function(AdwNavigationSplitView* self) nothrow;
__gshared c_adw_navigation_split_view_get_max_sidebar_widthFn c_adw_navigation_split_view_get_max_sidebar_width; ///
private alias c_adw_navigation_split_view_get_min_sidebar_widthFn = extern(C) double function(AdwNavigationSplitView* self) nothrow;
__gshared c_adw_navigation_split_view_get_min_sidebar_widthFn c_adw_navigation_split_view_get_min_sidebar_width; ///
private alias c_adw_navigation_split_view_get_show_contentFn = extern(C) gboolean function(AdwNavigationSplitView* self) nothrow;
__gshared c_adw_navigation_split_view_get_show_contentFn c_adw_navigation_split_view_get_show_content; ///
private alias c_adw_navigation_split_view_get_sidebarFn = extern(C) AdwNavigationPage* function(AdwNavigationSplitView* self) nothrow;
__gshared c_adw_navigation_split_view_get_sidebarFn c_adw_navigation_split_view_get_sidebar; ///
private alias c_adw_navigation_split_view_get_sidebar_positionFn = extern(C) GtkPackType function(AdwNavigationSplitView* self) nothrow;
__gshared c_adw_navigation_split_view_get_sidebar_positionFn c_adw_navigation_split_view_get_sidebar_position; ///
private alias c_adw_navigation_split_view_get_sidebar_width_fractionFn = extern(C) double function(AdwNavigationSplitView* self) nothrow;
__gshared c_adw_navigation_split_view_get_sidebar_width_fractionFn c_adw_navigation_split_view_get_sidebar_width_fraction; ///
private alias c_adw_navigation_split_view_get_sidebar_width_unitFn = extern(C) AdwLengthUnit function(AdwNavigationSplitView* self) nothrow;
__gshared c_adw_navigation_split_view_get_sidebar_width_unitFn c_adw_navigation_split_view_get_sidebar_width_unit; ///
private alias c_adw_navigation_split_view_set_collapsedFn = extern(C) void function(AdwNavigationSplitView* self, gboolean collapsed) nothrow;
__gshared c_adw_navigation_split_view_set_collapsedFn c_adw_navigation_split_view_set_collapsed; ///
private alias c_adw_navigation_split_view_set_contentFn = extern(C) void function(AdwNavigationSplitView* self, AdwNavigationPage* content) nothrow;
__gshared c_adw_navigation_split_view_set_contentFn c_adw_navigation_split_view_set_content; ///
private alias c_adw_navigation_split_view_set_max_sidebar_widthFn = extern(C) void function(AdwNavigationSplitView* self, double width) nothrow;
__gshared c_adw_navigation_split_view_set_max_sidebar_widthFn c_adw_navigation_split_view_set_max_sidebar_width; ///
private alias c_adw_navigation_split_view_set_min_sidebar_widthFn = extern(C) void function(AdwNavigationSplitView* self, double width) nothrow;
__gshared c_adw_navigation_split_view_set_min_sidebar_widthFn c_adw_navigation_split_view_set_min_sidebar_width; ///
private alias c_adw_navigation_split_view_set_show_contentFn = extern(C) void function(AdwNavigationSplitView* self, gboolean showContent) nothrow;
__gshared c_adw_navigation_split_view_set_show_contentFn c_adw_navigation_split_view_set_show_content; ///
private alias c_adw_navigation_split_view_set_sidebarFn = extern(C) void function(AdwNavigationSplitView* self, AdwNavigationPage* sidebar) nothrow;
__gshared c_adw_navigation_split_view_set_sidebarFn c_adw_navigation_split_view_set_sidebar; ///
private alias c_adw_navigation_split_view_set_sidebar_positionFn = extern(C) void function(AdwNavigationSplitView* self, GtkPackType position) nothrow;
__gshared c_adw_navigation_split_view_set_sidebar_positionFn c_adw_navigation_split_view_set_sidebar_position; ///
private alias c_adw_navigation_split_view_set_sidebar_width_fractionFn = extern(C) void function(AdwNavigationSplitView* self, double fraction) nothrow;
__gshared c_adw_navigation_split_view_set_sidebar_width_fractionFn c_adw_navigation_split_view_set_sidebar_width_fraction; ///
private alias c_adw_navigation_split_view_set_sidebar_width_unitFn = extern(C) void function(AdwNavigationSplitView* self, AdwLengthUnit unit) nothrow;
__gshared c_adw_navigation_split_view_set_sidebar_width_unitFn c_adw_navigation_split_view_set_sidebar_width_unit; ///

// NavigationView
private alias c_adw_navigation_view_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_navigation_view_get_typeFn c_adw_navigation_view_get_type; ///
private alias c_adw_navigation_view_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_adw_navigation_view_newFn c_adw_navigation_view_new; ///
private alias c_adw_navigation_view_addFn = extern(C) void function(AdwNavigationView* self, AdwNavigationPage* page) nothrow;
__gshared c_adw_navigation_view_addFn c_adw_navigation_view_add; ///
private alias c_adw_navigation_view_find_pageFn = extern(C) AdwNavigationPage* function(AdwNavigationView* self, const(char)* tag) nothrow;
__gshared c_adw_navigation_view_find_pageFn c_adw_navigation_view_find_page; ///
private alias c_adw_navigation_view_get_animate_transitionsFn = extern(C) gboolean function(AdwNavigationView* self) nothrow;
__gshared c_adw_navigation_view_get_animate_transitionsFn c_adw_navigation_view_get_animate_transitions; ///
private alias c_adw_navigation_view_get_hhomogeneousFn = extern(C) gboolean function(AdwNavigationView* self) nothrow;
__gshared c_adw_navigation_view_get_hhomogeneousFn c_adw_navigation_view_get_hhomogeneous; ///
private alias c_adw_navigation_view_get_navigation_stackFn = extern(C) GListModel* function(AdwNavigationView* self) nothrow;
__gshared c_adw_navigation_view_get_navigation_stackFn c_adw_navigation_view_get_navigation_stack; ///
private alias c_adw_navigation_view_get_pop_on_escapeFn = extern(C) gboolean function(AdwNavigationView* self) nothrow;
__gshared c_adw_navigation_view_get_pop_on_escapeFn c_adw_navigation_view_get_pop_on_escape; ///
private alias c_adw_navigation_view_get_previous_pageFn = extern(C) AdwNavigationPage* function(AdwNavigationView* self, AdwNavigationPage* page) nothrow;
__gshared c_adw_navigation_view_get_previous_pageFn c_adw_navigation_view_get_previous_page; ///
private alias c_adw_navigation_view_get_vhomogeneousFn = extern(C) gboolean function(AdwNavigationView* self) nothrow;
__gshared c_adw_navigation_view_get_vhomogeneousFn c_adw_navigation_view_get_vhomogeneous; ///
private alias c_adw_navigation_view_get_visible_pageFn = extern(C) AdwNavigationPage* function(AdwNavigationView* self) nothrow;
__gshared c_adw_navigation_view_get_visible_pageFn c_adw_navigation_view_get_visible_page; ///
private alias c_adw_navigation_view_get_visible_page_tagFn = extern(C) const(char)* function(AdwNavigationView* self) nothrow;
__gshared c_adw_navigation_view_get_visible_page_tagFn c_adw_navigation_view_get_visible_page_tag; ///
private alias c_adw_navigation_view_popFn = extern(C) gboolean function(AdwNavigationView* self) nothrow;
__gshared c_adw_navigation_view_popFn c_adw_navigation_view_pop; ///
private alias c_adw_navigation_view_pop_to_pageFn = extern(C) gboolean function(AdwNavigationView* self, AdwNavigationPage* page) nothrow;
__gshared c_adw_navigation_view_pop_to_pageFn c_adw_navigation_view_pop_to_page; ///
private alias c_adw_navigation_view_pop_to_tagFn = extern(C) gboolean function(AdwNavigationView* self, const(char)* tag) nothrow;
__gshared c_adw_navigation_view_pop_to_tagFn c_adw_navigation_view_pop_to_tag; ///
private alias c_adw_navigation_view_pushFn = extern(C) void function(AdwNavigationView* self, AdwNavigationPage* page) nothrow;
__gshared c_adw_navigation_view_pushFn c_adw_navigation_view_push; ///
private alias c_adw_navigation_view_push_by_tagFn = extern(C) void function(AdwNavigationView* self, const(char)* tag) nothrow;
__gshared c_adw_navigation_view_push_by_tagFn c_adw_navigation_view_push_by_tag; ///
private alias c_adw_navigation_view_removeFn = extern(C) void function(AdwNavigationView* self, AdwNavigationPage* page) nothrow;
__gshared c_adw_navigation_view_removeFn c_adw_navigation_view_remove; ///
private alias c_adw_navigation_view_replaceFn = extern(C) void function(AdwNavigationView* self, AdwNavigationPage** pages, int nPages) nothrow;
__gshared c_adw_navigation_view_replaceFn c_adw_navigation_view_replace; ///
private alias c_adw_navigation_view_replace_with_tagsFn = extern(C) void function(AdwNavigationView* self, const(char*)* tags, int nTags) nothrow;
__gshared c_adw_navigation_view_replace_with_tagsFn c_adw_navigation_view_replace_with_tags; ///
private alias c_adw_navigation_view_set_animate_transitionsFn = extern(C) void function(AdwNavigationView* self, gboolean animateTransitions) nothrow;
__gshared c_adw_navigation_view_set_animate_transitionsFn c_adw_navigation_view_set_animate_transitions; ///
private alias c_adw_navigation_view_set_hhomogeneousFn = extern(C) void function(AdwNavigationView* self, gboolean hhomogeneous) nothrow;
__gshared c_adw_navigation_view_set_hhomogeneousFn c_adw_navigation_view_set_hhomogeneous; ///
private alias c_adw_navigation_view_set_pop_on_escapeFn = extern(C) void function(AdwNavigationView* self, gboolean popOnEscape) nothrow;
__gshared c_adw_navigation_view_set_pop_on_escapeFn c_adw_navigation_view_set_pop_on_escape; ///
private alias c_adw_navigation_view_set_vhomogeneousFn = extern(C) void function(AdwNavigationView* self, gboolean vhomogeneous) nothrow;
__gshared c_adw_navigation_view_set_vhomogeneousFn c_adw_navigation_view_set_vhomogeneous; ///

// NoneAnimationTarget
private alias c_adw_none_animation_target_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_none_animation_target_get_typeFn c_adw_none_animation_target_get_type; ///
private alias c_adw_none_animation_target_newFn = extern(C) AdwAnimationTarget* function() nothrow;
__gshared c_adw_none_animation_target_newFn c_adw_none_animation_target_new; ///

// OverlaySplitView
private alias c_adw_overlay_split_view_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_overlay_split_view_get_typeFn c_adw_overlay_split_view_get_type; ///
private alias c_adw_overlay_split_view_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_adw_overlay_split_view_newFn c_adw_overlay_split_view_new; ///
private alias c_adw_overlay_split_view_get_collapsedFn = extern(C) gboolean function(AdwOverlaySplitView* self) nothrow;
__gshared c_adw_overlay_split_view_get_collapsedFn c_adw_overlay_split_view_get_collapsed; ///
private alias c_adw_overlay_split_view_get_contentFn = extern(C) GtkWidget* function(AdwOverlaySplitView* self) nothrow;
__gshared c_adw_overlay_split_view_get_contentFn c_adw_overlay_split_view_get_content; ///
private alias c_adw_overlay_split_view_get_enable_hide_gestureFn = extern(C) gboolean function(AdwOverlaySplitView* self) nothrow;
__gshared c_adw_overlay_split_view_get_enable_hide_gestureFn c_adw_overlay_split_view_get_enable_hide_gesture; ///
private alias c_adw_overlay_split_view_get_enable_show_gestureFn = extern(C) gboolean function(AdwOverlaySplitView* self) nothrow;
__gshared c_adw_overlay_split_view_get_enable_show_gestureFn c_adw_overlay_split_view_get_enable_show_gesture; ///
private alias c_adw_overlay_split_view_get_max_sidebar_widthFn = extern(C) double function(AdwOverlaySplitView* self) nothrow;
__gshared c_adw_overlay_split_view_get_max_sidebar_widthFn c_adw_overlay_split_view_get_max_sidebar_width; ///
private alias c_adw_overlay_split_view_get_min_sidebar_widthFn = extern(C) double function(AdwOverlaySplitView* self) nothrow;
__gshared c_adw_overlay_split_view_get_min_sidebar_widthFn c_adw_overlay_split_view_get_min_sidebar_width; ///
private alias c_adw_overlay_split_view_get_pin_sidebarFn = extern(C) gboolean function(AdwOverlaySplitView* self) nothrow;
__gshared c_adw_overlay_split_view_get_pin_sidebarFn c_adw_overlay_split_view_get_pin_sidebar; ///
private alias c_adw_overlay_split_view_get_show_sidebarFn = extern(C) gboolean function(AdwOverlaySplitView* self) nothrow;
__gshared c_adw_overlay_split_view_get_show_sidebarFn c_adw_overlay_split_view_get_show_sidebar; ///
private alias c_adw_overlay_split_view_get_sidebarFn = extern(C) GtkWidget* function(AdwOverlaySplitView* self) nothrow;
__gshared c_adw_overlay_split_view_get_sidebarFn c_adw_overlay_split_view_get_sidebar; ///
private alias c_adw_overlay_split_view_get_sidebar_positionFn = extern(C) GtkPackType function(AdwOverlaySplitView* self) nothrow;
__gshared c_adw_overlay_split_view_get_sidebar_positionFn c_adw_overlay_split_view_get_sidebar_position; ///
private alias c_adw_overlay_split_view_get_sidebar_width_fractionFn = extern(C) double function(AdwOverlaySplitView* self) nothrow;
__gshared c_adw_overlay_split_view_get_sidebar_width_fractionFn c_adw_overlay_split_view_get_sidebar_width_fraction; ///
private alias c_adw_overlay_split_view_get_sidebar_width_unitFn = extern(C) AdwLengthUnit function(AdwOverlaySplitView* self) nothrow;
__gshared c_adw_overlay_split_view_get_sidebar_width_unitFn c_adw_overlay_split_view_get_sidebar_width_unit; ///
private alias c_adw_overlay_split_view_set_collapsedFn = extern(C) void function(AdwOverlaySplitView* self, gboolean collapsed) nothrow;
__gshared c_adw_overlay_split_view_set_collapsedFn c_adw_overlay_split_view_set_collapsed; ///
private alias c_adw_overlay_split_view_set_contentFn = extern(C) void function(AdwOverlaySplitView* self, GtkWidget* content) nothrow;
__gshared c_adw_overlay_split_view_set_contentFn c_adw_overlay_split_view_set_content; ///
private alias c_adw_overlay_split_view_set_enable_hide_gestureFn = extern(C) void function(AdwOverlaySplitView* self, gboolean enableHideGesture) nothrow;
__gshared c_adw_overlay_split_view_set_enable_hide_gestureFn c_adw_overlay_split_view_set_enable_hide_gesture; ///
private alias c_adw_overlay_split_view_set_enable_show_gestureFn = extern(C) void function(AdwOverlaySplitView* self, gboolean enableShowGesture) nothrow;
__gshared c_adw_overlay_split_view_set_enable_show_gestureFn c_adw_overlay_split_view_set_enable_show_gesture; ///
private alias c_adw_overlay_split_view_set_max_sidebar_widthFn = extern(C) void function(AdwOverlaySplitView* self, double width) nothrow;
__gshared c_adw_overlay_split_view_set_max_sidebar_widthFn c_adw_overlay_split_view_set_max_sidebar_width; ///
private alias c_adw_overlay_split_view_set_min_sidebar_widthFn = extern(C) void function(AdwOverlaySplitView* self, double width) nothrow;
__gshared c_adw_overlay_split_view_set_min_sidebar_widthFn c_adw_overlay_split_view_set_min_sidebar_width; ///
private alias c_adw_overlay_split_view_set_pin_sidebarFn = extern(C) void function(AdwOverlaySplitView* self, gboolean pinSidebar) nothrow;
__gshared c_adw_overlay_split_view_set_pin_sidebarFn c_adw_overlay_split_view_set_pin_sidebar; ///
private alias c_adw_overlay_split_view_set_show_sidebarFn = extern(C) void function(AdwOverlaySplitView* self, gboolean showSidebar) nothrow;
__gshared c_adw_overlay_split_view_set_show_sidebarFn c_adw_overlay_split_view_set_show_sidebar; ///
private alias c_adw_overlay_split_view_set_sidebarFn = extern(C) void function(AdwOverlaySplitView* self, GtkWidget* sidebar) nothrow;
__gshared c_adw_overlay_split_view_set_sidebarFn c_adw_overlay_split_view_set_sidebar; ///
private alias c_adw_overlay_split_view_set_sidebar_positionFn = extern(C) void function(AdwOverlaySplitView* self, GtkPackType position) nothrow;
__gshared c_adw_overlay_split_view_set_sidebar_positionFn c_adw_overlay_split_view_set_sidebar_position; ///
private alias c_adw_overlay_split_view_set_sidebar_width_fractionFn = extern(C) void function(AdwOverlaySplitView* self, double fraction) nothrow;
__gshared c_adw_overlay_split_view_set_sidebar_width_fractionFn c_adw_overlay_split_view_set_sidebar_width_fraction; ///
private alias c_adw_overlay_split_view_set_sidebar_width_unitFn = extern(C) void function(AdwOverlaySplitView* self, AdwLengthUnit unit) nothrow;
__gshared c_adw_overlay_split_view_set_sidebar_width_unitFn c_adw_overlay_split_view_set_sidebar_width_unit; ///

// PasswordEntryRow
private alias c_adw_password_entry_row_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_password_entry_row_get_typeFn c_adw_password_entry_row_get_type; ///
private alias c_adw_password_entry_row_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_adw_password_entry_row_newFn c_adw_password_entry_row_new; ///

// PreferencesDialog
private alias c_adw_preferences_dialog_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_preferences_dialog_get_typeFn c_adw_preferences_dialog_get_type; ///
private alias c_adw_preferences_dialog_newFn = extern(C) AdwDialog* function() nothrow;
__gshared c_adw_preferences_dialog_newFn c_adw_preferences_dialog_new; ///
private alias c_adw_preferences_dialog_addFn = extern(C) void function(AdwPreferencesDialog* self, AdwPreferencesPage* page) nothrow;
__gshared c_adw_preferences_dialog_addFn c_adw_preferences_dialog_add; ///
private alias c_adw_preferences_dialog_add_toastFn = extern(C) void function(AdwPreferencesDialog* self, AdwToast* toast) nothrow;
__gshared c_adw_preferences_dialog_add_toastFn c_adw_preferences_dialog_add_toast; ///
private alias c_adw_preferences_dialog_get_search_enabledFn = extern(C) gboolean function(AdwPreferencesDialog* self) nothrow;
__gshared c_adw_preferences_dialog_get_search_enabledFn c_adw_preferences_dialog_get_search_enabled; ///
private alias c_adw_preferences_dialog_get_visible_pageFn = extern(C) AdwPreferencesPage* function(AdwPreferencesDialog* self) nothrow;
__gshared c_adw_preferences_dialog_get_visible_pageFn c_adw_preferences_dialog_get_visible_page; ///
private alias c_adw_preferences_dialog_get_visible_page_nameFn = extern(C) const(char)* function(AdwPreferencesDialog* self) nothrow;
__gshared c_adw_preferences_dialog_get_visible_page_nameFn c_adw_preferences_dialog_get_visible_page_name; ///
private alias c_adw_preferences_dialog_pop_subpageFn = extern(C) gboolean function(AdwPreferencesDialog* self) nothrow;
__gshared c_adw_preferences_dialog_pop_subpageFn c_adw_preferences_dialog_pop_subpage; ///
private alias c_adw_preferences_dialog_push_subpageFn = extern(C) void function(AdwPreferencesDialog* self, AdwNavigationPage* page) nothrow;
__gshared c_adw_preferences_dialog_push_subpageFn c_adw_preferences_dialog_push_subpage; ///
private alias c_adw_preferences_dialog_removeFn = extern(C) void function(AdwPreferencesDialog* self, AdwPreferencesPage* page) nothrow;
__gshared c_adw_preferences_dialog_removeFn c_adw_preferences_dialog_remove; ///
private alias c_adw_preferences_dialog_set_search_enabledFn = extern(C) void function(AdwPreferencesDialog* self, gboolean searchEnabled) nothrow;
__gshared c_adw_preferences_dialog_set_search_enabledFn c_adw_preferences_dialog_set_search_enabled; ///
private alias c_adw_preferences_dialog_set_visible_pageFn = extern(C) void function(AdwPreferencesDialog* self, AdwPreferencesPage* page) nothrow;
__gshared c_adw_preferences_dialog_set_visible_pageFn c_adw_preferences_dialog_set_visible_page; ///
private alias c_adw_preferences_dialog_set_visible_page_nameFn = extern(C) void function(AdwPreferencesDialog* self, const(char)* name) nothrow;
__gshared c_adw_preferences_dialog_set_visible_page_nameFn c_adw_preferences_dialog_set_visible_page_name; ///

// PreferencesGroup
private alias c_adw_preferences_group_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_preferences_group_get_typeFn c_adw_preferences_group_get_type; ///
private alias c_adw_preferences_group_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_adw_preferences_group_newFn c_adw_preferences_group_new; ///
private alias c_adw_preferences_group_addFn = extern(C) void function(AdwPreferencesGroup* self, GtkWidget* child) nothrow;
__gshared c_adw_preferences_group_addFn c_adw_preferences_group_add; ///
private alias c_adw_preferences_group_bind_modelFn = extern(C) void function(AdwPreferencesGroup* self, GListModel* model, GtkListBoxCreateWidgetFunc createRowFunc, void* userData, GDestroyNotify userDataFreeFunc) nothrow;
__gshared c_adw_preferences_group_bind_modelFn c_adw_preferences_group_bind_model; ///
private alias c_adw_preferences_group_get_descriptionFn = extern(C) const(char)* function(AdwPreferencesGroup* self) nothrow;
__gshared c_adw_preferences_group_get_descriptionFn c_adw_preferences_group_get_description; ///
private alias c_adw_preferences_group_get_header_suffixFn = extern(C) GtkWidget* function(AdwPreferencesGroup* self) nothrow;
__gshared c_adw_preferences_group_get_header_suffixFn c_adw_preferences_group_get_header_suffix; ///
private alias c_adw_preferences_group_get_rowFn = extern(C) GtkWidget* function(AdwPreferencesGroup* self, uint index) nothrow;
__gshared c_adw_preferences_group_get_rowFn c_adw_preferences_group_get_row; ///
private alias c_adw_preferences_group_get_separate_rowsFn = extern(C) gboolean function(AdwPreferencesGroup* self) nothrow;
__gshared c_adw_preferences_group_get_separate_rowsFn c_adw_preferences_group_get_separate_rows; ///
private alias c_adw_preferences_group_get_titleFn = extern(C) const(char)* function(AdwPreferencesGroup* self) nothrow;
__gshared c_adw_preferences_group_get_titleFn c_adw_preferences_group_get_title; ///
private alias c_adw_preferences_group_removeFn = extern(C) void function(AdwPreferencesGroup* self, GtkWidget* child) nothrow;
__gshared c_adw_preferences_group_removeFn c_adw_preferences_group_remove; ///
private alias c_adw_preferences_group_set_descriptionFn = extern(C) void function(AdwPreferencesGroup* self, const(char)* description) nothrow;
__gshared c_adw_preferences_group_set_descriptionFn c_adw_preferences_group_set_description; ///
private alias c_adw_preferences_group_set_header_suffixFn = extern(C) void function(AdwPreferencesGroup* self, GtkWidget* suffix) nothrow;
__gshared c_adw_preferences_group_set_header_suffixFn c_adw_preferences_group_set_header_suffix; ///
private alias c_adw_preferences_group_set_separate_rowsFn = extern(C) void function(AdwPreferencesGroup* self, gboolean separateRows) nothrow;
__gshared c_adw_preferences_group_set_separate_rowsFn c_adw_preferences_group_set_separate_rows; ///
private alias c_adw_preferences_group_set_titleFn = extern(C) void function(AdwPreferencesGroup* self, const(char)* title) nothrow;
__gshared c_adw_preferences_group_set_titleFn c_adw_preferences_group_set_title; ///

// PreferencesPage
private alias c_adw_preferences_page_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_preferences_page_get_typeFn c_adw_preferences_page_get_type; ///
private alias c_adw_preferences_page_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_adw_preferences_page_newFn c_adw_preferences_page_new; ///
private alias c_adw_preferences_page_addFn = extern(C) void function(AdwPreferencesPage* self, AdwPreferencesGroup* group) nothrow;
__gshared c_adw_preferences_page_addFn c_adw_preferences_page_add; ///
private alias c_adw_preferences_page_get_bannerFn = extern(C) AdwBanner* function(AdwPreferencesPage* self) nothrow;
__gshared c_adw_preferences_page_get_bannerFn c_adw_preferences_page_get_banner; ///
private alias c_adw_preferences_page_get_descriptionFn = extern(C) const(char)* function(AdwPreferencesPage* self) nothrow;
__gshared c_adw_preferences_page_get_descriptionFn c_adw_preferences_page_get_description; ///
private alias c_adw_preferences_page_get_description_centeredFn = extern(C) gboolean function(AdwPreferencesPage* self) nothrow;
__gshared c_adw_preferences_page_get_description_centeredFn c_adw_preferences_page_get_description_centered; ///
private alias c_adw_preferences_page_get_groupFn = extern(C) AdwPreferencesGroup* function(AdwPreferencesPage* self, uint index) nothrow;
__gshared c_adw_preferences_page_get_groupFn c_adw_preferences_page_get_group; ///
private alias c_adw_preferences_page_get_icon_nameFn = extern(C) const(char)* function(AdwPreferencesPage* self) nothrow;
__gshared c_adw_preferences_page_get_icon_nameFn c_adw_preferences_page_get_icon_name; ///
private alias c_adw_preferences_page_get_nameFn = extern(C) const(char)* function(AdwPreferencesPage* self) nothrow;
__gshared c_adw_preferences_page_get_nameFn c_adw_preferences_page_get_name; ///
private alias c_adw_preferences_page_get_titleFn = extern(C) const(char)* function(AdwPreferencesPage* self) nothrow;
__gshared c_adw_preferences_page_get_titleFn c_adw_preferences_page_get_title; ///
private alias c_adw_preferences_page_get_use_underlineFn = extern(C) gboolean function(AdwPreferencesPage* self) nothrow;
__gshared c_adw_preferences_page_get_use_underlineFn c_adw_preferences_page_get_use_underline; ///
private alias c_adw_preferences_page_insertFn = extern(C) void function(AdwPreferencesPage* self, AdwPreferencesGroup* group, int index) nothrow;
__gshared c_adw_preferences_page_insertFn c_adw_preferences_page_insert; ///
private alias c_adw_preferences_page_removeFn = extern(C) void function(AdwPreferencesPage* self, AdwPreferencesGroup* group) nothrow;
__gshared c_adw_preferences_page_removeFn c_adw_preferences_page_remove; ///
private alias c_adw_preferences_page_scroll_to_topFn = extern(C) void function(AdwPreferencesPage* self) nothrow;
__gshared c_adw_preferences_page_scroll_to_topFn c_adw_preferences_page_scroll_to_top; ///
private alias c_adw_preferences_page_set_bannerFn = extern(C) void function(AdwPreferencesPage* self, AdwBanner* banner) nothrow;
__gshared c_adw_preferences_page_set_bannerFn c_adw_preferences_page_set_banner; ///
private alias c_adw_preferences_page_set_descriptionFn = extern(C) void function(AdwPreferencesPage* self, const(char)* description) nothrow;
__gshared c_adw_preferences_page_set_descriptionFn c_adw_preferences_page_set_description; ///
private alias c_adw_preferences_page_set_description_centeredFn = extern(C) void function(AdwPreferencesPage* self, gboolean centered) nothrow;
__gshared c_adw_preferences_page_set_description_centeredFn c_adw_preferences_page_set_description_centered; ///
private alias c_adw_preferences_page_set_icon_nameFn = extern(C) void function(AdwPreferencesPage* self, const(char)* iconName) nothrow;
__gshared c_adw_preferences_page_set_icon_nameFn c_adw_preferences_page_set_icon_name; ///
private alias c_adw_preferences_page_set_nameFn = extern(C) void function(AdwPreferencesPage* self, const(char)* name) nothrow;
__gshared c_adw_preferences_page_set_nameFn c_adw_preferences_page_set_name; ///
private alias c_adw_preferences_page_set_titleFn = extern(C) void function(AdwPreferencesPage* self, const(char)* title) nothrow;
__gshared c_adw_preferences_page_set_titleFn c_adw_preferences_page_set_title; ///
private alias c_adw_preferences_page_set_use_underlineFn = extern(C) void function(AdwPreferencesPage* self, gboolean useUnderline) nothrow;
__gshared c_adw_preferences_page_set_use_underlineFn c_adw_preferences_page_set_use_underline; ///

// PreferencesRow
private alias c_adw_preferences_row_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_preferences_row_get_typeFn c_adw_preferences_row_get_type; ///
private alias c_adw_preferences_row_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_adw_preferences_row_newFn c_adw_preferences_row_new; ///
private alias c_adw_preferences_row_get_titleFn = extern(C) const(char)* function(AdwPreferencesRow* self) nothrow;
__gshared c_adw_preferences_row_get_titleFn c_adw_preferences_row_get_title; ///
private alias c_adw_preferences_row_get_title_selectableFn = extern(C) gboolean function(AdwPreferencesRow* self) nothrow;
__gshared c_adw_preferences_row_get_title_selectableFn c_adw_preferences_row_get_title_selectable; ///
private alias c_adw_preferences_row_get_use_markupFn = extern(C) gboolean function(AdwPreferencesRow* self) nothrow;
__gshared c_adw_preferences_row_get_use_markupFn c_adw_preferences_row_get_use_markup; ///
private alias c_adw_preferences_row_get_use_underlineFn = extern(C) gboolean function(AdwPreferencesRow* self) nothrow;
__gshared c_adw_preferences_row_get_use_underlineFn c_adw_preferences_row_get_use_underline; ///
private alias c_adw_preferences_row_set_titleFn = extern(C) void function(AdwPreferencesRow* self, const(char)* title) nothrow;
__gshared c_adw_preferences_row_set_titleFn c_adw_preferences_row_set_title; ///
private alias c_adw_preferences_row_set_title_selectableFn = extern(C) void function(AdwPreferencesRow* self, gboolean titleSelectable) nothrow;
__gshared c_adw_preferences_row_set_title_selectableFn c_adw_preferences_row_set_title_selectable; ///
private alias c_adw_preferences_row_set_use_markupFn = extern(C) void function(AdwPreferencesRow* self, gboolean useMarkup) nothrow;
__gshared c_adw_preferences_row_set_use_markupFn c_adw_preferences_row_set_use_markup; ///
private alias c_adw_preferences_row_set_use_underlineFn = extern(C) void function(AdwPreferencesRow* self, gboolean useUnderline) nothrow;
__gshared c_adw_preferences_row_set_use_underlineFn c_adw_preferences_row_set_use_underline; ///

// PreferencesWindow
private alias c_adw_preferences_window_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_preferences_window_get_typeFn c_adw_preferences_window_get_type; ///
private alias c_adw_preferences_window_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_adw_preferences_window_newFn c_adw_preferences_window_new; ///
private alias c_adw_preferences_window_addFn = extern(C) void function(AdwPreferencesWindow* self, AdwPreferencesPage* page) nothrow;
__gshared c_adw_preferences_window_addFn c_adw_preferences_window_add; ///
private alias c_adw_preferences_window_add_toastFn = extern(C) void function(AdwPreferencesWindow* self, AdwToast* toast) nothrow;
__gshared c_adw_preferences_window_add_toastFn c_adw_preferences_window_add_toast; ///
private alias c_adw_preferences_window_close_subpageFn = extern(C) void function(AdwPreferencesWindow* self) nothrow;
__gshared c_adw_preferences_window_close_subpageFn c_adw_preferences_window_close_subpage; ///
private alias c_adw_preferences_window_get_can_navigate_backFn = extern(C) gboolean function(AdwPreferencesWindow* self) nothrow;
__gshared c_adw_preferences_window_get_can_navigate_backFn c_adw_preferences_window_get_can_navigate_back; ///
private alias c_adw_preferences_window_get_search_enabledFn = extern(C) gboolean function(AdwPreferencesWindow* self) nothrow;
__gshared c_adw_preferences_window_get_search_enabledFn c_adw_preferences_window_get_search_enabled; ///
private alias c_adw_preferences_window_get_visible_pageFn = extern(C) AdwPreferencesPage* function(AdwPreferencesWindow* self) nothrow;
__gshared c_adw_preferences_window_get_visible_pageFn c_adw_preferences_window_get_visible_page; ///
private alias c_adw_preferences_window_get_visible_page_nameFn = extern(C) const(char)* function(AdwPreferencesWindow* self) nothrow;
__gshared c_adw_preferences_window_get_visible_page_nameFn c_adw_preferences_window_get_visible_page_name; ///
private alias c_adw_preferences_window_pop_subpageFn = extern(C) gboolean function(AdwPreferencesWindow* self) nothrow;
__gshared c_adw_preferences_window_pop_subpageFn c_adw_preferences_window_pop_subpage; ///
private alias c_adw_preferences_window_present_subpageFn = extern(C) void function(AdwPreferencesWindow* self, GtkWidget* subpage) nothrow;
__gshared c_adw_preferences_window_present_subpageFn c_adw_preferences_window_present_subpage; ///
private alias c_adw_preferences_window_push_subpageFn = extern(C) void function(AdwPreferencesWindow* self, AdwNavigationPage* page) nothrow;
__gshared c_adw_preferences_window_push_subpageFn c_adw_preferences_window_push_subpage; ///
private alias c_adw_preferences_window_removeFn = extern(C) void function(AdwPreferencesWindow* self, AdwPreferencesPage* page) nothrow;
__gshared c_adw_preferences_window_removeFn c_adw_preferences_window_remove; ///
private alias c_adw_preferences_window_set_can_navigate_backFn = extern(C) void function(AdwPreferencesWindow* self, gboolean canNavigateBack) nothrow;
__gshared c_adw_preferences_window_set_can_navigate_backFn c_adw_preferences_window_set_can_navigate_back; ///
private alias c_adw_preferences_window_set_search_enabledFn = extern(C) void function(AdwPreferencesWindow* self, gboolean searchEnabled) nothrow;
__gshared c_adw_preferences_window_set_search_enabledFn c_adw_preferences_window_set_search_enabled; ///
private alias c_adw_preferences_window_set_visible_pageFn = extern(C) void function(AdwPreferencesWindow* self, AdwPreferencesPage* page) nothrow;
__gshared c_adw_preferences_window_set_visible_pageFn c_adw_preferences_window_set_visible_page; ///
private alias c_adw_preferences_window_set_visible_page_nameFn = extern(C) void function(AdwPreferencesWindow* self, const(char)* name) nothrow;
__gshared c_adw_preferences_window_set_visible_page_nameFn c_adw_preferences_window_set_visible_page_name; ///

// PropertyAnimationTarget
private alias c_adw_property_animation_target_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_property_animation_target_get_typeFn c_adw_property_animation_target_get_type; ///
private alias c_adw_property_animation_target_newFn = extern(C) AdwAnimationTarget* function(GObject* object, const(char)* propertyName) nothrow;
__gshared c_adw_property_animation_target_newFn c_adw_property_animation_target_new; ///
private alias c_adw_property_animation_target_new_for_pspecFn = extern(C) AdwAnimationTarget* function(GObject* object, GParamSpec* pspec) nothrow;
__gshared c_adw_property_animation_target_new_for_pspecFn c_adw_property_animation_target_new_for_pspec; ///
private alias c_adw_property_animation_target_get_objectFn = extern(C) GObject* function(AdwPropertyAnimationTarget* self) nothrow;
__gshared c_adw_property_animation_target_get_objectFn c_adw_property_animation_target_get_object; ///
private alias c_adw_property_animation_target_get_pspecFn = extern(C) GParamSpec* function(AdwPropertyAnimationTarget* self) nothrow;
__gshared c_adw_property_animation_target_get_pspecFn c_adw_property_animation_target_get_pspec; ///

// ShortcutLabel
private alias c_adw_shortcut_label_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_shortcut_label_get_typeFn c_adw_shortcut_label_get_type; ///
private alias c_adw_shortcut_label_newFn = extern(C) GtkWidget* function(const(char)* accelerator) nothrow;
__gshared c_adw_shortcut_label_newFn c_adw_shortcut_label_new; ///
private alias c_adw_shortcut_label_get_acceleratorFn = extern(C) const(char)* function(AdwShortcutLabel* self) nothrow;
__gshared c_adw_shortcut_label_get_acceleratorFn c_adw_shortcut_label_get_accelerator; ///
private alias c_adw_shortcut_label_get_disabled_textFn = extern(C) const(char)* function(AdwShortcutLabel* self) nothrow;
__gshared c_adw_shortcut_label_get_disabled_textFn c_adw_shortcut_label_get_disabled_text; ///
private alias c_adw_shortcut_label_set_acceleratorFn = extern(C) void function(AdwShortcutLabel* self, const(char)* accelerator) nothrow;
__gshared c_adw_shortcut_label_set_acceleratorFn c_adw_shortcut_label_set_accelerator; ///
private alias c_adw_shortcut_label_set_disabled_textFn = extern(C) void function(AdwShortcutLabel* self, const(char)* disabledText) nothrow;
__gshared c_adw_shortcut_label_set_disabled_textFn c_adw_shortcut_label_set_disabled_text; ///

// ShortcutsDialog
private alias c_adw_shortcuts_dialog_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_shortcuts_dialog_get_typeFn c_adw_shortcuts_dialog_get_type; ///
private alias c_adw_shortcuts_dialog_newFn = extern(C) AdwDialog* function() nothrow;
__gshared c_adw_shortcuts_dialog_newFn c_adw_shortcuts_dialog_new; ///
private alias c_adw_shortcuts_dialog_addFn = extern(C) void function(AdwShortcutsDialog* self, AdwShortcutsSection* section) nothrow;
__gshared c_adw_shortcuts_dialog_addFn c_adw_shortcuts_dialog_add; ///

// ShortcutsItem
private alias c_adw_shortcuts_item_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_shortcuts_item_get_typeFn c_adw_shortcuts_item_get_type; ///
private alias c_adw_shortcuts_item_newFn = extern(C) AdwShortcutsItem* function(const(char)* title, const(char)* accelerator) nothrow;
__gshared c_adw_shortcuts_item_newFn c_adw_shortcuts_item_new; ///
private alias c_adw_shortcuts_item_new_from_actionFn = extern(C) AdwShortcutsItem* function(const(char)* title, const(char)* actionName) nothrow;
__gshared c_adw_shortcuts_item_new_from_actionFn c_adw_shortcuts_item_new_from_action; ///
private alias c_adw_shortcuts_item_get_acceleratorFn = extern(C) const(char)* function(AdwShortcutsItem* self) nothrow;
__gshared c_adw_shortcuts_item_get_acceleratorFn c_adw_shortcuts_item_get_accelerator; ///
private alias c_adw_shortcuts_item_get_action_nameFn = extern(C) const(char)* function(AdwShortcutsItem* self) nothrow;
__gshared c_adw_shortcuts_item_get_action_nameFn c_adw_shortcuts_item_get_action_name; ///
private alias c_adw_shortcuts_item_get_directionFn = extern(C) GtkTextDirection function(AdwShortcutsItem* self) nothrow;
__gshared c_adw_shortcuts_item_get_directionFn c_adw_shortcuts_item_get_direction; ///
private alias c_adw_shortcuts_item_get_subtitleFn = extern(C) const(char)* function(AdwShortcutsItem* self) nothrow;
__gshared c_adw_shortcuts_item_get_subtitleFn c_adw_shortcuts_item_get_subtitle; ///
private alias c_adw_shortcuts_item_get_titleFn = extern(C) const(char)* function(AdwShortcutsItem* self) nothrow;
__gshared c_adw_shortcuts_item_get_titleFn c_adw_shortcuts_item_get_title; ///
private alias c_adw_shortcuts_item_set_acceleratorFn = extern(C) void function(AdwShortcutsItem* self, const(char)* accelerator) nothrow;
__gshared c_adw_shortcuts_item_set_acceleratorFn c_adw_shortcuts_item_set_accelerator; ///
private alias c_adw_shortcuts_item_set_action_nameFn = extern(C) void function(AdwShortcutsItem* self, const(char)* actionName) nothrow;
__gshared c_adw_shortcuts_item_set_action_nameFn c_adw_shortcuts_item_set_action_name; ///
private alias c_adw_shortcuts_item_set_directionFn = extern(C) void function(AdwShortcutsItem* self, GtkTextDirection direction) nothrow;
__gshared c_adw_shortcuts_item_set_directionFn c_adw_shortcuts_item_set_direction; ///
private alias c_adw_shortcuts_item_set_subtitleFn = extern(C) void function(AdwShortcutsItem* self, const(char)* subtitle) nothrow;
__gshared c_adw_shortcuts_item_set_subtitleFn c_adw_shortcuts_item_set_subtitle; ///
private alias c_adw_shortcuts_item_set_titleFn = extern(C) void function(AdwShortcutsItem* self, const(char)* title) nothrow;
__gshared c_adw_shortcuts_item_set_titleFn c_adw_shortcuts_item_set_title; ///

// ShortcutsSection
private alias c_adw_shortcuts_section_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_shortcuts_section_get_typeFn c_adw_shortcuts_section_get_type; ///
private alias c_adw_shortcuts_section_newFn = extern(C) AdwShortcutsSection* function(const(char)* title) nothrow;
__gshared c_adw_shortcuts_section_newFn c_adw_shortcuts_section_new; ///
private alias c_adw_shortcuts_section_addFn = extern(C) void function(AdwShortcutsSection* self, AdwShortcutsItem* item) nothrow;
__gshared c_adw_shortcuts_section_addFn c_adw_shortcuts_section_add; ///
private alias c_adw_shortcuts_section_get_titleFn = extern(C) const(char)* function(AdwShortcutsSection* self) nothrow;
__gshared c_adw_shortcuts_section_get_titleFn c_adw_shortcuts_section_get_title; ///
private alias c_adw_shortcuts_section_set_titleFn = extern(C) void function(AdwShortcutsSection* self, const(char)* title) nothrow;
__gshared c_adw_shortcuts_section_set_titleFn c_adw_shortcuts_section_set_title; ///

// Sidebar
private alias c_adw_sidebar_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_sidebar_get_typeFn c_adw_sidebar_get_type; ///
private alias c_adw_sidebar_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_adw_sidebar_newFn c_adw_sidebar_new; ///
private alias c_adw_sidebar_appendFn = extern(C) void function(AdwSidebar* self, AdwSidebarSection* section) nothrow;
__gshared c_adw_sidebar_appendFn c_adw_sidebar_append; ///
private alias c_adw_sidebar_get_drop_preloadFn = extern(C) gboolean function(AdwSidebar* self) nothrow;
__gshared c_adw_sidebar_get_drop_preloadFn c_adw_sidebar_get_drop_preload; ///
private alias c_adw_sidebar_get_filterFn = extern(C) GtkFilter* function(AdwSidebar* self) nothrow;
__gshared c_adw_sidebar_get_filterFn c_adw_sidebar_get_filter; ///
private alias c_adw_sidebar_get_itemFn = extern(C) AdwSidebarItem* function(AdwSidebar* self, uint index) nothrow;
__gshared c_adw_sidebar_get_itemFn c_adw_sidebar_get_item; ///
private alias c_adw_sidebar_get_itemsFn = extern(C) GtkSelectionModel* function(AdwSidebar* self) nothrow;
__gshared c_adw_sidebar_get_itemsFn c_adw_sidebar_get_items; ///
private alias c_adw_sidebar_get_menu_modelFn = extern(C) GMenuModel* function(AdwSidebar* self) nothrow;
__gshared c_adw_sidebar_get_menu_modelFn c_adw_sidebar_get_menu_model; ///
private alias c_adw_sidebar_get_modeFn = extern(C) AdwSidebarMode function(AdwSidebar* self) nothrow;
__gshared c_adw_sidebar_get_modeFn c_adw_sidebar_get_mode; ///
private alias c_adw_sidebar_get_placeholderFn = extern(C) GtkWidget* function(AdwSidebar* self) nothrow;
__gshared c_adw_sidebar_get_placeholderFn c_adw_sidebar_get_placeholder; ///
private alias c_adw_sidebar_get_sectionFn = extern(C) AdwSidebarSection* function(AdwSidebar* self, uint index) nothrow;
__gshared c_adw_sidebar_get_sectionFn c_adw_sidebar_get_section; ///
private alias c_adw_sidebar_get_sectionsFn = extern(C) GListModel* function(AdwSidebar* self) nothrow;
__gshared c_adw_sidebar_get_sectionsFn c_adw_sidebar_get_sections; ///
private alias c_adw_sidebar_get_selectedFn = extern(C) uint function(AdwSidebar* self) nothrow;
__gshared c_adw_sidebar_get_selectedFn c_adw_sidebar_get_selected; ///
private alias c_adw_sidebar_get_selected_itemFn = extern(C) AdwSidebarItem* function(AdwSidebar* self) nothrow;
__gshared c_adw_sidebar_get_selected_itemFn c_adw_sidebar_get_selected_item; ///
private alias c_adw_sidebar_insertFn = extern(C) void function(AdwSidebar* self, AdwSidebarSection* section, int position) nothrow;
__gshared c_adw_sidebar_insertFn c_adw_sidebar_insert; ///
private alias c_adw_sidebar_prependFn = extern(C) void function(AdwSidebar* self, AdwSidebarSection* section) nothrow;
__gshared c_adw_sidebar_prependFn c_adw_sidebar_prepend; ///
private alias c_adw_sidebar_removeFn = extern(C) void function(AdwSidebar* self, AdwSidebarSection* section) nothrow;
__gshared c_adw_sidebar_removeFn c_adw_sidebar_remove; ///
private alias c_adw_sidebar_remove_allFn = extern(C) void function(AdwSidebar* self) nothrow;
__gshared c_adw_sidebar_remove_allFn c_adw_sidebar_remove_all; ///
private alias c_adw_sidebar_set_drop_preloadFn = extern(C) void function(AdwSidebar* self, gboolean preload) nothrow;
__gshared c_adw_sidebar_set_drop_preloadFn c_adw_sidebar_set_drop_preload; ///
private alias c_adw_sidebar_set_filterFn = extern(C) void function(AdwSidebar* self, GtkFilter* filter) nothrow;
__gshared c_adw_sidebar_set_filterFn c_adw_sidebar_set_filter; ///
private alias c_adw_sidebar_set_menu_modelFn = extern(C) void function(AdwSidebar* self, GMenuModel* menuModel) nothrow;
__gshared c_adw_sidebar_set_menu_modelFn c_adw_sidebar_set_menu_model; ///
private alias c_adw_sidebar_set_modeFn = extern(C) void function(AdwSidebar* self, AdwSidebarMode mode) nothrow;
__gshared c_adw_sidebar_set_modeFn c_adw_sidebar_set_mode; ///
private alias c_adw_sidebar_set_placeholderFn = extern(C) void function(AdwSidebar* self, GtkWidget* placeholder) nothrow;
__gshared c_adw_sidebar_set_placeholderFn c_adw_sidebar_set_placeholder; ///
private alias c_adw_sidebar_set_selectedFn = extern(C) void function(AdwSidebar* self, uint selected) nothrow;
__gshared c_adw_sidebar_set_selectedFn c_adw_sidebar_set_selected; ///
private alias c_adw_sidebar_setup_drop_targetFn = extern(C) void function(AdwSidebar* self, GdkDragAction actions, GType* types, size_t nTypes) nothrow;
__gshared c_adw_sidebar_setup_drop_targetFn c_adw_sidebar_setup_drop_target; ///

// SidebarItem
private alias c_adw_sidebar_item_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_sidebar_item_get_typeFn c_adw_sidebar_item_get_type; ///
private alias c_adw_sidebar_item_newFn = extern(C) AdwSidebarItem* function(const(char)* title) nothrow;
__gshared c_adw_sidebar_item_newFn c_adw_sidebar_item_new; ///
private alias c_adw_sidebar_item_get_drag_motion_activateFn = extern(C) gboolean function(AdwSidebarItem* self) nothrow;
__gshared c_adw_sidebar_item_get_drag_motion_activateFn c_adw_sidebar_item_get_drag_motion_activate; ///
private alias c_adw_sidebar_item_get_enabledFn = extern(C) gboolean function(AdwSidebarItem* self) nothrow;
__gshared c_adw_sidebar_item_get_enabledFn c_adw_sidebar_item_get_enabled; ///
private alias c_adw_sidebar_item_get_icon_nameFn = extern(C) const(char)* function(AdwSidebarItem* self) nothrow;
__gshared c_adw_sidebar_item_get_icon_nameFn c_adw_sidebar_item_get_icon_name; ///
private alias c_adw_sidebar_item_get_icon_paintableFn = extern(C) GdkPaintable* function(AdwSidebarItem* self) nothrow;
__gshared c_adw_sidebar_item_get_icon_paintableFn c_adw_sidebar_item_get_icon_paintable; ///
private alias c_adw_sidebar_item_get_indexFn = extern(C) uint function(AdwSidebarItem* self) nothrow;
__gshared c_adw_sidebar_item_get_indexFn c_adw_sidebar_item_get_index; ///
private alias c_adw_sidebar_item_get_sectionFn = extern(C) AdwSidebarSection* function(AdwSidebarItem* self) nothrow;
__gshared c_adw_sidebar_item_get_sectionFn c_adw_sidebar_item_get_section; ///
private alias c_adw_sidebar_item_get_section_indexFn = extern(C) uint function(AdwSidebarItem* self) nothrow;
__gshared c_adw_sidebar_item_get_section_indexFn c_adw_sidebar_item_get_section_index; ///
private alias c_adw_sidebar_item_get_subtitleFn = extern(C) const(char)* function(AdwSidebarItem* self) nothrow;
__gshared c_adw_sidebar_item_get_subtitleFn c_adw_sidebar_item_get_subtitle; ///
private alias c_adw_sidebar_item_get_suffixFn = extern(C) GtkWidget* function(AdwSidebarItem* self) nothrow;
__gshared c_adw_sidebar_item_get_suffixFn c_adw_sidebar_item_get_suffix; ///
private alias c_adw_sidebar_item_get_titleFn = extern(C) const(char)* function(AdwSidebarItem* self) nothrow;
__gshared c_adw_sidebar_item_get_titleFn c_adw_sidebar_item_get_title; ///
private alias c_adw_sidebar_item_get_tooltipFn = extern(C) const(char)* function(AdwSidebarItem* self) nothrow;
__gshared c_adw_sidebar_item_get_tooltipFn c_adw_sidebar_item_get_tooltip; ///
private alias c_adw_sidebar_item_get_use_underlineFn = extern(C) gboolean function(AdwSidebarItem* self) nothrow;
__gshared c_adw_sidebar_item_get_use_underlineFn c_adw_sidebar_item_get_use_underline; ///
private alias c_adw_sidebar_item_get_visibleFn = extern(C) gboolean function(AdwSidebarItem* self) nothrow;
__gshared c_adw_sidebar_item_get_visibleFn c_adw_sidebar_item_get_visible; ///
private alias c_adw_sidebar_item_set_drag_motion_activateFn = extern(C) void function(AdwSidebarItem* self, gboolean dragMotionActivate) nothrow;
__gshared c_adw_sidebar_item_set_drag_motion_activateFn c_adw_sidebar_item_set_drag_motion_activate; ///
private alias c_adw_sidebar_item_set_enabledFn = extern(C) void function(AdwSidebarItem* self, gboolean enabled) nothrow;
__gshared c_adw_sidebar_item_set_enabledFn c_adw_sidebar_item_set_enabled; ///
private alias c_adw_sidebar_item_set_icon_nameFn = extern(C) void function(AdwSidebarItem* self, const(char)* iconName) nothrow;
__gshared c_adw_sidebar_item_set_icon_nameFn c_adw_sidebar_item_set_icon_name; ///
private alias c_adw_sidebar_item_set_icon_paintableFn = extern(C) void function(AdwSidebarItem* self, GdkPaintable* paintable) nothrow;
__gshared c_adw_sidebar_item_set_icon_paintableFn c_adw_sidebar_item_set_icon_paintable; ///
private alias c_adw_sidebar_item_set_subtitleFn = extern(C) void function(AdwSidebarItem* self, const(char)* subtitle) nothrow;
__gshared c_adw_sidebar_item_set_subtitleFn c_adw_sidebar_item_set_subtitle; ///
private alias c_adw_sidebar_item_set_suffixFn = extern(C) void function(AdwSidebarItem* self, GtkWidget* suffix) nothrow;
__gshared c_adw_sidebar_item_set_suffixFn c_adw_sidebar_item_set_suffix; ///
private alias c_adw_sidebar_item_set_titleFn = extern(C) void function(AdwSidebarItem* self, const(char)* title) nothrow;
__gshared c_adw_sidebar_item_set_titleFn c_adw_sidebar_item_set_title; ///
private alias c_adw_sidebar_item_set_tooltipFn = extern(C) void function(AdwSidebarItem* self, const(char)* tooltip) nothrow;
__gshared c_adw_sidebar_item_set_tooltipFn c_adw_sidebar_item_set_tooltip; ///
private alias c_adw_sidebar_item_set_use_underlineFn = extern(C) void function(AdwSidebarItem* self, gboolean useUnderline) nothrow;
__gshared c_adw_sidebar_item_set_use_underlineFn c_adw_sidebar_item_set_use_underline; ///
private alias c_adw_sidebar_item_set_visibleFn = extern(C) void function(AdwSidebarItem* self, gboolean visible) nothrow;
__gshared c_adw_sidebar_item_set_visibleFn c_adw_sidebar_item_set_visible; ///

// SidebarSection
private alias c_adw_sidebar_section_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_sidebar_section_get_typeFn c_adw_sidebar_section_get_type; ///
private alias c_adw_sidebar_section_newFn = extern(C) AdwSidebarSection* function() nothrow;
__gshared c_adw_sidebar_section_newFn c_adw_sidebar_section_new; ///
private alias c_adw_sidebar_section_appendFn = extern(C) void function(AdwSidebarSection* self, AdwSidebarItem* item) nothrow;
__gshared c_adw_sidebar_section_appendFn c_adw_sidebar_section_append; ///
private alias c_adw_sidebar_section_bind_modelFn = extern(C) void function(AdwSidebarSection* self, GListModel* model, AdwSidebarSectionCreateItemFunc createItemFunc, void* userData, GDestroyNotify userDataFreeFunc) nothrow;
__gshared c_adw_sidebar_section_bind_modelFn c_adw_sidebar_section_bind_model; ///
private alias c_adw_sidebar_section_get_itemFn = extern(C) AdwSidebarItem* function(AdwSidebarSection* self, uint index) nothrow;
__gshared c_adw_sidebar_section_get_itemFn c_adw_sidebar_section_get_item; ///
private alias c_adw_sidebar_section_get_itemsFn = extern(C) GListModel* function(AdwSidebarSection* self) nothrow;
__gshared c_adw_sidebar_section_get_itemsFn c_adw_sidebar_section_get_items; ///
private alias c_adw_sidebar_section_get_menu_modelFn = extern(C) GMenuModel* function(AdwSidebarSection* self) nothrow;
__gshared c_adw_sidebar_section_get_menu_modelFn c_adw_sidebar_section_get_menu_model; ///
private alias c_adw_sidebar_section_get_sidebarFn = extern(C) AdwSidebar* function(AdwSidebarSection* self) nothrow;
__gshared c_adw_sidebar_section_get_sidebarFn c_adw_sidebar_section_get_sidebar; ///
private alias c_adw_sidebar_section_get_titleFn = extern(C) const(char)* function(AdwSidebarSection* self) nothrow;
__gshared c_adw_sidebar_section_get_titleFn c_adw_sidebar_section_get_title; ///
private alias c_adw_sidebar_section_insertFn = extern(C) void function(AdwSidebarSection* self, AdwSidebarItem* item, int position) nothrow;
__gshared c_adw_sidebar_section_insertFn c_adw_sidebar_section_insert; ///
private alias c_adw_sidebar_section_prependFn = extern(C) void function(AdwSidebarSection* self, AdwSidebarItem* item) nothrow;
__gshared c_adw_sidebar_section_prependFn c_adw_sidebar_section_prepend; ///
private alias c_adw_sidebar_section_removeFn = extern(C) void function(AdwSidebarSection* self, AdwSidebarItem* item) nothrow;
__gshared c_adw_sidebar_section_removeFn c_adw_sidebar_section_remove; ///
private alias c_adw_sidebar_section_remove_allFn = extern(C) void function(AdwSidebarSection* self) nothrow;
__gshared c_adw_sidebar_section_remove_allFn c_adw_sidebar_section_remove_all; ///
private alias c_adw_sidebar_section_set_menu_modelFn = extern(C) void function(AdwSidebarSection* self, GMenuModel* menuModel) nothrow;
__gshared c_adw_sidebar_section_set_menu_modelFn c_adw_sidebar_section_set_menu_model; ///
private alias c_adw_sidebar_section_set_titleFn = extern(C) void function(AdwSidebarSection* self, const(char)* title) nothrow;
__gshared c_adw_sidebar_section_set_titleFn c_adw_sidebar_section_set_title; ///

// SpinRow
private alias c_adw_spin_row_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_spin_row_get_typeFn c_adw_spin_row_get_type; ///
private alias c_adw_spin_row_newFn = extern(C) GtkWidget* function(GtkAdjustment* adjustment, double climbRate, uint digits) nothrow;
__gshared c_adw_spin_row_newFn c_adw_spin_row_new; ///
private alias c_adw_spin_row_new_with_rangeFn = extern(C) GtkWidget* function(double min, double max, double step) nothrow;
__gshared c_adw_spin_row_new_with_rangeFn c_adw_spin_row_new_with_range; ///
private alias c_adw_spin_row_configureFn = extern(C) void function(AdwSpinRow* self, GtkAdjustment* adjustment, double climbRate, uint digits) nothrow;
__gshared c_adw_spin_row_configureFn c_adw_spin_row_configure; ///
private alias c_adw_spin_row_get_adjustmentFn = extern(C) GtkAdjustment* function(AdwSpinRow* self) nothrow;
__gshared c_adw_spin_row_get_adjustmentFn c_adw_spin_row_get_adjustment; ///
private alias c_adw_spin_row_get_climb_rateFn = extern(C) double function(AdwSpinRow* self) nothrow;
__gshared c_adw_spin_row_get_climb_rateFn c_adw_spin_row_get_climb_rate; ///
private alias c_adw_spin_row_get_digitsFn = extern(C) uint function(AdwSpinRow* self) nothrow;
__gshared c_adw_spin_row_get_digitsFn c_adw_spin_row_get_digits; ///
private alias c_adw_spin_row_get_numericFn = extern(C) gboolean function(AdwSpinRow* self) nothrow;
__gshared c_adw_spin_row_get_numericFn c_adw_spin_row_get_numeric; ///
private alias c_adw_spin_row_get_snap_to_ticksFn = extern(C) gboolean function(AdwSpinRow* self) nothrow;
__gshared c_adw_spin_row_get_snap_to_ticksFn c_adw_spin_row_get_snap_to_ticks; ///
private alias c_adw_spin_row_get_update_policyFn = extern(C) GtkSpinButtonUpdatePolicy function(AdwSpinRow* self) nothrow;
__gshared c_adw_spin_row_get_update_policyFn c_adw_spin_row_get_update_policy; ///
private alias c_adw_spin_row_get_valueFn = extern(C) double function(AdwSpinRow* self) nothrow;
__gshared c_adw_spin_row_get_valueFn c_adw_spin_row_get_value; ///
private alias c_adw_spin_row_get_wrapFn = extern(C) gboolean function(AdwSpinRow* self) nothrow;
__gshared c_adw_spin_row_get_wrapFn c_adw_spin_row_get_wrap; ///
private alias c_adw_spin_row_set_adjustmentFn = extern(C) void function(AdwSpinRow* self, GtkAdjustment* adjustment) nothrow;
__gshared c_adw_spin_row_set_adjustmentFn c_adw_spin_row_set_adjustment; ///
private alias c_adw_spin_row_set_climb_rateFn = extern(C) void function(AdwSpinRow* self, double climbRate) nothrow;
__gshared c_adw_spin_row_set_climb_rateFn c_adw_spin_row_set_climb_rate; ///
private alias c_adw_spin_row_set_digitsFn = extern(C) void function(AdwSpinRow* self, uint digits) nothrow;
__gshared c_adw_spin_row_set_digitsFn c_adw_spin_row_set_digits; ///
private alias c_adw_spin_row_set_numericFn = extern(C) void function(AdwSpinRow* self, gboolean numeric) nothrow;
__gshared c_adw_spin_row_set_numericFn c_adw_spin_row_set_numeric; ///
private alias c_adw_spin_row_set_rangeFn = extern(C) void function(AdwSpinRow* self, double min, double max) nothrow;
__gshared c_adw_spin_row_set_rangeFn c_adw_spin_row_set_range; ///
private alias c_adw_spin_row_set_snap_to_ticksFn = extern(C) void function(AdwSpinRow* self, gboolean snapToTicks) nothrow;
__gshared c_adw_spin_row_set_snap_to_ticksFn c_adw_spin_row_set_snap_to_ticks; ///
private alias c_adw_spin_row_set_update_policyFn = extern(C) void function(AdwSpinRow* self, GtkSpinButtonUpdatePolicy policy) nothrow;
__gshared c_adw_spin_row_set_update_policyFn c_adw_spin_row_set_update_policy; ///
private alias c_adw_spin_row_set_valueFn = extern(C) void function(AdwSpinRow* self, double value) nothrow;
__gshared c_adw_spin_row_set_valueFn c_adw_spin_row_set_value; ///
private alias c_adw_spin_row_set_wrapFn = extern(C) void function(AdwSpinRow* self, gboolean wrap) nothrow;
__gshared c_adw_spin_row_set_wrapFn c_adw_spin_row_set_wrap; ///
private alias c_adw_spin_row_updateFn = extern(C) void function(AdwSpinRow* self) nothrow;
__gshared c_adw_spin_row_updateFn c_adw_spin_row_update; ///

// Spinner
private alias c_adw_spinner_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_spinner_get_typeFn c_adw_spinner_get_type; ///
private alias c_adw_spinner_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_adw_spinner_newFn c_adw_spinner_new; ///

// SpinnerPaintable
private alias c_adw_spinner_paintable_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_spinner_paintable_get_typeFn c_adw_spinner_paintable_get_type; ///
private alias c_adw_spinner_paintable_newFn = extern(C) AdwSpinnerPaintable* function(GtkWidget* widget) nothrow;
__gshared c_adw_spinner_paintable_newFn c_adw_spinner_paintable_new; ///
private alias c_adw_spinner_paintable_get_widgetFn = extern(C) GtkWidget* function(AdwSpinnerPaintable* self) nothrow;
__gshared c_adw_spinner_paintable_get_widgetFn c_adw_spinner_paintable_get_widget; ///
private alias c_adw_spinner_paintable_set_widgetFn = extern(C) void function(AdwSpinnerPaintable* self, GtkWidget* widget) nothrow;
__gshared c_adw_spinner_paintable_set_widgetFn c_adw_spinner_paintable_set_widget; ///

// SplitButton
private alias c_adw_split_button_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_split_button_get_typeFn c_adw_split_button_get_type; ///
private alias c_adw_split_button_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_adw_split_button_newFn c_adw_split_button_new; ///
private alias c_adw_split_button_get_can_shrinkFn = extern(C) gboolean function(AdwSplitButton* self) nothrow;
__gshared c_adw_split_button_get_can_shrinkFn c_adw_split_button_get_can_shrink; ///
private alias c_adw_split_button_get_childFn = extern(C) GtkWidget* function(AdwSplitButton* self) nothrow;
__gshared c_adw_split_button_get_childFn c_adw_split_button_get_child; ///
private alias c_adw_split_button_get_directionFn = extern(C) GtkArrowType function(AdwSplitButton* self) nothrow;
__gshared c_adw_split_button_get_directionFn c_adw_split_button_get_direction; ///
private alias c_adw_split_button_get_dropdown_tooltipFn = extern(C) const(char)* function(AdwSplitButton* self) nothrow;
__gshared c_adw_split_button_get_dropdown_tooltipFn c_adw_split_button_get_dropdown_tooltip; ///
private alias c_adw_split_button_get_icon_nameFn = extern(C) const(char)* function(AdwSplitButton* self) nothrow;
__gshared c_adw_split_button_get_icon_nameFn c_adw_split_button_get_icon_name; ///
private alias c_adw_split_button_get_labelFn = extern(C) const(char)* function(AdwSplitButton* self) nothrow;
__gshared c_adw_split_button_get_labelFn c_adw_split_button_get_label; ///
private alias c_adw_split_button_get_menu_modelFn = extern(C) GMenuModel* function(AdwSplitButton* self) nothrow;
__gshared c_adw_split_button_get_menu_modelFn c_adw_split_button_get_menu_model; ///
private alias c_adw_split_button_get_popoverFn = extern(C) GtkPopover* function(AdwSplitButton* self) nothrow;
__gshared c_adw_split_button_get_popoverFn c_adw_split_button_get_popover; ///
private alias c_adw_split_button_get_use_underlineFn = extern(C) gboolean function(AdwSplitButton* self) nothrow;
__gshared c_adw_split_button_get_use_underlineFn c_adw_split_button_get_use_underline; ///
private alias c_adw_split_button_popdownFn = extern(C) void function(AdwSplitButton* self) nothrow;
__gshared c_adw_split_button_popdownFn c_adw_split_button_popdown; ///
private alias c_adw_split_button_popupFn = extern(C) void function(AdwSplitButton* self) nothrow;
__gshared c_adw_split_button_popupFn c_adw_split_button_popup; ///
private alias c_adw_split_button_set_can_shrinkFn = extern(C) void function(AdwSplitButton* self, gboolean canShrink) nothrow;
__gshared c_adw_split_button_set_can_shrinkFn c_adw_split_button_set_can_shrink; ///
private alias c_adw_split_button_set_childFn = extern(C) void function(AdwSplitButton* self, GtkWidget* child) nothrow;
__gshared c_adw_split_button_set_childFn c_adw_split_button_set_child; ///
private alias c_adw_split_button_set_directionFn = extern(C) void function(AdwSplitButton* self, GtkArrowType direction) nothrow;
__gshared c_adw_split_button_set_directionFn c_adw_split_button_set_direction; ///
private alias c_adw_split_button_set_dropdown_tooltipFn = extern(C) void function(AdwSplitButton* self, const(char)* tooltip) nothrow;
__gshared c_adw_split_button_set_dropdown_tooltipFn c_adw_split_button_set_dropdown_tooltip; ///
private alias c_adw_split_button_set_icon_nameFn = extern(C) void function(AdwSplitButton* self, const(char)* iconName) nothrow;
__gshared c_adw_split_button_set_icon_nameFn c_adw_split_button_set_icon_name; ///
private alias c_adw_split_button_set_labelFn = extern(C) void function(AdwSplitButton* self, const(char)* label) nothrow;
__gshared c_adw_split_button_set_labelFn c_adw_split_button_set_label; ///
private alias c_adw_split_button_set_menu_modelFn = extern(C) void function(AdwSplitButton* self, GMenuModel* menuModel) nothrow;
__gshared c_adw_split_button_set_menu_modelFn c_adw_split_button_set_menu_model; ///
private alias c_adw_split_button_set_popoverFn = extern(C) void function(AdwSplitButton* self, GtkPopover* popover) nothrow;
__gshared c_adw_split_button_set_popoverFn c_adw_split_button_set_popover; ///
private alias c_adw_split_button_set_use_underlineFn = extern(C) void function(AdwSplitButton* self, gboolean useUnderline) nothrow;
__gshared c_adw_split_button_set_use_underlineFn c_adw_split_button_set_use_underline; ///

// SpringAnimation
private alias c_adw_spring_animation_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_spring_animation_get_typeFn c_adw_spring_animation_get_type; ///
private alias c_adw_spring_animation_newFn = extern(C) AdwAnimation* function(GtkWidget* widget, double from, double to, AdwSpringParams* springParams, AdwAnimationTarget* target) nothrow;
__gshared c_adw_spring_animation_newFn c_adw_spring_animation_new; ///
private alias c_adw_spring_animation_calculate_valueFn = extern(C) double function(AdwSpringAnimation* self, uint time) nothrow;
__gshared c_adw_spring_animation_calculate_valueFn c_adw_spring_animation_calculate_value; ///
private alias c_adw_spring_animation_calculate_velocityFn = extern(C) double function(AdwSpringAnimation* self, uint time) nothrow;
__gshared c_adw_spring_animation_calculate_velocityFn c_adw_spring_animation_calculate_velocity; ///
private alias c_adw_spring_animation_get_clampFn = extern(C) gboolean function(AdwSpringAnimation* self) nothrow;
__gshared c_adw_spring_animation_get_clampFn c_adw_spring_animation_get_clamp; ///
private alias c_adw_spring_animation_get_epsilonFn = extern(C) double function(AdwSpringAnimation* self) nothrow;
__gshared c_adw_spring_animation_get_epsilonFn c_adw_spring_animation_get_epsilon; ///
private alias c_adw_spring_animation_get_estimated_durationFn = extern(C) uint function(AdwSpringAnimation* self) nothrow;
__gshared c_adw_spring_animation_get_estimated_durationFn c_adw_spring_animation_get_estimated_duration; ///
private alias c_adw_spring_animation_get_initial_velocityFn = extern(C) double function(AdwSpringAnimation* self) nothrow;
__gshared c_adw_spring_animation_get_initial_velocityFn c_adw_spring_animation_get_initial_velocity; ///
private alias c_adw_spring_animation_get_spring_paramsFn = extern(C) AdwSpringParams* function(AdwSpringAnimation* self) nothrow;
__gshared c_adw_spring_animation_get_spring_paramsFn c_adw_spring_animation_get_spring_params; ///
private alias c_adw_spring_animation_get_value_fromFn = extern(C) double function(AdwSpringAnimation* self) nothrow;
__gshared c_adw_spring_animation_get_value_fromFn c_adw_spring_animation_get_value_from; ///
private alias c_adw_spring_animation_get_value_toFn = extern(C) double function(AdwSpringAnimation* self) nothrow;
__gshared c_adw_spring_animation_get_value_toFn c_adw_spring_animation_get_value_to; ///
private alias c_adw_spring_animation_get_velocityFn = extern(C) double function(AdwSpringAnimation* self) nothrow;
__gshared c_adw_spring_animation_get_velocityFn c_adw_spring_animation_get_velocity; ///
private alias c_adw_spring_animation_set_clampFn = extern(C) void function(AdwSpringAnimation* self, gboolean clamp) nothrow;
__gshared c_adw_spring_animation_set_clampFn c_adw_spring_animation_set_clamp; ///
private alias c_adw_spring_animation_set_epsilonFn = extern(C) void function(AdwSpringAnimation* self, double epsilon) nothrow;
__gshared c_adw_spring_animation_set_epsilonFn c_adw_spring_animation_set_epsilon; ///
private alias c_adw_spring_animation_set_initial_velocityFn = extern(C) void function(AdwSpringAnimation* self, double velocity) nothrow;
__gshared c_adw_spring_animation_set_initial_velocityFn c_adw_spring_animation_set_initial_velocity; ///
private alias c_adw_spring_animation_set_spring_paramsFn = extern(C) void function(AdwSpringAnimation* self, AdwSpringParams* springParams) nothrow;
__gshared c_adw_spring_animation_set_spring_paramsFn c_adw_spring_animation_set_spring_params; ///
private alias c_adw_spring_animation_set_value_fromFn = extern(C) void function(AdwSpringAnimation* self, double value) nothrow;
__gshared c_adw_spring_animation_set_value_fromFn c_adw_spring_animation_set_value_from; ///
private alias c_adw_spring_animation_set_value_toFn = extern(C) void function(AdwSpringAnimation* self, double value) nothrow;
__gshared c_adw_spring_animation_set_value_toFn c_adw_spring_animation_set_value_to; ///

// SpringParams
private alias c_adw_spring_params_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_spring_params_get_typeFn c_adw_spring_params_get_type; ///
private alias c_adw_spring_params_newFn = extern(C) AdwSpringParams* function(double dampingRatio, double mass, double stiffness) nothrow;
__gshared c_adw_spring_params_newFn c_adw_spring_params_new; ///
private alias c_adw_spring_params_new_fullFn = extern(C) AdwSpringParams* function(double damping, double mass, double stiffness) nothrow;
__gshared c_adw_spring_params_new_fullFn c_adw_spring_params_new_full; ///
private alias c_adw_spring_params_get_dampingFn = extern(C) double function(AdwSpringParams* self) nothrow;
__gshared c_adw_spring_params_get_dampingFn c_adw_spring_params_get_damping; ///
private alias c_adw_spring_params_get_damping_ratioFn = extern(C) double function(AdwSpringParams* self) nothrow;
__gshared c_adw_spring_params_get_damping_ratioFn c_adw_spring_params_get_damping_ratio; ///
private alias c_adw_spring_params_get_massFn = extern(C) double function(AdwSpringParams* self) nothrow;
__gshared c_adw_spring_params_get_massFn c_adw_spring_params_get_mass; ///
private alias c_adw_spring_params_get_stiffnessFn = extern(C) double function(AdwSpringParams* self) nothrow;
__gshared c_adw_spring_params_get_stiffnessFn c_adw_spring_params_get_stiffness; ///
private alias c_adw_spring_params_refFn = extern(C) AdwSpringParams* function(AdwSpringParams* self) nothrow;
__gshared c_adw_spring_params_refFn c_adw_spring_params_ref; ///
private alias c_adw_spring_params_unrefFn = extern(C) void function(AdwSpringParams* self) nothrow;
__gshared c_adw_spring_params_unrefFn c_adw_spring_params_unref; ///

// Squeezer
private alias c_adw_squeezer_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_squeezer_get_typeFn c_adw_squeezer_get_type; ///
private alias c_adw_squeezer_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_adw_squeezer_newFn c_adw_squeezer_new; ///
private alias c_adw_squeezer_addFn = extern(C) AdwSqueezerPage* function(AdwSqueezer* self, GtkWidget* child) nothrow;
__gshared c_adw_squeezer_addFn c_adw_squeezer_add; ///
private alias c_adw_squeezer_get_allow_noneFn = extern(C) gboolean function(AdwSqueezer* self) nothrow;
__gshared c_adw_squeezer_get_allow_noneFn c_adw_squeezer_get_allow_none; ///
private alias c_adw_squeezer_get_homogeneousFn = extern(C) gboolean function(AdwSqueezer* self) nothrow;
__gshared c_adw_squeezer_get_homogeneousFn c_adw_squeezer_get_homogeneous; ///
private alias c_adw_squeezer_get_interpolate_sizeFn = extern(C) gboolean function(AdwSqueezer* self) nothrow;
__gshared c_adw_squeezer_get_interpolate_sizeFn c_adw_squeezer_get_interpolate_size; ///
private alias c_adw_squeezer_get_pageFn = extern(C) AdwSqueezerPage* function(AdwSqueezer* self, GtkWidget* child) nothrow;
__gshared c_adw_squeezer_get_pageFn c_adw_squeezer_get_page; ///
private alias c_adw_squeezer_get_pagesFn = extern(C) GtkSelectionModel* function(AdwSqueezer* self) nothrow;
__gshared c_adw_squeezer_get_pagesFn c_adw_squeezer_get_pages; ///
private alias c_adw_squeezer_get_switch_threshold_policyFn = extern(C) AdwFoldThresholdPolicy function(AdwSqueezer* self) nothrow;
__gshared c_adw_squeezer_get_switch_threshold_policyFn c_adw_squeezer_get_switch_threshold_policy; ///
private alias c_adw_squeezer_get_transition_durationFn = extern(C) uint function(AdwSqueezer* self) nothrow;
__gshared c_adw_squeezer_get_transition_durationFn c_adw_squeezer_get_transition_duration; ///
private alias c_adw_squeezer_get_transition_runningFn = extern(C) gboolean function(AdwSqueezer* self) nothrow;
__gshared c_adw_squeezer_get_transition_runningFn c_adw_squeezer_get_transition_running; ///
private alias c_adw_squeezer_get_transition_typeFn = extern(C) AdwSqueezerTransitionType function(AdwSqueezer* self) nothrow;
__gshared c_adw_squeezer_get_transition_typeFn c_adw_squeezer_get_transition_type; ///
private alias c_adw_squeezer_get_visible_childFn = extern(C) GtkWidget* function(AdwSqueezer* self) nothrow;
__gshared c_adw_squeezer_get_visible_childFn c_adw_squeezer_get_visible_child; ///
private alias c_adw_squeezer_get_xalignFn = extern(C) float function(AdwSqueezer* self) nothrow;
__gshared c_adw_squeezer_get_xalignFn c_adw_squeezer_get_xalign; ///
private alias c_adw_squeezer_get_yalignFn = extern(C) float function(AdwSqueezer* self) nothrow;
__gshared c_adw_squeezer_get_yalignFn c_adw_squeezer_get_yalign; ///
private alias c_adw_squeezer_removeFn = extern(C) void function(AdwSqueezer* self, GtkWidget* child) nothrow;
__gshared c_adw_squeezer_removeFn c_adw_squeezer_remove; ///
private alias c_adw_squeezer_set_allow_noneFn = extern(C) void function(AdwSqueezer* self, gboolean allowNone) nothrow;
__gshared c_adw_squeezer_set_allow_noneFn c_adw_squeezer_set_allow_none; ///
private alias c_adw_squeezer_set_homogeneousFn = extern(C) void function(AdwSqueezer* self, gboolean homogeneous) nothrow;
__gshared c_adw_squeezer_set_homogeneousFn c_adw_squeezer_set_homogeneous; ///
private alias c_adw_squeezer_set_interpolate_sizeFn = extern(C) void function(AdwSqueezer* self, gboolean interpolateSize) nothrow;
__gshared c_adw_squeezer_set_interpolate_sizeFn c_adw_squeezer_set_interpolate_size; ///
private alias c_adw_squeezer_set_switch_threshold_policyFn = extern(C) void function(AdwSqueezer* self, AdwFoldThresholdPolicy policy) nothrow;
__gshared c_adw_squeezer_set_switch_threshold_policyFn c_adw_squeezer_set_switch_threshold_policy; ///
private alias c_adw_squeezer_set_transition_durationFn = extern(C) void function(AdwSqueezer* self, uint duration) nothrow;
__gshared c_adw_squeezer_set_transition_durationFn c_adw_squeezer_set_transition_duration; ///
private alias c_adw_squeezer_set_transition_typeFn = extern(C) void function(AdwSqueezer* self, AdwSqueezerTransitionType transition) nothrow;
__gshared c_adw_squeezer_set_transition_typeFn c_adw_squeezer_set_transition_type; ///
private alias c_adw_squeezer_set_xalignFn = extern(C) void function(AdwSqueezer* self, float xalign) nothrow;
__gshared c_adw_squeezer_set_xalignFn c_adw_squeezer_set_xalign; ///
private alias c_adw_squeezer_set_yalignFn = extern(C) void function(AdwSqueezer* self, float yalign) nothrow;
__gshared c_adw_squeezer_set_yalignFn c_adw_squeezer_set_yalign; ///

// SqueezerPage
private alias c_adw_squeezer_page_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_squeezer_page_get_typeFn c_adw_squeezer_page_get_type; ///
private alias c_adw_squeezer_page_get_childFn = extern(C) GtkWidget* function(AdwSqueezerPage* self) nothrow;
__gshared c_adw_squeezer_page_get_childFn c_adw_squeezer_page_get_child; ///
private alias c_adw_squeezer_page_get_enabledFn = extern(C) gboolean function(AdwSqueezerPage* self) nothrow;
__gshared c_adw_squeezer_page_get_enabledFn c_adw_squeezer_page_get_enabled; ///
private alias c_adw_squeezer_page_set_enabledFn = extern(C) void function(AdwSqueezerPage* self, gboolean enabled) nothrow;
__gshared c_adw_squeezer_page_set_enabledFn c_adw_squeezer_page_set_enabled; ///

// StatusPage
private alias c_adw_status_page_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_status_page_get_typeFn c_adw_status_page_get_type; ///
private alias c_adw_status_page_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_adw_status_page_newFn c_adw_status_page_new; ///
private alias c_adw_status_page_get_childFn = extern(C) GtkWidget* function(AdwStatusPage* self) nothrow;
__gshared c_adw_status_page_get_childFn c_adw_status_page_get_child; ///
private alias c_adw_status_page_get_descriptionFn = extern(C) const(char)* function(AdwStatusPage* self) nothrow;
__gshared c_adw_status_page_get_descriptionFn c_adw_status_page_get_description; ///
private alias c_adw_status_page_get_icon_nameFn = extern(C) const(char)* function(AdwStatusPage* self) nothrow;
__gshared c_adw_status_page_get_icon_nameFn c_adw_status_page_get_icon_name; ///
private alias c_adw_status_page_get_paintableFn = extern(C) GdkPaintable* function(AdwStatusPage* self) nothrow;
__gshared c_adw_status_page_get_paintableFn c_adw_status_page_get_paintable; ///
private alias c_adw_status_page_get_titleFn = extern(C) const(char)* function(AdwStatusPage* self) nothrow;
__gshared c_adw_status_page_get_titleFn c_adw_status_page_get_title; ///
private alias c_adw_status_page_set_childFn = extern(C) void function(AdwStatusPage* self, GtkWidget* child) nothrow;
__gshared c_adw_status_page_set_childFn c_adw_status_page_set_child; ///
private alias c_adw_status_page_set_descriptionFn = extern(C) void function(AdwStatusPage* self, const(char)* description) nothrow;
__gshared c_adw_status_page_set_descriptionFn c_adw_status_page_set_description; ///
private alias c_adw_status_page_set_icon_nameFn = extern(C) void function(AdwStatusPage* self, const(char)* iconName) nothrow;
__gshared c_adw_status_page_set_icon_nameFn c_adw_status_page_set_icon_name; ///
private alias c_adw_status_page_set_paintableFn = extern(C) void function(AdwStatusPage* self, GdkPaintable* paintable) nothrow;
__gshared c_adw_status_page_set_paintableFn c_adw_status_page_set_paintable; ///
private alias c_adw_status_page_set_titleFn = extern(C) void function(AdwStatusPage* self, const(char)* title) nothrow;
__gshared c_adw_status_page_set_titleFn c_adw_status_page_set_title; ///

// StyleManager
private alias c_adw_style_manager_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_style_manager_get_typeFn c_adw_style_manager_get_type; ///
private alias c_adw_style_manager_get_defaultFn = extern(C) AdwStyleManager* function() nothrow;
__gshared c_adw_style_manager_get_defaultFn c_adw_style_manager_get_default; ///
private alias c_adw_style_manager_get_for_displayFn = extern(C) AdwStyleManager* function(GdkDisplay* display) nothrow;
__gshared c_adw_style_manager_get_for_displayFn c_adw_style_manager_get_for_display; ///
private alias c_adw_style_manager_get_accent_colorFn = extern(C) AdwAccentColor function(AdwStyleManager* self) nothrow;
__gshared c_adw_style_manager_get_accent_colorFn c_adw_style_manager_get_accent_color; ///
private alias c_adw_style_manager_get_accent_color_rgbaFn = extern(C) GdkRGBA* function(AdwStyleManager* self) nothrow;
__gshared c_adw_style_manager_get_accent_color_rgbaFn c_adw_style_manager_get_accent_color_rgba; ///
private alias c_adw_style_manager_get_color_schemeFn = extern(C) AdwColorScheme function(AdwStyleManager* self) nothrow;
__gshared c_adw_style_manager_get_color_schemeFn c_adw_style_manager_get_color_scheme; ///
private alias c_adw_style_manager_get_darkFn = extern(C) gboolean function(AdwStyleManager* self) nothrow;
__gshared c_adw_style_manager_get_darkFn c_adw_style_manager_get_dark; ///
private alias c_adw_style_manager_get_displayFn = extern(C) GdkDisplay* function(AdwStyleManager* self) nothrow;
__gshared c_adw_style_manager_get_displayFn c_adw_style_manager_get_display; ///
private alias c_adw_style_manager_get_document_font_nameFn = extern(C) const(char)* function(AdwStyleManager* self) nothrow;
__gshared c_adw_style_manager_get_document_font_nameFn c_adw_style_manager_get_document_font_name; ///
private alias c_adw_style_manager_get_high_contrastFn = extern(C) gboolean function(AdwStyleManager* self) nothrow;
__gshared c_adw_style_manager_get_high_contrastFn c_adw_style_manager_get_high_contrast; ///
private alias c_adw_style_manager_get_monospace_font_nameFn = extern(C) const(char)* function(AdwStyleManager* self) nothrow;
__gshared c_adw_style_manager_get_monospace_font_nameFn c_adw_style_manager_get_monospace_font_name; ///
private alias c_adw_style_manager_get_system_supports_accent_colorsFn = extern(C) gboolean function(AdwStyleManager* self) nothrow;
__gshared c_adw_style_manager_get_system_supports_accent_colorsFn c_adw_style_manager_get_system_supports_accent_colors; ///
private alias c_adw_style_manager_get_system_supports_color_schemesFn = extern(C) gboolean function(AdwStyleManager* self) nothrow;
__gshared c_adw_style_manager_get_system_supports_color_schemesFn c_adw_style_manager_get_system_supports_color_schemes; ///
private alias c_adw_style_manager_set_color_schemeFn = extern(C) void function(AdwStyleManager* self, AdwColorScheme colorScheme) nothrow;
__gshared c_adw_style_manager_set_color_schemeFn c_adw_style_manager_set_color_scheme; ///

// SwipeTracker
private alias c_adw_swipe_tracker_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_swipe_tracker_get_typeFn c_adw_swipe_tracker_get_type; ///
private alias c_adw_swipe_tracker_newFn = extern(C) AdwSwipeTracker* function(AdwSwipeable* swipeable) nothrow;
__gshared c_adw_swipe_tracker_newFn c_adw_swipe_tracker_new; ///
private alias c_adw_swipe_tracker_get_allow_long_swipesFn = extern(C) gboolean function(AdwSwipeTracker* self) nothrow;
__gshared c_adw_swipe_tracker_get_allow_long_swipesFn c_adw_swipe_tracker_get_allow_long_swipes; ///
private alias c_adw_swipe_tracker_get_allow_mouse_dragFn = extern(C) gboolean function(AdwSwipeTracker* self) nothrow;
__gshared c_adw_swipe_tracker_get_allow_mouse_dragFn c_adw_swipe_tracker_get_allow_mouse_drag; ///
private alias c_adw_swipe_tracker_get_allow_window_handleFn = extern(C) gboolean function(AdwSwipeTracker* self) nothrow;
__gshared c_adw_swipe_tracker_get_allow_window_handleFn c_adw_swipe_tracker_get_allow_window_handle; ///
private alias c_adw_swipe_tracker_get_enabledFn = extern(C) gboolean function(AdwSwipeTracker* self) nothrow;
__gshared c_adw_swipe_tracker_get_enabledFn c_adw_swipe_tracker_get_enabled; ///
private alias c_adw_swipe_tracker_get_lower_overshootFn = extern(C) gboolean function(AdwSwipeTracker* self) nothrow;
__gshared c_adw_swipe_tracker_get_lower_overshootFn c_adw_swipe_tracker_get_lower_overshoot; ///
private alias c_adw_swipe_tracker_get_reversedFn = extern(C) gboolean function(AdwSwipeTracker* self) nothrow;
__gshared c_adw_swipe_tracker_get_reversedFn c_adw_swipe_tracker_get_reversed; ///
private alias c_adw_swipe_tracker_get_swipeableFn = extern(C) AdwSwipeable* function(AdwSwipeTracker* self) nothrow;
__gshared c_adw_swipe_tracker_get_swipeableFn c_adw_swipe_tracker_get_swipeable; ///
private alias c_adw_swipe_tracker_get_upper_overshootFn = extern(C) gboolean function(AdwSwipeTracker* self) nothrow;
__gshared c_adw_swipe_tracker_get_upper_overshootFn c_adw_swipe_tracker_get_upper_overshoot; ///
private alias c_adw_swipe_tracker_set_allow_long_swipesFn = extern(C) void function(AdwSwipeTracker* self, gboolean allowLongSwipes) nothrow;
__gshared c_adw_swipe_tracker_set_allow_long_swipesFn c_adw_swipe_tracker_set_allow_long_swipes; ///
private alias c_adw_swipe_tracker_set_allow_mouse_dragFn = extern(C) void function(AdwSwipeTracker* self, gboolean allowMouseDrag) nothrow;
__gshared c_adw_swipe_tracker_set_allow_mouse_dragFn c_adw_swipe_tracker_set_allow_mouse_drag; ///
private alias c_adw_swipe_tracker_set_allow_window_handleFn = extern(C) void function(AdwSwipeTracker* self, gboolean allowWindowHandle) nothrow;
__gshared c_adw_swipe_tracker_set_allow_window_handleFn c_adw_swipe_tracker_set_allow_window_handle; ///
private alias c_adw_swipe_tracker_set_enabledFn = extern(C) void function(AdwSwipeTracker* self, gboolean enabled) nothrow;
__gshared c_adw_swipe_tracker_set_enabledFn c_adw_swipe_tracker_set_enabled; ///
private alias c_adw_swipe_tracker_set_lower_overshootFn = extern(C) void function(AdwSwipeTracker* self, gboolean overshoot) nothrow;
__gshared c_adw_swipe_tracker_set_lower_overshootFn c_adw_swipe_tracker_set_lower_overshoot; ///
private alias c_adw_swipe_tracker_set_reversedFn = extern(C) void function(AdwSwipeTracker* self, gboolean reversed) nothrow;
__gshared c_adw_swipe_tracker_set_reversedFn c_adw_swipe_tracker_set_reversed; ///
private alias c_adw_swipe_tracker_set_upper_overshootFn = extern(C) void function(AdwSwipeTracker* self, gboolean overshoot) nothrow;
__gshared c_adw_swipe_tracker_set_upper_overshootFn c_adw_swipe_tracker_set_upper_overshoot; ///
private alias c_adw_swipe_tracker_shift_positionFn = extern(C) void function(AdwSwipeTracker* self, double delta) nothrow;
__gshared c_adw_swipe_tracker_shift_positionFn c_adw_swipe_tracker_shift_position; ///

// Swipeable
private alias c_adw_swipeable_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_swipeable_get_typeFn c_adw_swipeable_get_type; ///
private alias c_adw_swipeable_get_cancel_progressFn = extern(C) double function(AdwSwipeable* self) nothrow;
__gshared c_adw_swipeable_get_cancel_progressFn c_adw_swipeable_get_cancel_progress; ///
private alias c_adw_swipeable_get_distanceFn = extern(C) double function(AdwSwipeable* self) nothrow;
__gshared c_adw_swipeable_get_distanceFn c_adw_swipeable_get_distance; ///
private alias c_adw_swipeable_get_progressFn = extern(C) double function(AdwSwipeable* self) nothrow;
__gshared c_adw_swipeable_get_progressFn c_adw_swipeable_get_progress; ///
private alias c_adw_swipeable_get_snap_pointsFn = extern(C) double* function(AdwSwipeable* self, int* nSnapPoints) nothrow;
__gshared c_adw_swipeable_get_snap_pointsFn c_adw_swipeable_get_snap_points; ///
private alias c_adw_swipeable_get_swipe_areaFn = extern(C) void function(AdwSwipeable* self, AdwNavigationDirection navigationDirection, gboolean isDrag, GdkRectangle* rect) nothrow;
__gshared c_adw_swipeable_get_swipe_areaFn c_adw_swipeable_get_swipe_area; ///

// SwitchRow
private alias c_adw_switch_row_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_switch_row_get_typeFn c_adw_switch_row_get_type; ///
private alias c_adw_switch_row_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_adw_switch_row_newFn c_adw_switch_row_new; ///
private alias c_adw_switch_row_get_activeFn = extern(C) gboolean function(AdwSwitchRow* self) nothrow;
__gshared c_adw_switch_row_get_activeFn c_adw_switch_row_get_active; ///
private alias c_adw_switch_row_set_activeFn = extern(C) void function(AdwSwitchRow* self, gboolean isActive) nothrow;
__gshared c_adw_switch_row_set_activeFn c_adw_switch_row_set_active; ///

// TabBar
private alias c_adw_tab_bar_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_tab_bar_get_typeFn c_adw_tab_bar_get_type; ///
private alias c_adw_tab_bar_newFn = extern(C) AdwTabBar* function() nothrow;
__gshared c_adw_tab_bar_newFn c_adw_tab_bar_new; ///
private alias c_adw_tab_bar_get_autohideFn = extern(C) gboolean function(AdwTabBar* self) nothrow;
__gshared c_adw_tab_bar_get_autohideFn c_adw_tab_bar_get_autohide; ///
private alias c_adw_tab_bar_get_end_action_widgetFn = extern(C) GtkWidget* function(AdwTabBar* self) nothrow;
__gshared c_adw_tab_bar_get_end_action_widgetFn c_adw_tab_bar_get_end_action_widget; ///
private alias c_adw_tab_bar_get_expand_tabsFn = extern(C) gboolean function(AdwTabBar* self) nothrow;
__gshared c_adw_tab_bar_get_expand_tabsFn c_adw_tab_bar_get_expand_tabs; ///
private alias c_adw_tab_bar_get_extra_drag_preferred_actionFn = extern(C) GdkDragAction function(AdwTabBar* self) nothrow;
__gshared c_adw_tab_bar_get_extra_drag_preferred_actionFn c_adw_tab_bar_get_extra_drag_preferred_action; ///
private alias c_adw_tab_bar_get_extra_drag_preloadFn = extern(C) gboolean function(AdwTabBar* self) nothrow;
__gshared c_adw_tab_bar_get_extra_drag_preloadFn c_adw_tab_bar_get_extra_drag_preload; ///
private alias c_adw_tab_bar_get_invertedFn = extern(C) gboolean function(AdwTabBar* self) nothrow;
__gshared c_adw_tab_bar_get_invertedFn c_adw_tab_bar_get_inverted; ///
private alias c_adw_tab_bar_get_is_overflowingFn = extern(C) gboolean function(AdwTabBar* self) nothrow;
__gshared c_adw_tab_bar_get_is_overflowingFn c_adw_tab_bar_get_is_overflowing; ///
private alias c_adw_tab_bar_get_start_action_widgetFn = extern(C) GtkWidget* function(AdwTabBar* self) nothrow;
__gshared c_adw_tab_bar_get_start_action_widgetFn c_adw_tab_bar_get_start_action_widget; ///
private alias c_adw_tab_bar_get_tabs_revealedFn = extern(C) gboolean function(AdwTabBar* self) nothrow;
__gshared c_adw_tab_bar_get_tabs_revealedFn c_adw_tab_bar_get_tabs_revealed; ///
private alias c_adw_tab_bar_get_viewFn = extern(C) AdwTabView* function(AdwTabBar* self) nothrow;
__gshared c_adw_tab_bar_get_viewFn c_adw_tab_bar_get_view; ///
private alias c_adw_tab_bar_set_autohideFn = extern(C) void function(AdwTabBar* self, gboolean autohide) nothrow;
__gshared c_adw_tab_bar_set_autohideFn c_adw_tab_bar_set_autohide; ///
private alias c_adw_tab_bar_set_end_action_widgetFn = extern(C) void function(AdwTabBar* self, GtkWidget* widget) nothrow;
__gshared c_adw_tab_bar_set_end_action_widgetFn c_adw_tab_bar_set_end_action_widget; ///
private alias c_adw_tab_bar_set_expand_tabsFn = extern(C) void function(AdwTabBar* self, gboolean expandTabs) nothrow;
__gshared c_adw_tab_bar_set_expand_tabsFn c_adw_tab_bar_set_expand_tabs; ///
private alias c_adw_tab_bar_set_extra_drag_preloadFn = extern(C) void function(AdwTabBar* self, gboolean preload) nothrow;
__gshared c_adw_tab_bar_set_extra_drag_preloadFn c_adw_tab_bar_set_extra_drag_preload; ///
private alias c_adw_tab_bar_set_invertedFn = extern(C) void function(AdwTabBar* self, gboolean inverted) nothrow;
__gshared c_adw_tab_bar_set_invertedFn c_adw_tab_bar_set_inverted; ///
private alias c_adw_tab_bar_set_start_action_widgetFn = extern(C) void function(AdwTabBar* self, GtkWidget* widget) nothrow;
__gshared c_adw_tab_bar_set_start_action_widgetFn c_adw_tab_bar_set_start_action_widget; ///
private alias c_adw_tab_bar_set_viewFn = extern(C) void function(AdwTabBar* self, AdwTabView* view) nothrow;
__gshared c_adw_tab_bar_set_viewFn c_adw_tab_bar_set_view; ///
private alias c_adw_tab_bar_setup_extra_drop_targetFn = extern(C) void function(AdwTabBar* self, GdkDragAction actions, GType* types, size_t nTypes) nothrow;
__gshared c_adw_tab_bar_setup_extra_drop_targetFn c_adw_tab_bar_setup_extra_drop_target; ///

// TabButton
private alias c_adw_tab_button_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_tab_button_get_typeFn c_adw_tab_button_get_type; ///
private alias c_adw_tab_button_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_adw_tab_button_newFn c_adw_tab_button_new; ///
private alias c_adw_tab_button_get_viewFn = extern(C) AdwTabView* function(AdwTabButton* self) nothrow;
__gshared c_adw_tab_button_get_viewFn c_adw_tab_button_get_view; ///
private alias c_adw_tab_button_set_viewFn = extern(C) void function(AdwTabButton* self, AdwTabView* view) nothrow;
__gshared c_adw_tab_button_set_viewFn c_adw_tab_button_set_view; ///

// TabOverview
private alias c_adw_tab_overview_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_tab_overview_get_typeFn c_adw_tab_overview_get_type; ///
private alias c_adw_tab_overview_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_adw_tab_overview_newFn c_adw_tab_overview_new; ///
private alias c_adw_tab_overview_get_childFn = extern(C) GtkWidget* function(AdwTabOverview* self) nothrow;
__gshared c_adw_tab_overview_get_childFn c_adw_tab_overview_get_child; ///
private alias c_adw_tab_overview_get_enable_new_tabFn = extern(C) gboolean function(AdwTabOverview* self) nothrow;
__gshared c_adw_tab_overview_get_enable_new_tabFn c_adw_tab_overview_get_enable_new_tab; ///
private alias c_adw_tab_overview_get_enable_searchFn = extern(C) gboolean function(AdwTabOverview* self) nothrow;
__gshared c_adw_tab_overview_get_enable_searchFn c_adw_tab_overview_get_enable_search; ///
private alias c_adw_tab_overview_get_extra_drag_preferred_actionFn = extern(C) GdkDragAction function(AdwTabOverview* self) nothrow;
__gshared c_adw_tab_overview_get_extra_drag_preferred_actionFn c_adw_tab_overview_get_extra_drag_preferred_action; ///
private alias c_adw_tab_overview_get_extra_drag_preloadFn = extern(C) gboolean function(AdwTabOverview* self) nothrow;
__gshared c_adw_tab_overview_get_extra_drag_preloadFn c_adw_tab_overview_get_extra_drag_preload; ///
private alias c_adw_tab_overview_get_invertedFn = extern(C) gboolean function(AdwTabOverview* self) nothrow;
__gshared c_adw_tab_overview_get_invertedFn c_adw_tab_overview_get_inverted; ///
private alias c_adw_tab_overview_get_openFn = extern(C) gboolean function(AdwTabOverview* self) nothrow;
__gshared c_adw_tab_overview_get_openFn c_adw_tab_overview_get_open; ///
private alias c_adw_tab_overview_get_search_activeFn = extern(C) gboolean function(AdwTabOverview* self) nothrow;
__gshared c_adw_tab_overview_get_search_activeFn c_adw_tab_overview_get_search_active; ///
private alias c_adw_tab_overview_get_secondary_menuFn = extern(C) GMenuModel* function(AdwTabOverview* self) nothrow;
__gshared c_adw_tab_overview_get_secondary_menuFn c_adw_tab_overview_get_secondary_menu; ///
private alias c_adw_tab_overview_get_show_end_title_buttonsFn = extern(C) gboolean function(AdwTabOverview* self) nothrow;
__gshared c_adw_tab_overview_get_show_end_title_buttonsFn c_adw_tab_overview_get_show_end_title_buttons; ///
private alias c_adw_tab_overview_get_show_start_title_buttonsFn = extern(C) gboolean function(AdwTabOverview* self) nothrow;
__gshared c_adw_tab_overview_get_show_start_title_buttonsFn c_adw_tab_overview_get_show_start_title_buttons; ///
private alias c_adw_tab_overview_get_viewFn = extern(C) AdwTabView* function(AdwTabOverview* self) nothrow;
__gshared c_adw_tab_overview_get_viewFn c_adw_tab_overview_get_view; ///
private alias c_adw_tab_overview_set_childFn = extern(C) void function(AdwTabOverview* self, GtkWidget* child) nothrow;
__gshared c_adw_tab_overview_set_childFn c_adw_tab_overview_set_child; ///
private alias c_adw_tab_overview_set_enable_new_tabFn = extern(C) void function(AdwTabOverview* self, gboolean enableNewTab) nothrow;
__gshared c_adw_tab_overview_set_enable_new_tabFn c_adw_tab_overview_set_enable_new_tab; ///
private alias c_adw_tab_overview_set_enable_searchFn = extern(C) void function(AdwTabOverview* self, gboolean enableSearch) nothrow;
__gshared c_adw_tab_overview_set_enable_searchFn c_adw_tab_overview_set_enable_search; ///
private alias c_adw_tab_overview_set_extra_drag_preloadFn = extern(C) void function(AdwTabOverview* self, gboolean preload) nothrow;
__gshared c_adw_tab_overview_set_extra_drag_preloadFn c_adw_tab_overview_set_extra_drag_preload; ///
private alias c_adw_tab_overview_set_invertedFn = extern(C) void function(AdwTabOverview* self, gboolean inverted) nothrow;
__gshared c_adw_tab_overview_set_invertedFn c_adw_tab_overview_set_inverted; ///
private alias c_adw_tab_overview_set_openFn = extern(C) void function(AdwTabOverview* self, gboolean open) nothrow;
__gshared c_adw_tab_overview_set_openFn c_adw_tab_overview_set_open; ///
private alias c_adw_tab_overview_set_secondary_menuFn = extern(C) void function(AdwTabOverview* self, GMenuModel* secondaryMenu) nothrow;
__gshared c_adw_tab_overview_set_secondary_menuFn c_adw_tab_overview_set_secondary_menu; ///
private alias c_adw_tab_overview_set_show_end_title_buttonsFn = extern(C) void function(AdwTabOverview* self, gboolean showEndTitleButtons) nothrow;
__gshared c_adw_tab_overview_set_show_end_title_buttonsFn c_adw_tab_overview_set_show_end_title_buttons; ///
private alias c_adw_tab_overview_set_show_start_title_buttonsFn = extern(C) void function(AdwTabOverview* self, gboolean showStartTitleButtons) nothrow;
__gshared c_adw_tab_overview_set_show_start_title_buttonsFn c_adw_tab_overview_set_show_start_title_buttons; ///
private alias c_adw_tab_overview_set_viewFn = extern(C) void function(AdwTabOverview* self, AdwTabView* view) nothrow;
__gshared c_adw_tab_overview_set_viewFn c_adw_tab_overview_set_view; ///
private alias c_adw_tab_overview_setup_extra_drop_targetFn = extern(C) void function(AdwTabOverview* self, GdkDragAction actions, GType* types, size_t nTypes) nothrow;
__gshared c_adw_tab_overview_setup_extra_drop_targetFn c_adw_tab_overview_setup_extra_drop_target; ///

// TabPage
private alias c_adw_tab_page_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_tab_page_get_typeFn c_adw_tab_page_get_type; ///
private alias c_adw_tab_page_get_childFn = extern(C) GtkWidget* function(AdwTabPage* self) nothrow;
__gshared c_adw_tab_page_get_childFn c_adw_tab_page_get_child; ///
private alias c_adw_tab_page_get_iconFn = extern(C) GIcon* function(AdwTabPage* self) nothrow;
__gshared c_adw_tab_page_get_iconFn c_adw_tab_page_get_icon; ///
private alias c_adw_tab_page_get_indicator_activatableFn = extern(C) gboolean function(AdwTabPage* self) nothrow;
__gshared c_adw_tab_page_get_indicator_activatableFn c_adw_tab_page_get_indicator_activatable; ///
private alias c_adw_tab_page_get_indicator_iconFn = extern(C) GIcon* function(AdwTabPage* self) nothrow;
__gshared c_adw_tab_page_get_indicator_iconFn c_adw_tab_page_get_indicator_icon; ///
private alias c_adw_tab_page_get_indicator_tooltipFn = extern(C) const(char)* function(AdwTabPage* self) nothrow;
__gshared c_adw_tab_page_get_indicator_tooltipFn c_adw_tab_page_get_indicator_tooltip; ///
private alias c_adw_tab_page_get_keywordFn = extern(C) const(char)* function(AdwTabPage* self) nothrow;
__gshared c_adw_tab_page_get_keywordFn c_adw_tab_page_get_keyword; ///
private alias c_adw_tab_page_get_live_thumbnailFn = extern(C) gboolean function(AdwTabPage* self) nothrow;
__gshared c_adw_tab_page_get_live_thumbnailFn c_adw_tab_page_get_live_thumbnail; ///
private alias c_adw_tab_page_get_loadingFn = extern(C) gboolean function(AdwTabPage* self) nothrow;
__gshared c_adw_tab_page_get_loadingFn c_adw_tab_page_get_loading; ///
private alias c_adw_tab_page_get_needs_attentionFn = extern(C) gboolean function(AdwTabPage* self) nothrow;
__gshared c_adw_tab_page_get_needs_attentionFn c_adw_tab_page_get_needs_attention; ///
private alias c_adw_tab_page_get_parentFn = extern(C) AdwTabPage* function(AdwTabPage* self) nothrow;
__gshared c_adw_tab_page_get_parentFn c_adw_tab_page_get_parent; ///
private alias c_adw_tab_page_get_pinnedFn = extern(C) gboolean function(AdwTabPage* self) nothrow;
__gshared c_adw_tab_page_get_pinnedFn c_adw_tab_page_get_pinned; ///
private alias c_adw_tab_page_get_selectedFn = extern(C) gboolean function(AdwTabPage* self) nothrow;
__gshared c_adw_tab_page_get_selectedFn c_adw_tab_page_get_selected; ///
private alias c_adw_tab_page_get_thumbnail_xalignFn = extern(C) float function(AdwTabPage* self) nothrow;
__gshared c_adw_tab_page_get_thumbnail_xalignFn c_adw_tab_page_get_thumbnail_xalign; ///
private alias c_adw_tab_page_get_thumbnail_yalignFn = extern(C) float function(AdwTabPage* self) nothrow;
__gshared c_adw_tab_page_get_thumbnail_yalignFn c_adw_tab_page_get_thumbnail_yalign; ///
private alias c_adw_tab_page_get_titleFn = extern(C) const(char)* function(AdwTabPage* self) nothrow;
__gshared c_adw_tab_page_get_titleFn c_adw_tab_page_get_title; ///
private alias c_adw_tab_page_get_tooltipFn = extern(C) const(char)* function(AdwTabPage* self) nothrow;
__gshared c_adw_tab_page_get_tooltipFn c_adw_tab_page_get_tooltip; ///
private alias c_adw_tab_page_invalidate_thumbnailFn = extern(C) void function(AdwTabPage* self) nothrow;
__gshared c_adw_tab_page_invalidate_thumbnailFn c_adw_tab_page_invalidate_thumbnail; ///
private alias c_adw_tab_page_set_iconFn = extern(C) void function(AdwTabPage* self, GIcon* icon) nothrow;
__gshared c_adw_tab_page_set_iconFn c_adw_tab_page_set_icon; ///
private alias c_adw_tab_page_set_indicator_activatableFn = extern(C) void function(AdwTabPage* self, gboolean activatable) nothrow;
__gshared c_adw_tab_page_set_indicator_activatableFn c_adw_tab_page_set_indicator_activatable; ///
private alias c_adw_tab_page_set_indicator_iconFn = extern(C) void function(AdwTabPage* self, GIcon* indicatorIcon) nothrow;
__gshared c_adw_tab_page_set_indicator_iconFn c_adw_tab_page_set_indicator_icon; ///
private alias c_adw_tab_page_set_indicator_tooltipFn = extern(C) void function(AdwTabPage* self, const(char)* tooltip) nothrow;
__gshared c_adw_tab_page_set_indicator_tooltipFn c_adw_tab_page_set_indicator_tooltip; ///
private alias c_adw_tab_page_set_keywordFn = extern(C) void function(AdwTabPage* self, const(char)* keyword) nothrow;
__gshared c_adw_tab_page_set_keywordFn c_adw_tab_page_set_keyword; ///
private alias c_adw_tab_page_set_live_thumbnailFn = extern(C) void function(AdwTabPage* self, gboolean liveThumbnail) nothrow;
__gshared c_adw_tab_page_set_live_thumbnailFn c_adw_tab_page_set_live_thumbnail; ///
private alias c_adw_tab_page_set_loadingFn = extern(C) void function(AdwTabPage* self, gboolean loading) nothrow;
__gshared c_adw_tab_page_set_loadingFn c_adw_tab_page_set_loading; ///
private alias c_adw_tab_page_set_needs_attentionFn = extern(C) void function(AdwTabPage* self, gboolean needsAttention) nothrow;
__gshared c_adw_tab_page_set_needs_attentionFn c_adw_tab_page_set_needs_attention; ///
private alias c_adw_tab_page_set_thumbnail_xalignFn = extern(C) void function(AdwTabPage* self, float xalign) nothrow;
__gshared c_adw_tab_page_set_thumbnail_xalignFn c_adw_tab_page_set_thumbnail_xalign; ///
private alias c_adw_tab_page_set_thumbnail_yalignFn = extern(C) void function(AdwTabPage* self, float yalign) nothrow;
__gshared c_adw_tab_page_set_thumbnail_yalignFn c_adw_tab_page_set_thumbnail_yalign; ///
private alias c_adw_tab_page_set_titleFn = extern(C) void function(AdwTabPage* self, const(char)* title) nothrow;
__gshared c_adw_tab_page_set_titleFn c_adw_tab_page_set_title; ///
private alias c_adw_tab_page_set_tooltipFn = extern(C) void function(AdwTabPage* self, const(char)* tooltip) nothrow;
__gshared c_adw_tab_page_set_tooltipFn c_adw_tab_page_set_tooltip; ///

// TabView
private alias c_adw_tab_view_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_tab_view_get_typeFn c_adw_tab_view_get_type; ///
private alias c_adw_tab_view_newFn = extern(C) AdwTabView* function() nothrow;
__gshared c_adw_tab_view_newFn c_adw_tab_view_new; ///
private alias c_adw_tab_view_add_pageFn = extern(C) AdwTabPage* function(AdwTabView* self, GtkWidget* child, AdwTabPage* parent) nothrow;
__gshared c_adw_tab_view_add_pageFn c_adw_tab_view_add_page; ///
private alias c_adw_tab_view_add_shortcutsFn = extern(C) void function(AdwTabView* self, AdwTabViewShortcuts shortcuts) nothrow;
__gshared c_adw_tab_view_add_shortcutsFn c_adw_tab_view_add_shortcuts; ///
private alias c_adw_tab_view_appendFn = extern(C) AdwTabPage* function(AdwTabView* self, GtkWidget* child) nothrow;
__gshared c_adw_tab_view_appendFn c_adw_tab_view_append; ///
private alias c_adw_tab_view_append_pinnedFn = extern(C) AdwTabPage* function(AdwTabView* self, GtkWidget* child) nothrow;
__gshared c_adw_tab_view_append_pinnedFn c_adw_tab_view_append_pinned; ///
private alias c_adw_tab_view_close_other_pagesFn = extern(C) void function(AdwTabView* self, AdwTabPage* page) nothrow;
__gshared c_adw_tab_view_close_other_pagesFn c_adw_tab_view_close_other_pages; ///
private alias c_adw_tab_view_close_pageFn = extern(C) void function(AdwTabView* self, AdwTabPage* page) nothrow;
__gshared c_adw_tab_view_close_pageFn c_adw_tab_view_close_page; ///
private alias c_adw_tab_view_close_page_finishFn = extern(C) void function(AdwTabView* self, AdwTabPage* page, gboolean confirm) nothrow;
__gshared c_adw_tab_view_close_page_finishFn c_adw_tab_view_close_page_finish; ///
private alias c_adw_tab_view_close_pages_afterFn = extern(C) void function(AdwTabView* self, AdwTabPage* page) nothrow;
__gshared c_adw_tab_view_close_pages_afterFn c_adw_tab_view_close_pages_after; ///
private alias c_adw_tab_view_close_pages_beforeFn = extern(C) void function(AdwTabView* self, AdwTabPage* page) nothrow;
__gshared c_adw_tab_view_close_pages_beforeFn c_adw_tab_view_close_pages_before; ///
private alias c_adw_tab_view_get_default_iconFn = extern(C) GIcon* function(AdwTabView* self) nothrow;
__gshared c_adw_tab_view_get_default_iconFn c_adw_tab_view_get_default_icon; ///
private alias c_adw_tab_view_get_is_transferring_pageFn = extern(C) gboolean function(AdwTabView* self) nothrow;
__gshared c_adw_tab_view_get_is_transferring_pageFn c_adw_tab_view_get_is_transferring_page; ///
private alias c_adw_tab_view_get_menu_modelFn = extern(C) GMenuModel* function(AdwTabView* self) nothrow;
__gshared c_adw_tab_view_get_menu_modelFn c_adw_tab_view_get_menu_model; ///
private alias c_adw_tab_view_get_n_pagesFn = extern(C) int function(AdwTabView* self) nothrow;
__gshared c_adw_tab_view_get_n_pagesFn c_adw_tab_view_get_n_pages; ///
private alias c_adw_tab_view_get_n_pinned_pagesFn = extern(C) int function(AdwTabView* self) nothrow;
__gshared c_adw_tab_view_get_n_pinned_pagesFn c_adw_tab_view_get_n_pinned_pages; ///
private alias c_adw_tab_view_get_nth_pageFn = extern(C) AdwTabPage* function(AdwTabView* self, int position) nothrow;
__gshared c_adw_tab_view_get_nth_pageFn c_adw_tab_view_get_nth_page; ///
private alias c_adw_tab_view_get_pageFn = extern(C) AdwTabPage* function(AdwTabView* self, GtkWidget* child) nothrow;
__gshared c_adw_tab_view_get_pageFn c_adw_tab_view_get_page; ///
private alias c_adw_tab_view_get_page_positionFn = extern(C) int function(AdwTabView* self, AdwTabPage* page) nothrow;
__gshared c_adw_tab_view_get_page_positionFn c_adw_tab_view_get_page_position; ///
private alias c_adw_tab_view_get_pagesFn = extern(C) GtkSelectionModel* function(AdwTabView* self) nothrow;
__gshared c_adw_tab_view_get_pagesFn c_adw_tab_view_get_pages; ///
private alias c_adw_tab_view_get_selected_pageFn = extern(C) AdwTabPage* function(AdwTabView* self) nothrow;
__gshared c_adw_tab_view_get_selected_pageFn c_adw_tab_view_get_selected_page; ///
private alias c_adw_tab_view_get_shortcutsFn = extern(C) AdwTabViewShortcuts function(AdwTabView* self) nothrow;
__gshared c_adw_tab_view_get_shortcutsFn c_adw_tab_view_get_shortcuts; ///
private alias c_adw_tab_view_insertFn = extern(C) AdwTabPage* function(AdwTabView* self, GtkWidget* child, int position) nothrow;
__gshared c_adw_tab_view_insertFn c_adw_tab_view_insert; ///
private alias c_adw_tab_view_insert_pinnedFn = extern(C) AdwTabPage* function(AdwTabView* self, GtkWidget* child, int position) nothrow;
__gshared c_adw_tab_view_insert_pinnedFn c_adw_tab_view_insert_pinned; ///
private alias c_adw_tab_view_invalidate_thumbnailsFn = extern(C) void function(AdwTabView* self) nothrow;
__gshared c_adw_tab_view_invalidate_thumbnailsFn c_adw_tab_view_invalidate_thumbnails; ///
private alias c_adw_tab_view_prependFn = extern(C) AdwTabPage* function(AdwTabView* self, GtkWidget* child) nothrow;
__gshared c_adw_tab_view_prependFn c_adw_tab_view_prepend; ///
private alias c_adw_tab_view_prepend_pinnedFn = extern(C) AdwTabPage* function(AdwTabView* self, GtkWidget* child) nothrow;
__gshared c_adw_tab_view_prepend_pinnedFn c_adw_tab_view_prepend_pinned; ///
private alias c_adw_tab_view_remove_shortcutsFn = extern(C) void function(AdwTabView* self, AdwTabViewShortcuts shortcuts) nothrow;
__gshared c_adw_tab_view_remove_shortcutsFn c_adw_tab_view_remove_shortcuts; ///
private alias c_adw_tab_view_reorder_backwardFn = extern(C) gboolean function(AdwTabView* self, AdwTabPage* page) nothrow;
__gshared c_adw_tab_view_reorder_backwardFn c_adw_tab_view_reorder_backward; ///
private alias c_adw_tab_view_reorder_firstFn = extern(C) gboolean function(AdwTabView* self, AdwTabPage* page) nothrow;
__gshared c_adw_tab_view_reorder_firstFn c_adw_tab_view_reorder_first; ///
private alias c_adw_tab_view_reorder_forwardFn = extern(C) gboolean function(AdwTabView* self, AdwTabPage* page) nothrow;
__gshared c_adw_tab_view_reorder_forwardFn c_adw_tab_view_reorder_forward; ///
private alias c_adw_tab_view_reorder_lastFn = extern(C) gboolean function(AdwTabView* self, AdwTabPage* page) nothrow;
__gshared c_adw_tab_view_reorder_lastFn c_adw_tab_view_reorder_last; ///
private alias c_adw_tab_view_reorder_pageFn = extern(C) gboolean function(AdwTabView* self, AdwTabPage* page, int position) nothrow;
__gshared c_adw_tab_view_reorder_pageFn c_adw_tab_view_reorder_page; ///
private alias c_adw_tab_view_select_next_pageFn = extern(C) gboolean function(AdwTabView* self) nothrow;
__gshared c_adw_tab_view_select_next_pageFn c_adw_tab_view_select_next_page; ///
private alias c_adw_tab_view_select_previous_pageFn = extern(C) gboolean function(AdwTabView* self) nothrow;
__gshared c_adw_tab_view_select_previous_pageFn c_adw_tab_view_select_previous_page; ///
private alias c_adw_tab_view_set_default_iconFn = extern(C) void function(AdwTabView* self, GIcon* defaultIcon) nothrow;
__gshared c_adw_tab_view_set_default_iconFn c_adw_tab_view_set_default_icon; ///
private alias c_adw_tab_view_set_menu_modelFn = extern(C) void function(AdwTabView* self, GMenuModel* menuModel) nothrow;
__gshared c_adw_tab_view_set_menu_modelFn c_adw_tab_view_set_menu_model; ///
private alias c_adw_tab_view_set_page_pinnedFn = extern(C) void function(AdwTabView* self, AdwTabPage* page, gboolean pinned) nothrow;
__gshared c_adw_tab_view_set_page_pinnedFn c_adw_tab_view_set_page_pinned; ///
private alias c_adw_tab_view_set_selected_pageFn = extern(C) void function(AdwTabView* self, AdwTabPage* selectedPage) nothrow;
__gshared c_adw_tab_view_set_selected_pageFn c_adw_tab_view_set_selected_page; ///
private alias c_adw_tab_view_set_shortcutsFn = extern(C) void function(AdwTabView* self, AdwTabViewShortcuts shortcuts) nothrow;
__gshared c_adw_tab_view_set_shortcutsFn c_adw_tab_view_set_shortcuts; ///
private alias c_adw_tab_view_transfer_pageFn = extern(C) void function(AdwTabView* self, AdwTabPage* page, AdwTabView* otherView, int position) nothrow;
__gshared c_adw_tab_view_transfer_pageFn c_adw_tab_view_transfer_page; ///

// TimedAnimation
private alias c_adw_timed_animation_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_timed_animation_get_typeFn c_adw_timed_animation_get_type; ///
private alias c_adw_timed_animation_newFn = extern(C) AdwAnimation* function(GtkWidget* widget, double from, double to, uint duration, AdwAnimationTarget* target) nothrow;
__gshared c_adw_timed_animation_newFn c_adw_timed_animation_new; ///
private alias c_adw_timed_animation_get_alternateFn = extern(C) gboolean function(AdwTimedAnimation* self) nothrow;
__gshared c_adw_timed_animation_get_alternateFn c_adw_timed_animation_get_alternate; ///
private alias c_adw_timed_animation_get_durationFn = extern(C) uint function(AdwTimedAnimation* self) nothrow;
__gshared c_adw_timed_animation_get_durationFn c_adw_timed_animation_get_duration; ///
private alias c_adw_timed_animation_get_easingFn = extern(C) AdwEasing function(AdwTimedAnimation* self) nothrow;
__gshared c_adw_timed_animation_get_easingFn c_adw_timed_animation_get_easing; ///
private alias c_adw_timed_animation_get_repeat_countFn = extern(C) uint function(AdwTimedAnimation* self) nothrow;
__gshared c_adw_timed_animation_get_repeat_countFn c_adw_timed_animation_get_repeat_count; ///
private alias c_adw_timed_animation_get_reverseFn = extern(C) gboolean function(AdwTimedAnimation* self) nothrow;
__gshared c_adw_timed_animation_get_reverseFn c_adw_timed_animation_get_reverse; ///
private alias c_adw_timed_animation_get_value_fromFn = extern(C) double function(AdwTimedAnimation* self) nothrow;
__gshared c_adw_timed_animation_get_value_fromFn c_adw_timed_animation_get_value_from; ///
private alias c_adw_timed_animation_get_value_toFn = extern(C) double function(AdwTimedAnimation* self) nothrow;
__gshared c_adw_timed_animation_get_value_toFn c_adw_timed_animation_get_value_to; ///
private alias c_adw_timed_animation_set_alternateFn = extern(C) void function(AdwTimedAnimation* self, gboolean alternate) nothrow;
__gshared c_adw_timed_animation_set_alternateFn c_adw_timed_animation_set_alternate; ///
private alias c_adw_timed_animation_set_durationFn = extern(C) void function(AdwTimedAnimation* self, uint duration) nothrow;
__gshared c_adw_timed_animation_set_durationFn c_adw_timed_animation_set_duration; ///
private alias c_adw_timed_animation_set_easingFn = extern(C) void function(AdwTimedAnimation* self, AdwEasing easing) nothrow;
__gshared c_adw_timed_animation_set_easingFn c_adw_timed_animation_set_easing; ///
private alias c_adw_timed_animation_set_repeat_countFn = extern(C) void function(AdwTimedAnimation* self, uint repeatCount) nothrow;
__gshared c_adw_timed_animation_set_repeat_countFn c_adw_timed_animation_set_repeat_count; ///
private alias c_adw_timed_animation_set_reverseFn = extern(C) void function(AdwTimedAnimation* self, gboolean reverse) nothrow;
__gshared c_adw_timed_animation_set_reverseFn c_adw_timed_animation_set_reverse; ///
private alias c_adw_timed_animation_set_value_fromFn = extern(C) void function(AdwTimedAnimation* self, double value) nothrow;
__gshared c_adw_timed_animation_set_value_fromFn c_adw_timed_animation_set_value_from; ///
private alias c_adw_timed_animation_set_value_toFn = extern(C) void function(AdwTimedAnimation* self, double value) nothrow;
__gshared c_adw_timed_animation_set_value_toFn c_adw_timed_animation_set_value_to; ///

// Toast
private alias c_adw_toast_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_toast_get_typeFn c_adw_toast_get_type; ///
private alias c_adw_toast_newFn = extern(C) AdwToast* function(const(char)* title) nothrow;
__gshared c_adw_toast_newFn c_adw_toast_new; ///
private alias c_adw_toast_new_formatFn = extern(C) AdwToast* function(const(char)* format,  ...) nothrow;
__gshared c_adw_toast_new_formatFn c_adw_toast_new_format; ///
private alias c_adw_toast_dismissFn = extern(C) void function(AdwToast* self) nothrow;
__gshared c_adw_toast_dismissFn c_adw_toast_dismiss; ///
private alias c_adw_toast_get_action_nameFn = extern(C) const(char)* function(AdwToast* self) nothrow;
__gshared c_adw_toast_get_action_nameFn c_adw_toast_get_action_name; ///
private alias c_adw_toast_get_action_target_valueFn = extern(C) GVariant* function(AdwToast* self) nothrow;
__gshared c_adw_toast_get_action_target_valueFn c_adw_toast_get_action_target_value; ///
private alias c_adw_toast_get_button_labelFn = extern(C) const(char)* function(AdwToast* self) nothrow;
__gshared c_adw_toast_get_button_labelFn c_adw_toast_get_button_label; ///
private alias c_adw_toast_get_custom_titleFn = extern(C) GtkWidget* function(AdwToast* self) nothrow;
__gshared c_adw_toast_get_custom_titleFn c_adw_toast_get_custom_title; ///
private alias c_adw_toast_get_priorityFn = extern(C) AdwToastPriority function(AdwToast* self) nothrow;
__gshared c_adw_toast_get_priorityFn c_adw_toast_get_priority; ///
private alias c_adw_toast_get_timeoutFn = extern(C) uint function(AdwToast* self) nothrow;
__gshared c_adw_toast_get_timeoutFn c_adw_toast_get_timeout; ///
private alias c_adw_toast_get_titleFn = extern(C) const(char)* function(AdwToast* self) nothrow;
__gshared c_adw_toast_get_titleFn c_adw_toast_get_title; ///
private alias c_adw_toast_get_use_markupFn = extern(C) gboolean function(AdwToast* self) nothrow;
__gshared c_adw_toast_get_use_markupFn c_adw_toast_get_use_markup; ///
private alias c_adw_toast_set_action_nameFn = extern(C) void function(AdwToast* self, const(char)* actionName) nothrow;
__gshared c_adw_toast_set_action_nameFn c_adw_toast_set_action_name; ///
private alias c_adw_toast_set_action_targetFn = extern(C) void function(AdwToast* self, const(char)* formatString,  ...) nothrow;
__gshared c_adw_toast_set_action_targetFn c_adw_toast_set_action_target; ///
private alias c_adw_toast_set_action_target_valueFn = extern(C) void function(AdwToast* self, GVariant* actionTarget) nothrow;
__gshared c_adw_toast_set_action_target_valueFn c_adw_toast_set_action_target_value; ///
private alias c_adw_toast_set_button_labelFn = extern(C) void function(AdwToast* self, const(char)* buttonLabel) nothrow;
__gshared c_adw_toast_set_button_labelFn c_adw_toast_set_button_label; ///
private alias c_adw_toast_set_custom_titleFn = extern(C) void function(AdwToast* self, GtkWidget* widget) nothrow;
__gshared c_adw_toast_set_custom_titleFn c_adw_toast_set_custom_title; ///
private alias c_adw_toast_set_detailed_action_nameFn = extern(C) void function(AdwToast* self, const(char)* detailedActionName) nothrow;
__gshared c_adw_toast_set_detailed_action_nameFn c_adw_toast_set_detailed_action_name; ///
private alias c_adw_toast_set_priorityFn = extern(C) void function(AdwToast* self, AdwToastPriority priority) nothrow;
__gshared c_adw_toast_set_priorityFn c_adw_toast_set_priority; ///
private alias c_adw_toast_set_timeoutFn = extern(C) void function(AdwToast* self, uint timeout) nothrow;
__gshared c_adw_toast_set_timeoutFn c_adw_toast_set_timeout; ///
private alias c_adw_toast_set_titleFn = extern(C) void function(AdwToast* self, const(char)* title) nothrow;
__gshared c_adw_toast_set_titleFn c_adw_toast_set_title; ///
private alias c_adw_toast_set_use_markupFn = extern(C) void function(AdwToast* self, gboolean useMarkup) nothrow;
__gshared c_adw_toast_set_use_markupFn c_adw_toast_set_use_markup; ///

// ToastOverlay
private alias c_adw_toast_overlay_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_toast_overlay_get_typeFn c_adw_toast_overlay_get_type; ///
private alias c_adw_toast_overlay_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_adw_toast_overlay_newFn c_adw_toast_overlay_new; ///
private alias c_adw_toast_overlay_add_toastFn = extern(C) void function(AdwToastOverlay* self, AdwToast* toast) nothrow;
__gshared c_adw_toast_overlay_add_toastFn c_adw_toast_overlay_add_toast; ///
private alias c_adw_toast_overlay_dismiss_allFn = extern(C) void function(AdwToastOverlay* self) nothrow;
__gshared c_adw_toast_overlay_dismiss_allFn c_adw_toast_overlay_dismiss_all; ///
private alias c_adw_toast_overlay_get_childFn = extern(C) GtkWidget* function(AdwToastOverlay* self) nothrow;
__gshared c_adw_toast_overlay_get_childFn c_adw_toast_overlay_get_child; ///
private alias c_adw_toast_overlay_set_childFn = extern(C) void function(AdwToastOverlay* self, GtkWidget* child) nothrow;
__gshared c_adw_toast_overlay_set_childFn c_adw_toast_overlay_set_child; ///

// Toggle
private alias c_adw_toggle_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_toggle_get_typeFn c_adw_toggle_get_type; ///
private alias c_adw_toggle_newFn = extern(C) AdwToggle* function() nothrow;
__gshared c_adw_toggle_newFn c_adw_toggle_new; ///
private alias c_adw_toggle_get_childFn = extern(C) GtkWidget* function(AdwToggle* self) nothrow;
__gshared c_adw_toggle_get_childFn c_adw_toggle_get_child; ///
private alias c_adw_toggle_get_descriptionFn = extern(C) const(char)* function(AdwToggle* self) nothrow;
__gshared c_adw_toggle_get_descriptionFn c_adw_toggle_get_description; ///
private alias c_adw_toggle_get_enabledFn = extern(C) gboolean function(AdwToggle* self) nothrow;
__gshared c_adw_toggle_get_enabledFn c_adw_toggle_get_enabled; ///
private alias c_adw_toggle_get_icon_nameFn = extern(C) const(char)* function(AdwToggle* self) nothrow;
__gshared c_adw_toggle_get_icon_nameFn c_adw_toggle_get_icon_name; ///
private alias c_adw_toggle_get_indexFn = extern(C) uint function(AdwToggle* self) nothrow;
__gshared c_adw_toggle_get_indexFn c_adw_toggle_get_index; ///
private alias c_adw_toggle_get_labelFn = extern(C) const(char)* function(AdwToggle* self) nothrow;
__gshared c_adw_toggle_get_labelFn c_adw_toggle_get_label; ///
private alias c_adw_toggle_get_nameFn = extern(C) const(char)* function(AdwToggle* self) nothrow;
__gshared c_adw_toggle_get_nameFn c_adw_toggle_get_name; ///
private alias c_adw_toggle_get_tooltipFn = extern(C) const(char)* function(AdwToggle* self) nothrow;
__gshared c_adw_toggle_get_tooltipFn c_adw_toggle_get_tooltip; ///
private alias c_adw_toggle_get_use_underlineFn = extern(C) gboolean function(AdwToggle* self) nothrow;
__gshared c_adw_toggle_get_use_underlineFn c_adw_toggle_get_use_underline; ///
private alias c_adw_toggle_set_childFn = extern(C) void function(AdwToggle* self, GtkWidget* child) nothrow;
__gshared c_adw_toggle_set_childFn c_adw_toggle_set_child; ///
private alias c_adw_toggle_set_descriptionFn = extern(C) void function(AdwToggle* self, const(char)* description) nothrow;
__gshared c_adw_toggle_set_descriptionFn c_adw_toggle_set_description; ///
private alias c_adw_toggle_set_enabledFn = extern(C) void function(AdwToggle* self, gboolean enabled) nothrow;
__gshared c_adw_toggle_set_enabledFn c_adw_toggle_set_enabled; ///
private alias c_adw_toggle_set_icon_nameFn = extern(C) void function(AdwToggle* self, const(char)* iconName) nothrow;
__gshared c_adw_toggle_set_icon_nameFn c_adw_toggle_set_icon_name; ///
private alias c_adw_toggle_set_labelFn = extern(C) void function(AdwToggle* self, const(char)* label) nothrow;
__gshared c_adw_toggle_set_labelFn c_adw_toggle_set_label; ///
private alias c_adw_toggle_set_nameFn = extern(C) void function(AdwToggle* self, const(char)* name) nothrow;
__gshared c_adw_toggle_set_nameFn c_adw_toggle_set_name; ///
private alias c_adw_toggle_set_tooltipFn = extern(C) void function(AdwToggle* self, const(char)* tooltip) nothrow;
__gshared c_adw_toggle_set_tooltipFn c_adw_toggle_set_tooltip; ///
private alias c_adw_toggle_set_use_underlineFn = extern(C) void function(AdwToggle* self, gboolean useUnderline) nothrow;
__gshared c_adw_toggle_set_use_underlineFn c_adw_toggle_set_use_underline; ///

// ToggleGroup
private alias c_adw_toggle_group_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_toggle_group_get_typeFn c_adw_toggle_group_get_type; ///
private alias c_adw_toggle_group_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_adw_toggle_group_newFn c_adw_toggle_group_new; ///
private alias c_adw_toggle_group_addFn = extern(C) void function(AdwToggleGroup* self, AdwToggle* toggle) nothrow;
__gshared c_adw_toggle_group_addFn c_adw_toggle_group_add; ///
private alias c_adw_toggle_group_get_activeFn = extern(C) uint function(AdwToggleGroup* self) nothrow;
__gshared c_adw_toggle_group_get_activeFn c_adw_toggle_group_get_active; ///
private alias c_adw_toggle_group_get_active_nameFn = extern(C) const(char)* function(AdwToggleGroup* self) nothrow;
__gshared c_adw_toggle_group_get_active_nameFn c_adw_toggle_group_get_active_name; ///
private alias c_adw_toggle_group_get_can_shrinkFn = extern(C) gboolean function(AdwToggleGroup* self) nothrow;
__gshared c_adw_toggle_group_get_can_shrinkFn c_adw_toggle_group_get_can_shrink; ///
private alias c_adw_toggle_group_get_homogeneousFn = extern(C) gboolean function(AdwToggleGroup* self) nothrow;
__gshared c_adw_toggle_group_get_homogeneousFn c_adw_toggle_group_get_homogeneous; ///
private alias c_adw_toggle_group_get_n_togglesFn = extern(C) uint function(AdwToggleGroup* self) nothrow;
__gshared c_adw_toggle_group_get_n_togglesFn c_adw_toggle_group_get_n_toggles; ///
private alias c_adw_toggle_group_get_toggleFn = extern(C) AdwToggle* function(AdwToggleGroup* self, uint index) nothrow;
__gshared c_adw_toggle_group_get_toggleFn c_adw_toggle_group_get_toggle; ///
private alias c_adw_toggle_group_get_toggle_by_nameFn = extern(C) AdwToggle* function(AdwToggleGroup* self, const(char)* name) nothrow;
__gshared c_adw_toggle_group_get_toggle_by_nameFn c_adw_toggle_group_get_toggle_by_name; ///
private alias c_adw_toggle_group_get_togglesFn = extern(C) GtkSelectionModel* function(AdwToggleGroup* self) nothrow;
__gshared c_adw_toggle_group_get_togglesFn c_adw_toggle_group_get_toggles; ///
private alias c_adw_toggle_group_removeFn = extern(C) void function(AdwToggleGroup* self, AdwToggle* toggle) nothrow;
__gshared c_adw_toggle_group_removeFn c_adw_toggle_group_remove; ///
private alias c_adw_toggle_group_remove_allFn = extern(C) void function(AdwToggleGroup* self) nothrow;
__gshared c_adw_toggle_group_remove_allFn c_adw_toggle_group_remove_all; ///
private alias c_adw_toggle_group_set_activeFn = extern(C) void function(AdwToggleGroup* self, uint active) nothrow;
__gshared c_adw_toggle_group_set_activeFn c_adw_toggle_group_set_active; ///
private alias c_adw_toggle_group_set_active_nameFn = extern(C) void function(AdwToggleGroup* self, const(char)* name) nothrow;
__gshared c_adw_toggle_group_set_active_nameFn c_adw_toggle_group_set_active_name; ///
private alias c_adw_toggle_group_set_can_shrinkFn = extern(C) void function(AdwToggleGroup* self, gboolean canShrink) nothrow;
__gshared c_adw_toggle_group_set_can_shrinkFn c_adw_toggle_group_set_can_shrink; ///
private alias c_adw_toggle_group_set_homogeneousFn = extern(C) void function(AdwToggleGroup* self, gboolean homogeneous) nothrow;
__gshared c_adw_toggle_group_set_homogeneousFn c_adw_toggle_group_set_homogeneous; ///

// ToolbarView
private alias c_adw_toolbar_view_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_toolbar_view_get_typeFn c_adw_toolbar_view_get_type; ///
private alias c_adw_toolbar_view_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_adw_toolbar_view_newFn c_adw_toolbar_view_new; ///
private alias c_adw_toolbar_view_add_bottom_barFn = extern(C) void function(AdwToolbarView* self, GtkWidget* widget) nothrow;
__gshared c_adw_toolbar_view_add_bottom_barFn c_adw_toolbar_view_add_bottom_bar; ///
private alias c_adw_toolbar_view_add_top_barFn = extern(C) void function(AdwToolbarView* self, GtkWidget* widget) nothrow;
__gshared c_adw_toolbar_view_add_top_barFn c_adw_toolbar_view_add_top_bar; ///
private alias c_adw_toolbar_view_get_bottom_bar_heightFn = extern(C) int function(AdwToolbarView* self) nothrow;
__gshared c_adw_toolbar_view_get_bottom_bar_heightFn c_adw_toolbar_view_get_bottom_bar_height; ///
private alias c_adw_toolbar_view_get_bottom_bar_styleFn = extern(C) AdwToolbarStyle function(AdwToolbarView* self) nothrow;
__gshared c_adw_toolbar_view_get_bottom_bar_styleFn c_adw_toolbar_view_get_bottom_bar_style; ///
private alias c_adw_toolbar_view_get_contentFn = extern(C) GtkWidget* function(AdwToolbarView* self) nothrow;
__gshared c_adw_toolbar_view_get_contentFn c_adw_toolbar_view_get_content; ///
private alias c_adw_toolbar_view_get_extend_content_to_bottom_edgeFn = extern(C) gboolean function(AdwToolbarView* self) nothrow;
__gshared c_adw_toolbar_view_get_extend_content_to_bottom_edgeFn c_adw_toolbar_view_get_extend_content_to_bottom_edge; ///
private alias c_adw_toolbar_view_get_extend_content_to_top_edgeFn = extern(C) gboolean function(AdwToolbarView* self) nothrow;
__gshared c_adw_toolbar_view_get_extend_content_to_top_edgeFn c_adw_toolbar_view_get_extend_content_to_top_edge; ///
private alias c_adw_toolbar_view_get_reveal_bottom_barsFn = extern(C) gboolean function(AdwToolbarView* self) nothrow;
__gshared c_adw_toolbar_view_get_reveal_bottom_barsFn c_adw_toolbar_view_get_reveal_bottom_bars; ///
private alias c_adw_toolbar_view_get_reveal_top_barsFn = extern(C) gboolean function(AdwToolbarView* self) nothrow;
__gshared c_adw_toolbar_view_get_reveal_top_barsFn c_adw_toolbar_view_get_reveal_top_bars; ///
private alias c_adw_toolbar_view_get_top_bar_heightFn = extern(C) int function(AdwToolbarView* self) nothrow;
__gshared c_adw_toolbar_view_get_top_bar_heightFn c_adw_toolbar_view_get_top_bar_height; ///
private alias c_adw_toolbar_view_get_top_bar_styleFn = extern(C) AdwToolbarStyle function(AdwToolbarView* self) nothrow;
__gshared c_adw_toolbar_view_get_top_bar_styleFn c_adw_toolbar_view_get_top_bar_style; ///
private alias c_adw_toolbar_view_removeFn = extern(C) void function(AdwToolbarView* self, GtkWidget* widget) nothrow;
__gshared c_adw_toolbar_view_removeFn c_adw_toolbar_view_remove; ///
private alias c_adw_toolbar_view_set_bottom_bar_styleFn = extern(C) void function(AdwToolbarView* self, AdwToolbarStyle style) nothrow;
__gshared c_adw_toolbar_view_set_bottom_bar_styleFn c_adw_toolbar_view_set_bottom_bar_style; ///
private alias c_adw_toolbar_view_set_contentFn = extern(C) void function(AdwToolbarView* self, GtkWidget* content) nothrow;
__gshared c_adw_toolbar_view_set_contentFn c_adw_toolbar_view_set_content; ///
private alias c_adw_toolbar_view_set_extend_content_to_bottom_edgeFn = extern(C) void function(AdwToolbarView* self, gboolean extend) nothrow;
__gshared c_adw_toolbar_view_set_extend_content_to_bottom_edgeFn c_adw_toolbar_view_set_extend_content_to_bottom_edge; ///
private alias c_adw_toolbar_view_set_extend_content_to_top_edgeFn = extern(C) void function(AdwToolbarView* self, gboolean extend) nothrow;
__gshared c_adw_toolbar_view_set_extend_content_to_top_edgeFn c_adw_toolbar_view_set_extend_content_to_top_edge; ///
private alias c_adw_toolbar_view_set_reveal_bottom_barsFn = extern(C) void function(AdwToolbarView* self, gboolean reveal) nothrow;
__gshared c_adw_toolbar_view_set_reveal_bottom_barsFn c_adw_toolbar_view_set_reveal_bottom_bars; ///
private alias c_adw_toolbar_view_set_reveal_top_barsFn = extern(C) void function(AdwToolbarView* self, gboolean reveal) nothrow;
__gshared c_adw_toolbar_view_set_reveal_top_barsFn c_adw_toolbar_view_set_reveal_top_bars; ///
private alias c_adw_toolbar_view_set_top_bar_styleFn = extern(C) void function(AdwToolbarView* self, AdwToolbarStyle style) nothrow;
__gshared c_adw_toolbar_view_set_top_bar_styleFn c_adw_toolbar_view_set_top_bar_style; ///

// ViewStack
private alias c_adw_view_stack_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_view_stack_get_typeFn c_adw_view_stack_get_type; ///
private alias c_adw_view_stack_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_adw_view_stack_newFn c_adw_view_stack_new; ///
private alias c_adw_view_stack_addFn = extern(C) AdwViewStackPage* function(AdwViewStack* self, GtkWidget* child) nothrow;
__gshared c_adw_view_stack_addFn c_adw_view_stack_add; ///
private alias c_adw_view_stack_add_namedFn = extern(C) AdwViewStackPage* function(AdwViewStack* self, GtkWidget* child, const(char)* name) nothrow;
__gshared c_adw_view_stack_add_namedFn c_adw_view_stack_add_named; ///
private alias c_adw_view_stack_add_titledFn = extern(C) AdwViewStackPage* function(AdwViewStack* self, GtkWidget* child, const(char)* name, const(char)* title) nothrow;
__gshared c_adw_view_stack_add_titledFn c_adw_view_stack_add_titled; ///
private alias c_adw_view_stack_add_titled_with_iconFn = extern(C) AdwViewStackPage* function(AdwViewStack* self, GtkWidget* child, const(char)* name, const(char)* title, const(char)* iconName) nothrow;
__gshared c_adw_view_stack_add_titled_with_iconFn c_adw_view_stack_add_titled_with_icon; ///
private alias c_adw_view_stack_get_child_by_nameFn = extern(C) GtkWidget* function(AdwViewStack* self, const(char)* name) nothrow;
__gshared c_adw_view_stack_get_child_by_nameFn c_adw_view_stack_get_child_by_name; ///
private alias c_adw_view_stack_get_enable_transitionsFn = extern(C) gboolean function(AdwViewStack* self) nothrow;
__gshared c_adw_view_stack_get_enable_transitionsFn c_adw_view_stack_get_enable_transitions; ///
private alias c_adw_view_stack_get_hhomogeneousFn = extern(C) gboolean function(AdwViewStack* self) nothrow;
__gshared c_adw_view_stack_get_hhomogeneousFn c_adw_view_stack_get_hhomogeneous; ///
private alias c_adw_view_stack_get_pageFn = extern(C) AdwViewStackPage* function(AdwViewStack* self, GtkWidget* child) nothrow;
__gshared c_adw_view_stack_get_pageFn c_adw_view_stack_get_page; ///
private alias c_adw_view_stack_get_pagesFn = extern(C) GtkSelectionModel* function(AdwViewStack* self) nothrow;
__gshared c_adw_view_stack_get_pagesFn c_adw_view_stack_get_pages; ///
private alias c_adw_view_stack_get_transition_durationFn = extern(C) uint function(AdwViewStack* self) nothrow;
__gshared c_adw_view_stack_get_transition_durationFn c_adw_view_stack_get_transition_duration; ///
private alias c_adw_view_stack_get_transition_runningFn = extern(C) gboolean function(AdwViewStack* self) nothrow;
__gshared c_adw_view_stack_get_transition_runningFn c_adw_view_stack_get_transition_running; ///
private alias c_adw_view_stack_get_vhomogeneousFn = extern(C) gboolean function(AdwViewStack* self) nothrow;
__gshared c_adw_view_stack_get_vhomogeneousFn c_adw_view_stack_get_vhomogeneous; ///
private alias c_adw_view_stack_get_visible_childFn = extern(C) GtkWidget* function(AdwViewStack* self) nothrow;
__gshared c_adw_view_stack_get_visible_childFn c_adw_view_stack_get_visible_child; ///
private alias c_adw_view_stack_get_visible_child_nameFn = extern(C) const(char)* function(AdwViewStack* self) nothrow;
__gshared c_adw_view_stack_get_visible_child_nameFn c_adw_view_stack_get_visible_child_name; ///
private alias c_adw_view_stack_removeFn = extern(C) void function(AdwViewStack* self, GtkWidget* child) nothrow;
__gshared c_adw_view_stack_removeFn c_adw_view_stack_remove; ///
private alias c_adw_view_stack_set_enable_transitionsFn = extern(C) void function(AdwViewStack* self, gboolean enableTransitions) nothrow;
__gshared c_adw_view_stack_set_enable_transitionsFn c_adw_view_stack_set_enable_transitions; ///
private alias c_adw_view_stack_set_hhomogeneousFn = extern(C) void function(AdwViewStack* self, gboolean hhomogeneous) nothrow;
__gshared c_adw_view_stack_set_hhomogeneousFn c_adw_view_stack_set_hhomogeneous; ///
private alias c_adw_view_stack_set_transition_durationFn = extern(C) void function(AdwViewStack* self, uint duration) nothrow;
__gshared c_adw_view_stack_set_transition_durationFn c_adw_view_stack_set_transition_duration; ///
private alias c_adw_view_stack_set_vhomogeneousFn = extern(C) void function(AdwViewStack* self, gboolean vhomogeneous) nothrow;
__gshared c_adw_view_stack_set_vhomogeneousFn c_adw_view_stack_set_vhomogeneous; ///
private alias c_adw_view_stack_set_visible_childFn = extern(C) void function(AdwViewStack* self, GtkWidget* child) nothrow;
__gshared c_adw_view_stack_set_visible_childFn c_adw_view_stack_set_visible_child; ///
private alias c_adw_view_stack_set_visible_child_nameFn = extern(C) void function(AdwViewStack* self, const(char)* name) nothrow;
__gshared c_adw_view_stack_set_visible_child_nameFn c_adw_view_stack_set_visible_child_name; ///

// ViewStackPage
private alias c_adw_view_stack_page_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_view_stack_page_get_typeFn c_adw_view_stack_page_get_type; ///
private alias c_adw_view_stack_page_get_badge_numberFn = extern(C) uint function(AdwViewStackPage* self) nothrow;
__gshared c_adw_view_stack_page_get_badge_numberFn c_adw_view_stack_page_get_badge_number; ///
private alias c_adw_view_stack_page_get_childFn = extern(C) GtkWidget* function(AdwViewStackPage* self) nothrow;
__gshared c_adw_view_stack_page_get_childFn c_adw_view_stack_page_get_child; ///
private alias c_adw_view_stack_page_get_icon_nameFn = extern(C) const(char)* function(AdwViewStackPage* self) nothrow;
__gshared c_adw_view_stack_page_get_icon_nameFn c_adw_view_stack_page_get_icon_name; ///
private alias c_adw_view_stack_page_get_nameFn = extern(C) const(char)* function(AdwViewStackPage* self) nothrow;
__gshared c_adw_view_stack_page_get_nameFn c_adw_view_stack_page_get_name; ///
private alias c_adw_view_stack_page_get_needs_attentionFn = extern(C) gboolean function(AdwViewStackPage* self) nothrow;
__gshared c_adw_view_stack_page_get_needs_attentionFn c_adw_view_stack_page_get_needs_attention; ///
private alias c_adw_view_stack_page_get_section_titleFn = extern(C) const(char)* function(AdwViewStackPage* self) nothrow;
__gshared c_adw_view_stack_page_get_section_titleFn c_adw_view_stack_page_get_section_title; ///
private alias c_adw_view_stack_page_get_starts_sectionFn = extern(C) gboolean function(AdwViewStackPage* self) nothrow;
__gshared c_adw_view_stack_page_get_starts_sectionFn c_adw_view_stack_page_get_starts_section; ///
private alias c_adw_view_stack_page_get_titleFn = extern(C) const(char)* function(AdwViewStackPage* self) nothrow;
__gshared c_adw_view_stack_page_get_titleFn c_adw_view_stack_page_get_title; ///
private alias c_adw_view_stack_page_get_use_underlineFn = extern(C) gboolean function(AdwViewStackPage* self) nothrow;
__gshared c_adw_view_stack_page_get_use_underlineFn c_adw_view_stack_page_get_use_underline; ///
private alias c_adw_view_stack_page_get_visibleFn = extern(C) gboolean function(AdwViewStackPage* self) nothrow;
__gshared c_adw_view_stack_page_get_visibleFn c_adw_view_stack_page_get_visible; ///
private alias c_adw_view_stack_page_set_badge_numberFn = extern(C) void function(AdwViewStackPage* self, uint badgeNumber) nothrow;
__gshared c_adw_view_stack_page_set_badge_numberFn c_adw_view_stack_page_set_badge_number; ///
private alias c_adw_view_stack_page_set_icon_nameFn = extern(C) void function(AdwViewStackPage* self, const(char)* iconName) nothrow;
__gshared c_adw_view_stack_page_set_icon_nameFn c_adw_view_stack_page_set_icon_name; ///
private alias c_adw_view_stack_page_set_nameFn = extern(C) void function(AdwViewStackPage* self, const(char)* name) nothrow;
__gshared c_adw_view_stack_page_set_nameFn c_adw_view_stack_page_set_name; ///
private alias c_adw_view_stack_page_set_needs_attentionFn = extern(C) void function(AdwViewStackPage* self, gboolean needsAttention) nothrow;
__gshared c_adw_view_stack_page_set_needs_attentionFn c_adw_view_stack_page_set_needs_attention; ///
private alias c_adw_view_stack_page_set_section_titleFn = extern(C) void function(AdwViewStackPage* self, const(char)* sectionTitle) nothrow;
__gshared c_adw_view_stack_page_set_section_titleFn c_adw_view_stack_page_set_section_title; ///
private alias c_adw_view_stack_page_set_starts_sectionFn = extern(C) void function(AdwViewStackPage* self, gboolean startsSection) nothrow;
__gshared c_adw_view_stack_page_set_starts_sectionFn c_adw_view_stack_page_set_starts_section; ///
private alias c_adw_view_stack_page_set_titleFn = extern(C) void function(AdwViewStackPage* self, const(char)* title) nothrow;
__gshared c_adw_view_stack_page_set_titleFn c_adw_view_stack_page_set_title; ///
private alias c_adw_view_stack_page_set_use_underlineFn = extern(C) void function(AdwViewStackPage* self, gboolean useUnderline) nothrow;
__gshared c_adw_view_stack_page_set_use_underlineFn c_adw_view_stack_page_set_use_underline; ///
private alias c_adw_view_stack_page_set_visibleFn = extern(C) void function(AdwViewStackPage* self, gboolean visible) nothrow;
__gshared c_adw_view_stack_page_set_visibleFn c_adw_view_stack_page_set_visible; ///

// ViewStackPages
private alias c_adw_view_stack_pages_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_view_stack_pages_get_typeFn c_adw_view_stack_pages_get_type; ///
private alias c_adw_view_stack_pages_get_selected_pageFn = extern(C) AdwViewStackPage* function(AdwViewStackPages* self) nothrow;
__gshared c_adw_view_stack_pages_get_selected_pageFn c_adw_view_stack_pages_get_selected_page; ///
private alias c_adw_view_stack_pages_set_selected_pageFn = extern(C) void function(AdwViewStackPages* self, AdwViewStackPage* page) nothrow;
__gshared c_adw_view_stack_pages_set_selected_pageFn c_adw_view_stack_pages_set_selected_page; ///

// ViewSwitcher
private alias c_adw_view_switcher_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_view_switcher_get_typeFn c_adw_view_switcher_get_type; ///
private alias c_adw_view_switcher_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_adw_view_switcher_newFn c_adw_view_switcher_new; ///
private alias c_adw_view_switcher_get_policyFn = extern(C) AdwViewSwitcherPolicy function(AdwViewSwitcher* self) nothrow;
__gshared c_adw_view_switcher_get_policyFn c_adw_view_switcher_get_policy; ///
private alias c_adw_view_switcher_get_stackFn = extern(C) AdwViewStack* function(AdwViewSwitcher* self) nothrow;
__gshared c_adw_view_switcher_get_stackFn c_adw_view_switcher_get_stack; ///
private alias c_adw_view_switcher_set_policyFn = extern(C) void function(AdwViewSwitcher* self, AdwViewSwitcherPolicy policy) nothrow;
__gshared c_adw_view_switcher_set_policyFn c_adw_view_switcher_set_policy; ///
private alias c_adw_view_switcher_set_stackFn = extern(C) void function(AdwViewSwitcher* self, AdwViewStack* stack) nothrow;
__gshared c_adw_view_switcher_set_stackFn c_adw_view_switcher_set_stack; ///

// ViewSwitcherBar
private alias c_adw_view_switcher_bar_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_view_switcher_bar_get_typeFn c_adw_view_switcher_bar_get_type; ///
private alias c_adw_view_switcher_bar_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_adw_view_switcher_bar_newFn c_adw_view_switcher_bar_new; ///
private alias c_adw_view_switcher_bar_get_revealFn = extern(C) gboolean function(AdwViewSwitcherBar* self) nothrow;
__gshared c_adw_view_switcher_bar_get_revealFn c_adw_view_switcher_bar_get_reveal; ///
private alias c_adw_view_switcher_bar_get_stackFn = extern(C) AdwViewStack* function(AdwViewSwitcherBar* self) nothrow;
__gshared c_adw_view_switcher_bar_get_stackFn c_adw_view_switcher_bar_get_stack; ///
private alias c_adw_view_switcher_bar_set_revealFn = extern(C) void function(AdwViewSwitcherBar* self, gboolean reveal) nothrow;
__gshared c_adw_view_switcher_bar_set_revealFn c_adw_view_switcher_bar_set_reveal; ///
private alias c_adw_view_switcher_bar_set_stackFn = extern(C) void function(AdwViewSwitcherBar* self, AdwViewStack* stack) nothrow;
__gshared c_adw_view_switcher_bar_set_stackFn c_adw_view_switcher_bar_set_stack; ///

// ViewSwitcherSidebar
private alias c_adw_view_switcher_sidebar_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_view_switcher_sidebar_get_typeFn c_adw_view_switcher_sidebar_get_type; ///
private alias c_adw_view_switcher_sidebar_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_adw_view_switcher_sidebar_newFn c_adw_view_switcher_sidebar_new; ///
private alias c_adw_view_switcher_sidebar_get_filterFn = extern(C) GtkFilter* function(AdwViewSwitcherSidebar* self) nothrow;
__gshared c_adw_view_switcher_sidebar_get_filterFn c_adw_view_switcher_sidebar_get_filter; ///
private alias c_adw_view_switcher_sidebar_get_modeFn = extern(C) AdwSidebarMode function(AdwViewSwitcherSidebar* self) nothrow;
__gshared c_adw_view_switcher_sidebar_get_modeFn c_adw_view_switcher_sidebar_get_mode; ///
private alias c_adw_view_switcher_sidebar_get_placeholderFn = extern(C) GtkWidget* function(AdwViewSwitcherSidebar* self) nothrow;
__gshared c_adw_view_switcher_sidebar_get_placeholderFn c_adw_view_switcher_sidebar_get_placeholder; ///
private alias c_adw_view_switcher_sidebar_get_stackFn = extern(C) AdwViewStack* function(AdwViewSwitcherSidebar* self) nothrow;
__gshared c_adw_view_switcher_sidebar_get_stackFn c_adw_view_switcher_sidebar_get_stack; ///
private alias c_adw_view_switcher_sidebar_set_filterFn = extern(C) void function(AdwViewSwitcherSidebar* self, GtkFilter* filter) nothrow;
__gshared c_adw_view_switcher_sidebar_set_filterFn c_adw_view_switcher_sidebar_set_filter; ///
private alias c_adw_view_switcher_sidebar_set_modeFn = extern(C) void function(AdwViewSwitcherSidebar* self, AdwSidebarMode mode) nothrow;
__gshared c_adw_view_switcher_sidebar_set_modeFn c_adw_view_switcher_sidebar_set_mode; ///
private alias c_adw_view_switcher_sidebar_set_placeholderFn = extern(C) void function(AdwViewSwitcherSidebar* self, GtkWidget* placeholder) nothrow;
__gshared c_adw_view_switcher_sidebar_set_placeholderFn c_adw_view_switcher_sidebar_set_placeholder; ///
private alias c_adw_view_switcher_sidebar_set_stackFn = extern(C) void function(AdwViewSwitcherSidebar* self, AdwViewStack* stack) nothrow;
__gshared c_adw_view_switcher_sidebar_set_stackFn c_adw_view_switcher_sidebar_set_stack; ///

// ViewSwitcherTitle
private alias c_adw_view_switcher_title_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_view_switcher_title_get_typeFn c_adw_view_switcher_title_get_type; ///
private alias c_adw_view_switcher_title_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_adw_view_switcher_title_newFn c_adw_view_switcher_title_new; ///
private alias c_adw_view_switcher_title_get_stackFn = extern(C) AdwViewStack* function(AdwViewSwitcherTitle* self) nothrow;
__gshared c_adw_view_switcher_title_get_stackFn c_adw_view_switcher_title_get_stack; ///
private alias c_adw_view_switcher_title_get_subtitleFn = extern(C) const(char)* function(AdwViewSwitcherTitle* self) nothrow;
__gshared c_adw_view_switcher_title_get_subtitleFn c_adw_view_switcher_title_get_subtitle; ///
private alias c_adw_view_switcher_title_get_titleFn = extern(C) const(char)* function(AdwViewSwitcherTitle* self) nothrow;
__gshared c_adw_view_switcher_title_get_titleFn c_adw_view_switcher_title_get_title; ///
private alias c_adw_view_switcher_title_get_title_visibleFn = extern(C) gboolean function(AdwViewSwitcherTitle* self) nothrow;
__gshared c_adw_view_switcher_title_get_title_visibleFn c_adw_view_switcher_title_get_title_visible; ///
private alias c_adw_view_switcher_title_get_view_switcher_enabledFn = extern(C) gboolean function(AdwViewSwitcherTitle* self) nothrow;
__gshared c_adw_view_switcher_title_get_view_switcher_enabledFn c_adw_view_switcher_title_get_view_switcher_enabled; ///
private alias c_adw_view_switcher_title_set_stackFn = extern(C) void function(AdwViewSwitcherTitle* self, AdwViewStack* stack) nothrow;
__gshared c_adw_view_switcher_title_set_stackFn c_adw_view_switcher_title_set_stack; ///
private alias c_adw_view_switcher_title_set_subtitleFn = extern(C) void function(AdwViewSwitcherTitle* self, const(char)* subtitle) nothrow;
__gshared c_adw_view_switcher_title_set_subtitleFn c_adw_view_switcher_title_set_subtitle; ///
private alias c_adw_view_switcher_title_set_titleFn = extern(C) void function(AdwViewSwitcherTitle* self, const(char)* title) nothrow;
__gshared c_adw_view_switcher_title_set_titleFn c_adw_view_switcher_title_set_title; ///
private alias c_adw_view_switcher_title_set_view_switcher_enabledFn = extern(C) void function(AdwViewSwitcherTitle* self, gboolean enabled) nothrow;
__gshared c_adw_view_switcher_title_set_view_switcher_enabledFn c_adw_view_switcher_title_set_view_switcher_enabled; ///

// Window
private alias c_adw_window_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_window_get_typeFn c_adw_window_get_type; ///
private alias c_adw_window_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_adw_window_newFn c_adw_window_new; ///
private alias c_adw_window_add_breakpointFn = extern(C) void function(AdwWindow* self, AdwBreakpoint* breakpoint) nothrow;
__gshared c_adw_window_add_breakpointFn c_adw_window_add_breakpoint; ///
private alias c_adw_window_get_adaptive_previewFn = extern(C) gboolean function(AdwWindow* self) nothrow;
__gshared c_adw_window_get_adaptive_previewFn c_adw_window_get_adaptive_preview; ///
private alias c_adw_window_get_contentFn = extern(C) GtkWidget* function(AdwWindow* self) nothrow;
__gshared c_adw_window_get_contentFn c_adw_window_get_content; ///
private alias c_adw_window_get_current_breakpointFn = extern(C) AdwBreakpoint* function(AdwWindow* self) nothrow;
__gshared c_adw_window_get_current_breakpointFn c_adw_window_get_current_breakpoint; ///
private alias c_adw_window_get_dialogsFn = extern(C) GListModel* function(AdwWindow* self) nothrow;
__gshared c_adw_window_get_dialogsFn c_adw_window_get_dialogs; ///
private alias c_adw_window_get_visible_dialogFn = extern(C) AdwDialog* function(AdwWindow* self) nothrow;
__gshared c_adw_window_get_visible_dialogFn c_adw_window_get_visible_dialog; ///
private alias c_adw_window_set_adaptive_previewFn = extern(C) void function(AdwWindow* self, gboolean adaptivePreview) nothrow;
__gshared c_adw_window_set_adaptive_previewFn c_adw_window_set_adaptive_preview; ///
private alias c_adw_window_set_contentFn = extern(C) void function(AdwWindow* self, GtkWidget* content) nothrow;
__gshared c_adw_window_set_contentFn c_adw_window_set_content; ///

// WindowTitle
private alias c_adw_window_title_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_window_title_get_typeFn c_adw_window_title_get_type; ///
private alias c_adw_window_title_newFn = extern(C) GtkWidget* function(const(char)* title, const(char)* subtitle) nothrow;
__gshared c_adw_window_title_newFn c_adw_window_title_new; ///
private alias c_adw_window_title_get_subtitleFn = extern(C) const(char)* function(AdwWindowTitle* self) nothrow;
__gshared c_adw_window_title_get_subtitleFn c_adw_window_title_get_subtitle; ///
private alias c_adw_window_title_get_titleFn = extern(C) const(char)* function(AdwWindowTitle* self) nothrow;
__gshared c_adw_window_title_get_titleFn c_adw_window_title_get_title; ///
private alias c_adw_window_title_set_subtitleFn = extern(C) void function(AdwWindowTitle* self, const(char)* subtitle) nothrow;
__gshared c_adw_window_title_set_subtitleFn c_adw_window_title_set_subtitle; ///
private alias c_adw_window_title_set_titleFn = extern(C) void function(AdwWindowTitle* self, const(char)* title) nothrow;
__gshared c_adw_window_title_set_titleFn c_adw_window_title_set_title; ///

// WrapBox
private alias c_adw_wrap_box_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_wrap_box_get_typeFn c_adw_wrap_box_get_type; ///
private alias c_adw_wrap_box_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_adw_wrap_box_newFn c_adw_wrap_box_new; ///
private alias c_adw_wrap_box_appendFn = extern(C) void function(AdwWrapBox* self, GtkWidget* child) nothrow;
__gshared c_adw_wrap_box_appendFn c_adw_wrap_box_append; ///
private alias c_adw_wrap_box_get_alignFn = extern(C) float function(AdwWrapBox* self) nothrow;
__gshared c_adw_wrap_box_get_alignFn c_adw_wrap_box_get_align; ///
private alias c_adw_wrap_box_get_child_spacingFn = extern(C) int function(AdwWrapBox* self) nothrow;
__gshared c_adw_wrap_box_get_child_spacingFn c_adw_wrap_box_get_child_spacing; ///
private alias c_adw_wrap_box_get_child_spacing_unitFn = extern(C) AdwLengthUnit function(AdwWrapBox* self) nothrow;
__gshared c_adw_wrap_box_get_child_spacing_unitFn c_adw_wrap_box_get_child_spacing_unit; ///
private alias c_adw_wrap_box_get_justifyFn = extern(C) AdwJustifyMode function(AdwWrapBox* self) nothrow;
__gshared c_adw_wrap_box_get_justifyFn c_adw_wrap_box_get_justify; ///
private alias c_adw_wrap_box_get_justify_last_lineFn = extern(C) gboolean function(AdwWrapBox* self) nothrow;
__gshared c_adw_wrap_box_get_justify_last_lineFn c_adw_wrap_box_get_justify_last_line; ///
private alias c_adw_wrap_box_get_line_homogeneousFn = extern(C) gboolean function(AdwWrapBox* self) nothrow;
__gshared c_adw_wrap_box_get_line_homogeneousFn c_adw_wrap_box_get_line_homogeneous; ///
private alias c_adw_wrap_box_get_line_spacingFn = extern(C) int function(AdwWrapBox* self) nothrow;
__gshared c_adw_wrap_box_get_line_spacingFn c_adw_wrap_box_get_line_spacing; ///
private alias c_adw_wrap_box_get_line_spacing_unitFn = extern(C) AdwLengthUnit function(AdwWrapBox* self) nothrow;
__gshared c_adw_wrap_box_get_line_spacing_unitFn c_adw_wrap_box_get_line_spacing_unit; ///
private alias c_adw_wrap_box_get_natural_line_lengthFn = extern(C) int function(AdwWrapBox* self) nothrow;
__gshared c_adw_wrap_box_get_natural_line_lengthFn c_adw_wrap_box_get_natural_line_length; ///
private alias c_adw_wrap_box_get_natural_line_length_unitFn = extern(C) AdwLengthUnit function(AdwWrapBox* self) nothrow;
__gshared c_adw_wrap_box_get_natural_line_length_unitFn c_adw_wrap_box_get_natural_line_length_unit; ///
private alias c_adw_wrap_box_get_pack_directionFn = extern(C) AdwPackDirection function(AdwWrapBox* self) nothrow;
__gshared c_adw_wrap_box_get_pack_directionFn c_adw_wrap_box_get_pack_direction; ///
private alias c_adw_wrap_box_get_wrap_policyFn = extern(C) AdwWrapPolicy function(AdwWrapBox* self) nothrow;
__gshared c_adw_wrap_box_get_wrap_policyFn c_adw_wrap_box_get_wrap_policy; ///
private alias c_adw_wrap_box_get_wrap_reverseFn = extern(C) gboolean function(AdwWrapBox* self) nothrow;
__gshared c_adw_wrap_box_get_wrap_reverseFn c_adw_wrap_box_get_wrap_reverse; ///
private alias c_adw_wrap_box_insert_child_afterFn = extern(C) void function(AdwWrapBox* self, GtkWidget* child, GtkWidget* sibling) nothrow;
__gshared c_adw_wrap_box_insert_child_afterFn c_adw_wrap_box_insert_child_after; ///
private alias c_adw_wrap_box_prependFn = extern(C) void function(AdwWrapBox* self, GtkWidget* child) nothrow;
__gshared c_adw_wrap_box_prependFn c_adw_wrap_box_prepend; ///
private alias c_adw_wrap_box_removeFn = extern(C) void function(AdwWrapBox* self, GtkWidget* child) nothrow;
__gshared c_adw_wrap_box_removeFn c_adw_wrap_box_remove; ///
private alias c_adw_wrap_box_remove_allFn = extern(C) void function(AdwWrapBox* self) nothrow;
__gshared c_adw_wrap_box_remove_allFn c_adw_wrap_box_remove_all; ///
private alias c_adw_wrap_box_reorder_child_afterFn = extern(C) void function(AdwWrapBox* self, GtkWidget* child, GtkWidget* sibling) nothrow;
__gshared c_adw_wrap_box_reorder_child_afterFn c_adw_wrap_box_reorder_child_after; ///
private alias c_adw_wrap_box_set_alignFn = extern(C) void function(AdwWrapBox* self, float align_) nothrow;
__gshared c_adw_wrap_box_set_alignFn c_adw_wrap_box_set_align; ///
private alias c_adw_wrap_box_set_child_spacingFn = extern(C) void function(AdwWrapBox* self, int childSpacing) nothrow;
__gshared c_adw_wrap_box_set_child_spacingFn c_adw_wrap_box_set_child_spacing; ///
private alias c_adw_wrap_box_set_child_spacing_unitFn = extern(C) void function(AdwWrapBox* self, AdwLengthUnit unit) nothrow;
__gshared c_adw_wrap_box_set_child_spacing_unitFn c_adw_wrap_box_set_child_spacing_unit; ///
private alias c_adw_wrap_box_set_justifyFn = extern(C) void function(AdwWrapBox* self, AdwJustifyMode justify) nothrow;
__gshared c_adw_wrap_box_set_justifyFn c_adw_wrap_box_set_justify; ///
private alias c_adw_wrap_box_set_justify_last_lineFn = extern(C) void function(AdwWrapBox* self, gboolean justifyLastLine) nothrow;
__gshared c_adw_wrap_box_set_justify_last_lineFn c_adw_wrap_box_set_justify_last_line; ///
private alias c_adw_wrap_box_set_line_homogeneousFn = extern(C) void function(AdwWrapBox* self, gboolean homogeneous) nothrow;
__gshared c_adw_wrap_box_set_line_homogeneousFn c_adw_wrap_box_set_line_homogeneous; ///
private alias c_adw_wrap_box_set_line_spacingFn = extern(C) void function(AdwWrapBox* self, int lineSpacing) nothrow;
__gshared c_adw_wrap_box_set_line_spacingFn c_adw_wrap_box_set_line_spacing; ///
private alias c_adw_wrap_box_set_line_spacing_unitFn = extern(C) void function(AdwWrapBox* self, AdwLengthUnit unit) nothrow;
__gshared c_adw_wrap_box_set_line_spacing_unitFn c_adw_wrap_box_set_line_spacing_unit; ///
private alias c_adw_wrap_box_set_natural_line_lengthFn = extern(C) void function(AdwWrapBox* self, int naturalLineLength) nothrow;
__gshared c_adw_wrap_box_set_natural_line_lengthFn c_adw_wrap_box_set_natural_line_length; ///
private alias c_adw_wrap_box_set_natural_line_length_unitFn = extern(C) void function(AdwWrapBox* self, AdwLengthUnit unit) nothrow;
__gshared c_adw_wrap_box_set_natural_line_length_unitFn c_adw_wrap_box_set_natural_line_length_unit; ///
private alias c_adw_wrap_box_set_pack_directionFn = extern(C) void function(AdwWrapBox* self, AdwPackDirection packDirection) nothrow;
__gshared c_adw_wrap_box_set_pack_directionFn c_adw_wrap_box_set_pack_direction; ///
private alias c_adw_wrap_box_set_wrap_policyFn = extern(C) void function(AdwWrapBox* self, AdwWrapPolicy wrapPolicy) nothrow;
__gshared c_adw_wrap_box_set_wrap_policyFn c_adw_wrap_box_set_wrap_policy; ///
private alias c_adw_wrap_box_set_wrap_reverseFn = extern(C) void function(AdwWrapBox* self, gboolean wrapReverse) nothrow;
__gshared c_adw_wrap_box_set_wrap_reverseFn c_adw_wrap_box_set_wrap_reverse; ///

// WrapLayout
private alias c_adw_wrap_layout_get_typeFn = extern(C) GType function() nothrow;
__gshared c_adw_wrap_layout_get_typeFn c_adw_wrap_layout_get_type; ///
private alias c_adw_wrap_layout_newFn = extern(C) GtkLayoutManager* function() nothrow;
__gshared c_adw_wrap_layout_newFn c_adw_wrap_layout_new; ///
private alias c_adw_wrap_layout_get_alignFn = extern(C) float function(AdwWrapLayout* self) nothrow;
__gshared c_adw_wrap_layout_get_alignFn c_adw_wrap_layout_get_align; ///
private alias c_adw_wrap_layout_get_child_spacingFn = extern(C) int function(AdwWrapLayout* self) nothrow;
__gshared c_adw_wrap_layout_get_child_spacingFn c_adw_wrap_layout_get_child_spacing; ///
private alias c_adw_wrap_layout_get_child_spacing_unitFn = extern(C) AdwLengthUnit function(AdwWrapLayout* self) nothrow;
__gshared c_adw_wrap_layout_get_child_spacing_unitFn c_adw_wrap_layout_get_child_spacing_unit; ///
private alias c_adw_wrap_layout_get_justifyFn = extern(C) AdwJustifyMode function(AdwWrapLayout* self) nothrow;
__gshared c_adw_wrap_layout_get_justifyFn c_adw_wrap_layout_get_justify; ///
private alias c_adw_wrap_layout_get_justify_last_lineFn = extern(C) gboolean function(AdwWrapLayout* self) nothrow;
__gshared c_adw_wrap_layout_get_justify_last_lineFn c_adw_wrap_layout_get_justify_last_line; ///
private alias c_adw_wrap_layout_get_line_homogeneousFn = extern(C) gboolean function(AdwWrapLayout* self) nothrow;
__gshared c_adw_wrap_layout_get_line_homogeneousFn c_adw_wrap_layout_get_line_homogeneous; ///
private alias c_adw_wrap_layout_get_line_spacingFn = extern(C) int function(AdwWrapLayout* self) nothrow;
__gshared c_adw_wrap_layout_get_line_spacingFn c_adw_wrap_layout_get_line_spacing; ///
private alias c_adw_wrap_layout_get_line_spacing_unitFn = extern(C) AdwLengthUnit function(AdwWrapLayout* self) nothrow;
__gshared c_adw_wrap_layout_get_line_spacing_unitFn c_adw_wrap_layout_get_line_spacing_unit; ///
private alias c_adw_wrap_layout_get_natural_line_lengthFn = extern(C) int function(AdwWrapLayout* self) nothrow;
__gshared c_adw_wrap_layout_get_natural_line_lengthFn c_adw_wrap_layout_get_natural_line_length; ///
private alias c_adw_wrap_layout_get_natural_line_length_unitFn = extern(C) AdwLengthUnit function(AdwWrapLayout* self) nothrow;
__gshared c_adw_wrap_layout_get_natural_line_length_unitFn c_adw_wrap_layout_get_natural_line_length_unit; ///
private alias c_adw_wrap_layout_get_pack_directionFn = extern(C) AdwPackDirection function(AdwWrapLayout* self) nothrow;
__gshared c_adw_wrap_layout_get_pack_directionFn c_adw_wrap_layout_get_pack_direction; ///
private alias c_adw_wrap_layout_get_wrap_policyFn = extern(C) AdwWrapPolicy function(AdwWrapLayout* self) nothrow;
__gshared c_adw_wrap_layout_get_wrap_policyFn c_adw_wrap_layout_get_wrap_policy; ///
private alias c_adw_wrap_layout_get_wrap_reverseFn = extern(C) gboolean function(AdwWrapLayout* self) nothrow;
__gshared c_adw_wrap_layout_get_wrap_reverseFn c_adw_wrap_layout_get_wrap_reverse; ///
private alias c_adw_wrap_layout_set_alignFn = extern(C) void function(AdwWrapLayout* self, float align_) nothrow;
__gshared c_adw_wrap_layout_set_alignFn c_adw_wrap_layout_set_align; ///
private alias c_adw_wrap_layout_set_child_spacingFn = extern(C) void function(AdwWrapLayout* self, int childSpacing) nothrow;
__gshared c_adw_wrap_layout_set_child_spacingFn c_adw_wrap_layout_set_child_spacing; ///
private alias c_adw_wrap_layout_set_child_spacing_unitFn = extern(C) void function(AdwWrapLayout* self, AdwLengthUnit unit) nothrow;
__gshared c_adw_wrap_layout_set_child_spacing_unitFn c_adw_wrap_layout_set_child_spacing_unit; ///
private alias c_adw_wrap_layout_set_justifyFn = extern(C) void function(AdwWrapLayout* self, AdwJustifyMode justify) nothrow;
__gshared c_adw_wrap_layout_set_justifyFn c_adw_wrap_layout_set_justify; ///
private alias c_adw_wrap_layout_set_justify_last_lineFn = extern(C) void function(AdwWrapLayout* self, gboolean justifyLastLine) nothrow;
__gshared c_adw_wrap_layout_set_justify_last_lineFn c_adw_wrap_layout_set_justify_last_line; ///
private alias c_adw_wrap_layout_set_line_homogeneousFn = extern(C) void function(AdwWrapLayout* self, gboolean homogeneous) nothrow;
__gshared c_adw_wrap_layout_set_line_homogeneousFn c_adw_wrap_layout_set_line_homogeneous; ///
private alias c_adw_wrap_layout_set_line_spacingFn = extern(C) void function(AdwWrapLayout* self, int lineSpacing) nothrow;
__gshared c_adw_wrap_layout_set_line_spacingFn c_adw_wrap_layout_set_line_spacing; ///
private alias c_adw_wrap_layout_set_line_spacing_unitFn = extern(C) void function(AdwWrapLayout* self, AdwLengthUnit unit) nothrow;
__gshared c_adw_wrap_layout_set_line_spacing_unitFn c_adw_wrap_layout_set_line_spacing_unit; ///
private alias c_adw_wrap_layout_set_natural_line_lengthFn = extern(C) void function(AdwWrapLayout* self, int naturalLineLength) nothrow;
__gshared c_adw_wrap_layout_set_natural_line_lengthFn c_adw_wrap_layout_set_natural_line_length; ///
private alias c_adw_wrap_layout_set_natural_line_length_unitFn = extern(C) void function(AdwWrapLayout* self, AdwLengthUnit unit) nothrow;
__gshared c_adw_wrap_layout_set_natural_line_length_unitFn c_adw_wrap_layout_set_natural_line_length_unit; ///
private alias c_adw_wrap_layout_set_pack_directionFn = extern(C) void function(AdwWrapLayout* self, AdwPackDirection packDirection) nothrow;
__gshared c_adw_wrap_layout_set_pack_directionFn c_adw_wrap_layout_set_pack_direction; ///
private alias c_adw_wrap_layout_set_wrap_policyFn = extern(C) void function(AdwWrapLayout* self, AdwWrapPolicy wrapPolicy) nothrow;
__gshared c_adw_wrap_layout_set_wrap_policyFn c_adw_wrap_layout_set_wrap_policy; ///
private alias c_adw_wrap_layout_set_wrap_reverseFn = extern(C) void function(AdwWrapLayout* self, gboolean wrapReverse) nothrow;
__gshared c_adw_wrap_layout_set_wrap_reverseFn c_adw_wrap_layout_set_wrap_reverse; ///

// global
private alias c_adw_get_enable_animationsFn = extern(C) gboolean function(GtkWidget* widget) nothrow;
__gshared c_adw_get_enable_animationsFn c_adw_get_enable_animations; ///
private alias c_adw_get_major_versionFn = extern(C) uint function() nothrow;
__gshared c_adw_get_major_versionFn c_adw_get_major_version; ///
private alias c_adw_get_micro_versionFn = extern(C) uint function() nothrow;
__gshared c_adw_get_micro_versionFn c_adw_get_micro_version; ///
private alias c_adw_get_minor_versionFn = extern(C) uint function() nothrow;
__gshared c_adw_get_minor_versionFn c_adw_get_minor_version; ///
private alias c_adw_initFn = extern(C) void function() nothrow;
__gshared c_adw_initFn c_adw_init; ///
private alias c_adw_is_initializedFn = extern(C) gboolean function() nothrow;
__gshared c_adw_is_initializedFn c_adw_is_initialized; ///
private alias c_adw_lerpFn = extern(C) double function(double a, double b, double t) nothrow;
__gshared c_adw_lerpFn c_adw_lerp; ///
private alias c_adw_rgba_to_standaloneFn = extern(C) void function(const(GdkRGBA)* rgba, gboolean dark, GdkRGBA* standaloneRgba) nothrow;
__gshared c_adw_rgba_to_standaloneFn c_adw_rgba_to_standalone; ///
private alias c_adw_show_about_dialogFn = extern(C) void function(GtkWidget* parent, const(char)* firstPropertyName,  ...) nothrow;
__gshared c_adw_show_about_dialogFn c_adw_show_about_dialog; ///
private alias c_adw_show_about_dialog_from_appdataFn = extern(C) void function(GtkWidget* parent, const(char)* resourcePath, const(char)* releaseNotesVersion, const(char)* firstPropertyName,  ...) nothrow;
__gshared c_adw_show_about_dialog_from_appdataFn c_adw_show_about_dialog_from_appdata; ///
private alias c_adw_show_about_windowFn = extern(C) void function(GtkWindow* parent, const(char)* firstPropertyName,  ...) nothrow;
__gshared c_adw_show_about_windowFn c_adw_show_about_window; ///
private alias c_adw_show_about_window_from_appdataFn = extern(C) void function(GtkWindow* parent, const(char)* resourcePath, const(char)* releaseNotesVersion, const(char)* firstPropertyName,  ...) nothrow;
__gshared c_adw_show_about_window_from_appdataFn c_adw_show_about_window_from_appdata; ///

// AccentColor
private alias c_adw_accent_color_to_rgbaFn = extern(C) void function(AdwAccentColor self, GdkRGBA* rgba) nothrow;
__gshared c_adw_accent_color_to_rgbaFn c_adw_accent_color_to_rgba; ///
private alias c_adw_accent_color_to_standalone_rgbaFn = extern(C) void function(AdwAccentColor self, gboolean dark, GdkRGBA* rgba) nothrow;
__gshared c_adw_accent_color_to_standalone_rgbaFn c_adw_accent_color_to_standalone_rgba; ///

// Easing
private alias c_adw_easing_easeFn = extern(C) double function(AdwEasing self, double value) nothrow;
__gshared c_adw_easing_easeFn c_adw_easing_ease; ///

// LengthUnit
private alias c_adw_length_unit_from_pxFn = extern(C) double function(AdwLengthUnit unit, double value, GtkSettings* settings) nothrow;
__gshared c_adw_length_unit_from_pxFn c_adw_length_unit_from_px; ///
private alias c_adw_length_unit_to_pxFn = extern(C) double function(AdwLengthUnit unit, double value, GtkSettings* settings) nothrow;
__gshared c_adw_length_unit_to_pxFn c_adw_length_unit_to_px; ///

// AboutDialog

/** */
alias adw_about_dialog_get_type = c_adw_about_dialog_get_type;

/** */
alias adw_about_dialog_new = c_adw_about_dialog_new;

/** */
alias adw_about_dialog_new_from_appdata = c_adw_about_dialog_new_from_appdata;

/** */
alias adw_about_dialog_add_acknowledgement_section = c_adw_about_dialog_add_acknowledgement_section;

/** */
alias adw_about_dialog_add_credit_section = c_adw_about_dialog_add_credit_section;

/** */
alias adw_about_dialog_add_legal_section = c_adw_about_dialog_add_legal_section;

/** */
alias adw_about_dialog_add_link = c_adw_about_dialog_add_link;

/** */
alias adw_about_dialog_add_other_app = c_adw_about_dialog_add_other_app;

/** */
alias adw_about_dialog_get_appdata_resource_path = c_adw_about_dialog_get_appdata_resource_path;

/** */
alias adw_about_dialog_get_application_icon = c_adw_about_dialog_get_application_icon;

/** */
alias adw_about_dialog_get_application_name = c_adw_about_dialog_get_application_name;

/** */
alias adw_about_dialog_get_artists = c_adw_about_dialog_get_artists;

/** */
alias adw_about_dialog_get_comments = c_adw_about_dialog_get_comments;

/** */
alias adw_about_dialog_get_copyright = c_adw_about_dialog_get_copyright;

/** */
alias adw_about_dialog_get_debug_info = c_adw_about_dialog_get_debug_info;

/** */
alias adw_about_dialog_get_debug_info_filename = c_adw_about_dialog_get_debug_info_filename;

/** */
alias adw_about_dialog_get_designers = c_adw_about_dialog_get_designers;

/** */
alias adw_about_dialog_get_developer_name = c_adw_about_dialog_get_developer_name;

/** */
alias adw_about_dialog_get_developers = c_adw_about_dialog_get_developers;

/** */
alias adw_about_dialog_get_documenters = c_adw_about_dialog_get_documenters;

/** */
alias adw_about_dialog_get_issue_url = c_adw_about_dialog_get_issue_url;

/** */
alias adw_about_dialog_get_license = c_adw_about_dialog_get_license;

/** */
alias adw_about_dialog_get_license_type = c_adw_about_dialog_get_license_type;

/** */
alias adw_about_dialog_get_release_notes = c_adw_about_dialog_get_release_notes;

/** */
alias adw_about_dialog_get_release_notes_version = c_adw_about_dialog_get_release_notes_version;

/** */
alias adw_about_dialog_get_support_url = c_adw_about_dialog_get_support_url;

/** */
alias adw_about_dialog_get_translator_credits = c_adw_about_dialog_get_translator_credits;

/** */
alias adw_about_dialog_get_version = c_adw_about_dialog_get_version;

/** */
alias adw_about_dialog_get_website = c_adw_about_dialog_get_website;

/** */
alias adw_about_dialog_set_application_icon = c_adw_about_dialog_set_application_icon;

/** */
alias adw_about_dialog_set_application_name = c_adw_about_dialog_set_application_name;

/** */
alias adw_about_dialog_set_artists = c_adw_about_dialog_set_artists;

/** */
alias adw_about_dialog_set_comments = c_adw_about_dialog_set_comments;

/** */
alias adw_about_dialog_set_copyright = c_adw_about_dialog_set_copyright;

/** */
alias adw_about_dialog_set_debug_info = c_adw_about_dialog_set_debug_info;

/** */
alias adw_about_dialog_set_debug_info_filename = c_adw_about_dialog_set_debug_info_filename;

/** */
alias adw_about_dialog_set_designers = c_adw_about_dialog_set_designers;

/** */
alias adw_about_dialog_set_developer_name = c_adw_about_dialog_set_developer_name;

/** */
alias adw_about_dialog_set_developers = c_adw_about_dialog_set_developers;

/** */
alias adw_about_dialog_set_documenters = c_adw_about_dialog_set_documenters;

/** */
alias adw_about_dialog_set_issue_url = c_adw_about_dialog_set_issue_url;

/** */
alias adw_about_dialog_set_license = c_adw_about_dialog_set_license;

/** */
alias adw_about_dialog_set_license_type = c_adw_about_dialog_set_license_type;

/** */
alias adw_about_dialog_set_release_notes = c_adw_about_dialog_set_release_notes;

/** */
alias adw_about_dialog_set_release_notes_version = c_adw_about_dialog_set_release_notes_version;

/** */
alias adw_about_dialog_set_support_url = c_adw_about_dialog_set_support_url;

/** */
alias adw_about_dialog_set_translator_credits = c_adw_about_dialog_set_translator_credits;

/** */
alias adw_about_dialog_set_version = c_adw_about_dialog_set_version;

/** */
alias adw_about_dialog_set_website = c_adw_about_dialog_set_website;

// AboutWindow

/** */
alias adw_about_window_get_type = c_adw_about_window_get_type;

/** */
alias adw_about_window_new = c_adw_about_window_new;

/** */
alias adw_about_window_new_from_appdata = c_adw_about_window_new_from_appdata;

/** */
alias adw_about_window_add_acknowledgement_section = c_adw_about_window_add_acknowledgement_section;

/** */
alias adw_about_window_add_credit_section = c_adw_about_window_add_credit_section;

/** */
alias adw_about_window_add_legal_section = c_adw_about_window_add_legal_section;

/** */
alias adw_about_window_add_link = c_adw_about_window_add_link;

/** */
alias adw_about_window_get_application_icon = c_adw_about_window_get_application_icon;

/** */
alias adw_about_window_get_application_name = c_adw_about_window_get_application_name;

/** */
alias adw_about_window_get_artists = c_adw_about_window_get_artists;

/** */
alias adw_about_window_get_comments = c_adw_about_window_get_comments;

/** */
alias adw_about_window_get_copyright = c_adw_about_window_get_copyright;

/** */
alias adw_about_window_get_debug_info = c_adw_about_window_get_debug_info;

/** */
alias adw_about_window_get_debug_info_filename = c_adw_about_window_get_debug_info_filename;

/** */
alias adw_about_window_get_designers = c_adw_about_window_get_designers;

/** */
alias adw_about_window_get_developer_name = c_adw_about_window_get_developer_name;

/** */
alias adw_about_window_get_developers = c_adw_about_window_get_developers;

/** */
alias adw_about_window_get_documenters = c_adw_about_window_get_documenters;

/** */
alias adw_about_window_get_issue_url = c_adw_about_window_get_issue_url;

/** */
alias adw_about_window_get_license = c_adw_about_window_get_license;

/** */
alias adw_about_window_get_license_type = c_adw_about_window_get_license_type;

/** */
alias adw_about_window_get_release_notes = c_adw_about_window_get_release_notes;

/** */
alias adw_about_window_get_release_notes_version = c_adw_about_window_get_release_notes_version;

/** */
alias adw_about_window_get_support_url = c_adw_about_window_get_support_url;

/** */
alias adw_about_window_get_translator_credits = c_adw_about_window_get_translator_credits;

/** */
alias adw_about_window_get_version = c_adw_about_window_get_version;

/** */
alias adw_about_window_get_website = c_adw_about_window_get_website;

/** */
alias adw_about_window_set_application_icon = c_adw_about_window_set_application_icon;

/** */
alias adw_about_window_set_application_name = c_adw_about_window_set_application_name;

/** */
alias adw_about_window_set_artists = c_adw_about_window_set_artists;

/** */
alias adw_about_window_set_comments = c_adw_about_window_set_comments;

/** */
alias adw_about_window_set_copyright = c_adw_about_window_set_copyright;

/** */
alias adw_about_window_set_debug_info = c_adw_about_window_set_debug_info;

/** */
alias adw_about_window_set_debug_info_filename = c_adw_about_window_set_debug_info_filename;

/** */
alias adw_about_window_set_designers = c_adw_about_window_set_designers;

/** */
alias adw_about_window_set_developer_name = c_adw_about_window_set_developer_name;

/** */
alias adw_about_window_set_developers = c_adw_about_window_set_developers;

/** */
alias adw_about_window_set_documenters = c_adw_about_window_set_documenters;

/** */
alias adw_about_window_set_issue_url = c_adw_about_window_set_issue_url;

/** */
alias adw_about_window_set_license = c_adw_about_window_set_license;

/** */
alias adw_about_window_set_license_type = c_adw_about_window_set_license_type;

/** */
alias adw_about_window_set_release_notes = c_adw_about_window_set_release_notes;

/** */
alias adw_about_window_set_release_notes_version = c_adw_about_window_set_release_notes_version;

/** */
alias adw_about_window_set_support_url = c_adw_about_window_set_support_url;

/** */
alias adw_about_window_set_translator_credits = c_adw_about_window_set_translator_credits;

/** */
alias adw_about_window_set_version = c_adw_about_window_set_version;

/** */
alias adw_about_window_set_website = c_adw_about_window_set_website;

// ActionRow

/** */
alias adw_action_row_get_type = c_adw_action_row_get_type;

/** */
alias adw_action_row_new = c_adw_action_row_new;

/** */
alias adw_action_row_activate = c_adw_action_row_activate;

/** */
alias adw_action_row_add_prefix = c_adw_action_row_add_prefix;

/** */
alias adw_action_row_add_suffix = c_adw_action_row_add_suffix;

/** */
alias adw_action_row_get_activatable_widget = c_adw_action_row_get_activatable_widget;

/** */
alias adw_action_row_get_icon_name = c_adw_action_row_get_icon_name;

/** */
alias adw_action_row_get_subtitle = c_adw_action_row_get_subtitle;

/** */
alias adw_action_row_get_subtitle_lines = c_adw_action_row_get_subtitle_lines;

/** */
alias adw_action_row_get_subtitle_selectable = c_adw_action_row_get_subtitle_selectable;

/** */
alias adw_action_row_get_title_lines = c_adw_action_row_get_title_lines;

/** */
alias adw_action_row_remove = c_adw_action_row_remove;

/** */
alias adw_action_row_set_activatable_widget = c_adw_action_row_set_activatable_widget;

/** */
alias adw_action_row_set_icon_name = c_adw_action_row_set_icon_name;

/** */
alias adw_action_row_set_subtitle = c_adw_action_row_set_subtitle;

/** */
alias adw_action_row_set_subtitle_lines = c_adw_action_row_set_subtitle_lines;

/** */
alias adw_action_row_set_subtitle_selectable = c_adw_action_row_set_subtitle_selectable;

/** */
alias adw_action_row_set_title_lines = c_adw_action_row_set_title_lines;

// AlertDialog

/** */
alias adw_alert_dialog_get_type = c_adw_alert_dialog_get_type;

/** */
alias adw_alert_dialog_new = c_adw_alert_dialog_new;

/** */
alias adw_alert_dialog_add_response = c_adw_alert_dialog_add_response;

/** */
alias adw_alert_dialog_add_responses = c_adw_alert_dialog_add_responses;

/** */
alias adw_alert_dialog_choose = c_adw_alert_dialog_choose;

/** */
alias adw_alert_dialog_choose_finish = c_adw_alert_dialog_choose_finish;

/** */
alias adw_alert_dialog_format_body = c_adw_alert_dialog_format_body;

/** */
alias adw_alert_dialog_format_body_markup = c_adw_alert_dialog_format_body_markup;

/** */
alias adw_alert_dialog_format_heading = c_adw_alert_dialog_format_heading;

/** */
alias adw_alert_dialog_format_heading_markup = c_adw_alert_dialog_format_heading_markup;

/** */
alias adw_alert_dialog_get_body = c_adw_alert_dialog_get_body;

/** */
alias adw_alert_dialog_get_body_use_markup = c_adw_alert_dialog_get_body_use_markup;

/** */
alias adw_alert_dialog_get_close_response = c_adw_alert_dialog_get_close_response;

/** */
alias adw_alert_dialog_get_default_response = c_adw_alert_dialog_get_default_response;

/** */
alias adw_alert_dialog_get_extra_child = c_adw_alert_dialog_get_extra_child;

/** */
alias adw_alert_dialog_get_heading = c_adw_alert_dialog_get_heading;

/** */
alias adw_alert_dialog_get_heading_use_markup = c_adw_alert_dialog_get_heading_use_markup;

/** */
alias adw_alert_dialog_get_prefer_wide_layout = c_adw_alert_dialog_get_prefer_wide_layout;

/** */
alias adw_alert_dialog_get_response_appearance = c_adw_alert_dialog_get_response_appearance;

/** */
alias adw_alert_dialog_get_response_enabled = c_adw_alert_dialog_get_response_enabled;

/** */
alias adw_alert_dialog_get_response_label = c_adw_alert_dialog_get_response_label;

/** */
alias adw_alert_dialog_has_response = c_adw_alert_dialog_has_response;

/** */
alias adw_alert_dialog_remove_response = c_adw_alert_dialog_remove_response;

/** */
alias adw_alert_dialog_set_body = c_adw_alert_dialog_set_body;

/** */
alias adw_alert_dialog_set_body_use_markup = c_adw_alert_dialog_set_body_use_markup;

/** */
alias adw_alert_dialog_set_close_response = c_adw_alert_dialog_set_close_response;

/** */
alias adw_alert_dialog_set_default_response = c_adw_alert_dialog_set_default_response;

/** */
alias adw_alert_dialog_set_extra_child = c_adw_alert_dialog_set_extra_child;

/** */
alias adw_alert_dialog_set_heading = c_adw_alert_dialog_set_heading;

/** */
alias adw_alert_dialog_set_heading_use_markup = c_adw_alert_dialog_set_heading_use_markup;

/** */
alias adw_alert_dialog_set_prefer_wide_layout = c_adw_alert_dialog_set_prefer_wide_layout;

/** */
alias adw_alert_dialog_set_response_appearance = c_adw_alert_dialog_set_response_appearance;

/** */
alias adw_alert_dialog_set_response_enabled = c_adw_alert_dialog_set_response_enabled;

/** */
alias adw_alert_dialog_set_response_label = c_adw_alert_dialog_set_response_label;

// Animation

/** */
alias adw_animation_get_type = c_adw_animation_get_type;

/** */
alias adw_animation_get_follow_enable_animations_setting = c_adw_animation_get_follow_enable_animations_setting;

/** */
alias adw_animation_get_state = c_adw_animation_get_state;

/** */
alias adw_animation_get_target = c_adw_animation_get_target;

/** */
alias adw_animation_get_value = c_adw_animation_get_value;

/** */
alias adw_animation_get_widget = c_adw_animation_get_widget;

/** */
alias adw_animation_pause = c_adw_animation_pause;

/** */
alias adw_animation_play = c_adw_animation_play;

/** */
alias adw_animation_reset = c_adw_animation_reset;

/** */
alias adw_animation_resume = c_adw_animation_resume;

/** */
alias adw_animation_set_follow_enable_animations_setting = c_adw_animation_set_follow_enable_animations_setting;

/** */
alias adw_animation_set_target = c_adw_animation_set_target;

/** */
alias adw_animation_skip = c_adw_animation_skip;

// AnimationTarget

/** */
alias adw_animation_target_get_type = c_adw_animation_target_get_type;

// Application

/** */
alias adw_application_get_type = c_adw_application_get_type;

/** */
alias adw_application_new = c_adw_application_new;

/** */
alias adw_application_get_style_manager = c_adw_application_get_style_manager;

// ApplicationWindow

/** */
alias adw_application_window_get_type = c_adw_application_window_get_type;

/** */
alias adw_application_window_new = c_adw_application_window_new;

/** */
alias adw_application_window_add_breakpoint = c_adw_application_window_add_breakpoint;

/** */
alias adw_application_window_get_adaptive_preview = c_adw_application_window_get_adaptive_preview;

/** */
alias adw_application_window_get_content = c_adw_application_window_get_content;

/** */
alias adw_application_window_get_current_breakpoint = c_adw_application_window_get_current_breakpoint;

/** */
alias adw_application_window_get_dialogs = c_adw_application_window_get_dialogs;

/** */
alias adw_application_window_get_visible_dialog = c_adw_application_window_get_visible_dialog;

/** */
alias adw_application_window_set_adaptive_preview = c_adw_application_window_set_adaptive_preview;

/** */
alias adw_application_window_set_content = c_adw_application_window_set_content;

// Avatar

/** */
alias adw_avatar_get_type = c_adw_avatar_get_type;

/** */
alias adw_avatar_new = c_adw_avatar_new;

/** */
alias adw_avatar_draw_to_texture = c_adw_avatar_draw_to_texture;

/** */
alias adw_avatar_get_custom_image = c_adw_avatar_get_custom_image;

/** */
alias adw_avatar_get_icon_name = c_adw_avatar_get_icon_name;

/** */
alias adw_avatar_get_show_initials = c_adw_avatar_get_show_initials;

/** */
alias adw_avatar_get_size = c_adw_avatar_get_size;

/** */
alias adw_avatar_get_text = c_adw_avatar_get_text;

/** */
alias adw_avatar_set_custom_image = c_adw_avatar_set_custom_image;

/** */
alias adw_avatar_set_icon_name = c_adw_avatar_set_icon_name;

/** */
alias adw_avatar_set_show_initials = c_adw_avatar_set_show_initials;

/** */
alias adw_avatar_set_size = c_adw_avatar_set_size;

/** */
alias adw_avatar_set_text = c_adw_avatar_set_text;

// Banner

/** */
alias adw_banner_get_type = c_adw_banner_get_type;

/** */
alias adw_banner_new = c_adw_banner_new;

/** */
alias adw_banner_get_button_label = c_adw_banner_get_button_label;

/** */
alias adw_banner_get_button_style = c_adw_banner_get_button_style;

/** */
alias adw_banner_get_revealed = c_adw_banner_get_revealed;

/** */
alias adw_banner_get_title = c_adw_banner_get_title;

/** */
alias adw_banner_get_use_markup = c_adw_banner_get_use_markup;

/** */
alias adw_banner_set_button_label = c_adw_banner_set_button_label;

/** */
alias adw_banner_set_button_style = c_adw_banner_set_button_style;

/** */
alias adw_banner_set_revealed = c_adw_banner_set_revealed;

/** */
alias adw_banner_set_title = c_adw_banner_set_title;

/** */
alias adw_banner_set_use_markup = c_adw_banner_set_use_markup;

// Bin

/** */
alias adw_bin_get_type = c_adw_bin_get_type;

/** */
alias adw_bin_new = c_adw_bin_new;

/** */
alias adw_bin_get_child = c_adw_bin_get_child;

/** */
alias adw_bin_set_child = c_adw_bin_set_child;

// BottomSheet

/** */
alias adw_bottom_sheet_get_type = c_adw_bottom_sheet_get_type;

/** */
alias adw_bottom_sheet_new = c_adw_bottom_sheet_new;

/** */
alias adw_bottom_sheet_get_align = c_adw_bottom_sheet_get_align;

/** */
alias adw_bottom_sheet_get_bottom_bar = c_adw_bottom_sheet_get_bottom_bar;

/** */
alias adw_bottom_sheet_get_bottom_bar_height = c_adw_bottom_sheet_get_bottom_bar_height;

/** */
alias adw_bottom_sheet_get_can_close = c_adw_bottom_sheet_get_can_close;

/** */
alias adw_bottom_sheet_get_can_open = c_adw_bottom_sheet_get_can_open;

/** */
alias adw_bottom_sheet_get_content = c_adw_bottom_sheet_get_content;

/** */
alias adw_bottom_sheet_get_full_width = c_adw_bottom_sheet_get_full_width;

/** */
alias adw_bottom_sheet_get_modal = c_adw_bottom_sheet_get_modal;

/** */
alias adw_bottom_sheet_get_open = c_adw_bottom_sheet_get_open;

/** */
alias adw_bottom_sheet_get_reveal_bottom_bar = c_adw_bottom_sheet_get_reveal_bottom_bar;

/** */
alias adw_bottom_sheet_get_sheet = c_adw_bottom_sheet_get_sheet;

/** */
alias adw_bottom_sheet_get_sheet_height = c_adw_bottom_sheet_get_sheet_height;

/** */
alias adw_bottom_sheet_get_show_drag_handle = c_adw_bottom_sheet_get_show_drag_handle;

/** */
alias adw_bottom_sheet_set_align = c_adw_bottom_sheet_set_align;

/** */
alias adw_bottom_sheet_set_bottom_bar = c_adw_bottom_sheet_set_bottom_bar;

/** */
alias adw_bottom_sheet_set_can_close = c_adw_bottom_sheet_set_can_close;

/** */
alias adw_bottom_sheet_set_can_open = c_adw_bottom_sheet_set_can_open;

/** */
alias adw_bottom_sheet_set_content = c_adw_bottom_sheet_set_content;

/** */
alias adw_bottom_sheet_set_full_width = c_adw_bottom_sheet_set_full_width;

/** */
alias adw_bottom_sheet_set_modal = c_adw_bottom_sheet_set_modal;

/** */
alias adw_bottom_sheet_set_open = c_adw_bottom_sheet_set_open;

/** */
alias adw_bottom_sheet_set_reveal_bottom_bar = c_adw_bottom_sheet_set_reveal_bottom_bar;

/** */
alias adw_bottom_sheet_set_sheet = c_adw_bottom_sheet_set_sheet;

/** */
alias adw_bottom_sheet_set_show_drag_handle = c_adw_bottom_sheet_set_show_drag_handle;

// Breakpoint

/** */
alias adw_breakpoint_get_type = c_adw_breakpoint_get_type;

/** */
alias adw_breakpoint_new = c_adw_breakpoint_new;

/** */
alias adw_breakpoint_add_setter = c_adw_breakpoint_add_setter;

/** */
alias adw_breakpoint_add_setters = c_adw_breakpoint_add_setters;

/** */
alias adw_breakpoint_add_setters_valist = c_adw_breakpoint_add_setters_valist;

/** */
alias adw_breakpoint_add_settersv = c_adw_breakpoint_add_settersv;

/** */
alias adw_breakpoint_get_condition = c_adw_breakpoint_get_condition;

/** */
alias adw_breakpoint_set_condition = c_adw_breakpoint_set_condition;

// BreakpointBin

/** */
alias adw_breakpoint_bin_get_type = c_adw_breakpoint_bin_get_type;

/** */
alias adw_breakpoint_bin_new = c_adw_breakpoint_bin_new;

/** */
alias adw_breakpoint_bin_add_breakpoint = c_adw_breakpoint_bin_add_breakpoint;

/** */
alias adw_breakpoint_bin_get_child = c_adw_breakpoint_bin_get_child;

/** */
alias adw_breakpoint_bin_get_current_breakpoint = c_adw_breakpoint_bin_get_current_breakpoint;

/** */
alias adw_breakpoint_bin_remove_breakpoint = c_adw_breakpoint_bin_remove_breakpoint;

/** */
alias adw_breakpoint_bin_set_child = c_adw_breakpoint_bin_set_child;

// BreakpointCondition

/** */
alias adw_breakpoint_condition_get_type = c_adw_breakpoint_condition_get_type;

/** */
alias adw_breakpoint_condition_new_and = c_adw_breakpoint_condition_new_and;

/** */
alias adw_breakpoint_condition_new_length = c_adw_breakpoint_condition_new_length;

/** */
alias adw_breakpoint_condition_new_or = c_adw_breakpoint_condition_new_or;

/** */
alias adw_breakpoint_condition_new_ratio = c_adw_breakpoint_condition_new_ratio;

/** */
alias adw_breakpoint_condition_copy = c_adw_breakpoint_condition_copy;

/** */
alias adw_breakpoint_condition_free = c_adw_breakpoint_condition_free;

/** */
alias adw_breakpoint_condition_to_string = c_adw_breakpoint_condition_to_string;

/** */
alias adw_breakpoint_condition_parse = c_adw_breakpoint_condition_parse;

// ButtonContent

/** */
alias adw_button_content_get_type = c_adw_button_content_get_type;

/** */
alias adw_button_content_new = c_adw_button_content_new;

/** */
alias adw_button_content_get_can_shrink = c_adw_button_content_get_can_shrink;

/** */
alias adw_button_content_get_icon_name = c_adw_button_content_get_icon_name;

/** */
alias adw_button_content_get_label = c_adw_button_content_get_label;

/** */
alias adw_button_content_get_use_underline = c_adw_button_content_get_use_underline;

/** */
alias adw_button_content_set_can_shrink = c_adw_button_content_set_can_shrink;

/** */
alias adw_button_content_set_icon_name = c_adw_button_content_set_icon_name;

/** */
alias adw_button_content_set_label = c_adw_button_content_set_label;

/** */
alias adw_button_content_set_use_underline = c_adw_button_content_set_use_underline;

// ButtonRow

/** */
alias adw_button_row_get_type = c_adw_button_row_get_type;

/** */
alias adw_button_row_new = c_adw_button_row_new;

/** */
alias adw_button_row_get_end_icon_name = c_adw_button_row_get_end_icon_name;

/** */
alias adw_button_row_get_start_icon_name = c_adw_button_row_get_start_icon_name;

/** */
alias adw_button_row_set_end_icon_name = c_adw_button_row_set_end_icon_name;

/** */
alias adw_button_row_set_start_icon_name = c_adw_button_row_set_start_icon_name;

// CallbackAnimationTarget

/** */
alias adw_callback_animation_target_get_type = c_adw_callback_animation_target_get_type;

/** */
alias adw_callback_animation_target_new = c_adw_callback_animation_target_new;

// Carousel

/** */
alias adw_carousel_get_type = c_adw_carousel_get_type;

/** */
alias adw_carousel_new = c_adw_carousel_new;

/** */
alias adw_carousel_append = c_adw_carousel_append;

/** */
alias adw_carousel_get_allow_long_swipes = c_adw_carousel_get_allow_long_swipes;

/** */
alias adw_carousel_get_allow_mouse_drag = c_adw_carousel_get_allow_mouse_drag;

/** */
alias adw_carousel_get_allow_scroll_wheel = c_adw_carousel_get_allow_scroll_wheel;

/** */
alias adw_carousel_get_interactive = c_adw_carousel_get_interactive;

/** */
alias adw_carousel_get_n_pages = c_adw_carousel_get_n_pages;

/** */
alias adw_carousel_get_nth_page = c_adw_carousel_get_nth_page;

/** */
alias adw_carousel_get_position = c_adw_carousel_get_position;

/** */
alias adw_carousel_get_reveal_duration = c_adw_carousel_get_reveal_duration;

/** */
alias adw_carousel_get_scroll_params = c_adw_carousel_get_scroll_params;

/** */
alias adw_carousel_get_spacing = c_adw_carousel_get_spacing;

/** */
alias adw_carousel_insert = c_adw_carousel_insert;

/** */
alias adw_carousel_prepend = c_adw_carousel_prepend;

/** */
alias adw_carousel_remove = c_adw_carousel_remove;

/** */
alias adw_carousel_reorder = c_adw_carousel_reorder;

/** */
alias adw_carousel_scroll_to = c_adw_carousel_scroll_to;

/** */
alias adw_carousel_set_allow_long_swipes = c_adw_carousel_set_allow_long_swipes;

/** */
alias adw_carousel_set_allow_mouse_drag = c_adw_carousel_set_allow_mouse_drag;

/** */
alias adw_carousel_set_allow_scroll_wheel = c_adw_carousel_set_allow_scroll_wheel;

/** */
alias adw_carousel_set_interactive = c_adw_carousel_set_interactive;

/** */
alias adw_carousel_set_reveal_duration = c_adw_carousel_set_reveal_duration;

/** */
alias adw_carousel_set_scroll_params = c_adw_carousel_set_scroll_params;

/** */
alias adw_carousel_set_spacing = c_adw_carousel_set_spacing;

// CarouselIndicatorDots

/** */
alias adw_carousel_indicator_dots_get_type = c_adw_carousel_indicator_dots_get_type;

/** */
alias adw_carousel_indicator_dots_new = c_adw_carousel_indicator_dots_new;

/** */
alias adw_carousel_indicator_dots_get_carousel = c_adw_carousel_indicator_dots_get_carousel;

/** */
alias adw_carousel_indicator_dots_set_carousel = c_adw_carousel_indicator_dots_set_carousel;

// CarouselIndicatorLines

/** */
alias adw_carousel_indicator_lines_get_type = c_adw_carousel_indicator_lines_get_type;

/** */
alias adw_carousel_indicator_lines_new = c_adw_carousel_indicator_lines_new;

/** */
alias adw_carousel_indicator_lines_get_carousel = c_adw_carousel_indicator_lines_get_carousel;

/** */
alias adw_carousel_indicator_lines_set_carousel = c_adw_carousel_indicator_lines_set_carousel;

// Clamp

/** */
alias adw_clamp_get_type = c_adw_clamp_get_type;

/** */
alias adw_clamp_new = c_adw_clamp_new;

/** */
alias adw_clamp_get_child = c_adw_clamp_get_child;

/** */
alias adw_clamp_get_maximum_size = c_adw_clamp_get_maximum_size;

/** */
alias adw_clamp_get_tightening_threshold = c_adw_clamp_get_tightening_threshold;

/** */
alias adw_clamp_get_unit = c_adw_clamp_get_unit;

/** */
alias adw_clamp_set_child = c_adw_clamp_set_child;

/** */
alias adw_clamp_set_maximum_size = c_adw_clamp_set_maximum_size;

/** */
alias adw_clamp_set_tightening_threshold = c_adw_clamp_set_tightening_threshold;

/** */
alias adw_clamp_set_unit = c_adw_clamp_set_unit;

// ClampLayout

/** */
alias adw_clamp_layout_get_type = c_adw_clamp_layout_get_type;

/** */
alias adw_clamp_layout_new = c_adw_clamp_layout_new;

/** */
alias adw_clamp_layout_get_maximum_size = c_adw_clamp_layout_get_maximum_size;

/** */
alias adw_clamp_layout_get_tightening_threshold = c_adw_clamp_layout_get_tightening_threshold;

/** */
alias adw_clamp_layout_get_unit = c_adw_clamp_layout_get_unit;

/** */
alias adw_clamp_layout_set_maximum_size = c_adw_clamp_layout_set_maximum_size;

/** */
alias adw_clamp_layout_set_tightening_threshold = c_adw_clamp_layout_set_tightening_threshold;

/** */
alias adw_clamp_layout_set_unit = c_adw_clamp_layout_set_unit;

// ClampScrollable

/** */
alias adw_clamp_scrollable_get_type = c_adw_clamp_scrollable_get_type;

/** */
alias adw_clamp_scrollable_new = c_adw_clamp_scrollable_new;

/** */
alias adw_clamp_scrollable_get_child = c_adw_clamp_scrollable_get_child;

/** */
alias adw_clamp_scrollable_get_maximum_size = c_adw_clamp_scrollable_get_maximum_size;

/** */
alias adw_clamp_scrollable_get_tightening_threshold = c_adw_clamp_scrollable_get_tightening_threshold;

/** */
alias adw_clamp_scrollable_get_unit = c_adw_clamp_scrollable_get_unit;

/** */
alias adw_clamp_scrollable_set_child = c_adw_clamp_scrollable_set_child;

/** */
alias adw_clamp_scrollable_set_maximum_size = c_adw_clamp_scrollable_set_maximum_size;

/** */
alias adw_clamp_scrollable_set_tightening_threshold = c_adw_clamp_scrollable_set_tightening_threshold;

/** */
alias adw_clamp_scrollable_set_unit = c_adw_clamp_scrollable_set_unit;

// ComboRow

/** */
alias adw_combo_row_get_type = c_adw_combo_row_get_type;

/** */
alias adw_combo_row_new = c_adw_combo_row_new;

/** */
alias adw_combo_row_get_enable_search = c_adw_combo_row_get_enable_search;

/** */
alias adw_combo_row_get_expression = c_adw_combo_row_get_expression;

/** */
alias adw_combo_row_get_factory = c_adw_combo_row_get_factory;

/** */
alias adw_combo_row_get_header_factory = c_adw_combo_row_get_header_factory;

/** */
alias adw_combo_row_get_list_factory = c_adw_combo_row_get_list_factory;

/** */
alias adw_combo_row_get_model = c_adw_combo_row_get_model;

/** */
alias adw_combo_row_get_search_match_mode = c_adw_combo_row_get_search_match_mode;

/** */
alias adw_combo_row_get_selected = c_adw_combo_row_get_selected;

/** */
alias adw_combo_row_get_selected_item = c_adw_combo_row_get_selected_item;

/** */
alias adw_combo_row_get_use_subtitle = c_adw_combo_row_get_use_subtitle;

/** */
alias adw_combo_row_set_enable_search = c_adw_combo_row_set_enable_search;

/** */
alias adw_combo_row_set_expression = c_adw_combo_row_set_expression;

/** */
alias adw_combo_row_set_factory = c_adw_combo_row_set_factory;

/** */
alias adw_combo_row_set_header_factory = c_adw_combo_row_set_header_factory;

/** */
alias adw_combo_row_set_list_factory = c_adw_combo_row_set_list_factory;

/** */
alias adw_combo_row_set_model = c_adw_combo_row_set_model;

/** */
alias adw_combo_row_set_search_match_mode = c_adw_combo_row_set_search_match_mode;

/** */
alias adw_combo_row_set_selected = c_adw_combo_row_set_selected;

/** */
alias adw_combo_row_set_use_subtitle = c_adw_combo_row_set_use_subtitle;

// Dialog

/** */
alias adw_dialog_get_type = c_adw_dialog_get_type;

/** */
alias adw_dialog_new = c_adw_dialog_new;

/** */
alias adw_dialog_add_breakpoint = c_adw_dialog_add_breakpoint;

/** */
alias adw_dialog_close = c_adw_dialog_close;

/** */
alias adw_dialog_force_close = c_adw_dialog_force_close;

/** */
alias adw_dialog_get_can_close = c_adw_dialog_get_can_close;

/** */
alias adw_dialog_get_child = c_adw_dialog_get_child;

/** */
alias adw_dialog_get_content_height = c_adw_dialog_get_content_height;

/** */
alias adw_dialog_get_content_width = c_adw_dialog_get_content_width;

/** */
alias adw_dialog_get_current_breakpoint = c_adw_dialog_get_current_breakpoint;

/** */
alias adw_dialog_get_default_widget = c_adw_dialog_get_default_widget;

/** */
alias adw_dialog_get_focus = c_adw_dialog_get_focus;

/** */
alias adw_dialog_get_follows_content_size = c_adw_dialog_get_follows_content_size;

/** */
alias adw_dialog_get_presentation_mode = c_adw_dialog_get_presentation_mode;

/** */
alias adw_dialog_get_title = c_adw_dialog_get_title;

/** */
alias adw_dialog_present = c_adw_dialog_present;

/** */
alias adw_dialog_set_can_close = c_adw_dialog_set_can_close;

/** */
alias adw_dialog_set_child = c_adw_dialog_set_child;

/** */
alias adw_dialog_set_content_height = c_adw_dialog_set_content_height;

/** */
alias adw_dialog_set_content_width = c_adw_dialog_set_content_width;

/** */
alias adw_dialog_set_default_widget = c_adw_dialog_set_default_widget;

/** */
alias adw_dialog_set_focus = c_adw_dialog_set_focus;

/** */
alias adw_dialog_set_follows_content_size = c_adw_dialog_set_follows_content_size;

/** */
alias adw_dialog_set_presentation_mode = c_adw_dialog_set_presentation_mode;

/** */
alias adw_dialog_set_title = c_adw_dialog_set_title;

// EntryRow

/** */
alias adw_entry_row_get_type = c_adw_entry_row_get_type;

/** */
alias adw_entry_row_new = c_adw_entry_row_new;

/** */
alias adw_entry_row_add_prefix = c_adw_entry_row_add_prefix;

/** */
alias adw_entry_row_add_suffix = c_adw_entry_row_add_suffix;

/** */
alias adw_entry_row_get_activates_default = c_adw_entry_row_get_activates_default;

/** */
alias adw_entry_row_get_attributes = c_adw_entry_row_get_attributes;

/** */
alias adw_entry_row_get_enable_emoji_completion = c_adw_entry_row_get_enable_emoji_completion;

/** */
alias adw_entry_row_get_input_hints = c_adw_entry_row_get_input_hints;

/** */
alias adw_entry_row_get_input_purpose = c_adw_entry_row_get_input_purpose;

/** */
alias adw_entry_row_get_max_length = c_adw_entry_row_get_max_length;

/** */
alias adw_entry_row_get_show_apply_button = c_adw_entry_row_get_show_apply_button;

/** */
alias adw_entry_row_get_text_length = c_adw_entry_row_get_text_length;

/** */
alias adw_entry_row_grab_focus_without_selecting = c_adw_entry_row_grab_focus_without_selecting;

/** */
alias adw_entry_row_remove = c_adw_entry_row_remove;

/** */
alias adw_entry_row_set_activates_default = c_adw_entry_row_set_activates_default;

/** */
alias adw_entry_row_set_attributes = c_adw_entry_row_set_attributes;

/** */
alias adw_entry_row_set_enable_emoji_completion = c_adw_entry_row_set_enable_emoji_completion;

/** */
alias adw_entry_row_set_input_hints = c_adw_entry_row_set_input_hints;

/** */
alias adw_entry_row_set_input_purpose = c_adw_entry_row_set_input_purpose;

/** */
alias adw_entry_row_set_max_length = c_adw_entry_row_set_max_length;

/** */
alias adw_entry_row_set_show_apply_button = c_adw_entry_row_set_show_apply_button;

// EnumListItem

/** */
alias adw_enum_list_item_get_type = c_adw_enum_list_item_get_type;

/** */
alias adw_enum_list_item_get_name = c_adw_enum_list_item_get_name;

/** */
alias adw_enum_list_item_get_nick = c_adw_enum_list_item_get_nick;

/** */
alias adw_enum_list_item_get_value = c_adw_enum_list_item_get_value;

// EnumListModel

/** */
alias adw_enum_list_model_get_type = c_adw_enum_list_model_get_type;

/** */
alias adw_enum_list_model_new = c_adw_enum_list_model_new;

/** */
alias adw_enum_list_model_find_position = c_adw_enum_list_model_find_position;

/** */
alias adw_enum_list_model_get_enum_type = c_adw_enum_list_model_get_enum_type;

// ExpanderRow

/** */
alias adw_expander_row_get_type = c_adw_expander_row_get_type;

/** */
alias adw_expander_row_new = c_adw_expander_row_new;

/** */
alias adw_expander_row_add_action = c_adw_expander_row_add_action;

/** */
alias adw_expander_row_add_prefix = c_adw_expander_row_add_prefix;

/** */
alias adw_expander_row_add_row = c_adw_expander_row_add_row;

/** */
alias adw_expander_row_add_suffix = c_adw_expander_row_add_suffix;

/** */
alias adw_expander_row_get_enable_expansion = c_adw_expander_row_get_enable_expansion;

/** */
alias adw_expander_row_get_expanded = c_adw_expander_row_get_expanded;

/** */
alias adw_expander_row_get_icon_name = c_adw_expander_row_get_icon_name;

/** */
alias adw_expander_row_get_show_enable_switch = c_adw_expander_row_get_show_enable_switch;

/** */
alias adw_expander_row_get_subtitle = c_adw_expander_row_get_subtitle;

/** */
alias adw_expander_row_get_subtitle_lines = c_adw_expander_row_get_subtitle_lines;

/** */
alias adw_expander_row_get_title_lines = c_adw_expander_row_get_title_lines;

/** */
alias adw_expander_row_remove = c_adw_expander_row_remove;

/** */
alias adw_expander_row_set_enable_expansion = c_adw_expander_row_set_enable_expansion;

/** */
alias adw_expander_row_set_expanded = c_adw_expander_row_set_expanded;

/** */
alias adw_expander_row_set_icon_name = c_adw_expander_row_set_icon_name;

/** */
alias adw_expander_row_set_show_enable_switch = c_adw_expander_row_set_show_enable_switch;

/** */
alias adw_expander_row_set_subtitle = c_adw_expander_row_set_subtitle;

/** */
alias adw_expander_row_set_subtitle_lines = c_adw_expander_row_set_subtitle_lines;

/** */
alias adw_expander_row_set_title_lines = c_adw_expander_row_set_title_lines;

// Flap

/** */
alias adw_flap_get_type = c_adw_flap_get_type;

/** */
alias adw_flap_new = c_adw_flap_new;

/** */
alias adw_flap_get_content = c_adw_flap_get_content;

/** */
alias adw_flap_get_flap = c_adw_flap_get_flap;

/** */
alias adw_flap_get_flap_position = c_adw_flap_get_flap_position;

/** */
alias adw_flap_get_fold_duration = c_adw_flap_get_fold_duration;

/** */
alias adw_flap_get_fold_policy = c_adw_flap_get_fold_policy;

/** */
alias adw_flap_get_fold_threshold_policy = c_adw_flap_get_fold_threshold_policy;

/** */
alias adw_flap_get_folded = c_adw_flap_get_folded;

/** */
alias adw_flap_get_locked = c_adw_flap_get_locked;

/** */
alias adw_flap_get_modal = c_adw_flap_get_modal;

/** */
alias adw_flap_get_reveal_flap = c_adw_flap_get_reveal_flap;

/** */
alias adw_flap_get_reveal_params = c_adw_flap_get_reveal_params;

/** */
alias adw_flap_get_reveal_progress = c_adw_flap_get_reveal_progress;

/** */
alias adw_flap_get_separator = c_adw_flap_get_separator;

/** */
alias adw_flap_get_swipe_to_close = c_adw_flap_get_swipe_to_close;

/** */
alias adw_flap_get_swipe_to_open = c_adw_flap_get_swipe_to_open;

/** */
alias adw_flap_get_transition_type = c_adw_flap_get_transition_type;

/** */
alias adw_flap_set_content = c_adw_flap_set_content;

/** */
alias adw_flap_set_flap = c_adw_flap_set_flap;

/** */
alias adw_flap_set_flap_position = c_adw_flap_set_flap_position;

/** */
alias adw_flap_set_fold_duration = c_adw_flap_set_fold_duration;

/** */
alias adw_flap_set_fold_policy = c_adw_flap_set_fold_policy;

/** */
alias adw_flap_set_fold_threshold_policy = c_adw_flap_set_fold_threshold_policy;

/** */
alias adw_flap_set_locked = c_adw_flap_set_locked;

/** */
alias adw_flap_set_modal = c_adw_flap_set_modal;

/** */
alias adw_flap_set_reveal_flap = c_adw_flap_set_reveal_flap;

/** */
alias adw_flap_set_reveal_params = c_adw_flap_set_reveal_params;

/** */
alias adw_flap_set_separator = c_adw_flap_set_separator;

/** */
alias adw_flap_set_swipe_to_close = c_adw_flap_set_swipe_to_close;

/** */
alias adw_flap_set_swipe_to_open = c_adw_flap_set_swipe_to_open;

/** */
alias adw_flap_set_transition_type = c_adw_flap_set_transition_type;

// HeaderBar

/** */
alias adw_header_bar_get_type = c_adw_header_bar_get_type;

/** */
alias adw_header_bar_new = c_adw_header_bar_new;

/** */
alias adw_header_bar_get_centering_policy = c_adw_header_bar_get_centering_policy;

/** */
alias adw_header_bar_get_decoration_layout = c_adw_header_bar_get_decoration_layout;

/** */
alias adw_header_bar_get_show_back_button = c_adw_header_bar_get_show_back_button;

/** */
alias adw_header_bar_get_show_end_title_buttons = c_adw_header_bar_get_show_end_title_buttons;

/** */
alias adw_header_bar_get_show_start_title_buttons = c_adw_header_bar_get_show_start_title_buttons;

/** */
alias adw_header_bar_get_show_title = c_adw_header_bar_get_show_title;

/** */
alias adw_header_bar_get_title_widget = c_adw_header_bar_get_title_widget;

/** */
alias adw_header_bar_pack_end = c_adw_header_bar_pack_end;

/** */
alias adw_header_bar_pack_start = c_adw_header_bar_pack_start;

/** */
alias adw_header_bar_remove = c_adw_header_bar_remove;

/** */
alias adw_header_bar_set_centering_policy = c_adw_header_bar_set_centering_policy;

/** */
alias adw_header_bar_set_decoration_layout = c_adw_header_bar_set_decoration_layout;

/** */
alias adw_header_bar_set_show_back_button = c_adw_header_bar_set_show_back_button;

/** */
alias adw_header_bar_set_show_end_title_buttons = c_adw_header_bar_set_show_end_title_buttons;

/** */
alias adw_header_bar_set_show_start_title_buttons = c_adw_header_bar_set_show_start_title_buttons;

/** */
alias adw_header_bar_set_show_title = c_adw_header_bar_set_show_title;

/** */
alias adw_header_bar_set_title_widget = c_adw_header_bar_set_title_widget;

// InlineViewSwitcher

/** */
alias adw_inline_view_switcher_get_type = c_adw_inline_view_switcher_get_type;

/** */
alias adw_inline_view_switcher_new = c_adw_inline_view_switcher_new;

/** */
alias adw_inline_view_switcher_get_can_shrink = c_adw_inline_view_switcher_get_can_shrink;

/** */
alias adw_inline_view_switcher_get_display_mode = c_adw_inline_view_switcher_get_display_mode;

/** */
alias adw_inline_view_switcher_get_homogeneous = c_adw_inline_view_switcher_get_homogeneous;

/** */
alias adw_inline_view_switcher_get_stack = c_adw_inline_view_switcher_get_stack;

/** */
alias adw_inline_view_switcher_set_can_shrink = c_adw_inline_view_switcher_set_can_shrink;

/** */
alias adw_inline_view_switcher_set_display_mode = c_adw_inline_view_switcher_set_display_mode;

/** */
alias adw_inline_view_switcher_set_homogeneous = c_adw_inline_view_switcher_set_homogeneous;

/** */
alias adw_inline_view_switcher_set_stack = c_adw_inline_view_switcher_set_stack;

// Layout

/** */
alias adw_layout_get_type = c_adw_layout_get_type;

/** */
alias adw_layout_new = c_adw_layout_new;

/** */
alias adw_layout_get_content = c_adw_layout_get_content;

/** */
alias adw_layout_get_name = c_adw_layout_get_name;

/** */
alias adw_layout_set_name = c_adw_layout_set_name;

// LayoutSlot

/** */
alias adw_layout_slot_get_type = c_adw_layout_slot_get_type;

/** */
alias adw_layout_slot_new = c_adw_layout_slot_new;

/** */
alias adw_layout_slot_get_slot_id = c_adw_layout_slot_get_slot_id;

// Leaflet

/** */
alias adw_leaflet_get_type = c_adw_leaflet_get_type;

/** */
alias adw_leaflet_new = c_adw_leaflet_new;

/** */
alias adw_leaflet_append = c_adw_leaflet_append;

/** */
alias adw_leaflet_get_adjacent_child = c_adw_leaflet_get_adjacent_child;

/** */
alias adw_leaflet_get_can_navigate_back = c_adw_leaflet_get_can_navigate_back;

/** */
alias adw_leaflet_get_can_navigate_forward = c_adw_leaflet_get_can_navigate_forward;

/** */
alias adw_leaflet_get_can_unfold = c_adw_leaflet_get_can_unfold;

/** */
alias adw_leaflet_get_child_by_name = c_adw_leaflet_get_child_by_name;

/** */
alias adw_leaflet_get_child_transition_params = c_adw_leaflet_get_child_transition_params;

/** */
alias adw_leaflet_get_child_transition_running = c_adw_leaflet_get_child_transition_running;

/** */
alias adw_leaflet_get_fold_threshold_policy = c_adw_leaflet_get_fold_threshold_policy;

/** */
alias adw_leaflet_get_folded = c_adw_leaflet_get_folded;

/** */
alias adw_leaflet_get_homogeneous = c_adw_leaflet_get_homogeneous;

/** */
alias adw_leaflet_get_mode_transition_duration = c_adw_leaflet_get_mode_transition_duration;

/** */
alias adw_leaflet_get_page = c_adw_leaflet_get_page;

/** */
alias adw_leaflet_get_pages = c_adw_leaflet_get_pages;

/** */
alias adw_leaflet_get_transition_type = c_adw_leaflet_get_transition_type;

/** */
alias adw_leaflet_get_visible_child = c_adw_leaflet_get_visible_child;

/** */
alias adw_leaflet_get_visible_child_name = c_adw_leaflet_get_visible_child_name;

/** */
alias adw_leaflet_insert_child_after = c_adw_leaflet_insert_child_after;

/** */
alias adw_leaflet_navigate = c_adw_leaflet_navigate;

/** */
alias adw_leaflet_prepend = c_adw_leaflet_prepend;

/** */
alias adw_leaflet_remove = c_adw_leaflet_remove;

/** */
alias adw_leaflet_reorder_child_after = c_adw_leaflet_reorder_child_after;

/** */
alias adw_leaflet_set_can_navigate_back = c_adw_leaflet_set_can_navigate_back;

/** */
alias adw_leaflet_set_can_navigate_forward = c_adw_leaflet_set_can_navigate_forward;

/** */
alias adw_leaflet_set_can_unfold = c_adw_leaflet_set_can_unfold;

/** */
alias adw_leaflet_set_child_transition_params = c_adw_leaflet_set_child_transition_params;

/** */
alias adw_leaflet_set_fold_threshold_policy = c_adw_leaflet_set_fold_threshold_policy;

/** */
alias adw_leaflet_set_homogeneous = c_adw_leaflet_set_homogeneous;

/** */
alias adw_leaflet_set_mode_transition_duration = c_adw_leaflet_set_mode_transition_duration;

/** */
alias adw_leaflet_set_transition_type = c_adw_leaflet_set_transition_type;

/** */
alias adw_leaflet_set_visible_child = c_adw_leaflet_set_visible_child;

/** */
alias adw_leaflet_set_visible_child_name = c_adw_leaflet_set_visible_child_name;

// LeafletPage

/** */
alias adw_leaflet_page_get_type = c_adw_leaflet_page_get_type;

/** */
alias adw_leaflet_page_get_child = c_adw_leaflet_page_get_child;

/** */
alias adw_leaflet_page_get_name = c_adw_leaflet_page_get_name;

/** */
alias adw_leaflet_page_get_navigatable = c_adw_leaflet_page_get_navigatable;

/** */
alias adw_leaflet_page_set_name = c_adw_leaflet_page_set_name;

/** */
alias adw_leaflet_page_set_navigatable = c_adw_leaflet_page_set_navigatable;

// MessageDialog

/** */
alias adw_message_dialog_get_type = c_adw_message_dialog_get_type;

/** */
alias adw_message_dialog_new = c_adw_message_dialog_new;

/** */
alias adw_message_dialog_add_response = c_adw_message_dialog_add_response;

/** */
alias adw_message_dialog_add_responses = c_adw_message_dialog_add_responses;

/** */
alias adw_message_dialog_choose = c_adw_message_dialog_choose;

/** */
alias adw_message_dialog_choose_finish = c_adw_message_dialog_choose_finish;

/** */
alias adw_message_dialog_format_body = c_adw_message_dialog_format_body;

/** */
alias adw_message_dialog_format_body_markup = c_adw_message_dialog_format_body_markup;

/** */
alias adw_message_dialog_format_heading = c_adw_message_dialog_format_heading;

/** */
alias adw_message_dialog_format_heading_markup = c_adw_message_dialog_format_heading_markup;

/** */
alias adw_message_dialog_get_body = c_adw_message_dialog_get_body;

/** */
alias adw_message_dialog_get_body_use_markup = c_adw_message_dialog_get_body_use_markup;

/** */
alias adw_message_dialog_get_close_response = c_adw_message_dialog_get_close_response;

/** */
alias adw_message_dialog_get_default_response = c_adw_message_dialog_get_default_response;

/** */
alias adw_message_dialog_get_extra_child = c_adw_message_dialog_get_extra_child;

/** */
alias adw_message_dialog_get_heading = c_adw_message_dialog_get_heading;

/** */
alias adw_message_dialog_get_heading_use_markup = c_adw_message_dialog_get_heading_use_markup;

/** */
alias adw_message_dialog_get_response_appearance = c_adw_message_dialog_get_response_appearance;

/** */
alias adw_message_dialog_get_response_enabled = c_adw_message_dialog_get_response_enabled;

/** */
alias adw_message_dialog_get_response_label = c_adw_message_dialog_get_response_label;

/** */
alias adw_message_dialog_has_response = c_adw_message_dialog_has_response;

/** */
alias adw_message_dialog_remove_response = c_adw_message_dialog_remove_response;

/** */
alias adw_message_dialog_response = c_adw_message_dialog_response;

/** */
alias adw_message_dialog_set_body = c_adw_message_dialog_set_body;

/** */
alias adw_message_dialog_set_body_use_markup = c_adw_message_dialog_set_body_use_markup;

/** */
alias adw_message_dialog_set_close_response = c_adw_message_dialog_set_close_response;

/** */
alias adw_message_dialog_set_default_response = c_adw_message_dialog_set_default_response;

/** */
alias adw_message_dialog_set_extra_child = c_adw_message_dialog_set_extra_child;

/** */
alias adw_message_dialog_set_heading = c_adw_message_dialog_set_heading;

/** */
alias adw_message_dialog_set_heading_use_markup = c_adw_message_dialog_set_heading_use_markup;

/** */
alias adw_message_dialog_set_response_appearance = c_adw_message_dialog_set_response_appearance;

/** */
alias adw_message_dialog_set_response_enabled = c_adw_message_dialog_set_response_enabled;

/** */
alias adw_message_dialog_set_response_label = c_adw_message_dialog_set_response_label;

// MultiLayoutView

/** */
alias adw_multi_layout_view_get_type = c_adw_multi_layout_view_get_type;

/** */
alias adw_multi_layout_view_new = c_adw_multi_layout_view_new;

/** */
alias adw_multi_layout_view_add_layout = c_adw_multi_layout_view_add_layout;

/** */
alias adw_multi_layout_view_get_child = c_adw_multi_layout_view_get_child;

/** */
alias adw_multi_layout_view_get_layout = c_adw_multi_layout_view_get_layout;

/** */
alias adw_multi_layout_view_get_layout_by_name = c_adw_multi_layout_view_get_layout_by_name;

/** */
alias adw_multi_layout_view_get_layout_name = c_adw_multi_layout_view_get_layout_name;

/** */
alias adw_multi_layout_view_remove_layout = c_adw_multi_layout_view_remove_layout;

/** */
alias adw_multi_layout_view_set_child = c_adw_multi_layout_view_set_child;

/** */
alias adw_multi_layout_view_set_layout = c_adw_multi_layout_view_set_layout;

/** */
alias adw_multi_layout_view_set_layout_name = c_adw_multi_layout_view_set_layout_name;

// NavigationPage

/** */
alias adw_navigation_page_get_type = c_adw_navigation_page_get_type;

/** */
alias adw_navigation_page_new = c_adw_navigation_page_new;

/** */
alias adw_navigation_page_new_with_tag = c_adw_navigation_page_new_with_tag;

/** */
alias adw_navigation_page_get_can_pop = c_adw_navigation_page_get_can_pop;

/** */
alias adw_navigation_page_get_child = c_adw_navigation_page_get_child;

/** */
alias adw_navigation_page_get_tag = c_adw_navigation_page_get_tag;

/** */
alias adw_navigation_page_get_title = c_adw_navigation_page_get_title;

/** */
alias adw_navigation_page_set_can_pop = c_adw_navigation_page_set_can_pop;

/** */
alias adw_navigation_page_set_child = c_adw_navigation_page_set_child;

/** */
alias adw_navigation_page_set_tag = c_adw_navigation_page_set_tag;

/** */
alias adw_navigation_page_set_title = c_adw_navigation_page_set_title;

// NavigationSplitView

/** */
alias adw_navigation_split_view_get_type = c_adw_navigation_split_view_get_type;

/** */
alias adw_navigation_split_view_new = c_adw_navigation_split_view_new;

/** */
alias adw_navigation_split_view_get_collapsed = c_adw_navigation_split_view_get_collapsed;

/** */
alias adw_navigation_split_view_get_content = c_adw_navigation_split_view_get_content;

/** */
alias adw_navigation_split_view_get_max_sidebar_width = c_adw_navigation_split_view_get_max_sidebar_width;

/** */
alias adw_navigation_split_view_get_min_sidebar_width = c_adw_navigation_split_view_get_min_sidebar_width;

/** */
alias adw_navigation_split_view_get_show_content = c_adw_navigation_split_view_get_show_content;

/** */
alias adw_navigation_split_view_get_sidebar = c_adw_navigation_split_view_get_sidebar;

/** */
alias adw_navigation_split_view_get_sidebar_position = c_adw_navigation_split_view_get_sidebar_position;

/** */
alias adw_navigation_split_view_get_sidebar_width_fraction = c_adw_navigation_split_view_get_sidebar_width_fraction;

/** */
alias adw_navigation_split_view_get_sidebar_width_unit = c_adw_navigation_split_view_get_sidebar_width_unit;

/** */
alias adw_navigation_split_view_set_collapsed = c_adw_navigation_split_view_set_collapsed;

/** */
alias adw_navigation_split_view_set_content = c_adw_navigation_split_view_set_content;

/** */
alias adw_navigation_split_view_set_max_sidebar_width = c_adw_navigation_split_view_set_max_sidebar_width;

/** */
alias adw_navigation_split_view_set_min_sidebar_width = c_adw_navigation_split_view_set_min_sidebar_width;

/** */
alias adw_navigation_split_view_set_show_content = c_adw_navigation_split_view_set_show_content;

/** */
alias adw_navigation_split_view_set_sidebar = c_adw_navigation_split_view_set_sidebar;

/** */
alias adw_navigation_split_view_set_sidebar_position = c_adw_navigation_split_view_set_sidebar_position;

/** */
alias adw_navigation_split_view_set_sidebar_width_fraction = c_adw_navigation_split_view_set_sidebar_width_fraction;

/** */
alias adw_navigation_split_view_set_sidebar_width_unit = c_adw_navigation_split_view_set_sidebar_width_unit;

// NavigationView

/** */
alias adw_navigation_view_get_type = c_adw_navigation_view_get_type;

/** */
alias adw_navigation_view_new = c_adw_navigation_view_new;

/** */
alias adw_navigation_view_add = c_adw_navigation_view_add;

/** */
alias adw_navigation_view_find_page = c_adw_navigation_view_find_page;

/** */
alias adw_navigation_view_get_animate_transitions = c_adw_navigation_view_get_animate_transitions;

/** */
alias adw_navigation_view_get_hhomogeneous = c_adw_navigation_view_get_hhomogeneous;

/** */
alias adw_navigation_view_get_navigation_stack = c_adw_navigation_view_get_navigation_stack;

/** */
alias adw_navigation_view_get_pop_on_escape = c_adw_navigation_view_get_pop_on_escape;

/** */
alias adw_navigation_view_get_previous_page = c_adw_navigation_view_get_previous_page;

/** */
alias adw_navigation_view_get_vhomogeneous = c_adw_navigation_view_get_vhomogeneous;

/** */
alias adw_navigation_view_get_visible_page = c_adw_navigation_view_get_visible_page;

/** */
alias adw_navigation_view_get_visible_page_tag = c_adw_navigation_view_get_visible_page_tag;

/** */
alias adw_navigation_view_pop = c_adw_navigation_view_pop;

/** */
alias adw_navigation_view_pop_to_page = c_adw_navigation_view_pop_to_page;

/** */
alias adw_navigation_view_pop_to_tag = c_adw_navigation_view_pop_to_tag;

/** */
alias adw_navigation_view_push = c_adw_navigation_view_push;

/** */
alias adw_navigation_view_push_by_tag = c_adw_navigation_view_push_by_tag;

/** */
alias adw_navigation_view_remove = c_adw_navigation_view_remove;

/** */
alias adw_navigation_view_replace = c_adw_navigation_view_replace;

/** */
alias adw_navigation_view_replace_with_tags = c_adw_navigation_view_replace_with_tags;

/** */
alias adw_navigation_view_set_animate_transitions = c_adw_navigation_view_set_animate_transitions;

/** */
alias adw_navigation_view_set_hhomogeneous = c_adw_navigation_view_set_hhomogeneous;

/** */
alias adw_navigation_view_set_pop_on_escape = c_adw_navigation_view_set_pop_on_escape;

/** */
alias adw_navigation_view_set_vhomogeneous = c_adw_navigation_view_set_vhomogeneous;

// NoneAnimationTarget

/** */
alias adw_none_animation_target_get_type = c_adw_none_animation_target_get_type;

/** */
alias adw_none_animation_target_new = c_adw_none_animation_target_new;

// OverlaySplitView

/** */
alias adw_overlay_split_view_get_type = c_adw_overlay_split_view_get_type;

/** */
alias adw_overlay_split_view_new = c_adw_overlay_split_view_new;

/** */
alias adw_overlay_split_view_get_collapsed = c_adw_overlay_split_view_get_collapsed;

/** */
alias adw_overlay_split_view_get_content = c_adw_overlay_split_view_get_content;

/** */
alias adw_overlay_split_view_get_enable_hide_gesture = c_adw_overlay_split_view_get_enable_hide_gesture;

/** */
alias adw_overlay_split_view_get_enable_show_gesture = c_adw_overlay_split_view_get_enable_show_gesture;

/** */
alias adw_overlay_split_view_get_max_sidebar_width = c_adw_overlay_split_view_get_max_sidebar_width;

/** */
alias adw_overlay_split_view_get_min_sidebar_width = c_adw_overlay_split_view_get_min_sidebar_width;

/** */
alias adw_overlay_split_view_get_pin_sidebar = c_adw_overlay_split_view_get_pin_sidebar;

/** */
alias adw_overlay_split_view_get_show_sidebar = c_adw_overlay_split_view_get_show_sidebar;

/** */
alias adw_overlay_split_view_get_sidebar = c_adw_overlay_split_view_get_sidebar;

/** */
alias adw_overlay_split_view_get_sidebar_position = c_adw_overlay_split_view_get_sidebar_position;

/** */
alias adw_overlay_split_view_get_sidebar_width_fraction = c_adw_overlay_split_view_get_sidebar_width_fraction;

/** */
alias adw_overlay_split_view_get_sidebar_width_unit = c_adw_overlay_split_view_get_sidebar_width_unit;

/** */
alias adw_overlay_split_view_set_collapsed = c_adw_overlay_split_view_set_collapsed;

/** */
alias adw_overlay_split_view_set_content = c_adw_overlay_split_view_set_content;

/** */
alias adw_overlay_split_view_set_enable_hide_gesture = c_adw_overlay_split_view_set_enable_hide_gesture;

/** */
alias adw_overlay_split_view_set_enable_show_gesture = c_adw_overlay_split_view_set_enable_show_gesture;

/** */
alias adw_overlay_split_view_set_max_sidebar_width = c_adw_overlay_split_view_set_max_sidebar_width;

/** */
alias adw_overlay_split_view_set_min_sidebar_width = c_adw_overlay_split_view_set_min_sidebar_width;

/** */
alias adw_overlay_split_view_set_pin_sidebar = c_adw_overlay_split_view_set_pin_sidebar;

/** */
alias adw_overlay_split_view_set_show_sidebar = c_adw_overlay_split_view_set_show_sidebar;

/** */
alias adw_overlay_split_view_set_sidebar = c_adw_overlay_split_view_set_sidebar;

/** */
alias adw_overlay_split_view_set_sidebar_position = c_adw_overlay_split_view_set_sidebar_position;

/** */
alias adw_overlay_split_view_set_sidebar_width_fraction = c_adw_overlay_split_view_set_sidebar_width_fraction;

/** */
alias adw_overlay_split_view_set_sidebar_width_unit = c_adw_overlay_split_view_set_sidebar_width_unit;

// PasswordEntryRow

/** */
alias adw_password_entry_row_get_type = c_adw_password_entry_row_get_type;

/** */
alias adw_password_entry_row_new = c_adw_password_entry_row_new;

// PreferencesDialog

/** */
alias adw_preferences_dialog_get_type = c_adw_preferences_dialog_get_type;

/** */
alias adw_preferences_dialog_new = c_adw_preferences_dialog_new;

/** */
alias adw_preferences_dialog_add = c_adw_preferences_dialog_add;

/** */
alias adw_preferences_dialog_add_toast = c_adw_preferences_dialog_add_toast;

/** */
alias adw_preferences_dialog_get_search_enabled = c_adw_preferences_dialog_get_search_enabled;

/** */
alias adw_preferences_dialog_get_visible_page = c_adw_preferences_dialog_get_visible_page;

/** */
alias adw_preferences_dialog_get_visible_page_name = c_adw_preferences_dialog_get_visible_page_name;

/** */
alias adw_preferences_dialog_pop_subpage = c_adw_preferences_dialog_pop_subpage;

/** */
alias adw_preferences_dialog_push_subpage = c_adw_preferences_dialog_push_subpage;

/** */
alias adw_preferences_dialog_remove = c_adw_preferences_dialog_remove;

/** */
alias adw_preferences_dialog_set_search_enabled = c_adw_preferences_dialog_set_search_enabled;

/** */
alias adw_preferences_dialog_set_visible_page = c_adw_preferences_dialog_set_visible_page;

/** */
alias adw_preferences_dialog_set_visible_page_name = c_adw_preferences_dialog_set_visible_page_name;

// PreferencesGroup

/** */
alias adw_preferences_group_get_type = c_adw_preferences_group_get_type;

/** */
alias adw_preferences_group_new = c_adw_preferences_group_new;

/** */
alias adw_preferences_group_add = c_adw_preferences_group_add;

/** */
alias adw_preferences_group_bind_model = c_adw_preferences_group_bind_model;

/** */
alias adw_preferences_group_get_description = c_adw_preferences_group_get_description;

/** */
alias adw_preferences_group_get_header_suffix = c_adw_preferences_group_get_header_suffix;

/** */
alias adw_preferences_group_get_row = c_adw_preferences_group_get_row;

/** */
alias adw_preferences_group_get_separate_rows = c_adw_preferences_group_get_separate_rows;

/** */
alias adw_preferences_group_get_title = c_adw_preferences_group_get_title;

/** */
alias adw_preferences_group_remove = c_adw_preferences_group_remove;

/** */
alias adw_preferences_group_set_description = c_adw_preferences_group_set_description;

/** */
alias adw_preferences_group_set_header_suffix = c_adw_preferences_group_set_header_suffix;

/** */
alias adw_preferences_group_set_separate_rows = c_adw_preferences_group_set_separate_rows;

/** */
alias adw_preferences_group_set_title = c_adw_preferences_group_set_title;

// PreferencesPage

/** */
alias adw_preferences_page_get_type = c_adw_preferences_page_get_type;

/** */
alias adw_preferences_page_new = c_adw_preferences_page_new;

/** */
alias adw_preferences_page_add = c_adw_preferences_page_add;

/** */
alias adw_preferences_page_get_banner = c_adw_preferences_page_get_banner;

/** */
alias adw_preferences_page_get_description = c_adw_preferences_page_get_description;

/** */
alias adw_preferences_page_get_description_centered = c_adw_preferences_page_get_description_centered;

/** */
alias adw_preferences_page_get_group = c_adw_preferences_page_get_group;

/** */
alias adw_preferences_page_get_icon_name = c_adw_preferences_page_get_icon_name;

/** */
alias adw_preferences_page_get_name = c_adw_preferences_page_get_name;

/** */
alias adw_preferences_page_get_title = c_adw_preferences_page_get_title;

/** */
alias adw_preferences_page_get_use_underline = c_adw_preferences_page_get_use_underline;

/** */
alias adw_preferences_page_insert = c_adw_preferences_page_insert;

/** */
alias adw_preferences_page_remove = c_adw_preferences_page_remove;

/** */
alias adw_preferences_page_scroll_to_top = c_adw_preferences_page_scroll_to_top;

/** */
alias adw_preferences_page_set_banner = c_adw_preferences_page_set_banner;

/** */
alias adw_preferences_page_set_description = c_adw_preferences_page_set_description;

/** */
alias adw_preferences_page_set_description_centered = c_adw_preferences_page_set_description_centered;

/** */
alias adw_preferences_page_set_icon_name = c_adw_preferences_page_set_icon_name;

/** */
alias adw_preferences_page_set_name = c_adw_preferences_page_set_name;

/** */
alias adw_preferences_page_set_title = c_adw_preferences_page_set_title;

/** */
alias adw_preferences_page_set_use_underline = c_adw_preferences_page_set_use_underline;

// PreferencesRow

/** */
alias adw_preferences_row_get_type = c_adw_preferences_row_get_type;

/** */
alias adw_preferences_row_new = c_adw_preferences_row_new;

/** */
alias adw_preferences_row_get_title = c_adw_preferences_row_get_title;

/** */
alias adw_preferences_row_get_title_selectable = c_adw_preferences_row_get_title_selectable;

/** */
alias adw_preferences_row_get_use_markup = c_adw_preferences_row_get_use_markup;

/** */
alias adw_preferences_row_get_use_underline = c_adw_preferences_row_get_use_underline;

/** */
alias adw_preferences_row_set_title = c_adw_preferences_row_set_title;

/** */
alias adw_preferences_row_set_title_selectable = c_adw_preferences_row_set_title_selectable;

/** */
alias adw_preferences_row_set_use_markup = c_adw_preferences_row_set_use_markup;

/** */
alias adw_preferences_row_set_use_underline = c_adw_preferences_row_set_use_underline;

// PreferencesWindow

/** */
alias adw_preferences_window_get_type = c_adw_preferences_window_get_type;

/** */
alias adw_preferences_window_new = c_adw_preferences_window_new;

/** */
alias adw_preferences_window_add = c_adw_preferences_window_add;

/** */
alias adw_preferences_window_add_toast = c_adw_preferences_window_add_toast;

/** */
alias adw_preferences_window_close_subpage = c_adw_preferences_window_close_subpage;

/** */
alias adw_preferences_window_get_can_navigate_back = c_adw_preferences_window_get_can_navigate_back;

/** */
alias adw_preferences_window_get_search_enabled = c_adw_preferences_window_get_search_enabled;

/** */
alias adw_preferences_window_get_visible_page = c_adw_preferences_window_get_visible_page;

/** */
alias adw_preferences_window_get_visible_page_name = c_adw_preferences_window_get_visible_page_name;

/** */
alias adw_preferences_window_pop_subpage = c_adw_preferences_window_pop_subpage;

/** */
alias adw_preferences_window_present_subpage = c_adw_preferences_window_present_subpage;

/** */
alias adw_preferences_window_push_subpage = c_adw_preferences_window_push_subpage;

/** */
alias adw_preferences_window_remove = c_adw_preferences_window_remove;

/** */
alias adw_preferences_window_set_can_navigate_back = c_adw_preferences_window_set_can_navigate_back;

/** */
alias adw_preferences_window_set_search_enabled = c_adw_preferences_window_set_search_enabled;

/** */
alias adw_preferences_window_set_visible_page = c_adw_preferences_window_set_visible_page;

/** */
alias adw_preferences_window_set_visible_page_name = c_adw_preferences_window_set_visible_page_name;

// PropertyAnimationTarget

/** */
alias adw_property_animation_target_get_type = c_adw_property_animation_target_get_type;

/** */
alias adw_property_animation_target_new = c_adw_property_animation_target_new;

/** */
alias adw_property_animation_target_new_for_pspec = c_adw_property_animation_target_new_for_pspec;

/** */
alias adw_property_animation_target_get_object = c_adw_property_animation_target_get_object;

/** */
alias adw_property_animation_target_get_pspec = c_adw_property_animation_target_get_pspec;

// ShortcutLabel

/** */
alias adw_shortcut_label_get_type = c_adw_shortcut_label_get_type;

/** */
alias adw_shortcut_label_new = c_adw_shortcut_label_new;

/** */
alias adw_shortcut_label_get_accelerator = c_adw_shortcut_label_get_accelerator;

/** */
alias adw_shortcut_label_get_disabled_text = c_adw_shortcut_label_get_disabled_text;

/** */
alias adw_shortcut_label_set_accelerator = c_adw_shortcut_label_set_accelerator;

/** */
alias adw_shortcut_label_set_disabled_text = c_adw_shortcut_label_set_disabled_text;

// ShortcutsDialog

/** */
alias adw_shortcuts_dialog_get_type = c_adw_shortcuts_dialog_get_type;

/** */
alias adw_shortcuts_dialog_new = c_adw_shortcuts_dialog_new;

/** */
alias adw_shortcuts_dialog_add = c_adw_shortcuts_dialog_add;

// ShortcutsItem

/** */
alias adw_shortcuts_item_get_type = c_adw_shortcuts_item_get_type;

/** */
alias adw_shortcuts_item_new = c_adw_shortcuts_item_new;

/** */
alias adw_shortcuts_item_new_from_action = c_adw_shortcuts_item_new_from_action;

/** */
alias adw_shortcuts_item_get_accelerator = c_adw_shortcuts_item_get_accelerator;

/** */
alias adw_shortcuts_item_get_action_name = c_adw_shortcuts_item_get_action_name;

/** */
alias adw_shortcuts_item_get_direction = c_adw_shortcuts_item_get_direction;

/** */
alias adw_shortcuts_item_get_subtitle = c_adw_shortcuts_item_get_subtitle;

/** */
alias adw_shortcuts_item_get_title = c_adw_shortcuts_item_get_title;

/** */
alias adw_shortcuts_item_set_accelerator = c_adw_shortcuts_item_set_accelerator;

/** */
alias adw_shortcuts_item_set_action_name = c_adw_shortcuts_item_set_action_name;

/** */
alias adw_shortcuts_item_set_direction = c_adw_shortcuts_item_set_direction;

/** */
alias adw_shortcuts_item_set_subtitle = c_adw_shortcuts_item_set_subtitle;

/** */
alias adw_shortcuts_item_set_title = c_adw_shortcuts_item_set_title;

// ShortcutsSection

/** */
alias adw_shortcuts_section_get_type = c_adw_shortcuts_section_get_type;

/** */
alias adw_shortcuts_section_new = c_adw_shortcuts_section_new;

/** */
alias adw_shortcuts_section_add = c_adw_shortcuts_section_add;

/** */
alias adw_shortcuts_section_get_title = c_adw_shortcuts_section_get_title;

/** */
alias adw_shortcuts_section_set_title = c_adw_shortcuts_section_set_title;

// Sidebar

/** */
alias adw_sidebar_get_type = c_adw_sidebar_get_type;

/** */
alias adw_sidebar_new = c_adw_sidebar_new;

/** */
alias adw_sidebar_append = c_adw_sidebar_append;

/** */
alias adw_sidebar_get_drop_preload = c_adw_sidebar_get_drop_preload;

/** */
alias adw_sidebar_get_filter = c_adw_sidebar_get_filter;

/** */
alias adw_sidebar_get_item = c_adw_sidebar_get_item;

/** */
alias adw_sidebar_get_items = c_adw_sidebar_get_items;

/** */
alias adw_sidebar_get_menu_model = c_adw_sidebar_get_menu_model;

/** */
alias adw_sidebar_get_mode = c_adw_sidebar_get_mode;

/** */
alias adw_sidebar_get_placeholder = c_adw_sidebar_get_placeholder;

/** */
alias adw_sidebar_get_section = c_adw_sidebar_get_section;

/** */
alias adw_sidebar_get_sections = c_adw_sidebar_get_sections;

/** */
alias adw_sidebar_get_selected = c_adw_sidebar_get_selected;

/** */
alias adw_sidebar_get_selected_item = c_adw_sidebar_get_selected_item;

/** */
alias adw_sidebar_insert = c_adw_sidebar_insert;

/** */
alias adw_sidebar_prepend = c_adw_sidebar_prepend;

/** */
alias adw_sidebar_remove = c_adw_sidebar_remove;

/** */
alias adw_sidebar_remove_all = c_adw_sidebar_remove_all;

/** */
alias adw_sidebar_set_drop_preload = c_adw_sidebar_set_drop_preload;

/** */
alias adw_sidebar_set_filter = c_adw_sidebar_set_filter;

/** */
alias adw_sidebar_set_menu_model = c_adw_sidebar_set_menu_model;

/** */
alias adw_sidebar_set_mode = c_adw_sidebar_set_mode;

/** */
alias adw_sidebar_set_placeholder = c_adw_sidebar_set_placeholder;

/** */
alias adw_sidebar_set_selected = c_adw_sidebar_set_selected;

/** */
alias adw_sidebar_setup_drop_target = c_adw_sidebar_setup_drop_target;

// SidebarItem

/** */
alias adw_sidebar_item_get_type = c_adw_sidebar_item_get_type;

/** */
alias adw_sidebar_item_new = c_adw_sidebar_item_new;

/** */
alias adw_sidebar_item_get_drag_motion_activate = c_adw_sidebar_item_get_drag_motion_activate;

/** */
alias adw_sidebar_item_get_enabled = c_adw_sidebar_item_get_enabled;

/** */
alias adw_sidebar_item_get_icon_name = c_adw_sidebar_item_get_icon_name;

/** */
alias adw_sidebar_item_get_icon_paintable = c_adw_sidebar_item_get_icon_paintable;

/** */
alias adw_sidebar_item_get_index = c_adw_sidebar_item_get_index;

/** */
alias adw_sidebar_item_get_section = c_adw_sidebar_item_get_section;

/** */
alias adw_sidebar_item_get_section_index = c_adw_sidebar_item_get_section_index;

/** */
alias adw_sidebar_item_get_subtitle = c_adw_sidebar_item_get_subtitle;

/** */
alias adw_sidebar_item_get_suffix = c_adw_sidebar_item_get_suffix;

/** */
alias adw_sidebar_item_get_title = c_adw_sidebar_item_get_title;

/** */
alias adw_sidebar_item_get_tooltip = c_adw_sidebar_item_get_tooltip;

/** */
alias adw_sidebar_item_get_use_underline = c_adw_sidebar_item_get_use_underline;

/** */
alias adw_sidebar_item_get_visible = c_adw_sidebar_item_get_visible;

/** */
alias adw_sidebar_item_set_drag_motion_activate = c_adw_sidebar_item_set_drag_motion_activate;

/** */
alias adw_sidebar_item_set_enabled = c_adw_sidebar_item_set_enabled;

/** */
alias adw_sidebar_item_set_icon_name = c_adw_sidebar_item_set_icon_name;

/** */
alias adw_sidebar_item_set_icon_paintable = c_adw_sidebar_item_set_icon_paintable;

/** */
alias adw_sidebar_item_set_subtitle = c_adw_sidebar_item_set_subtitle;

/** */
alias adw_sidebar_item_set_suffix = c_adw_sidebar_item_set_suffix;

/** */
alias adw_sidebar_item_set_title = c_adw_sidebar_item_set_title;

/** */
alias adw_sidebar_item_set_tooltip = c_adw_sidebar_item_set_tooltip;

/** */
alias adw_sidebar_item_set_use_underline = c_adw_sidebar_item_set_use_underline;

/** */
alias adw_sidebar_item_set_visible = c_adw_sidebar_item_set_visible;

// SidebarSection

/** */
alias adw_sidebar_section_get_type = c_adw_sidebar_section_get_type;

/** */
alias adw_sidebar_section_new = c_adw_sidebar_section_new;

/** */
alias adw_sidebar_section_append = c_adw_sidebar_section_append;

/** */
alias adw_sidebar_section_bind_model = c_adw_sidebar_section_bind_model;

/** */
alias adw_sidebar_section_get_item = c_adw_sidebar_section_get_item;

/** */
alias adw_sidebar_section_get_items = c_adw_sidebar_section_get_items;

/** */
alias adw_sidebar_section_get_menu_model = c_adw_sidebar_section_get_menu_model;

/** */
alias adw_sidebar_section_get_sidebar = c_adw_sidebar_section_get_sidebar;

/** */
alias adw_sidebar_section_get_title = c_adw_sidebar_section_get_title;

/** */
alias adw_sidebar_section_insert = c_adw_sidebar_section_insert;

/** */
alias adw_sidebar_section_prepend = c_adw_sidebar_section_prepend;

/** */
alias adw_sidebar_section_remove = c_adw_sidebar_section_remove;

/** */
alias adw_sidebar_section_remove_all = c_adw_sidebar_section_remove_all;

/** */
alias adw_sidebar_section_set_menu_model = c_adw_sidebar_section_set_menu_model;

/** */
alias adw_sidebar_section_set_title = c_adw_sidebar_section_set_title;

// SpinRow

/** */
alias adw_spin_row_get_type = c_adw_spin_row_get_type;

/** */
alias adw_spin_row_new = c_adw_spin_row_new;

/** */
alias adw_spin_row_new_with_range = c_adw_spin_row_new_with_range;

/** */
alias adw_spin_row_configure = c_adw_spin_row_configure;

/** */
alias adw_spin_row_get_adjustment = c_adw_spin_row_get_adjustment;

/** */
alias adw_spin_row_get_climb_rate = c_adw_spin_row_get_climb_rate;

/** */
alias adw_spin_row_get_digits = c_adw_spin_row_get_digits;

/** */
alias adw_spin_row_get_numeric = c_adw_spin_row_get_numeric;

/** */
alias adw_spin_row_get_snap_to_ticks = c_adw_spin_row_get_snap_to_ticks;

/** */
alias adw_spin_row_get_update_policy = c_adw_spin_row_get_update_policy;

/** */
alias adw_spin_row_get_value = c_adw_spin_row_get_value;

/** */
alias adw_spin_row_get_wrap = c_adw_spin_row_get_wrap;

/** */
alias adw_spin_row_set_adjustment = c_adw_spin_row_set_adjustment;

/** */
alias adw_spin_row_set_climb_rate = c_adw_spin_row_set_climb_rate;

/** */
alias adw_spin_row_set_digits = c_adw_spin_row_set_digits;

/** */
alias adw_spin_row_set_numeric = c_adw_spin_row_set_numeric;

/** */
alias adw_spin_row_set_range = c_adw_spin_row_set_range;

/** */
alias adw_spin_row_set_snap_to_ticks = c_adw_spin_row_set_snap_to_ticks;

/** */
alias adw_spin_row_set_update_policy = c_adw_spin_row_set_update_policy;

/** */
alias adw_spin_row_set_value = c_adw_spin_row_set_value;

/** */
alias adw_spin_row_set_wrap = c_adw_spin_row_set_wrap;

/** */
alias adw_spin_row_update = c_adw_spin_row_update;

// Spinner

/** */
alias adw_spinner_get_type = c_adw_spinner_get_type;

/** */
alias adw_spinner_new = c_adw_spinner_new;

// SpinnerPaintable

/** */
alias adw_spinner_paintable_get_type = c_adw_spinner_paintable_get_type;

/** */
alias adw_spinner_paintable_new = c_adw_spinner_paintable_new;

/** */
alias adw_spinner_paintable_get_widget = c_adw_spinner_paintable_get_widget;

/** */
alias adw_spinner_paintable_set_widget = c_adw_spinner_paintable_set_widget;

// SplitButton

/** */
alias adw_split_button_get_type = c_adw_split_button_get_type;

/** */
alias adw_split_button_new = c_adw_split_button_new;

/** */
alias adw_split_button_get_can_shrink = c_adw_split_button_get_can_shrink;

/** */
alias adw_split_button_get_child = c_adw_split_button_get_child;

/** */
alias adw_split_button_get_direction = c_adw_split_button_get_direction;

/** */
alias adw_split_button_get_dropdown_tooltip = c_adw_split_button_get_dropdown_tooltip;

/** */
alias adw_split_button_get_icon_name = c_adw_split_button_get_icon_name;

/** */
alias adw_split_button_get_label = c_adw_split_button_get_label;

/** */
alias adw_split_button_get_menu_model = c_adw_split_button_get_menu_model;

/** */
alias adw_split_button_get_popover = c_adw_split_button_get_popover;

/** */
alias adw_split_button_get_use_underline = c_adw_split_button_get_use_underline;

/** */
alias adw_split_button_popdown = c_adw_split_button_popdown;

/** */
alias adw_split_button_popup = c_adw_split_button_popup;

/** */
alias adw_split_button_set_can_shrink = c_adw_split_button_set_can_shrink;

/** */
alias adw_split_button_set_child = c_adw_split_button_set_child;

/** */
alias adw_split_button_set_direction = c_adw_split_button_set_direction;

/** */
alias adw_split_button_set_dropdown_tooltip = c_adw_split_button_set_dropdown_tooltip;

/** */
alias adw_split_button_set_icon_name = c_adw_split_button_set_icon_name;

/** */
alias adw_split_button_set_label = c_adw_split_button_set_label;

/** */
alias adw_split_button_set_menu_model = c_adw_split_button_set_menu_model;

/** */
alias adw_split_button_set_popover = c_adw_split_button_set_popover;

/** */
alias adw_split_button_set_use_underline = c_adw_split_button_set_use_underline;

// SpringAnimation

/** */
alias adw_spring_animation_get_type = c_adw_spring_animation_get_type;

/** */
alias adw_spring_animation_new = c_adw_spring_animation_new;

/** */
alias adw_spring_animation_calculate_value = c_adw_spring_animation_calculate_value;

/** */
alias adw_spring_animation_calculate_velocity = c_adw_spring_animation_calculate_velocity;

/** */
alias adw_spring_animation_get_clamp = c_adw_spring_animation_get_clamp;

/** */
alias adw_spring_animation_get_epsilon = c_adw_spring_animation_get_epsilon;

/** */
alias adw_spring_animation_get_estimated_duration = c_adw_spring_animation_get_estimated_duration;

/** */
alias adw_spring_animation_get_initial_velocity = c_adw_spring_animation_get_initial_velocity;

/** */
alias adw_spring_animation_get_spring_params = c_adw_spring_animation_get_spring_params;

/** */
alias adw_spring_animation_get_value_from = c_adw_spring_animation_get_value_from;

/** */
alias adw_spring_animation_get_value_to = c_adw_spring_animation_get_value_to;

/** */
alias adw_spring_animation_get_velocity = c_adw_spring_animation_get_velocity;

/** */
alias adw_spring_animation_set_clamp = c_adw_spring_animation_set_clamp;

/** */
alias adw_spring_animation_set_epsilon = c_adw_spring_animation_set_epsilon;

/** */
alias adw_spring_animation_set_initial_velocity = c_adw_spring_animation_set_initial_velocity;

/** */
alias adw_spring_animation_set_spring_params = c_adw_spring_animation_set_spring_params;

/** */
alias adw_spring_animation_set_value_from = c_adw_spring_animation_set_value_from;

/** */
alias adw_spring_animation_set_value_to = c_adw_spring_animation_set_value_to;

// SpringParams

/** */
alias adw_spring_params_get_type = c_adw_spring_params_get_type;

/** */
alias adw_spring_params_new = c_adw_spring_params_new;

/** */
alias adw_spring_params_new_full = c_adw_spring_params_new_full;

/** */
alias adw_spring_params_get_damping = c_adw_spring_params_get_damping;

/** */
alias adw_spring_params_get_damping_ratio = c_adw_spring_params_get_damping_ratio;

/** */
alias adw_spring_params_get_mass = c_adw_spring_params_get_mass;

/** */
alias adw_spring_params_get_stiffness = c_adw_spring_params_get_stiffness;

/** */
alias adw_spring_params_ref = c_adw_spring_params_ref;

/** */
alias adw_spring_params_unref = c_adw_spring_params_unref;

// Squeezer

/** */
alias adw_squeezer_get_type = c_adw_squeezer_get_type;

/** */
alias adw_squeezer_new = c_adw_squeezer_new;

/** */
alias adw_squeezer_add = c_adw_squeezer_add;

/** */
alias adw_squeezer_get_allow_none = c_adw_squeezer_get_allow_none;

/** */
alias adw_squeezer_get_homogeneous = c_adw_squeezer_get_homogeneous;

/** */
alias adw_squeezer_get_interpolate_size = c_adw_squeezer_get_interpolate_size;

/** */
alias adw_squeezer_get_page = c_adw_squeezer_get_page;

/** */
alias adw_squeezer_get_pages = c_adw_squeezer_get_pages;

/** */
alias adw_squeezer_get_switch_threshold_policy = c_adw_squeezer_get_switch_threshold_policy;

/** */
alias adw_squeezer_get_transition_duration = c_adw_squeezer_get_transition_duration;

/** */
alias adw_squeezer_get_transition_running = c_adw_squeezer_get_transition_running;

/** */
alias adw_squeezer_get_transition_type = c_adw_squeezer_get_transition_type;

/** */
alias adw_squeezer_get_visible_child = c_adw_squeezer_get_visible_child;

/** */
alias adw_squeezer_get_xalign = c_adw_squeezer_get_xalign;

/** */
alias adw_squeezer_get_yalign = c_adw_squeezer_get_yalign;

/** */
alias adw_squeezer_remove = c_adw_squeezer_remove;

/** */
alias adw_squeezer_set_allow_none = c_adw_squeezer_set_allow_none;

/** */
alias adw_squeezer_set_homogeneous = c_adw_squeezer_set_homogeneous;

/** */
alias adw_squeezer_set_interpolate_size = c_adw_squeezer_set_interpolate_size;

/** */
alias adw_squeezer_set_switch_threshold_policy = c_adw_squeezer_set_switch_threshold_policy;

/** */
alias adw_squeezer_set_transition_duration = c_adw_squeezer_set_transition_duration;

/** */
alias adw_squeezer_set_transition_type = c_adw_squeezer_set_transition_type;

/** */
alias adw_squeezer_set_xalign = c_adw_squeezer_set_xalign;

/** */
alias adw_squeezer_set_yalign = c_adw_squeezer_set_yalign;

// SqueezerPage

/** */
alias adw_squeezer_page_get_type = c_adw_squeezer_page_get_type;

/** */
alias adw_squeezer_page_get_child = c_adw_squeezer_page_get_child;

/** */
alias adw_squeezer_page_get_enabled = c_adw_squeezer_page_get_enabled;

/** */
alias adw_squeezer_page_set_enabled = c_adw_squeezer_page_set_enabled;

// StatusPage

/** */
alias adw_status_page_get_type = c_adw_status_page_get_type;

/** */
alias adw_status_page_new = c_adw_status_page_new;

/** */
alias adw_status_page_get_child = c_adw_status_page_get_child;

/** */
alias adw_status_page_get_description = c_adw_status_page_get_description;

/** */
alias adw_status_page_get_icon_name = c_adw_status_page_get_icon_name;

/** */
alias adw_status_page_get_paintable = c_adw_status_page_get_paintable;

/** */
alias adw_status_page_get_title = c_adw_status_page_get_title;

/** */
alias adw_status_page_set_child = c_adw_status_page_set_child;

/** */
alias adw_status_page_set_description = c_adw_status_page_set_description;

/** */
alias adw_status_page_set_icon_name = c_adw_status_page_set_icon_name;

/** */
alias adw_status_page_set_paintable = c_adw_status_page_set_paintable;

/** */
alias adw_status_page_set_title = c_adw_status_page_set_title;

// StyleManager

/** */
alias adw_style_manager_get_type = c_adw_style_manager_get_type;

/** */
alias adw_style_manager_get_default = c_adw_style_manager_get_default;

/** */
alias adw_style_manager_get_for_display = c_adw_style_manager_get_for_display;

/** */
alias adw_style_manager_get_accent_color = c_adw_style_manager_get_accent_color;

/** */
alias adw_style_manager_get_accent_color_rgba = c_adw_style_manager_get_accent_color_rgba;

/** */
alias adw_style_manager_get_color_scheme = c_adw_style_manager_get_color_scheme;

/** */
alias adw_style_manager_get_dark = c_adw_style_manager_get_dark;

/** */
alias adw_style_manager_get_display = c_adw_style_manager_get_display;

/** */
alias adw_style_manager_get_document_font_name = c_adw_style_manager_get_document_font_name;

/** */
alias adw_style_manager_get_high_contrast = c_adw_style_manager_get_high_contrast;

/** */
alias adw_style_manager_get_monospace_font_name = c_adw_style_manager_get_monospace_font_name;

/** */
alias adw_style_manager_get_system_supports_accent_colors = c_adw_style_manager_get_system_supports_accent_colors;

/** */
alias adw_style_manager_get_system_supports_color_schemes = c_adw_style_manager_get_system_supports_color_schemes;

/** */
alias adw_style_manager_set_color_scheme = c_adw_style_manager_set_color_scheme;

// SwipeTracker

/** */
alias adw_swipe_tracker_get_type = c_adw_swipe_tracker_get_type;

/** */
alias adw_swipe_tracker_new = c_adw_swipe_tracker_new;

/** */
alias adw_swipe_tracker_get_allow_long_swipes = c_adw_swipe_tracker_get_allow_long_swipes;

/** */
alias adw_swipe_tracker_get_allow_mouse_drag = c_adw_swipe_tracker_get_allow_mouse_drag;

/** */
alias adw_swipe_tracker_get_allow_window_handle = c_adw_swipe_tracker_get_allow_window_handle;

/** */
alias adw_swipe_tracker_get_enabled = c_adw_swipe_tracker_get_enabled;

/** */
alias adw_swipe_tracker_get_lower_overshoot = c_adw_swipe_tracker_get_lower_overshoot;

/** */
alias adw_swipe_tracker_get_reversed = c_adw_swipe_tracker_get_reversed;

/** */
alias adw_swipe_tracker_get_swipeable = c_adw_swipe_tracker_get_swipeable;

/** */
alias adw_swipe_tracker_get_upper_overshoot = c_adw_swipe_tracker_get_upper_overshoot;

/** */
alias adw_swipe_tracker_set_allow_long_swipes = c_adw_swipe_tracker_set_allow_long_swipes;

/** */
alias adw_swipe_tracker_set_allow_mouse_drag = c_adw_swipe_tracker_set_allow_mouse_drag;

/** */
alias adw_swipe_tracker_set_allow_window_handle = c_adw_swipe_tracker_set_allow_window_handle;

/** */
alias adw_swipe_tracker_set_enabled = c_adw_swipe_tracker_set_enabled;

/** */
alias adw_swipe_tracker_set_lower_overshoot = c_adw_swipe_tracker_set_lower_overshoot;

/** */
alias adw_swipe_tracker_set_reversed = c_adw_swipe_tracker_set_reversed;

/** */
alias adw_swipe_tracker_set_upper_overshoot = c_adw_swipe_tracker_set_upper_overshoot;

/** */
alias adw_swipe_tracker_shift_position = c_adw_swipe_tracker_shift_position;

// Swipeable

/** */
alias adw_swipeable_get_type = c_adw_swipeable_get_type;

/** */
alias adw_swipeable_get_cancel_progress = c_adw_swipeable_get_cancel_progress;

/** */
alias adw_swipeable_get_distance = c_adw_swipeable_get_distance;

/** */
alias adw_swipeable_get_progress = c_adw_swipeable_get_progress;

/** */
alias adw_swipeable_get_snap_points = c_adw_swipeable_get_snap_points;

/** */
alias adw_swipeable_get_swipe_area = c_adw_swipeable_get_swipe_area;

// SwitchRow

/** */
alias adw_switch_row_get_type = c_adw_switch_row_get_type;

/** */
alias adw_switch_row_new = c_adw_switch_row_new;

/** */
alias adw_switch_row_get_active = c_adw_switch_row_get_active;

/** */
alias adw_switch_row_set_active = c_adw_switch_row_set_active;

// TabBar

/** */
alias adw_tab_bar_get_type = c_adw_tab_bar_get_type;

/** */
alias adw_tab_bar_new = c_adw_tab_bar_new;

/** */
alias adw_tab_bar_get_autohide = c_adw_tab_bar_get_autohide;

/** */
alias adw_tab_bar_get_end_action_widget = c_adw_tab_bar_get_end_action_widget;

/** */
alias adw_tab_bar_get_expand_tabs = c_adw_tab_bar_get_expand_tabs;

/** */
alias adw_tab_bar_get_extra_drag_preferred_action = c_adw_tab_bar_get_extra_drag_preferred_action;

/** */
alias adw_tab_bar_get_extra_drag_preload = c_adw_tab_bar_get_extra_drag_preload;

/** */
alias adw_tab_bar_get_inverted = c_adw_tab_bar_get_inverted;

/** */
alias adw_tab_bar_get_is_overflowing = c_adw_tab_bar_get_is_overflowing;

/** */
alias adw_tab_bar_get_start_action_widget = c_adw_tab_bar_get_start_action_widget;

/** */
alias adw_tab_bar_get_tabs_revealed = c_adw_tab_bar_get_tabs_revealed;

/** */
alias adw_tab_bar_get_view = c_adw_tab_bar_get_view;

/** */
alias adw_tab_bar_set_autohide = c_adw_tab_bar_set_autohide;

/** */
alias adw_tab_bar_set_end_action_widget = c_adw_tab_bar_set_end_action_widget;

/** */
alias adw_tab_bar_set_expand_tabs = c_adw_tab_bar_set_expand_tabs;

/** */
alias adw_tab_bar_set_extra_drag_preload = c_adw_tab_bar_set_extra_drag_preload;

/** */
alias adw_tab_bar_set_inverted = c_adw_tab_bar_set_inverted;

/** */
alias adw_tab_bar_set_start_action_widget = c_adw_tab_bar_set_start_action_widget;

/** */
alias adw_tab_bar_set_view = c_adw_tab_bar_set_view;

/** */
alias adw_tab_bar_setup_extra_drop_target = c_adw_tab_bar_setup_extra_drop_target;

// TabButton

/** */
alias adw_tab_button_get_type = c_adw_tab_button_get_type;

/** */
alias adw_tab_button_new = c_adw_tab_button_new;

/** */
alias adw_tab_button_get_view = c_adw_tab_button_get_view;

/** */
alias adw_tab_button_set_view = c_adw_tab_button_set_view;

// TabOverview

/** */
alias adw_tab_overview_get_type = c_adw_tab_overview_get_type;

/** */
alias adw_tab_overview_new = c_adw_tab_overview_new;

/** */
alias adw_tab_overview_get_child = c_adw_tab_overview_get_child;

/** */
alias adw_tab_overview_get_enable_new_tab = c_adw_tab_overview_get_enable_new_tab;

/** */
alias adw_tab_overview_get_enable_search = c_adw_tab_overview_get_enable_search;

/** */
alias adw_tab_overview_get_extra_drag_preferred_action = c_adw_tab_overview_get_extra_drag_preferred_action;

/** */
alias adw_tab_overview_get_extra_drag_preload = c_adw_tab_overview_get_extra_drag_preload;

/** */
alias adw_tab_overview_get_inverted = c_adw_tab_overview_get_inverted;

/** */
alias adw_tab_overview_get_open = c_adw_tab_overview_get_open;

/** */
alias adw_tab_overview_get_search_active = c_adw_tab_overview_get_search_active;

/** */
alias adw_tab_overview_get_secondary_menu = c_adw_tab_overview_get_secondary_menu;

/** */
alias adw_tab_overview_get_show_end_title_buttons = c_adw_tab_overview_get_show_end_title_buttons;

/** */
alias adw_tab_overview_get_show_start_title_buttons = c_adw_tab_overview_get_show_start_title_buttons;

/** */
alias adw_tab_overview_get_view = c_adw_tab_overview_get_view;

/** */
alias adw_tab_overview_set_child = c_adw_tab_overview_set_child;

/** */
alias adw_tab_overview_set_enable_new_tab = c_adw_tab_overview_set_enable_new_tab;

/** */
alias adw_tab_overview_set_enable_search = c_adw_tab_overview_set_enable_search;

/** */
alias adw_tab_overview_set_extra_drag_preload = c_adw_tab_overview_set_extra_drag_preload;

/** */
alias adw_tab_overview_set_inverted = c_adw_tab_overview_set_inverted;

/** */
alias adw_tab_overview_set_open = c_adw_tab_overview_set_open;

/** */
alias adw_tab_overview_set_secondary_menu = c_adw_tab_overview_set_secondary_menu;

/** */
alias adw_tab_overview_set_show_end_title_buttons = c_adw_tab_overview_set_show_end_title_buttons;

/** */
alias adw_tab_overview_set_show_start_title_buttons = c_adw_tab_overview_set_show_start_title_buttons;

/** */
alias adw_tab_overview_set_view = c_adw_tab_overview_set_view;

/** */
alias adw_tab_overview_setup_extra_drop_target = c_adw_tab_overview_setup_extra_drop_target;

// TabPage

/** */
alias adw_tab_page_get_type = c_adw_tab_page_get_type;

/** */
alias adw_tab_page_get_child = c_adw_tab_page_get_child;

/** */
alias adw_tab_page_get_icon = c_adw_tab_page_get_icon;

/** */
alias adw_tab_page_get_indicator_activatable = c_adw_tab_page_get_indicator_activatable;

/** */
alias adw_tab_page_get_indicator_icon = c_adw_tab_page_get_indicator_icon;

/** */
alias adw_tab_page_get_indicator_tooltip = c_adw_tab_page_get_indicator_tooltip;

/** */
alias adw_tab_page_get_keyword = c_adw_tab_page_get_keyword;

/** */
alias adw_tab_page_get_live_thumbnail = c_adw_tab_page_get_live_thumbnail;

/** */
alias adw_tab_page_get_loading = c_adw_tab_page_get_loading;

/** */
alias adw_tab_page_get_needs_attention = c_adw_tab_page_get_needs_attention;

/** */
alias adw_tab_page_get_parent = c_adw_tab_page_get_parent;

/** */
alias adw_tab_page_get_pinned = c_adw_tab_page_get_pinned;

/** */
alias adw_tab_page_get_selected = c_adw_tab_page_get_selected;

/** */
alias adw_tab_page_get_thumbnail_xalign = c_adw_tab_page_get_thumbnail_xalign;

/** */
alias adw_tab_page_get_thumbnail_yalign = c_adw_tab_page_get_thumbnail_yalign;

/** */
alias adw_tab_page_get_title = c_adw_tab_page_get_title;

/** */
alias adw_tab_page_get_tooltip = c_adw_tab_page_get_tooltip;

/** */
alias adw_tab_page_invalidate_thumbnail = c_adw_tab_page_invalidate_thumbnail;

/** */
alias adw_tab_page_set_icon = c_adw_tab_page_set_icon;

/** */
alias adw_tab_page_set_indicator_activatable = c_adw_tab_page_set_indicator_activatable;

/** */
alias adw_tab_page_set_indicator_icon = c_adw_tab_page_set_indicator_icon;

/** */
alias adw_tab_page_set_indicator_tooltip = c_adw_tab_page_set_indicator_tooltip;

/** */
alias adw_tab_page_set_keyword = c_adw_tab_page_set_keyword;

/** */
alias adw_tab_page_set_live_thumbnail = c_adw_tab_page_set_live_thumbnail;

/** */
alias adw_tab_page_set_loading = c_adw_tab_page_set_loading;

/** */
alias adw_tab_page_set_needs_attention = c_adw_tab_page_set_needs_attention;

/** */
alias adw_tab_page_set_thumbnail_xalign = c_adw_tab_page_set_thumbnail_xalign;

/** */
alias adw_tab_page_set_thumbnail_yalign = c_adw_tab_page_set_thumbnail_yalign;

/** */
alias adw_tab_page_set_title = c_adw_tab_page_set_title;

/** */
alias adw_tab_page_set_tooltip = c_adw_tab_page_set_tooltip;

// TabView

/** */
alias adw_tab_view_get_type = c_adw_tab_view_get_type;

/** */
alias adw_tab_view_new = c_adw_tab_view_new;

/** */
alias adw_tab_view_add_page = c_adw_tab_view_add_page;

/** */
alias adw_tab_view_add_shortcuts = c_adw_tab_view_add_shortcuts;

/** */
alias adw_tab_view_append = c_adw_tab_view_append;

/** */
alias adw_tab_view_append_pinned = c_adw_tab_view_append_pinned;

/** */
alias adw_tab_view_close_other_pages = c_adw_tab_view_close_other_pages;

/** */
alias adw_tab_view_close_page = c_adw_tab_view_close_page;

/** */
alias adw_tab_view_close_page_finish = c_adw_tab_view_close_page_finish;

/** */
alias adw_tab_view_close_pages_after = c_adw_tab_view_close_pages_after;

/** */
alias adw_tab_view_close_pages_before = c_adw_tab_view_close_pages_before;

/** */
alias adw_tab_view_get_default_icon = c_adw_tab_view_get_default_icon;

/** */
alias adw_tab_view_get_is_transferring_page = c_adw_tab_view_get_is_transferring_page;

/** */
alias adw_tab_view_get_menu_model = c_adw_tab_view_get_menu_model;

/** */
alias adw_tab_view_get_n_pages = c_adw_tab_view_get_n_pages;

/** */
alias adw_tab_view_get_n_pinned_pages = c_adw_tab_view_get_n_pinned_pages;

/** */
alias adw_tab_view_get_nth_page = c_adw_tab_view_get_nth_page;

/** */
alias adw_tab_view_get_page = c_adw_tab_view_get_page;

/** */
alias adw_tab_view_get_page_position = c_adw_tab_view_get_page_position;

/** */
alias adw_tab_view_get_pages = c_adw_tab_view_get_pages;

/** */
alias adw_tab_view_get_selected_page = c_adw_tab_view_get_selected_page;

/** */
alias adw_tab_view_get_shortcuts = c_adw_tab_view_get_shortcuts;

/** */
alias adw_tab_view_insert = c_adw_tab_view_insert;

/** */
alias adw_tab_view_insert_pinned = c_adw_tab_view_insert_pinned;

/** */
alias adw_tab_view_invalidate_thumbnails = c_adw_tab_view_invalidate_thumbnails;

/** */
alias adw_tab_view_prepend = c_adw_tab_view_prepend;

/** */
alias adw_tab_view_prepend_pinned = c_adw_tab_view_prepend_pinned;

/** */
alias adw_tab_view_remove_shortcuts = c_adw_tab_view_remove_shortcuts;

/** */
alias adw_tab_view_reorder_backward = c_adw_tab_view_reorder_backward;

/** */
alias adw_tab_view_reorder_first = c_adw_tab_view_reorder_first;

/** */
alias adw_tab_view_reorder_forward = c_adw_tab_view_reorder_forward;

/** */
alias adw_tab_view_reorder_last = c_adw_tab_view_reorder_last;

/** */
alias adw_tab_view_reorder_page = c_adw_tab_view_reorder_page;

/** */
alias adw_tab_view_select_next_page = c_adw_tab_view_select_next_page;

/** */
alias adw_tab_view_select_previous_page = c_adw_tab_view_select_previous_page;

/** */
alias adw_tab_view_set_default_icon = c_adw_tab_view_set_default_icon;

/** */
alias adw_tab_view_set_menu_model = c_adw_tab_view_set_menu_model;

/** */
alias adw_tab_view_set_page_pinned = c_adw_tab_view_set_page_pinned;

/** */
alias adw_tab_view_set_selected_page = c_adw_tab_view_set_selected_page;

/** */
alias adw_tab_view_set_shortcuts = c_adw_tab_view_set_shortcuts;

/** */
alias adw_tab_view_transfer_page = c_adw_tab_view_transfer_page;

// TimedAnimation

/** */
alias adw_timed_animation_get_type = c_adw_timed_animation_get_type;

/** */
alias adw_timed_animation_new = c_adw_timed_animation_new;

/** */
alias adw_timed_animation_get_alternate = c_adw_timed_animation_get_alternate;

/** */
alias adw_timed_animation_get_duration = c_adw_timed_animation_get_duration;

/** */
alias adw_timed_animation_get_easing = c_adw_timed_animation_get_easing;

/** */
alias adw_timed_animation_get_repeat_count = c_adw_timed_animation_get_repeat_count;

/** */
alias adw_timed_animation_get_reverse = c_adw_timed_animation_get_reverse;

/** */
alias adw_timed_animation_get_value_from = c_adw_timed_animation_get_value_from;

/** */
alias adw_timed_animation_get_value_to = c_adw_timed_animation_get_value_to;

/** */
alias adw_timed_animation_set_alternate = c_adw_timed_animation_set_alternate;

/** */
alias adw_timed_animation_set_duration = c_adw_timed_animation_set_duration;

/** */
alias adw_timed_animation_set_easing = c_adw_timed_animation_set_easing;

/** */
alias adw_timed_animation_set_repeat_count = c_adw_timed_animation_set_repeat_count;

/** */
alias adw_timed_animation_set_reverse = c_adw_timed_animation_set_reverse;

/** */
alias adw_timed_animation_set_value_from = c_adw_timed_animation_set_value_from;

/** */
alias adw_timed_animation_set_value_to = c_adw_timed_animation_set_value_to;

// Toast

/** */
alias adw_toast_get_type = c_adw_toast_get_type;

/** */
alias adw_toast_new = c_adw_toast_new;

/** */
alias adw_toast_new_format = c_adw_toast_new_format;

/** */
alias adw_toast_dismiss = c_adw_toast_dismiss;

/** */
alias adw_toast_get_action_name = c_adw_toast_get_action_name;

/** */
alias adw_toast_get_action_target_value = c_adw_toast_get_action_target_value;

/** */
alias adw_toast_get_button_label = c_adw_toast_get_button_label;

/** */
alias adw_toast_get_custom_title = c_adw_toast_get_custom_title;

/** */
alias adw_toast_get_priority = c_adw_toast_get_priority;

/** */
alias adw_toast_get_timeout = c_adw_toast_get_timeout;

/** */
alias adw_toast_get_title = c_adw_toast_get_title;

/** */
alias adw_toast_get_use_markup = c_adw_toast_get_use_markup;

/** */
alias adw_toast_set_action_name = c_adw_toast_set_action_name;

/** */
alias adw_toast_set_action_target = c_adw_toast_set_action_target;

/** */
alias adw_toast_set_action_target_value = c_adw_toast_set_action_target_value;

/** */
alias adw_toast_set_button_label = c_adw_toast_set_button_label;

/** */
alias adw_toast_set_custom_title = c_adw_toast_set_custom_title;

/** */
alias adw_toast_set_detailed_action_name = c_adw_toast_set_detailed_action_name;

/** */
alias adw_toast_set_priority = c_adw_toast_set_priority;

/** */
alias adw_toast_set_timeout = c_adw_toast_set_timeout;

/** */
alias adw_toast_set_title = c_adw_toast_set_title;

/** */
alias adw_toast_set_use_markup = c_adw_toast_set_use_markup;

// ToastOverlay

/** */
alias adw_toast_overlay_get_type = c_adw_toast_overlay_get_type;

/** */
alias adw_toast_overlay_new = c_adw_toast_overlay_new;

/** */
alias adw_toast_overlay_add_toast = c_adw_toast_overlay_add_toast;

/** */
alias adw_toast_overlay_dismiss_all = c_adw_toast_overlay_dismiss_all;

/** */
alias adw_toast_overlay_get_child = c_adw_toast_overlay_get_child;

/** */
alias adw_toast_overlay_set_child = c_adw_toast_overlay_set_child;

// Toggle

/** */
alias adw_toggle_get_type = c_adw_toggle_get_type;

/** */
alias adw_toggle_new = c_adw_toggle_new;

/** */
alias adw_toggle_get_child = c_adw_toggle_get_child;

/** */
alias adw_toggle_get_description = c_adw_toggle_get_description;

/** */
alias adw_toggle_get_enabled = c_adw_toggle_get_enabled;

/** */
alias adw_toggle_get_icon_name = c_adw_toggle_get_icon_name;

/** */
alias adw_toggle_get_index = c_adw_toggle_get_index;

/** */
alias adw_toggle_get_label = c_adw_toggle_get_label;

/** */
alias adw_toggle_get_name = c_adw_toggle_get_name;

/** */
alias adw_toggle_get_tooltip = c_adw_toggle_get_tooltip;

/** */
alias adw_toggle_get_use_underline = c_adw_toggle_get_use_underline;

/** */
alias adw_toggle_set_child = c_adw_toggle_set_child;

/** */
alias adw_toggle_set_description = c_adw_toggle_set_description;

/** */
alias adw_toggle_set_enabled = c_adw_toggle_set_enabled;

/** */
alias adw_toggle_set_icon_name = c_adw_toggle_set_icon_name;

/** */
alias adw_toggle_set_label = c_adw_toggle_set_label;

/** */
alias adw_toggle_set_name = c_adw_toggle_set_name;

/** */
alias adw_toggle_set_tooltip = c_adw_toggle_set_tooltip;

/** */
alias adw_toggle_set_use_underline = c_adw_toggle_set_use_underline;

// ToggleGroup

/** */
alias adw_toggle_group_get_type = c_adw_toggle_group_get_type;

/** */
alias adw_toggle_group_new = c_adw_toggle_group_new;

/** */
alias adw_toggle_group_add = c_adw_toggle_group_add;

/** */
alias adw_toggle_group_get_active = c_adw_toggle_group_get_active;

/** */
alias adw_toggle_group_get_active_name = c_adw_toggle_group_get_active_name;

/** */
alias adw_toggle_group_get_can_shrink = c_adw_toggle_group_get_can_shrink;

/** */
alias adw_toggle_group_get_homogeneous = c_adw_toggle_group_get_homogeneous;

/** */
alias adw_toggle_group_get_n_toggles = c_adw_toggle_group_get_n_toggles;

/** */
alias adw_toggle_group_get_toggle = c_adw_toggle_group_get_toggle;

/** */
alias adw_toggle_group_get_toggle_by_name = c_adw_toggle_group_get_toggle_by_name;

/** */
alias adw_toggle_group_get_toggles = c_adw_toggle_group_get_toggles;

/** */
alias adw_toggle_group_remove = c_adw_toggle_group_remove;

/** */
alias adw_toggle_group_remove_all = c_adw_toggle_group_remove_all;

/** */
alias adw_toggle_group_set_active = c_adw_toggle_group_set_active;

/** */
alias adw_toggle_group_set_active_name = c_adw_toggle_group_set_active_name;

/** */
alias adw_toggle_group_set_can_shrink = c_adw_toggle_group_set_can_shrink;

/** */
alias adw_toggle_group_set_homogeneous = c_adw_toggle_group_set_homogeneous;

// ToolbarView

/** */
alias adw_toolbar_view_get_type = c_adw_toolbar_view_get_type;

/** */
alias adw_toolbar_view_new = c_adw_toolbar_view_new;

/** */
alias adw_toolbar_view_add_bottom_bar = c_adw_toolbar_view_add_bottom_bar;

/** */
alias adw_toolbar_view_add_top_bar = c_adw_toolbar_view_add_top_bar;

/** */
alias adw_toolbar_view_get_bottom_bar_height = c_adw_toolbar_view_get_bottom_bar_height;

/** */
alias adw_toolbar_view_get_bottom_bar_style = c_adw_toolbar_view_get_bottom_bar_style;

/** */
alias adw_toolbar_view_get_content = c_adw_toolbar_view_get_content;

/** */
alias adw_toolbar_view_get_extend_content_to_bottom_edge = c_adw_toolbar_view_get_extend_content_to_bottom_edge;

/** */
alias adw_toolbar_view_get_extend_content_to_top_edge = c_adw_toolbar_view_get_extend_content_to_top_edge;

/** */
alias adw_toolbar_view_get_reveal_bottom_bars = c_adw_toolbar_view_get_reveal_bottom_bars;

/** */
alias adw_toolbar_view_get_reveal_top_bars = c_adw_toolbar_view_get_reveal_top_bars;

/** */
alias adw_toolbar_view_get_top_bar_height = c_adw_toolbar_view_get_top_bar_height;

/** */
alias adw_toolbar_view_get_top_bar_style = c_adw_toolbar_view_get_top_bar_style;

/** */
alias adw_toolbar_view_remove = c_adw_toolbar_view_remove;

/** */
alias adw_toolbar_view_set_bottom_bar_style = c_adw_toolbar_view_set_bottom_bar_style;

/** */
alias adw_toolbar_view_set_content = c_adw_toolbar_view_set_content;

/** */
alias adw_toolbar_view_set_extend_content_to_bottom_edge = c_adw_toolbar_view_set_extend_content_to_bottom_edge;

/** */
alias adw_toolbar_view_set_extend_content_to_top_edge = c_adw_toolbar_view_set_extend_content_to_top_edge;

/** */
alias adw_toolbar_view_set_reveal_bottom_bars = c_adw_toolbar_view_set_reveal_bottom_bars;

/** */
alias adw_toolbar_view_set_reveal_top_bars = c_adw_toolbar_view_set_reveal_top_bars;

/** */
alias adw_toolbar_view_set_top_bar_style = c_adw_toolbar_view_set_top_bar_style;

// ViewStack

/** */
alias adw_view_stack_get_type = c_adw_view_stack_get_type;

/** */
alias adw_view_stack_new = c_adw_view_stack_new;

/** */
alias adw_view_stack_add = c_adw_view_stack_add;

/** */
alias adw_view_stack_add_named = c_adw_view_stack_add_named;

/** */
alias adw_view_stack_add_titled = c_adw_view_stack_add_titled;

/** */
alias adw_view_stack_add_titled_with_icon = c_adw_view_stack_add_titled_with_icon;

/** */
alias adw_view_stack_get_child_by_name = c_adw_view_stack_get_child_by_name;

/** */
alias adw_view_stack_get_enable_transitions = c_adw_view_stack_get_enable_transitions;

/** */
alias adw_view_stack_get_hhomogeneous = c_adw_view_stack_get_hhomogeneous;

/** */
alias adw_view_stack_get_page = c_adw_view_stack_get_page;

/** */
alias adw_view_stack_get_pages = c_adw_view_stack_get_pages;

/** */
alias adw_view_stack_get_transition_duration = c_adw_view_stack_get_transition_duration;

/** */
alias adw_view_stack_get_transition_running = c_adw_view_stack_get_transition_running;

/** */
alias adw_view_stack_get_vhomogeneous = c_adw_view_stack_get_vhomogeneous;

/** */
alias adw_view_stack_get_visible_child = c_adw_view_stack_get_visible_child;

/** */
alias adw_view_stack_get_visible_child_name = c_adw_view_stack_get_visible_child_name;

/** */
alias adw_view_stack_remove = c_adw_view_stack_remove;

/** */
alias adw_view_stack_set_enable_transitions = c_adw_view_stack_set_enable_transitions;

/** */
alias adw_view_stack_set_hhomogeneous = c_adw_view_stack_set_hhomogeneous;

/** */
alias adw_view_stack_set_transition_duration = c_adw_view_stack_set_transition_duration;

/** */
alias adw_view_stack_set_vhomogeneous = c_adw_view_stack_set_vhomogeneous;

/** */
alias adw_view_stack_set_visible_child = c_adw_view_stack_set_visible_child;

/** */
alias adw_view_stack_set_visible_child_name = c_adw_view_stack_set_visible_child_name;

// ViewStackPage

/** */
alias adw_view_stack_page_get_type = c_adw_view_stack_page_get_type;

/** */
alias adw_view_stack_page_get_badge_number = c_adw_view_stack_page_get_badge_number;

/** */
alias adw_view_stack_page_get_child = c_adw_view_stack_page_get_child;

/** */
alias adw_view_stack_page_get_icon_name = c_adw_view_stack_page_get_icon_name;

/** */
alias adw_view_stack_page_get_name = c_adw_view_stack_page_get_name;

/** */
alias adw_view_stack_page_get_needs_attention = c_adw_view_stack_page_get_needs_attention;

/** */
alias adw_view_stack_page_get_section_title = c_adw_view_stack_page_get_section_title;

/** */
alias adw_view_stack_page_get_starts_section = c_adw_view_stack_page_get_starts_section;

/** */
alias adw_view_stack_page_get_title = c_adw_view_stack_page_get_title;

/** */
alias adw_view_stack_page_get_use_underline = c_adw_view_stack_page_get_use_underline;

/** */
alias adw_view_stack_page_get_visible = c_adw_view_stack_page_get_visible;

/** */
alias adw_view_stack_page_set_badge_number = c_adw_view_stack_page_set_badge_number;

/** */
alias adw_view_stack_page_set_icon_name = c_adw_view_stack_page_set_icon_name;

/** */
alias adw_view_stack_page_set_name = c_adw_view_stack_page_set_name;

/** */
alias adw_view_stack_page_set_needs_attention = c_adw_view_stack_page_set_needs_attention;

/** */
alias adw_view_stack_page_set_section_title = c_adw_view_stack_page_set_section_title;

/** */
alias adw_view_stack_page_set_starts_section = c_adw_view_stack_page_set_starts_section;

/** */
alias adw_view_stack_page_set_title = c_adw_view_stack_page_set_title;

/** */
alias adw_view_stack_page_set_use_underline = c_adw_view_stack_page_set_use_underline;

/** */
alias adw_view_stack_page_set_visible = c_adw_view_stack_page_set_visible;

// ViewStackPages

/** */
alias adw_view_stack_pages_get_type = c_adw_view_stack_pages_get_type;

/** */
alias adw_view_stack_pages_get_selected_page = c_adw_view_stack_pages_get_selected_page;

/** */
alias adw_view_stack_pages_set_selected_page = c_adw_view_stack_pages_set_selected_page;

// ViewSwitcher

/** */
alias adw_view_switcher_get_type = c_adw_view_switcher_get_type;

/** */
alias adw_view_switcher_new = c_adw_view_switcher_new;

/** */
alias adw_view_switcher_get_policy = c_adw_view_switcher_get_policy;

/** */
alias adw_view_switcher_get_stack = c_adw_view_switcher_get_stack;

/** */
alias adw_view_switcher_set_policy = c_adw_view_switcher_set_policy;

/** */
alias adw_view_switcher_set_stack = c_adw_view_switcher_set_stack;

// ViewSwitcherBar

/** */
alias adw_view_switcher_bar_get_type = c_adw_view_switcher_bar_get_type;

/** */
alias adw_view_switcher_bar_new = c_adw_view_switcher_bar_new;

/** */
alias adw_view_switcher_bar_get_reveal = c_adw_view_switcher_bar_get_reveal;

/** */
alias adw_view_switcher_bar_get_stack = c_adw_view_switcher_bar_get_stack;

/** */
alias adw_view_switcher_bar_set_reveal = c_adw_view_switcher_bar_set_reveal;

/** */
alias adw_view_switcher_bar_set_stack = c_adw_view_switcher_bar_set_stack;

// ViewSwitcherSidebar

/** */
alias adw_view_switcher_sidebar_get_type = c_adw_view_switcher_sidebar_get_type;

/** */
alias adw_view_switcher_sidebar_new = c_adw_view_switcher_sidebar_new;

/** */
alias adw_view_switcher_sidebar_get_filter = c_adw_view_switcher_sidebar_get_filter;

/** */
alias adw_view_switcher_sidebar_get_mode = c_adw_view_switcher_sidebar_get_mode;

/** */
alias adw_view_switcher_sidebar_get_placeholder = c_adw_view_switcher_sidebar_get_placeholder;

/** */
alias adw_view_switcher_sidebar_get_stack = c_adw_view_switcher_sidebar_get_stack;

/** */
alias adw_view_switcher_sidebar_set_filter = c_adw_view_switcher_sidebar_set_filter;

/** */
alias adw_view_switcher_sidebar_set_mode = c_adw_view_switcher_sidebar_set_mode;

/** */
alias adw_view_switcher_sidebar_set_placeholder = c_adw_view_switcher_sidebar_set_placeholder;

/** */
alias adw_view_switcher_sidebar_set_stack = c_adw_view_switcher_sidebar_set_stack;

// ViewSwitcherTitle

/** */
alias adw_view_switcher_title_get_type = c_adw_view_switcher_title_get_type;

/** */
alias adw_view_switcher_title_new = c_adw_view_switcher_title_new;

/** */
alias adw_view_switcher_title_get_stack = c_adw_view_switcher_title_get_stack;

/** */
alias adw_view_switcher_title_get_subtitle = c_adw_view_switcher_title_get_subtitle;

/** */
alias adw_view_switcher_title_get_title = c_adw_view_switcher_title_get_title;

/** */
alias adw_view_switcher_title_get_title_visible = c_adw_view_switcher_title_get_title_visible;

/** */
alias adw_view_switcher_title_get_view_switcher_enabled = c_adw_view_switcher_title_get_view_switcher_enabled;

/** */
alias adw_view_switcher_title_set_stack = c_adw_view_switcher_title_set_stack;

/** */
alias adw_view_switcher_title_set_subtitle = c_adw_view_switcher_title_set_subtitle;

/** */
alias adw_view_switcher_title_set_title = c_adw_view_switcher_title_set_title;

/** */
alias adw_view_switcher_title_set_view_switcher_enabled = c_adw_view_switcher_title_set_view_switcher_enabled;

// Window

/** */
alias adw_window_get_type = c_adw_window_get_type;

/** */
alias adw_window_new = c_adw_window_new;

/** */
alias adw_window_add_breakpoint = c_adw_window_add_breakpoint;

/** */
alias adw_window_get_adaptive_preview = c_adw_window_get_adaptive_preview;

/** */
alias adw_window_get_content = c_adw_window_get_content;

/** */
alias adw_window_get_current_breakpoint = c_adw_window_get_current_breakpoint;

/** */
alias adw_window_get_dialogs = c_adw_window_get_dialogs;

/** */
alias adw_window_get_visible_dialog = c_adw_window_get_visible_dialog;

/** */
alias adw_window_set_adaptive_preview = c_adw_window_set_adaptive_preview;

/** */
alias adw_window_set_content = c_adw_window_set_content;

// WindowTitle

/** */
alias adw_window_title_get_type = c_adw_window_title_get_type;

/** */
alias adw_window_title_new = c_adw_window_title_new;

/** */
alias adw_window_title_get_subtitle = c_adw_window_title_get_subtitle;

/** */
alias adw_window_title_get_title = c_adw_window_title_get_title;

/** */
alias adw_window_title_set_subtitle = c_adw_window_title_set_subtitle;

/** */
alias adw_window_title_set_title = c_adw_window_title_set_title;

// WrapBox

/** */
alias adw_wrap_box_get_type = c_adw_wrap_box_get_type;

/** */
alias adw_wrap_box_new = c_adw_wrap_box_new;

/** */
alias adw_wrap_box_append = c_adw_wrap_box_append;

/** */
alias adw_wrap_box_get_align = c_adw_wrap_box_get_align;

/** */
alias adw_wrap_box_get_child_spacing = c_adw_wrap_box_get_child_spacing;

/** */
alias adw_wrap_box_get_child_spacing_unit = c_adw_wrap_box_get_child_spacing_unit;

/** */
alias adw_wrap_box_get_justify = c_adw_wrap_box_get_justify;

/** */
alias adw_wrap_box_get_justify_last_line = c_adw_wrap_box_get_justify_last_line;

/** */
alias adw_wrap_box_get_line_homogeneous = c_adw_wrap_box_get_line_homogeneous;

/** */
alias adw_wrap_box_get_line_spacing = c_adw_wrap_box_get_line_spacing;

/** */
alias adw_wrap_box_get_line_spacing_unit = c_adw_wrap_box_get_line_spacing_unit;

/** */
alias adw_wrap_box_get_natural_line_length = c_adw_wrap_box_get_natural_line_length;

/** */
alias adw_wrap_box_get_natural_line_length_unit = c_adw_wrap_box_get_natural_line_length_unit;

/** */
alias adw_wrap_box_get_pack_direction = c_adw_wrap_box_get_pack_direction;

/** */
alias adw_wrap_box_get_wrap_policy = c_adw_wrap_box_get_wrap_policy;

/** */
alias adw_wrap_box_get_wrap_reverse = c_adw_wrap_box_get_wrap_reverse;

/** */
alias adw_wrap_box_insert_child_after = c_adw_wrap_box_insert_child_after;

/** */
alias adw_wrap_box_prepend = c_adw_wrap_box_prepend;

/** */
alias adw_wrap_box_remove = c_adw_wrap_box_remove;

/** */
alias adw_wrap_box_remove_all = c_adw_wrap_box_remove_all;

/** */
alias adw_wrap_box_reorder_child_after = c_adw_wrap_box_reorder_child_after;

/** */
alias adw_wrap_box_set_align = c_adw_wrap_box_set_align;

/** */
alias adw_wrap_box_set_child_spacing = c_adw_wrap_box_set_child_spacing;

/** */
alias adw_wrap_box_set_child_spacing_unit = c_adw_wrap_box_set_child_spacing_unit;

/** */
alias adw_wrap_box_set_justify = c_adw_wrap_box_set_justify;

/** */
alias adw_wrap_box_set_justify_last_line = c_adw_wrap_box_set_justify_last_line;

/** */
alias adw_wrap_box_set_line_homogeneous = c_adw_wrap_box_set_line_homogeneous;

/** */
alias adw_wrap_box_set_line_spacing = c_adw_wrap_box_set_line_spacing;

/** */
alias adw_wrap_box_set_line_spacing_unit = c_adw_wrap_box_set_line_spacing_unit;

/** */
alias adw_wrap_box_set_natural_line_length = c_adw_wrap_box_set_natural_line_length;

/** */
alias adw_wrap_box_set_natural_line_length_unit = c_adw_wrap_box_set_natural_line_length_unit;

/** */
alias adw_wrap_box_set_pack_direction = c_adw_wrap_box_set_pack_direction;

/** */
alias adw_wrap_box_set_wrap_policy = c_adw_wrap_box_set_wrap_policy;

/** */
alias adw_wrap_box_set_wrap_reverse = c_adw_wrap_box_set_wrap_reverse;

// WrapLayout

/** */
alias adw_wrap_layout_get_type = c_adw_wrap_layout_get_type;

/** */
alias adw_wrap_layout_new = c_adw_wrap_layout_new;

/** */
alias adw_wrap_layout_get_align = c_adw_wrap_layout_get_align;

/** */
alias adw_wrap_layout_get_child_spacing = c_adw_wrap_layout_get_child_spacing;

/** */
alias adw_wrap_layout_get_child_spacing_unit = c_adw_wrap_layout_get_child_spacing_unit;

/** */
alias adw_wrap_layout_get_justify = c_adw_wrap_layout_get_justify;

/** */
alias adw_wrap_layout_get_justify_last_line = c_adw_wrap_layout_get_justify_last_line;

/** */
alias adw_wrap_layout_get_line_homogeneous = c_adw_wrap_layout_get_line_homogeneous;

/** */
alias adw_wrap_layout_get_line_spacing = c_adw_wrap_layout_get_line_spacing;

/** */
alias adw_wrap_layout_get_line_spacing_unit = c_adw_wrap_layout_get_line_spacing_unit;

/** */
alias adw_wrap_layout_get_natural_line_length = c_adw_wrap_layout_get_natural_line_length;

/** */
alias adw_wrap_layout_get_natural_line_length_unit = c_adw_wrap_layout_get_natural_line_length_unit;

/** */
alias adw_wrap_layout_get_pack_direction = c_adw_wrap_layout_get_pack_direction;

/** */
alias adw_wrap_layout_get_wrap_policy = c_adw_wrap_layout_get_wrap_policy;

/** */
alias adw_wrap_layout_get_wrap_reverse = c_adw_wrap_layout_get_wrap_reverse;

/** */
alias adw_wrap_layout_set_align = c_adw_wrap_layout_set_align;

/** */
alias adw_wrap_layout_set_child_spacing = c_adw_wrap_layout_set_child_spacing;

/** */
alias adw_wrap_layout_set_child_spacing_unit = c_adw_wrap_layout_set_child_spacing_unit;

/** */
alias adw_wrap_layout_set_justify = c_adw_wrap_layout_set_justify;

/** */
alias adw_wrap_layout_set_justify_last_line = c_adw_wrap_layout_set_justify_last_line;

/** */
alias adw_wrap_layout_set_line_homogeneous = c_adw_wrap_layout_set_line_homogeneous;

/** */
alias adw_wrap_layout_set_line_spacing = c_adw_wrap_layout_set_line_spacing;

/** */
alias adw_wrap_layout_set_line_spacing_unit = c_adw_wrap_layout_set_line_spacing_unit;

/** */
alias adw_wrap_layout_set_natural_line_length = c_adw_wrap_layout_set_natural_line_length;

/** */
alias adw_wrap_layout_set_natural_line_length_unit = c_adw_wrap_layout_set_natural_line_length_unit;

/** */
alias adw_wrap_layout_set_pack_direction = c_adw_wrap_layout_set_pack_direction;

/** */
alias adw_wrap_layout_set_wrap_policy = c_adw_wrap_layout_set_wrap_policy;

/** */
alias adw_wrap_layout_set_wrap_reverse = c_adw_wrap_layout_set_wrap_reverse;

// global

/** */
alias adw_get_enable_animations = c_adw_get_enable_animations;

/** */
alias adw_get_major_version = c_adw_get_major_version;

/** */
alias adw_get_micro_version = c_adw_get_micro_version;

/** */
alias adw_get_minor_version = c_adw_get_minor_version;

/** */
alias adw_init = c_adw_init;

/** */
alias adw_is_initialized = c_adw_is_initialized;

/** */
alias adw_lerp = c_adw_lerp;

/** */
alias adw_rgba_to_standalone = c_adw_rgba_to_standalone;

/** */
alias adw_show_about_dialog = c_adw_show_about_dialog;

/** */
alias adw_show_about_dialog_from_appdata = c_adw_show_about_dialog_from_appdata;

/** */
alias adw_show_about_window = c_adw_show_about_window;

/** */
alias adw_show_about_window_from_appdata = c_adw_show_about_window_from_appdata;

// AccentColor

/** */
alias adw_accent_color_to_rgba = c_adw_accent_color_to_rgba;

/** */
alias adw_accent_color_to_standalone_rgba = c_adw_accent_color_to_standalone_rgba;

// Easing

/** */
alias adw_easing_ease = c_adw_easing_ease;

// LengthUnit

/** */
alias adw_length_unit_from_px = c_adw_length_unit_from_px;

/** */
alias adw_length_unit_to_px = c_adw_length_unit_to_px;

shared static this()
{
  auto libs = gidResolveLibs(LIBS);

  // AboutDialog
  gidLink(cast(void**)&adw_about_dialog_get_type, "adw_about_dialog_get_type", libs);
  gidLink(cast(void**)&adw_about_dialog_new, "adw_about_dialog_new", libs);
  gidLink(cast(void**)&adw_about_dialog_new_from_appdata, "adw_about_dialog_new_from_appdata", libs);
  gidLink(cast(void**)&adw_about_dialog_add_acknowledgement_section, "adw_about_dialog_add_acknowledgement_section", libs);
  gidLink(cast(void**)&adw_about_dialog_add_credit_section, "adw_about_dialog_add_credit_section", libs);
  gidLink(cast(void**)&adw_about_dialog_add_legal_section, "adw_about_dialog_add_legal_section", libs);
  gidLink(cast(void**)&adw_about_dialog_add_link, "adw_about_dialog_add_link", libs);
  gidLink(cast(void**)&adw_about_dialog_add_other_app, "adw_about_dialog_add_other_app", libs);
  gidLink(cast(void**)&adw_about_dialog_get_appdata_resource_path, "adw_about_dialog_get_appdata_resource_path", libs);
  gidLink(cast(void**)&adw_about_dialog_get_application_icon, "adw_about_dialog_get_application_icon", libs);
  gidLink(cast(void**)&adw_about_dialog_get_application_name, "adw_about_dialog_get_application_name", libs);
  gidLink(cast(void**)&adw_about_dialog_get_artists, "adw_about_dialog_get_artists", libs);
  gidLink(cast(void**)&adw_about_dialog_get_comments, "adw_about_dialog_get_comments", libs);
  gidLink(cast(void**)&adw_about_dialog_get_copyright, "adw_about_dialog_get_copyright", libs);
  gidLink(cast(void**)&adw_about_dialog_get_debug_info, "adw_about_dialog_get_debug_info", libs);
  gidLink(cast(void**)&adw_about_dialog_get_debug_info_filename, "adw_about_dialog_get_debug_info_filename", libs);
  gidLink(cast(void**)&adw_about_dialog_get_designers, "adw_about_dialog_get_designers", libs);
  gidLink(cast(void**)&adw_about_dialog_get_developer_name, "adw_about_dialog_get_developer_name", libs);
  gidLink(cast(void**)&adw_about_dialog_get_developers, "adw_about_dialog_get_developers", libs);
  gidLink(cast(void**)&adw_about_dialog_get_documenters, "adw_about_dialog_get_documenters", libs);
  gidLink(cast(void**)&adw_about_dialog_get_issue_url, "adw_about_dialog_get_issue_url", libs);
  gidLink(cast(void**)&adw_about_dialog_get_license, "adw_about_dialog_get_license", libs);
  gidLink(cast(void**)&adw_about_dialog_get_license_type, "adw_about_dialog_get_license_type", libs);
  gidLink(cast(void**)&adw_about_dialog_get_release_notes, "adw_about_dialog_get_release_notes", libs);
  gidLink(cast(void**)&adw_about_dialog_get_release_notes_version, "adw_about_dialog_get_release_notes_version", libs);
  gidLink(cast(void**)&adw_about_dialog_get_support_url, "adw_about_dialog_get_support_url", libs);
  gidLink(cast(void**)&adw_about_dialog_get_translator_credits, "adw_about_dialog_get_translator_credits", libs);
  gidLink(cast(void**)&adw_about_dialog_get_version, "adw_about_dialog_get_version", libs);
  gidLink(cast(void**)&adw_about_dialog_get_website, "adw_about_dialog_get_website", libs);
  gidLink(cast(void**)&adw_about_dialog_set_application_icon, "adw_about_dialog_set_application_icon", libs);
  gidLink(cast(void**)&adw_about_dialog_set_application_name, "adw_about_dialog_set_application_name", libs);
  gidLink(cast(void**)&adw_about_dialog_set_artists, "adw_about_dialog_set_artists", libs);
  gidLink(cast(void**)&adw_about_dialog_set_comments, "adw_about_dialog_set_comments", libs);
  gidLink(cast(void**)&adw_about_dialog_set_copyright, "adw_about_dialog_set_copyright", libs);
  gidLink(cast(void**)&adw_about_dialog_set_debug_info, "adw_about_dialog_set_debug_info", libs);
  gidLink(cast(void**)&adw_about_dialog_set_debug_info_filename, "adw_about_dialog_set_debug_info_filename", libs);
  gidLink(cast(void**)&adw_about_dialog_set_designers, "adw_about_dialog_set_designers", libs);
  gidLink(cast(void**)&adw_about_dialog_set_developer_name, "adw_about_dialog_set_developer_name", libs);
  gidLink(cast(void**)&adw_about_dialog_set_developers, "adw_about_dialog_set_developers", libs);
  gidLink(cast(void**)&adw_about_dialog_set_documenters, "adw_about_dialog_set_documenters", libs);
  gidLink(cast(void**)&adw_about_dialog_set_issue_url, "adw_about_dialog_set_issue_url", libs);
  gidLink(cast(void**)&adw_about_dialog_set_license, "adw_about_dialog_set_license", libs);
  gidLink(cast(void**)&adw_about_dialog_set_license_type, "adw_about_dialog_set_license_type", libs);
  gidLink(cast(void**)&adw_about_dialog_set_release_notes, "adw_about_dialog_set_release_notes", libs);
  gidLink(cast(void**)&adw_about_dialog_set_release_notes_version, "adw_about_dialog_set_release_notes_version", libs);
  gidLink(cast(void**)&adw_about_dialog_set_support_url, "adw_about_dialog_set_support_url", libs);
  gidLink(cast(void**)&adw_about_dialog_set_translator_credits, "adw_about_dialog_set_translator_credits", libs);
  gidLink(cast(void**)&adw_about_dialog_set_version, "adw_about_dialog_set_version", libs);
  gidLink(cast(void**)&adw_about_dialog_set_website, "adw_about_dialog_set_website", libs);

  // AboutWindow
  gidLink(cast(void**)&adw_about_window_get_type, "adw_about_window_get_type", libs);
  gidLink(cast(void**)&adw_about_window_new, "adw_about_window_new", libs);
  gidLink(cast(void**)&adw_about_window_new_from_appdata, "adw_about_window_new_from_appdata", libs);
  gidLink(cast(void**)&adw_about_window_add_acknowledgement_section, "adw_about_window_add_acknowledgement_section", libs);
  gidLink(cast(void**)&adw_about_window_add_credit_section, "adw_about_window_add_credit_section", libs);
  gidLink(cast(void**)&adw_about_window_add_legal_section, "adw_about_window_add_legal_section", libs);
  gidLink(cast(void**)&adw_about_window_add_link, "adw_about_window_add_link", libs);
  gidLink(cast(void**)&adw_about_window_get_application_icon, "adw_about_window_get_application_icon", libs);
  gidLink(cast(void**)&adw_about_window_get_application_name, "adw_about_window_get_application_name", libs);
  gidLink(cast(void**)&adw_about_window_get_artists, "adw_about_window_get_artists", libs);
  gidLink(cast(void**)&adw_about_window_get_comments, "adw_about_window_get_comments", libs);
  gidLink(cast(void**)&adw_about_window_get_copyright, "adw_about_window_get_copyright", libs);
  gidLink(cast(void**)&adw_about_window_get_debug_info, "adw_about_window_get_debug_info", libs);
  gidLink(cast(void**)&adw_about_window_get_debug_info_filename, "adw_about_window_get_debug_info_filename", libs);
  gidLink(cast(void**)&adw_about_window_get_designers, "adw_about_window_get_designers", libs);
  gidLink(cast(void**)&adw_about_window_get_developer_name, "adw_about_window_get_developer_name", libs);
  gidLink(cast(void**)&adw_about_window_get_developers, "adw_about_window_get_developers", libs);
  gidLink(cast(void**)&adw_about_window_get_documenters, "adw_about_window_get_documenters", libs);
  gidLink(cast(void**)&adw_about_window_get_issue_url, "adw_about_window_get_issue_url", libs);
  gidLink(cast(void**)&adw_about_window_get_license, "adw_about_window_get_license", libs);
  gidLink(cast(void**)&adw_about_window_get_license_type, "adw_about_window_get_license_type", libs);
  gidLink(cast(void**)&adw_about_window_get_release_notes, "adw_about_window_get_release_notes", libs);
  gidLink(cast(void**)&adw_about_window_get_release_notes_version, "adw_about_window_get_release_notes_version", libs);
  gidLink(cast(void**)&adw_about_window_get_support_url, "adw_about_window_get_support_url", libs);
  gidLink(cast(void**)&adw_about_window_get_translator_credits, "adw_about_window_get_translator_credits", libs);
  gidLink(cast(void**)&adw_about_window_get_version, "adw_about_window_get_version", libs);
  gidLink(cast(void**)&adw_about_window_get_website, "adw_about_window_get_website", libs);
  gidLink(cast(void**)&adw_about_window_set_application_icon, "adw_about_window_set_application_icon", libs);
  gidLink(cast(void**)&adw_about_window_set_application_name, "adw_about_window_set_application_name", libs);
  gidLink(cast(void**)&adw_about_window_set_artists, "adw_about_window_set_artists", libs);
  gidLink(cast(void**)&adw_about_window_set_comments, "adw_about_window_set_comments", libs);
  gidLink(cast(void**)&adw_about_window_set_copyright, "adw_about_window_set_copyright", libs);
  gidLink(cast(void**)&adw_about_window_set_debug_info, "adw_about_window_set_debug_info", libs);
  gidLink(cast(void**)&adw_about_window_set_debug_info_filename, "adw_about_window_set_debug_info_filename", libs);
  gidLink(cast(void**)&adw_about_window_set_designers, "adw_about_window_set_designers", libs);
  gidLink(cast(void**)&adw_about_window_set_developer_name, "adw_about_window_set_developer_name", libs);
  gidLink(cast(void**)&adw_about_window_set_developers, "adw_about_window_set_developers", libs);
  gidLink(cast(void**)&adw_about_window_set_documenters, "adw_about_window_set_documenters", libs);
  gidLink(cast(void**)&adw_about_window_set_issue_url, "adw_about_window_set_issue_url", libs);
  gidLink(cast(void**)&adw_about_window_set_license, "adw_about_window_set_license", libs);
  gidLink(cast(void**)&adw_about_window_set_license_type, "adw_about_window_set_license_type", libs);
  gidLink(cast(void**)&adw_about_window_set_release_notes, "adw_about_window_set_release_notes", libs);
  gidLink(cast(void**)&adw_about_window_set_release_notes_version, "adw_about_window_set_release_notes_version", libs);
  gidLink(cast(void**)&adw_about_window_set_support_url, "adw_about_window_set_support_url", libs);
  gidLink(cast(void**)&adw_about_window_set_translator_credits, "adw_about_window_set_translator_credits", libs);
  gidLink(cast(void**)&adw_about_window_set_version, "adw_about_window_set_version", libs);
  gidLink(cast(void**)&adw_about_window_set_website, "adw_about_window_set_website", libs);

  // ActionRow
  gidLink(cast(void**)&adw_action_row_get_type, "adw_action_row_get_type", libs);
  gidLink(cast(void**)&adw_action_row_new, "adw_action_row_new", libs);
  gidLink(cast(void**)&adw_action_row_activate, "adw_action_row_activate", libs);
  gidLink(cast(void**)&adw_action_row_add_prefix, "adw_action_row_add_prefix", libs);
  gidLink(cast(void**)&adw_action_row_add_suffix, "adw_action_row_add_suffix", libs);
  gidLink(cast(void**)&adw_action_row_get_activatable_widget, "adw_action_row_get_activatable_widget", libs);
  gidLink(cast(void**)&adw_action_row_get_icon_name, "adw_action_row_get_icon_name", libs);
  gidLink(cast(void**)&adw_action_row_get_subtitle, "adw_action_row_get_subtitle", libs);
  gidLink(cast(void**)&adw_action_row_get_subtitle_lines, "adw_action_row_get_subtitle_lines", libs);
  gidLink(cast(void**)&adw_action_row_get_subtitle_selectable, "adw_action_row_get_subtitle_selectable", libs);
  gidLink(cast(void**)&adw_action_row_get_title_lines, "adw_action_row_get_title_lines", libs);
  gidLink(cast(void**)&adw_action_row_remove, "adw_action_row_remove", libs);
  gidLink(cast(void**)&adw_action_row_set_activatable_widget, "adw_action_row_set_activatable_widget", libs);
  gidLink(cast(void**)&adw_action_row_set_icon_name, "adw_action_row_set_icon_name", libs);
  gidLink(cast(void**)&adw_action_row_set_subtitle, "adw_action_row_set_subtitle", libs);
  gidLink(cast(void**)&adw_action_row_set_subtitle_lines, "adw_action_row_set_subtitle_lines", libs);
  gidLink(cast(void**)&adw_action_row_set_subtitle_selectable, "adw_action_row_set_subtitle_selectable", libs);
  gidLink(cast(void**)&adw_action_row_set_title_lines, "adw_action_row_set_title_lines", libs);

  // AlertDialog
  gidLink(cast(void**)&adw_alert_dialog_get_type, "adw_alert_dialog_get_type", libs);
  gidLink(cast(void**)&adw_alert_dialog_new, "adw_alert_dialog_new", libs);
  gidLink(cast(void**)&adw_alert_dialog_add_response, "adw_alert_dialog_add_response", libs);
  gidLink(cast(void**)&adw_alert_dialog_add_responses, "adw_alert_dialog_add_responses", libs);
  gidLink(cast(void**)&adw_alert_dialog_choose, "adw_alert_dialog_choose", libs);
  gidLink(cast(void**)&adw_alert_dialog_choose_finish, "adw_alert_dialog_choose_finish", libs);
  gidLink(cast(void**)&adw_alert_dialog_format_body, "adw_alert_dialog_format_body", libs);
  gidLink(cast(void**)&adw_alert_dialog_format_body_markup, "adw_alert_dialog_format_body_markup", libs);
  gidLink(cast(void**)&adw_alert_dialog_format_heading, "adw_alert_dialog_format_heading", libs);
  gidLink(cast(void**)&adw_alert_dialog_format_heading_markup, "adw_alert_dialog_format_heading_markup", libs);
  gidLink(cast(void**)&adw_alert_dialog_get_body, "adw_alert_dialog_get_body", libs);
  gidLink(cast(void**)&adw_alert_dialog_get_body_use_markup, "adw_alert_dialog_get_body_use_markup", libs);
  gidLink(cast(void**)&adw_alert_dialog_get_close_response, "adw_alert_dialog_get_close_response", libs);
  gidLink(cast(void**)&adw_alert_dialog_get_default_response, "adw_alert_dialog_get_default_response", libs);
  gidLink(cast(void**)&adw_alert_dialog_get_extra_child, "adw_alert_dialog_get_extra_child", libs);
  gidLink(cast(void**)&adw_alert_dialog_get_heading, "adw_alert_dialog_get_heading", libs);
  gidLink(cast(void**)&adw_alert_dialog_get_heading_use_markup, "adw_alert_dialog_get_heading_use_markup", libs);
  gidLink(cast(void**)&adw_alert_dialog_get_prefer_wide_layout, "adw_alert_dialog_get_prefer_wide_layout", libs);
  gidLink(cast(void**)&adw_alert_dialog_get_response_appearance, "adw_alert_dialog_get_response_appearance", libs);
  gidLink(cast(void**)&adw_alert_dialog_get_response_enabled, "adw_alert_dialog_get_response_enabled", libs);
  gidLink(cast(void**)&adw_alert_dialog_get_response_label, "adw_alert_dialog_get_response_label", libs);
  gidLink(cast(void**)&adw_alert_dialog_has_response, "adw_alert_dialog_has_response", libs);
  gidLink(cast(void**)&adw_alert_dialog_remove_response, "adw_alert_dialog_remove_response", libs);
  gidLink(cast(void**)&adw_alert_dialog_set_body, "adw_alert_dialog_set_body", libs);
  gidLink(cast(void**)&adw_alert_dialog_set_body_use_markup, "adw_alert_dialog_set_body_use_markup", libs);
  gidLink(cast(void**)&adw_alert_dialog_set_close_response, "adw_alert_dialog_set_close_response", libs);
  gidLink(cast(void**)&adw_alert_dialog_set_default_response, "adw_alert_dialog_set_default_response", libs);
  gidLink(cast(void**)&adw_alert_dialog_set_extra_child, "adw_alert_dialog_set_extra_child", libs);
  gidLink(cast(void**)&adw_alert_dialog_set_heading, "adw_alert_dialog_set_heading", libs);
  gidLink(cast(void**)&adw_alert_dialog_set_heading_use_markup, "adw_alert_dialog_set_heading_use_markup", libs);
  gidLink(cast(void**)&adw_alert_dialog_set_prefer_wide_layout, "adw_alert_dialog_set_prefer_wide_layout", libs);
  gidLink(cast(void**)&adw_alert_dialog_set_response_appearance, "adw_alert_dialog_set_response_appearance", libs);
  gidLink(cast(void**)&adw_alert_dialog_set_response_enabled, "adw_alert_dialog_set_response_enabled", libs);
  gidLink(cast(void**)&adw_alert_dialog_set_response_label, "adw_alert_dialog_set_response_label", libs);

  // Animation
  gidLink(cast(void**)&adw_animation_get_type, "adw_animation_get_type", libs);
  gidLink(cast(void**)&adw_animation_get_follow_enable_animations_setting, "adw_animation_get_follow_enable_animations_setting", libs);
  gidLink(cast(void**)&adw_animation_get_state, "adw_animation_get_state", libs);
  gidLink(cast(void**)&adw_animation_get_target, "adw_animation_get_target", libs);
  gidLink(cast(void**)&adw_animation_get_value, "adw_animation_get_value", libs);
  gidLink(cast(void**)&adw_animation_get_widget, "adw_animation_get_widget", libs);
  gidLink(cast(void**)&adw_animation_pause, "adw_animation_pause", libs);
  gidLink(cast(void**)&adw_animation_play, "adw_animation_play", libs);
  gidLink(cast(void**)&adw_animation_reset, "adw_animation_reset", libs);
  gidLink(cast(void**)&adw_animation_resume, "adw_animation_resume", libs);
  gidLink(cast(void**)&adw_animation_set_follow_enable_animations_setting, "adw_animation_set_follow_enable_animations_setting", libs);
  gidLink(cast(void**)&adw_animation_set_target, "adw_animation_set_target", libs);
  gidLink(cast(void**)&adw_animation_skip, "adw_animation_skip", libs);

  // AnimationTarget
  gidLink(cast(void**)&adw_animation_target_get_type, "adw_animation_target_get_type", libs);

  // Application
  gidLink(cast(void**)&adw_application_get_type, "adw_application_get_type", libs);
  gidLink(cast(void**)&adw_application_new, "adw_application_new", libs);
  gidLink(cast(void**)&adw_application_get_style_manager, "adw_application_get_style_manager", libs);

  // ApplicationWindow
  gidLink(cast(void**)&adw_application_window_get_type, "adw_application_window_get_type", libs);
  gidLink(cast(void**)&adw_application_window_new, "adw_application_window_new", libs);
  gidLink(cast(void**)&adw_application_window_add_breakpoint, "adw_application_window_add_breakpoint", libs);
  gidLink(cast(void**)&adw_application_window_get_adaptive_preview, "adw_application_window_get_adaptive_preview", libs);
  gidLink(cast(void**)&adw_application_window_get_content, "adw_application_window_get_content", libs);
  gidLink(cast(void**)&adw_application_window_get_current_breakpoint, "adw_application_window_get_current_breakpoint", libs);
  gidLink(cast(void**)&adw_application_window_get_dialogs, "adw_application_window_get_dialogs", libs);
  gidLink(cast(void**)&adw_application_window_get_visible_dialog, "adw_application_window_get_visible_dialog", libs);
  gidLink(cast(void**)&adw_application_window_set_adaptive_preview, "adw_application_window_set_adaptive_preview", libs);
  gidLink(cast(void**)&adw_application_window_set_content, "adw_application_window_set_content", libs);

  // Avatar
  gidLink(cast(void**)&adw_avatar_get_type, "adw_avatar_get_type", libs);
  gidLink(cast(void**)&adw_avatar_new, "adw_avatar_new", libs);
  gidLink(cast(void**)&adw_avatar_draw_to_texture, "adw_avatar_draw_to_texture", libs);
  gidLink(cast(void**)&adw_avatar_get_custom_image, "adw_avatar_get_custom_image", libs);
  gidLink(cast(void**)&adw_avatar_get_icon_name, "adw_avatar_get_icon_name", libs);
  gidLink(cast(void**)&adw_avatar_get_show_initials, "adw_avatar_get_show_initials", libs);
  gidLink(cast(void**)&adw_avatar_get_size, "adw_avatar_get_size", libs);
  gidLink(cast(void**)&adw_avatar_get_text, "adw_avatar_get_text", libs);
  gidLink(cast(void**)&adw_avatar_set_custom_image, "adw_avatar_set_custom_image", libs);
  gidLink(cast(void**)&adw_avatar_set_icon_name, "adw_avatar_set_icon_name", libs);
  gidLink(cast(void**)&adw_avatar_set_show_initials, "adw_avatar_set_show_initials", libs);
  gidLink(cast(void**)&adw_avatar_set_size, "adw_avatar_set_size", libs);
  gidLink(cast(void**)&adw_avatar_set_text, "adw_avatar_set_text", libs);

  // Banner
  gidLink(cast(void**)&adw_banner_get_type, "adw_banner_get_type", libs);
  gidLink(cast(void**)&adw_banner_new, "adw_banner_new", libs);
  gidLink(cast(void**)&adw_banner_get_button_label, "adw_banner_get_button_label", libs);
  gidLink(cast(void**)&adw_banner_get_button_style, "adw_banner_get_button_style", libs);
  gidLink(cast(void**)&adw_banner_get_revealed, "adw_banner_get_revealed", libs);
  gidLink(cast(void**)&adw_banner_get_title, "adw_banner_get_title", libs);
  gidLink(cast(void**)&adw_banner_get_use_markup, "adw_banner_get_use_markup", libs);
  gidLink(cast(void**)&adw_banner_set_button_label, "adw_banner_set_button_label", libs);
  gidLink(cast(void**)&adw_banner_set_button_style, "adw_banner_set_button_style", libs);
  gidLink(cast(void**)&adw_banner_set_revealed, "adw_banner_set_revealed", libs);
  gidLink(cast(void**)&adw_banner_set_title, "adw_banner_set_title", libs);
  gidLink(cast(void**)&adw_banner_set_use_markup, "adw_banner_set_use_markup", libs);

  // Bin
  gidLink(cast(void**)&adw_bin_get_type, "adw_bin_get_type", libs);
  gidLink(cast(void**)&adw_bin_new, "adw_bin_new", libs);
  gidLink(cast(void**)&adw_bin_get_child, "adw_bin_get_child", libs);
  gidLink(cast(void**)&adw_bin_set_child, "adw_bin_set_child", libs);

  // BottomSheet
  gidLink(cast(void**)&adw_bottom_sheet_get_type, "adw_bottom_sheet_get_type", libs);
  gidLink(cast(void**)&adw_bottom_sheet_new, "adw_bottom_sheet_new", libs);
  gidLink(cast(void**)&adw_bottom_sheet_get_align, "adw_bottom_sheet_get_align", libs);
  gidLink(cast(void**)&adw_bottom_sheet_get_bottom_bar, "adw_bottom_sheet_get_bottom_bar", libs);
  gidLink(cast(void**)&adw_bottom_sheet_get_bottom_bar_height, "adw_bottom_sheet_get_bottom_bar_height", libs);
  gidLink(cast(void**)&adw_bottom_sheet_get_can_close, "adw_bottom_sheet_get_can_close", libs);
  gidLink(cast(void**)&adw_bottom_sheet_get_can_open, "adw_bottom_sheet_get_can_open", libs);
  gidLink(cast(void**)&adw_bottom_sheet_get_content, "adw_bottom_sheet_get_content", libs);
  gidLink(cast(void**)&adw_bottom_sheet_get_full_width, "adw_bottom_sheet_get_full_width", libs);
  gidLink(cast(void**)&adw_bottom_sheet_get_modal, "adw_bottom_sheet_get_modal", libs);
  gidLink(cast(void**)&adw_bottom_sheet_get_open, "adw_bottom_sheet_get_open", libs);
  gidLink(cast(void**)&adw_bottom_sheet_get_reveal_bottom_bar, "adw_bottom_sheet_get_reveal_bottom_bar", libs);
  gidLink(cast(void**)&adw_bottom_sheet_get_sheet, "adw_bottom_sheet_get_sheet", libs);
  gidLink(cast(void**)&adw_bottom_sheet_get_sheet_height, "adw_bottom_sheet_get_sheet_height", libs);
  gidLink(cast(void**)&adw_bottom_sheet_get_show_drag_handle, "adw_bottom_sheet_get_show_drag_handle", libs);
  gidLink(cast(void**)&adw_bottom_sheet_set_align, "adw_bottom_sheet_set_align", libs);
  gidLink(cast(void**)&adw_bottom_sheet_set_bottom_bar, "adw_bottom_sheet_set_bottom_bar", libs);
  gidLink(cast(void**)&adw_bottom_sheet_set_can_close, "adw_bottom_sheet_set_can_close", libs);
  gidLink(cast(void**)&adw_bottom_sheet_set_can_open, "adw_bottom_sheet_set_can_open", libs);
  gidLink(cast(void**)&adw_bottom_sheet_set_content, "adw_bottom_sheet_set_content", libs);
  gidLink(cast(void**)&adw_bottom_sheet_set_full_width, "adw_bottom_sheet_set_full_width", libs);
  gidLink(cast(void**)&adw_bottom_sheet_set_modal, "adw_bottom_sheet_set_modal", libs);
  gidLink(cast(void**)&adw_bottom_sheet_set_open, "adw_bottom_sheet_set_open", libs);
  gidLink(cast(void**)&adw_bottom_sheet_set_reveal_bottom_bar, "adw_bottom_sheet_set_reveal_bottom_bar", libs);
  gidLink(cast(void**)&adw_bottom_sheet_set_sheet, "adw_bottom_sheet_set_sheet", libs);
  gidLink(cast(void**)&adw_bottom_sheet_set_show_drag_handle, "adw_bottom_sheet_set_show_drag_handle", libs);

  // Breakpoint
  gidLink(cast(void**)&adw_breakpoint_get_type, "adw_breakpoint_get_type", libs);
  gidLink(cast(void**)&adw_breakpoint_new, "adw_breakpoint_new", libs);
  gidLink(cast(void**)&adw_breakpoint_add_setter, "adw_breakpoint_add_setter", libs);
  gidLink(cast(void**)&adw_breakpoint_add_setters, "adw_breakpoint_add_setters", libs);
  gidLink(cast(void**)&adw_breakpoint_add_setters_valist, "adw_breakpoint_add_setters_valist", libs);
  gidLink(cast(void**)&adw_breakpoint_add_settersv, "adw_breakpoint_add_settersv", libs);
  gidLink(cast(void**)&adw_breakpoint_get_condition, "adw_breakpoint_get_condition", libs);
  gidLink(cast(void**)&adw_breakpoint_set_condition, "adw_breakpoint_set_condition", libs);

  // BreakpointBin
  gidLink(cast(void**)&adw_breakpoint_bin_get_type, "adw_breakpoint_bin_get_type", libs);
  gidLink(cast(void**)&adw_breakpoint_bin_new, "adw_breakpoint_bin_new", libs);
  gidLink(cast(void**)&adw_breakpoint_bin_add_breakpoint, "adw_breakpoint_bin_add_breakpoint", libs);
  gidLink(cast(void**)&adw_breakpoint_bin_get_child, "adw_breakpoint_bin_get_child", libs);
  gidLink(cast(void**)&adw_breakpoint_bin_get_current_breakpoint, "adw_breakpoint_bin_get_current_breakpoint", libs);
  gidLink(cast(void**)&adw_breakpoint_bin_remove_breakpoint, "adw_breakpoint_bin_remove_breakpoint", libs);
  gidLink(cast(void**)&adw_breakpoint_bin_set_child, "adw_breakpoint_bin_set_child", libs);

  // BreakpointCondition
  gidLink(cast(void**)&adw_breakpoint_condition_get_type, "adw_breakpoint_condition_get_type", libs);
  gidLink(cast(void**)&adw_breakpoint_condition_new_and, "adw_breakpoint_condition_new_and", libs);
  gidLink(cast(void**)&adw_breakpoint_condition_new_length, "adw_breakpoint_condition_new_length", libs);
  gidLink(cast(void**)&adw_breakpoint_condition_new_or, "adw_breakpoint_condition_new_or", libs);
  gidLink(cast(void**)&adw_breakpoint_condition_new_ratio, "adw_breakpoint_condition_new_ratio", libs);
  gidLink(cast(void**)&adw_breakpoint_condition_copy, "adw_breakpoint_condition_copy", libs);
  gidLink(cast(void**)&adw_breakpoint_condition_free, "adw_breakpoint_condition_free", libs);
  gidLink(cast(void**)&adw_breakpoint_condition_to_string, "adw_breakpoint_condition_to_string", libs);
  gidLink(cast(void**)&adw_breakpoint_condition_parse, "adw_breakpoint_condition_parse", libs);

  // ButtonContent
  gidLink(cast(void**)&adw_button_content_get_type, "adw_button_content_get_type", libs);
  gidLink(cast(void**)&adw_button_content_new, "adw_button_content_new", libs);
  gidLink(cast(void**)&adw_button_content_get_can_shrink, "adw_button_content_get_can_shrink", libs);
  gidLink(cast(void**)&adw_button_content_get_icon_name, "adw_button_content_get_icon_name", libs);
  gidLink(cast(void**)&adw_button_content_get_label, "adw_button_content_get_label", libs);
  gidLink(cast(void**)&adw_button_content_get_use_underline, "adw_button_content_get_use_underline", libs);
  gidLink(cast(void**)&adw_button_content_set_can_shrink, "adw_button_content_set_can_shrink", libs);
  gidLink(cast(void**)&adw_button_content_set_icon_name, "adw_button_content_set_icon_name", libs);
  gidLink(cast(void**)&adw_button_content_set_label, "adw_button_content_set_label", libs);
  gidLink(cast(void**)&adw_button_content_set_use_underline, "adw_button_content_set_use_underline", libs);

  // ButtonRow
  gidLink(cast(void**)&adw_button_row_get_type, "adw_button_row_get_type", libs);
  gidLink(cast(void**)&adw_button_row_new, "adw_button_row_new", libs);
  gidLink(cast(void**)&adw_button_row_get_end_icon_name, "adw_button_row_get_end_icon_name", libs);
  gidLink(cast(void**)&adw_button_row_get_start_icon_name, "adw_button_row_get_start_icon_name", libs);
  gidLink(cast(void**)&adw_button_row_set_end_icon_name, "adw_button_row_set_end_icon_name", libs);
  gidLink(cast(void**)&adw_button_row_set_start_icon_name, "adw_button_row_set_start_icon_name", libs);

  // CallbackAnimationTarget
  gidLink(cast(void**)&adw_callback_animation_target_get_type, "adw_callback_animation_target_get_type", libs);
  gidLink(cast(void**)&adw_callback_animation_target_new, "adw_callback_animation_target_new", libs);

  // Carousel
  gidLink(cast(void**)&adw_carousel_get_type, "adw_carousel_get_type", libs);
  gidLink(cast(void**)&adw_carousel_new, "adw_carousel_new", libs);
  gidLink(cast(void**)&adw_carousel_append, "adw_carousel_append", libs);
  gidLink(cast(void**)&adw_carousel_get_allow_long_swipes, "adw_carousel_get_allow_long_swipes", libs);
  gidLink(cast(void**)&adw_carousel_get_allow_mouse_drag, "adw_carousel_get_allow_mouse_drag", libs);
  gidLink(cast(void**)&adw_carousel_get_allow_scroll_wheel, "adw_carousel_get_allow_scroll_wheel", libs);
  gidLink(cast(void**)&adw_carousel_get_interactive, "adw_carousel_get_interactive", libs);
  gidLink(cast(void**)&adw_carousel_get_n_pages, "adw_carousel_get_n_pages", libs);
  gidLink(cast(void**)&adw_carousel_get_nth_page, "adw_carousel_get_nth_page", libs);
  gidLink(cast(void**)&adw_carousel_get_position, "adw_carousel_get_position", libs);
  gidLink(cast(void**)&adw_carousel_get_reveal_duration, "adw_carousel_get_reveal_duration", libs);
  gidLink(cast(void**)&adw_carousel_get_scroll_params, "adw_carousel_get_scroll_params", libs);
  gidLink(cast(void**)&adw_carousel_get_spacing, "adw_carousel_get_spacing", libs);
  gidLink(cast(void**)&adw_carousel_insert, "adw_carousel_insert", libs);
  gidLink(cast(void**)&adw_carousel_prepend, "adw_carousel_prepend", libs);
  gidLink(cast(void**)&adw_carousel_remove, "adw_carousel_remove", libs);
  gidLink(cast(void**)&adw_carousel_reorder, "adw_carousel_reorder", libs);
  gidLink(cast(void**)&adw_carousel_scroll_to, "adw_carousel_scroll_to", libs);
  gidLink(cast(void**)&adw_carousel_set_allow_long_swipes, "adw_carousel_set_allow_long_swipes", libs);
  gidLink(cast(void**)&adw_carousel_set_allow_mouse_drag, "adw_carousel_set_allow_mouse_drag", libs);
  gidLink(cast(void**)&adw_carousel_set_allow_scroll_wheel, "adw_carousel_set_allow_scroll_wheel", libs);
  gidLink(cast(void**)&adw_carousel_set_interactive, "adw_carousel_set_interactive", libs);
  gidLink(cast(void**)&adw_carousel_set_reveal_duration, "adw_carousel_set_reveal_duration", libs);
  gidLink(cast(void**)&adw_carousel_set_scroll_params, "adw_carousel_set_scroll_params", libs);
  gidLink(cast(void**)&adw_carousel_set_spacing, "adw_carousel_set_spacing", libs);

  // CarouselIndicatorDots
  gidLink(cast(void**)&adw_carousel_indicator_dots_get_type, "adw_carousel_indicator_dots_get_type", libs);
  gidLink(cast(void**)&adw_carousel_indicator_dots_new, "adw_carousel_indicator_dots_new", libs);
  gidLink(cast(void**)&adw_carousel_indicator_dots_get_carousel, "adw_carousel_indicator_dots_get_carousel", libs);
  gidLink(cast(void**)&adw_carousel_indicator_dots_set_carousel, "adw_carousel_indicator_dots_set_carousel", libs);

  // CarouselIndicatorLines
  gidLink(cast(void**)&adw_carousel_indicator_lines_get_type, "adw_carousel_indicator_lines_get_type", libs);
  gidLink(cast(void**)&adw_carousel_indicator_lines_new, "adw_carousel_indicator_lines_new", libs);
  gidLink(cast(void**)&adw_carousel_indicator_lines_get_carousel, "adw_carousel_indicator_lines_get_carousel", libs);
  gidLink(cast(void**)&adw_carousel_indicator_lines_set_carousel, "adw_carousel_indicator_lines_set_carousel", libs);

  // Clamp
  gidLink(cast(void**)&adw_clamp_get_type, "adw_clamp_get_type", libs);
  gidLink(cast(void**)&adw_clamp_new, "adw_clamp_new", libs);
  gidLink(cast(void**)&adw_clamp_get_child, "adw_clamp_get_child", libs);
  gidLink(cast(void**)&adw_clamp_get_maximum_size, "adw_clamp_get_maximum_size", libs);
  gidLink(cast(void**)&adw_clamp_get_tightening_threshold, "adw_clamp_get_tightening_threshold", libs);
  gidLink(cast(void**)&adw_clamp_get_unit, "adw_clamp_get_unit", libs);
  gidLink(cast(void**)&adw_clamp_set_child, "adw_clamp_set_child", libs);
  gidLink(cast(void**)&adw_clamp_set_maximum_size, "adw_clamp_set_maximum_size", libs);
  gidLink(cast(void**)&adw_clamp_set_tightening_threshold, "adw_clamp_set_tightening_threshold", libs);
  gidLink(cast(void**)&adw_clamp_set_unit, "adw_clamp_set_unit", libs);

  // ClampLayout
  gidLink(cast(void**)&adw_clamp_layout_get_type, "adw_clamp_layout_get_type", libs);
  gidLink(cast(void**)&adw_clamp_layout_new, "adw_clamp_layout_new", libs);
  gidLink(cast(void**)&adw_clamp_layout_get_maximum_size, "adw_clamp_layout_get_maximum_size", libs);
  gidLink(cast(void**)&adw_clamp_layout_get_tightening_threshold, "adw_clamp_layout_get_tightening_threshold", libs);
  gidLink(cast(void**)&adw_clamp_layout_get_unit, "adw_clamp_layout_get_unit", libs);
  gidLink(cast(void**)&adw_clamp_layout_set_maximum_size, "adw_clamp_layout_set_maximum_size", libs);
  gidLink(cast(void**)&adw_clamp_layout_set_tightening_threshold, "adw_clamp_layout_set_tightening_threshold", libs);
  gidLink(cast(void**)&adw_clamp_layout_set_unit, "adw_clamp_layout_set_unit", libs);

  // ClampScrollable
  gidLink(cast(void**)&adw_clamp_scrollable_get_type, "adw_clamp_scrollable_get_type", libs);
  gidLink(cast(void**)&adw_clamp_scrollable_new, "adw_clamp_scrollable_new", libs);
  gidLink(cast(void**)&adw_clamp_scrollable_get_child, "adw_clamp_scrollable_get_child", libs);
  gidLink(cast(void**)&adw_clamp_scrollable_get_maximum_size, "adw_clamp_scrollable_get_maximum_size", libs);
  gidLink(cast(void**)&adw_clamp_scrollable_get_tightening_threshold, "adw_clamp_scrollable_get_tightening_threshold", libs);
  gidLink(cast(void**)&adw_clamp_scrollable_get_unit, "adw_clamp_scrollable_get_unit", libs);
  gidLink(cast(void**)&adw_clamp_scrollable_set_child, "adw_clamp_scrollable_set_child", libs);
  gidLink(cast(void**)&adw_clamp_scrollable_set_maximum_size, "adw_clamp_scrollable_set_maximum_size", libs);
  gidLink(cast(void**)&adw_clamp_scrollable_set_tightening_threshold, "adw_clamp_scrollable_set_tightening_threshold", libs);
  gidLink(cast(void**)&adw_clamp_scrollable_set_unit, "adw_clamp_scrollable_set_unit", libs);

  // ComboRow
  gidLink(cast(void**)&adw_combo_row_get_type, "adw_combo_row_get_type", libs);
  gidLink(cast(void**)&adw_combo_row_new, "adw_combo_row_new", libs);
  gidLink(cast(void**)&adw_combo_row_get_enable_search, "adw_combo_row_get_enable_search", libs);
  gidLink(cast(void**)&adw_combo_row_get_expression, "adw_combo_row_get_expression", libs);
  gidLink(cast(void**)&adw_combo_row_get_factory, "adw_combo_row_get_factory", libs);
  gidLink(cast(void**)&adw_combo_row_get_header_factory, "adw_combo_row_get_header_factory", libs);
  gidLink(cast(void**)&adw_combo_row_get_list_factory, "adw_combo_row_get_list_factory", libs);
  gidLink(cast(void**)&adw_combo_row_get_model, "adw_combo_row_get_model", libs);
  gidLink(cast(void**)&adw_combo_row_get_search_match_mode, "adw_combo_row_get_search_match_mode", libs);
  gidLink(cast(void**)&adw_combo_row_get_selected, "adw_combo_row_get_selected", libs);
  gidLink(cast(void**)&adw_combo_row_get_selected_item, "adw_combo_row_get_selected_item", libs);
  gidLink(cast(void**)&adw_combo_row_get_use_subtitle, "adw_combo_row_get_use_subtitle", libs);
  gidLink(cast(void**)&adw_combo_row_set_enable_search, "adw_combo_row_set_enable_search", libs);
  gidLink(cast(void**)&adw_combo_row_set_expression, "adw_combo_row_set_expression", libs);
  gidLink(cast(void**)&adw_combo_row_set_factory, "adw_combo_row_set_factory", libs);
  gidLink(cast(void**)&adw_combo_row_set_header_factory, "adw_combo_row_set_header_factory", libs);
  gidLink(cast(void**)&adw_combo_row_set_list_factory, "adw_combo_row_set_list_factory", libs);
  gidLink(cast(void**)&adw_combo_row_set_model, "adw_combo_row_set_model", libs);
  gidLink(cast(void**)&adw_combo_row_set_search_match_mode, "adw_combo_row_set_search_match_mode", libs);
  gidLink(cast(void**)&adw_combo_row_set_selected, "adw_combo_row_set_selected", libs);
  gidLink(cast(void**)&adw_combo_row_set_use_subtitle, "adw_combo_row_set_use_subtitle", libs);

  // Dialog
  gidLink(cast(void**)&adw_dialog_get_type, "adw_dialog_get_type", libs);
  gidLink(cast(void**)&adw_dialog_new, "adw_dialog_new", libs);
  gidLink(cast(void**)&adw_dialog_add_breakpoint, "adw_dialog_add_breakpoint", libs);
  gidLink(cast(void**)&adw_dialog_close, "adw_dialog_close", libs);
  gidLink(cast(void**)&adw_dialog_force_close, "adw_dialog_force_close", libs);
  gidLink(cast(void**)&adw_dialog_get_can_close, "adw_dialog_get_can_close", libs);
  gidLink(cast(void**)&adw_dialog_get_child, "adw_dialog_get_child", libs);
  gidLink(cast(void**)&adw_dialog_get_content_height, "adw_dialog_get_content_height", libs);
  gidLink(cast(void**)&adw_dialog_get_content_width, "adw_dialog_get_content_width", libs);
  gidLink(cast(void**)&adw_dialog_get_current_breakpoint, "adw_dialog_get_current_breakpoint", libs);
  gidLink(cast(void**)&adw_dialog_get_default_widget, "adw_dialog_get_default_widget", libs);
  gidLink(cast(void**)&adw_dialog_get_focus, "adw_dialog_get_focus", libs);
  gidLink(cast(void**)&adw_dialog_get_follows_content_size, "adw_dialog_get_follows_content_size", libs);
  gidLink(cast(void**)&adw_dialog_get_presentation_mode, "adw_dialog_get_presentation_mode", libs);
  gidLink(cast(void**)&adw_dialog_get_title, "adw_dialog_get_title", libs);
  gidLink(cast(void**)&adw_dialog_present, "adw_dialog_present", libs);
  gidLink(cast(void**)&adw_dialog_set_can_close, "adw_dialog_set_can_close", libs);
  gidLink(cast(void**)&adw_dialog_set_child, "adw_dialog_set_child", libs);
  gidLink(cast(void**)&adw_dialog_set_content_height, "adw_dialog_set_content_height", libs);
  gidLink(cast(void**)&adw_dialog_set_content_width, "adw_dialog_set_content_width", libs);
  gidLink(cast(void**)&adw_dialog_set_default_widget, "adw_dialog_set_default_widget", libs);
  gidLink(cast(void**)&adw_dialog_set_focus, "adw_dialog_set_focus", libs);
  gidLink(cast(void**)&adw_dialog_set_follows_content_size, "adw_dialog_set_follows_content_size", libs);
  gidLink(cast(void**)&adw_dialog_set_presentation_mode, "adw_dialog_set_presentation_mode", libs);
  gidLink(cast(void**)&adw_dialog_set_title, "adw_dialog_set_title", libs);

  // EntryRow
  gidLink(cast(void**)&adw_entry_row_get_type, "adw_entry_row_get_type", libs);
  gidLink(cast(void**)&adw_entry_row_new, "adw_entry_row_new", libs);
  gidLink(cast(void**)&adw_entry_row_add_prefix, "adw_entry_row_add_prefix", libs);
  gidLink(cast(void**)&adw_entry_row_add_suffix, "adw_entry_row_add_suffix", libs);
  gidLink(cast(void**)&adw_entry_row_get_activates_default, "adw_entry_row_get_activates_default", libs);
  gidLink(cast(void**)&adw_entry_row_get_attributes, "adw_entry_row_get_attributes", libs);
  gidLink(cast(void**)&adw_entry_row_get_enable_emoji_completion, "adw_entry_row_get_enable_emoji_completion", libs);
  gidLink(cast(void**)&adw_entry_row_get_input_hints, "adw_entry_row_get_input_hints", libs);
  gidLink(cast(void**)&adw_entry_row_get_input_purpose, "adw_entry_row_get_input_purpose", libs);
  gidLink(cast(void**)&adw_entry_row_get_max_length, "adw_entry_row_get_max_length", libs);
  gidLink(cast(void**)&adw_entry_row_get_show_apply_button, "adw_entry_row_get_show_apply_button", libs);
  gidLink(cast(void**)&adw_entry_row_get_text_length, "adw_entry_row_get_text_length", libs);
  gidLink(cast(void**)&adw_entry_row_grab_focus_without_selecting, "adw_entry_row_grab_focus_without_selecting", libs);
  gidLink(cast(void**)&adw_entry_row_remove, "adw_entry_row_remove", libs);
  gidLink(cast(void**)&adw_entry_row_set_activates_default, "adw_entry_row_set_activates_default", libs);
  gidLink(cast(void**)&adw_entry_row_set_attributes, "adw_entry_row_set_attributes", libs);
  gidLink(cast(void**)&adw_entry_row_set_enable_emoji_completion, "adw_entry_row_set_enable_emoji_completion", libs);
  gidLink(cast(void**)&adw_entry_row_set_input_hints, "adw_entry_row_set_input_hints", libs);
  gidLink(cast(void**)&adw_entry_row_set_input_purpose, "adw_entry_row_set_input_purpose", libs);
  gidLink(cast(void**)&adw_entry_row_set_max_length, "adw_entry_row_set_max_length", libs);
  gidLink(cast(void**)&adw_entry_row_set_show_apply_button, "adw_entry_row_set_show_apply_button", libs);

  // EnumListItem
  gidLink(cast(void**)&adw_enum_list_item_get_type, "adw_enum_list_item_get_type", libs);
  gidLink(cast(void**)&adw_enum_list_item_get_name, "adw_enum_list_item_get_name", libs);
  gidLink(cast(void**)&adw_enum_list_item_get_nick, "adw_enum_list_item_get_nick", libs);
  gidLink(cast(void**)&adw_enum_list_item_get_value, "adw_enum_list_item_get_value", libs);

  // EnumListModel
  gidLink(cast(void**)&adw_enum_list_model_get_type, "adw_enum_list_model_get_type", libs);
  gidLink(cast(void**)&adw_enum_list_model_new, "adw_enum_list_model_new", libs);
  gidLink(cast(void**)&adw_enum_list_model_find_position, "adw_enum_list_model_find_position", libs);
  gidLink(cast(void**)&adw_enum_list_model_get_enum_type, "adw_enum_list_model_get_enum_type", libs);

  // ExpanderRow
  gidLink(cast(void**)&adw_expander_row_get_type, "adw_expander_row_get_type", libs);
  gidLink(cast(void**)&adw_expander_row_new, "adw_expander_row_new", libs);
  gidLink(cast(void**)&adw_expander_row_add_action, "adw_expander_row_add_action", libs);
  gidLink(cast(void**)&adw_expander_row_add_prefix, "adw_expander_row_add_prefix", libs);
  gidLink(cast(void**)&adw_expander_row_add_row, "adw_expander_row_add_row", libs);
  gidLink(cast(void**)&adw_expander_row_add_suffix, "adw_expander_row_add_suffix", libs);
  gidLink(cast(void**)&adw_expander_row_get_enable_expansion, "adw_expander_row_get_enable_expansion", libs);
  gidLink(cast(void**)&adw_expander_row_get_expanded, "adw_expander_row_get_expanded", libs);
  gidLink(cast(void**)&adw_expander_row_get_icon_name, "adw_expander_row_get_icon_name", libs);
  gidLink(cast(void**)&adw_expander_row_get_show_enable_switch, "adw_expander_row_get_show_enable_switch", libs);
  gidLink(cast(void**)&adw_expander_row_get_subtitle, "adw_expander_row_get_subtitle", libs);
  gidLink(cast(void**)&adw_expander_row_get_subtitle_lines, "adw_expander_row_get_subtitle_lines", libs);
  gidLink(cast(void**)&adw_expander_row_get_title_lines, "adw_expander_row_get_title_lines", libs);
  gidLink(cast(void**)&adw_expander_row_remove, "adw_expander_row_remove", libs);
  gidLink(cast(void**)&adw_expander_row_set_enable_expansion, "adw_expander_row_set_enable_expansion", libs);
  gidLink(cast(void**)&adw_expander_row_set_expanded, "adw_expander_row_set_expanded", libs);
  gidLink(cast(void**)&adw_expander_row_set_icon_name, "adw_expander_row_set_icon_name", libs);
  gidLink(cast(void**)&adw_expander_row_set_show_enable_switch, "adw_expander_row_set_show_enable_switch", libs);
  gidLink(cast(void**)&adw_expander_row_set_subtitle, "adw_expander_row_set_subtitle", libs);
  gidLink(cast(void**)&adw_expander_row_set_subtitle_lines, "adw_expander_row_set_subtitle_lines", libs);
  gidLink(cast(void**)&adw_expander_row_set_title_lines, "adw_expander_row_set_title_lines", libs);

  // Flap
  gidLink(cast(void**)&adw_flap_get_type, "adw_flap_get_type", libs);
  gidLink(cast(void**)&adw_flap_new, "adw_flap_new", libs);
  gidLink(cast(void**)&adw_flap_get_content, "adw_flap_get_content", libs);
  gidLink(cast(void**)&adw_flap_get_flap, "adw_flap_get_flap", libs);
  gidLink(cast(void**)&adw_flap_get_flap_position, "adw_flap_get_flap_position", libs);
  gidLink(cast(void**)&adw_flap_get_fold_duration, "adw_flap_get_fold_duration", libs);
  gidLink(cast(void**)&adw_flap_get_fold_policy, "adw_flap_get_fold_policy", libs);
  gidLink(cast(void**)&adw_flap_get_fold_threshold_policy, "adw_flap_get_fold_threshold_policy", libs);
  gidLink(cast(void**)&adw_flap_get_folded, "adw_flap_get_folded", libs);
  gidLink(cast(void**)&adw_flap_get_locked, "adw_flap_get_locked", libs);
  gidLink(cast(void**)&adw_flap_get_modal, "adw_flap_get_modal", libs);
  gidLink(cast(void**)&adw_flap_get_reveal_flap, "adw_flap_get_reveal_flap", libs);
  gidLink(cast(void**)&adw_flap_get_reveal_params, "adw_flap_get_reveal_params", libs);
  gidLink(cast(void**)&adw_flap_get_reveal_progress, "adw_flap_get_reveal_progress", libs);
  gidLink(cast(void**)&adw_flap_get_separator, "adw_flap_get_separator", libs);
  gidLink(cast(void**)&adw_flap_get_swipe_to_close, "adw_flap_get_swipe_to_close", libs);
  gidLink(cast(void**)&adw_flap_get_swipe_to_open, "adw_flap_get_swipe_to_open", libs);
  gidLink(cast(void**)&adw_flap_get_transition_type, "adw_flap_get_transition_type", libs);
  gidLink(cast(void**)&adw_flap_set_content, "adw_flap_set_content", libs);
  gidLink(cast(void**)&adw_flap_set_flap, "adw_flap_set_flap", libs);
  gidLink(cast(void**)&adw_flap_set_flap_position, "adw_flap_set_flap_position", libs);
  gidLink(cast(void**)&adw_flap_set_fold_duration, "adw_flap_set_fold_duration", libs);
  gidLink(cast(void**)&adw_flap_set_fold_policy, "adw_flap_set_fold_policy", libs);
  gidLink(cast(void**)&adw_flap_set_fold_threshold_policy, "adw_flap_set_fold_threshold_policy", libs);
  gidLink(cast(void**)&adw_flap_set_locked, "adw_flap_set_locked", libs);
  gidLink(cast(void**)&adw_flap_set_modal, "adw_flap_set_modal", libs);
  gidLink(cast(void**)&adw_flap_set_reveal_flap, "adw_flap_set_reveal_flap", libs);
  gidLink(cast(void**)&adw_flap_set_reveal_params, "adw_flap_set_reveal_params", libs);
  gidLink(cast(void**)&adw_flap_set_separator, "adw_flap_set_separator", libs);
  gidLink(cast(void**)&adw_flap_set_swipe_to_close, "adw_flap_set_swipe_to_close", libs);
  gidLink(cast(void**)&adw_flap_set_swipe_to_open, "adw_flap_set_swipe_to_open", libs);
  gidLink(cast(void**)&adw_flap_set_transition_type, "adw_flap_set_transition_type", libs);

  // HeaderBar
  gidLink(cast(void**)&adw_header_bar_get_type, "adw_header_bar_get_type", libs);
  gidLink(cast(void**)&adw_header_bar_new, "adw_header_bar_new", libs);
  gidLink(cast(void**)&adw_header_bar_get_centering_policy, "adw_header_bar_get_centering_policy", libs);
  gidLink(cast(void**)&adw_header_bar_get_decoration_layout, "adw_header_bar_get_decoration_layout", libs);
  gidLink(cast(void**)&adw_header_bar_get_show_back_button, "adw_header_bar_get_show_back_button", libs);
  gidLink(cast(void**)&adw_header_bar_get_show_end_title_buttons, "adw_header_bar_get_show_end_title_buttons", libs);
  gidLink(cast(void**)&adw_header_bar_get_show_start_title_buttons, "adw_header_bar_get_show_start_title_buttons", libs);
  gidLink(cast(void**)&adw_header_bar_get_show_title, "adw_header_bar_get_show_title", libs);
  gidLink(cast(void**)&adw_header_bar_get_title_widget, "adw_header_bar_get_title_widget", libs);
  gidLink(cast(void**)&adw_header_bar_pack_end, "adw_header_bar_pack_end", libs);
  gidLink(cast(void**)&adw_header_bar_pack_start, "adw_header_bar_pack_start", libs);
  gidLink(cast(void**)&adw_header_bar_remove, "adw_header_bar_remove", libs);
  gidLink(cast(void**)&adw_header_bar_set_centering_policy, "adw_header_bar_set_centering_policy", libs);
  gidLink(cast(void**)&adw_header_bar_set_decoration_layout, "adw_header_bar_set_decoration_layout", libs);
  gidLink(cast(void**)&adw_header_bar_set_show_back_button, "adw_header_bar_set_show_back_button", libs);
  gidLink(cast(void**)&adw_header_bar_set_show_end_title_buttons, "adw_header_bar_set_show_end_title_buttons", libs);
  gidLink(cast(void**)&adw_header_bar_set_show_start_title_buttons, "adw_header_bar_set_show_start_title_buttons", libs);
  gidLink(cast(void**)&adw_header_bar_set_show_title, "adw_header_bar_set_show_title", libs);
  gidLink(cast(void**)&adw_header_bar_set_title_widget, "adw_header_bar_set_title_widget", libs);

  // InlineViewSwitcher
  gidLink(cast(void**)&adw_inline_view_switcher_get_type, "adw_inline_view_switcher_get_type", libs);
  gidLink(cast(void**)&adw_inline_view_switcher_new, "adw_inline_view_switcher_new", libs);
  gidLink(cast(void**)&adw_inline_view_switcher_get_can_shrink, "adw_inline_view_switcher_get_can_shrink", libs);
  gidLink(cast(void**)&adw_inline_view_switcher_get_display_mode, "adw_inline_view_switcher_get_display_mode", libs);
  gidLink(cast(void**)&adw_inline_view_switcher_get_homogeneous, "adw_inline_view_switcher_get_homogeneous", libs);
  gidLink(cast(void**)&adw_inline_view_switcher_get_stack, "adw_inline_view_switcher_get_stack", libs);
  gidLink(cast(void**)&adw_inline_view_switcher_set_can_shrink, "adw_inline_view_switcher_set_can_shrink", libs);
  gidLink(cast(void**)&adw_inline_view_switcher_set_display_mode, "adw_inline_view_switcher_set_display_mode", libs);
  gidLink(cast(void**)&adw_inline_view_switcher_set_homogeneous, "adw_inline_view_switcher_set_homogeneous", libs);
  gidLink(cast(void**)&adw_inline_view_switcher_set_stack, "adw_inline_view_switcher_set_stack", libs);

  // Layout
  gidLink(cast(void**)&adw_layout_get_type, "adw_layout_get_type", libs);
  gidLink(cast(void**)&adw_layout_new, "adw_layout_new", libs);
  gidLink(cast(void**)&adw_layout_get_content, "adw_layout_get_content", libs);
  gidLink(cast(void**)&adw_layout_get_name, "adw_layout_get_name", libs);
  gidLink(cast(void**)&adw_layout_set_name, "adw_layout_set_name", libs);

  // LayoutSlot
  gidLink(cast(void**)&adw_layout_slot_get_type, "adw_layout_slot_get_type", libs);
  gidLink(cast(void**)&adw_layout_slot_new, "adw_layout_slot_new", libs);
  gidLink(cast(void**)&adw_layout_slot_get_slot_id, "adw_layout_slot_get_slot_id", libs);

  // Leaflet
  gidLink(cast(void**)&adw_leaflet_get_type, "adw_leaflet_get_type", libs);
  gidLink(cast(void**)&adw_leaflet_new, "adw_leaflet_new", libs);
  gidLink(cast(void**)&adw_leaflet_append, "adw_leaflet_append", libs);
  gidLink(cast(void**)&adw_leaflet_get_adjacent_child, "adw_leaflet_get_adjacent_child", libs);
  gidLink(cast(void**)&adw_leaflet_get_can_navigate_back, "adw_leaflet_get_can_navigate_back", libs);
  gidLink(cast(void**)&adw_leaflet_get_can_navigate_forward, "adw_leaflet_get_can_navigate_forward", libs);
  gidLink(cast(void**)&adw_leaflet_get_can_unfold, "adw_leaflet_get_can_unfold", libs);
  gidLink(cast(void**)&adw_leaflet_get_child_by_name, "adw_leaflet_get_child_by_name", libs);
  gidLink(cast(void**)&adw_leaflet_get_child_transition_params, "adw_leaflet_get_child_transition_params", libs);
  gidLink(cast(void**)&adw_leaflet_get_child_transition_running, "adw_leaflet_get_child_transition_running", libs);
  gidLink(cast(void**)&adw_leaflet_get_fold_threshold_policy, "adw_leaflet_get_fold_threshold_policy", libs);
  gidLink(cast(void**)&adw_leaflet_get_folded, "adw_leaflet_get_folded", libs);
  gidLink(cast(void**)&adw_leaflet_get_homogeneous, "adw_leaflet_get_homogeneous", libs);
  gidLink(cast(void**)&adw_leaflet_get_mode_transition_duration, "adw_leaflet_get_mode_transition_duration", libs);
  gidLink(cast(void**)&adw_leaflet_get_page, "adw_leaflet_get_page", libs);
  gidLink(cast(void**)&adw_leaflet_get_pages, "adw_leaflet_get_pages", libs);
  gidLink(cast(void**)&adw_leaflet_get_transition_type, "adw_leaflet_get_transition_type", libs);
  gidLink(cast(void**)&adw_leaflet_get_visible_child, "adw_leaflet_get_visible_child", libs);
  gidLink(cast(void**)&adw_leaflet_get_visible_child_name, "adw_leaflet_get_visible_child_name", libs);
  gidLink(cast(void**)&adw_leaflet_insert_child_after, "adw_leaflet_insert_child_after", libs);
  gidLink(cast(void**)&adw_leaflet_navigate, "adw_leaflet_navigate", libs);
  gidLink(cast(void**)&adw_leaflet_prepend, "adw_leaflet_prepend", libs);
  gidLink(cast(void**)&adw_leaflet_remove, "adw_leaflet_remove", libs);
  gidLink(cast(void**)&adw_leaflet_reorder_child_after, "adw_leaflet_reorder_child_after", libs);
  gidLink(cast(void**)&adw_leaflet_set_can_navigate_back, "adw_leaflet_set_can_navigate_back", libs);
  gidLink(cast(void**)&adw_leaflet_set_can_navigate_forward, "adw_leaflet_set_can_navigate_forward", libs);
  gidLink(cast(void**)&adw_leaflet_set_can_unfold, "adw_leaflet_set_can_unfold", libs);
  gidLink(cast(void**)&adw_leaflet_set_child_transition_params, "adw_leaflet_set_child_transition_params", libs);
  gidLink(cast(void**)&adw_leaflet_set_fold_threshold_policy, "adw_leaflet_set_fold_threshold_policy", libs);
  gidLink(cast(void**)&adw_leaflet_set_homogeneous, "adw_leaflet_set_homogeneous", libs);
  gidLink(cast(void**)&adw_leaflet_set_mode_transition_duration, "adw_leaflet_set_mode_transition_duration", libs);
  gidLink(cast(void**)&adw_leaflet_set_transition_type, "adw_leaflet_set_transition_type", libs);
  gidLink(cast(void**)&adw_leaflet_set_visible_child, "adw_leaflet_set_visible_child", libs);
  gidLink(cast(void**)&adw_leaflet_set_visible_child_name, "adw_leaflet_set_visible_child_name", libs);

  // LeafletPage
  gidLink(cast(void**)&adw_leaflet_page_get_type, "adw_leaflet_page_get_type", libs);
  gidLink(cast(void**)&adw_leaflet_page_get_child, "adw_leaflet_page_get_child", libs);
  gidLink(cast(void**)&adw_leaflet_page_get_name, "adw_leaflet_page_get_name", libs);
  gidLink(cast(void**)&adw_leaflet_page_get_navigatable, "adw_leaflet_page_get_navigatable", libs);
  gidLink(cast(void**)&adw_leaflet_page_set_name, "adw_leaflet_page_set_name", libs);
  gidLink(cast(void**)&adw_leaflet_page_set_navigatable, "adw_leaflet_page_set_navigatable", libs);

  // MessageDialog
  gidLink(cast(void**)&adw_message_dialog_get_type, "adw_message_dialog_get_type", libs);
  gidLink(cast(void**)&adw_message_dialog_new, "adw_message_dialog_new", libs);
  gidLink(cast(void**)&adw_message_dialog_add_response, "adw_message_dialog_add_response", libs);
  gidLink(cast(void**)&adw_message_dialog_add_responses, "adw_message_dialog_add_responses", libs);
  gidLink(cast(void**)&adw_message_dialog_choose, "adw_message_dialog_choose", libs);
  gidLink(cast(void**)&adw_message_dialog_choose_finish, "adw_message_dialog_choose_finish", libs);
  gidLink(cast(void**)&adw_message_dialog_format_body, "adw_message_dialog_format_body", libs);
  gidLink(cast(void**)&adw_message_dialog_format_body_markup, "adw_message_dialog_format_body_markup", libs);
  gidLink(cast(void**)&adw_message_dialog_format_heading, "adw_message_dialog_format_heading", libs);
  gidLink(cast(void**)&adw_message_dialog_format_heading_markup, "adw_message_dialog_format_heading_markup", libs);
  gidLink(cast(void**)&adw_message_dialog_get_body, "adw_message_dialog_get_body", libs);
  gidLink(cast(void**)&adw_message_dialog_get_body_use_markup, "adw_message_dialog_get_body_use_markup", libs);
  gidLink(cast(void**)&adw_message_dialog_get_close_response, "adw_message_dialog_get_close_response", libs);
  gidLink(cast(void**)&adw_message_dialog_get_default_response, "adw_message_dialog_get_default_response", libs);
  gidLink(cast(void**)&adw_message_dialog_get_extra_child, "adw_message_dialog_get_extra_child", libs);
  gidLink(cast(void**)&adw_message_dialog_get_heading, "adw_message_dialog_get_heading", libs);
  gidLink(cast(void**)&adw_message_dialog_get_heading_use_markup, "adw_message_dialog_get_heading_use_markup", libs);
  gidLink(cast(void**)&adw_message_dialog_get_response_appearance, "adw_message_dialog_get_response_appearance", libs);
  gidLink(cast(void**)&adw_message_dialog_get_response_enabled, "adw_message_dialog_get_response_enabled", libs);
  gidLink(cast(void**)&adw_message_dialog_get_response_label, "adw_message_dialog_get_response_label", libs);
  gidLink(cast(void**)&adw_message_dialog_has_response, "adw_message_dialog_has_response", libs);
  gidLink(cast(void**)&adw_message_dialog_remove_response, "adw_message_dialog_remove_response", libs);
  gidLink(cast(void**)&adw_message_dialog_response, "adw_message_dialog_response", libs);
  gidLink(cast(void**)&adw_message_dialog_set_body, "adw_message_dialog_set_body", libs);
  gidLink(cast(void**)&adw_message_dialog_set_body_use_markup, "adw_message_dialog_set_body_use_markup", libs);
  gidLink(cast(void**)&adw_message_dialog_set_close_response, "adw_message_dialog_set_close_response", libs);
  gidLink(cast(void**)&adw_message_dialog_set_default_response, "adw_message_dialog_set_default_response", libs);
  gidLink(cast(void**)&adw_message_dialog_set_extra_child, "adw_message_dialog_set_extra_child", libs);
  gidLink(cast(void**)&adw_message_dialog_set_heading, "adw_message_dialog_set_heading", libs);
  gidLink(cast(void**)&adw_message_dialog_set_heading_use_markup, "adw_message_dialog_set_heading_use_markup", libs);
  gidLink(cast(void**)&adw_message_dialog_set_response_appearance, "adw_message_dialog_set_response_appearance", libs);
  gidLink(cast(void**)&adw_message_dialog_set_response_enabled, "adw_message_dialog_set_response_enabled", libs);
  gidLink(cast(void**)&adw_message_dialog_set_response_label, "adw_message_dialog_set_response_label", libs);

  // MultiLayoutView
  gidLink(cast(void**)&adw_multi_layout_view_get_type, "adw_multi_layout_view_get_type", libs);
  gidLink(cast(void**)&adw_multi_layout_view_new, "adw_multi_layout_view_new", libs);
  gidLink(cast(void**)&adw_multi_layout_view_add_layout, "adw_multi_layout_view_add_layout", libs);
  gidLink(cast(void**)&adw_multi_layout_view_get_child, "adw_multi_layout_view_get_child", libs);
  gidLink(cast(void**)&adw_multi_layout_view_get_layout, "adw_multi_layout_view_get_layout", libs);
  gidLink(cast(void**)&adw_multi_layout_view_get_layout_by_name, "adw_multi_layout_view_get_layout_by_name", libs);
  gidLink(cast(void**)&adw_multi_layout_view_get_layout_name, "adw_multi_layout_view_get_layout_name", libs);
  gidLink(cast(void**)&adw_multi_layout_view_remove_layout, "adw_multi_layout_view_remove_layout", libs);
  gidLink(cast(void**)&adw_multi_layout_view_set_child, "adw_multi_layout_view_set_child", libs);
  gidLink(cast(void**)&adw_multi_layout_view_set_layout, "adw_multi_layout_view_set_layout", libs);
  gidLink(cast(void**)&adw_multi_layout_view_set_layout_name, "adw_multi_layout_view_set_layout_name", libs);

  // NavigationPage
  gidLink(cast(void**)&adw_navigation_page_get_type, "adw_navigation_page_get_type", libs);
  gidLink(cast(void**)&adw_navigation_page_new, "adw_navigation_page_new", libs);
  gidLink(cast(void**)&adw_navigation_page_new_with_tag, "adw_navigation_page_new_with_tag", libs);
  gidLink(cast(void**)&adw_navigation_page_get_can_pop, "adw_navigation_page_get_can_pop", libs);
  gidLink(cast(void**)&adw_navigation_page_get_child, "adw_navigation_page_get_child", libs);
  gidLink(cast(void**)&adw_navigation_page_get_tag, "adw_navigation_page_get_tag", libs);
  gidLink(cast(void**)&adw_navigation_page_get_title, "adw_navigation_page_get_title", libs);
  gidLink(cast(void**)&adw_navigation_page_set_can_pop, "adw_navigation_page_set_can_pop", libs);
  gidLink(cast(void**)&adw_navigation_page_set_child, "adw_navigation_page_set_child", libs);
  gidLink(cast(void**)&adw_navigation_page_set_tag, "adw_navigation_page_set_tag", libs);
  gidLink(cast(void**)&adw_navigation_page_set_title, "adw_navigation_page_set_title", libs);

  // NavigationSplitView
  gidLink(cast(void**)&adw_navigation_split_view_get_type, "adw_navigation_split_view_get_type", libs);
  gidLink(cast(void**)&adw_navigation_split_view_new, "adw_navigation_split_view_new", libs);
  gidLink(cast(void**)&adw_navigation_split_view_get_collapsed, "adw_navigation_split_view_get_collapsed", libs);
  gidLink(cast(void**)&adw_navigation_split_view_get_content, "adw_navigation_split_view_get_content", libs);
  gidLink(cast(void**)&adw_navigation_split_view_get_max_sidebar_width, "adw_navigation_split_view_get_max_sidebar_width", libs);
  gidLink(cast(void**)&adw_navigation_split_view_get_min_sidebar_width, "adw_navigation_split_view_get_min_sidebar_width", libs);
  gidLink(cast(void**)&adw_navigation_split_view_get_show_content, "adw_navigation_split_view_get_show_content", libs);
  gidLink(cast(void**)&adw_navigation_split_view_get_sidebar, "adw_navigation_split_view_get_sidebar", libs);
  gidLink(cast(void**)&adw_navigation_split_view_get_sidebar_position, "adw_navigation_split_view_get_sidebar_position", libs);
  gidLink(cast(void**)&adw_navigation_split_view_get_sidebar_width_fraction, "adw_navigation_split_view_get_sidebar_width_fraction", libs);
  gidLink(cast(void**)&adw_navigation_split_view_get_sidebar_width_unit, "adw_navigation_split_view_get_sidebar_width_unit", libs);
  gidLink(cast(void**)&adw_navigation_split_view_set_collapsed, "adw_navigation_split_view_set_collapsed", libs);
  gidLink(cast(void**)&adw_navigation_split_view_set_content, "adw_navigation_split_view_set_content", libs);
  gidLink(cast(void**)&adw_navigation_split_view_set_max_sidebar_width, "adw_navigation_split_view_set_max_sidebar_width", libs);
  gidLink(cast(void**)&adw_navigation_split_view_set_min_sidebar_width, "adw_navigation_split_view_set_min_sidebar_width", libs);
  gidLink(cast(void**)&adw_navigation_split_view_set_show_content, "adw_navigation_split_view_set_show_content", libs);
  gidLink(cast(void**)&adw_navigation_split_view_set_sidebar, "adw_navigation_split_view_set_sidebar", libs);
  gidLink(cast(void**)&adw_navigation_split_view_set_sidebar_position, "adw_navigation_split_view_set_sidebar_position", libs);
  gidLink(cast(void**)&adw_navigation_split_view_set_sidebar_width_fraction, "adw_navigation_split_view_set_sidebar_width_fraction", libs);
  gidLink(cast(void**)&adw_navigation_split_view_set_sidebar_width_unit, "adw_navigation_split_view_set_sidebar_width_unit", libs);

  // NavigationView
  gidLink(cast(void**)&adw_navigation_view_get_type, "adw_navigation_view_get_type", libs);
  gidLink(cast(void**)&adw_navigation_view_new, "adw_navigation_view_new", libs);
  gidLink(cast(void**)&adw_navigation_view_add, "adw_navigation_view_add", libs);
  gidLink(cast(void**)&adw_navigation_view_find_page, "adw_navigation_view_find_page", libs);
  gidLink(cast(void**)&adw_navigation_view_get_animate_transitions, "adw_navigation_view_get_animate_transitions", libs);
  gidLink(cast(void**)&adw_navigation_view_get_hhomogeneous, "adw_navigation_view_get_hhomogeneous", libs);
  gidLink(cast(void**)&adw_navigation_view_get_navigation_stack, "adw_navigation_view_get_navigation_stack", libs);
  gidLink(cast(void**)&adw_navigation_view_get_pop_on_escape, "adw_navigation_view_get_pop_on_escape", libs);
  gidLink(cast(void**)&adw_navigation_view_get_previous_page, "adw_navigation_view_get_previous_page", libs);
  gidLink(cast(void**)&adw_navigation_view_get_vhomogeneous, "adw_navigation_view_get_vhomogeneous", libs);
  gidLink(cast(void**)&adw_navigation_view_get_visible_page, "adw_navigation_view_get_visible_page", libs);
  gidLink(cast(void**)&adw_navigation_view_get_visible_page_tag, "adw_navigation_view_get_visible_page_tag", libs);
  gidLink(cast(void**)&adw_navigation_view_pop, "adw_navigation_view_pop", libs);
  gidLink(cast(void**)&adw_navigation_view_pop_to_page, "adw_navigation_view_pop_to_page", libs);
  gidLink(cast(void**)&adw_navigation_view_pop_to_tag, "adw_navigation_view_pop_to_tag", libs);
  gidLink(cast(void**)&adw_navigation_view_push, "adw_navigation_view_push", libs);
  gidLink(cast(void**)&adw_navigation_view_push_by_tag, "adw_navigation_view_push_by_tag", libs);
  gidLink(cast(void**)&adw_navigation_view_remove, "adw_navigation_view_remove", libs);
  gidLink(cast(void**)&adw_navigation_view_replace, "adw_navigation_view_replace", libs);
  gidLink(cast(void**)&adw_navigation_view_replace_with_tags, "adw_navigation_view_replace_with_tags", libs);
  gidLink(cast(void**)&adw_navigation_view_set_animate_transitions, "adw_navigation_view_set_animate_transitions", libs);
  gidLink(cast(void**)&adw_navigation_view_set_hhomogeneous, "adw_navigation_view_set_hhomogeneous", libs);
  gidLink(cast(void**)&adw_navigation_view_set_pop_on_escape, "adw_navigation_view_set_pop_on_escape", libs);
  gidLink(cast(void**)&adw_navigation_view_set_vhomogeneous, "adw_navigation_view_set_vhomogeneous", libs);

  // NoneAnimationTarget
  gidLink(cast(void**)&adw_none_animation_target_get_type, "adw_none_animation_target_get_type", libs);
  gidLink(cast(void**)&adw_none_animation_target_new, "adw_none_animation_target_new", libs);

  // OverlaySplitView
  gidLink(cast(void**)&adw_overlay_split_view_get_type, "adw_overlay_split_view_get_type", libs);
  gidLink(cast(void**)&adw_overlay_split_view_new, "adw_overlay_split_view_new", libs);
  gidLink(cast(void**)&adw_overlay_split_view_get_collapsed, "adw_overlay_split_view_get_collapsed", libs);
  gidLink(cast(void**)&adw_overlay_split_view_get_content, "adw_overlay_split_view_get_content", libs);
  gidLink(cast(void**)&adw_overlay_split_view_get_enable_hide_gesture, "adw_overlay_split_view_get_enable_hide_gesture", libs);
  gidLink(cast(void**)&adw_overlay_split_view_get_enable_show_gesture, "adw_overlay_split_view_get_enable_show_gesture", libs);
  gidLink(cast(void**)&adw_overlay_split_view_get_max_sidebar_width, "adw_overlay_split_view_get_max_sidebar_width", libs);
  gidLink(cast(void**)&adw_overlay_split_view_get_min_sidebar_width, "adw_overlay_split_view_get_min_sidebar_width", libs);
  gidLink(cast(void**)&adw_overlay_split_view_get_pin_sidebar, "adw_overlay_split_view_get_pin_sidebar", libs);
  gidLink(cast(void**)&adw_overlay_split_view_get_show_sidebar, "adw_overlay_split_view_get_show_sidebar", libs);
  gidLink(cast(void**)&adw_overlay_split_view_get_sidebar, "adw_overlay_split_view_get_sidebar", libs);
  gidLink(cast(void**)&adw_overlay_split_view_get_sidebar_position, "adw_overlay_split_view_get_sidebar_position", libs);
  gidLink(cast(void**)&adw_overlay_split_view_get_sidebar_width_fraction, "adw_overlay_split_view_get_sidebar_width_fraction", libs);
  gidLink(cast(void**)&adw_overlay_split_view_get_sidebar_width_unit, "adw_overlay_split_view_get_sidebar_width_unit", libs);
  gidLink(cast(void**)&adw_overlay_split_view_set_collapsed, "adw_overlay_split_view_set_collapsed", libs);
  gidLink(cast(void**)&adw_overlay_split_view_set_content, "adw_overlay_split_view_set_content", libs);
  gidLink(cast(void**)&adw_overlay_split_view_set_enable_hide_gesture, "adw_overlay_split_view_set_enable_hide_gesture", libs);
  gidLink(cast(void**)&adw_overlay_split_view_set_enable_show_gesture, "adw_overlay_split_view_set_enable_show_gesture", libs);
  gidLink(cast(void**)&adw_overlay_split_view_set_max_sidebar_width, "adw_overlay_split_view_set_max_sidebar_width", libs);
  gidLink(cast(void**)&adw_overlay_split_view_set_min_sidebar_width, "adw_overlay_split_view_set_min_sidebar_width", libs);
  gidLink(cast(void**)&adw_overlay_split_view_set_pin_sidebar, "adw_overlay_split_view_set_pin_sidebar", libs);
  gidLink(cast(void**)&adw_overlay_split_view_set_show_sidebar, "adw_overlay_split_view_set_show_sidebar", libs);
  gidLink(cast(void**)&adw_overlay_split_view_set_sidebar, "adw_overlay_split_view_set_sidebar", libs);
  gidLink(cast(void**)&adw_overlay_split_view_set_sidebar_position, "adw_overlay_split_view_set_sidebar_position", libs);
  gidLink(cast(void**)&adw_overlay_split_view_set_sidebar_width_fraction, "adw_overlay_split_view_set_sidebar_width_fraction", libs);
  gidLink(cast(void**)&adw_overlay_split_view_set_sidebar_width_unit, "adw_overlay_split_view_set_sidebar_width_unit", libs);

  // PasswordEntryRow
  gidLink(cast(void**)&adw_password_entry_row_get_type, "adw_password_entry_row_get_type", libs);
  gidLink(cast(void**)&adw_password_entry_row_new, "adw_password_entry_row_new", libs);

  // PreferencesDialog
  gidLink(cast(void**)&adw_preferences_dialog_get_type, "adw_preferences_dialog_get_type", libs);
  gidLink(cast(void**)&adw_preferences_dialog_new, "adw_preferences_dialog_new", libs);
  gidLink(cast(void**)&adw_preferences_dialog_add, "adw_preferences_dialog_add", libs);
  gidLink(cast(void**)&adw_preferences_dialog_add_toast, "adw_preferences_dialog_add_toast", libs);
  gidLink(cast(void**)&adw_preferences_dialog_get_search_enabled, "adw_preferences_dialog_get_search_enabled", libs);
  gidLink(cast(void**)&adw_preferences_dialog_get_visible_page, "adw_preferences_dialog_get_visible_page", libs);
  gidLink(cast(void**)&adw_preferences_dialog_get_visible_page_name, "adw_preferences_dialog_get_visible_page_name", libs);
  gidLink(cast(void**)&adw_preferences_dialog_pop_subpage, "adw_preferences_dialog_pop_subpage", libs);
  gidLink(cast(void**)&adw_preferences_dialog_push_subpage, "adw_preferences_dialog_push_subpage", libs);
  gidLink(cast(void**)&adw_preferences_dialog_remove, "adw_preferences_dialog_remove", libs);
  gidLink(cast(void**)&adw_preferences_dialog_set_search_enabled, "adw_preferences_dialog_set_search_enabled", libs);
  gidLink(cast(void**)&adw_preferences_dialog_set_visible_page, "adw_preferences_dialog_set_visible_page", libs);
  gidLink(cast(void**)&adw_preferences_dialog_set_visible_page_name, "adw_preferences_dialog_set_visible_page_name", libs);

  // PreferencesGroup
  gidLink(cast(void**)&adw_preferences_group_get_type, "adw_preferences_group_get_type", libs);
  gidLink(cast(void**)&adw_preferences_group_new, "adw_preferences_group_new", libs);
  gidLink(cast(void**)&adw_preferences_group_add, "adw_preferences_group_add", libs);
  gidLink(cast(void**)&adw_preferences_group_bind_model, "adw_preferences_group_bind_model", libs);
  gidLink(cast(void**)&adw_preferences_group_get_description, "adw_preferences_group_get_description", libs);
  gidLink(cast(void**)&adw_preferences_group_get_header_suffix, "adw_preferences_group_get_header_suffix", libs);
  gidLink(cast(void**)&adw_preferences_group_get_row, "adw_preferences_group_get_row", libs);
  gidLink(cast(void**)&adw_preferences_group_get_separate_rows, "adw_preferences_group_get_separate_rows", libs);
  gidLink(cast(void**)&adw_preferences_group_get_title, "adw_preferences_group_get_title", libs);
  gidLink(cast(void**)&adw_preferences_group_remove, "adw_preferences_group_remove", libs);
  gidLink(cast(void**)&adw_preferences_group_set_description, "adw_preferences_group_set_description", libs);
  gidLink(cast(void**)&adw_preferences_group_set_header_suffix, "adw_preferences_group_set_header_suffix", libs);
  gidLink(cast(void**)&adw_preferences_group_set_separate_rows, "adw_preferences_group_set_separate_rows", libs);
  gidLink(cast(void**)&adw_preferences_group_set_title, "adw_preferences_group_set_title", libs);

  // PreferencesPage
  gidLink(cast(void**)&adw_preferences_page_get_type, "adw_preferences_page_get_type", libs);
  gidLink(cast(void**)&adw_preferences_page_new, "adw_preferences_page_new", libs);
  gidLink(cast(void**)&adw_preferences_page_add, "adw_preferences_page_add", libs);
  gidLink(cast(void**)&adw_preferences_page_get_banner, "adw_preferences_page_get_banner", libs);
  gidLink(cast(void**)&adw_preferences_page_get_description, "adw_preferences_page_get_description", libs);
  gidLink(cast(void**)&adw_preferences_page_get_description_centered, "adw_preferences_page_get_description_centered", libs);
  gidLink(cast(void**)&adw_preferences_page_get_group, "adw_preferences_page_get_group", libs);
  gidLink(cast(void**)&adw_preferences_page_get_icon_name, "adw_preferences_page_get_icon_name", libs);
  gidLink(cast(void**)&adw_preferences_page_get_name, "adw_preferences_page_get_name", libs);
  gidLink(cast(void**)&adw_preferences_page_get_title, "adw_preferences_page_get_title", libs);
  gidLink(cast(void**)&adw_preferences_page_get_use_underline, "adw_preferences_page_get_use_underline", libs);
  gidLink(cast(void**)&adw_preferences_page_insert, "adw_preferences_page_insert", libs);
  gidLink(cast(void**)&adw_preferences_page_remove, "adw_preferences_page_remove", libs);
  gidLink(cast(void**)&adw_preferences_page_scroll_to_top, "adw_preferences_page_scroll_to_top", libs);
  gidLink(cast(void**)&adw_preferences_page_set_banner, "adw_preferences_page_set_banner", libs);
  gidLink(cast(void**)&adw_preferences_page_set_description, "adw_preferences_page_set_description", libs);
  gidLink(cast(void**)&adw_preferences_page_set_description_centered, "adw_preferences_page_set_description_centered", libs);
  gidLink(cast(void**)&adw_preferences_page_set_icon_name, "adw_preferences_page_set_icon_name", libs);
  gidLink(cast(void**)&adw_preferences_page_set_name, "adw_preferences_page_set_name", libs);
  gidLink(cast(void**)&adw_preferences_page_set_title, "adw_preferences_page_set_title", libs);
  gidLink(cast(void**)&adw_preferences_page_set_use_underline, "adw_preferences_page_set_use_underline", libs);

  // PreferencesRow
  gidLink(cast(void**)&adw_preferences_row_get_type, "adw_preferences_row_get_type", libs);
  gidLink(cast(void**)&adw_preferences_row_new, "adw_preferences_row_new", libs);
  gidLink(cast(void**)&adw_preferences_row_get_title, "adw_preferences_row_get_title", libs);
  gidLink(cast(void**)&adw_preferences_row_get_title_selectable, "adw_preferences_row_get_title_selectable", libs);
  gidLink(cast(void**)&adw_preferences_row_get_use_markup, "adw_preferences_row_get_use_markup", libs);
  gidLink(cast(void**)&adw_preferences_row_get_use_underline, "adw_preferences_row_get_use_underline", libs);
  gidLink(cast(void**)&adw_preferences_row_set_title, "adw_preferences_row_set_title", libs);
  gidLink(cast(void**)&adw_preferences_row_set_title_selectable, "adw_preferences_row_set_title_selectable", libs);
  gidLink(cast(void**)&adw_preferences_row_set_use_markup, "adw_preferences_row_set_use_markup", libs);
  gidLink(cast(void**)&adw_preferences_row_set_use_underline, "adw_preferences_row_set_use_underline", libs);

  // PreferencesWindow
  gidLink(cast(void**)&adw_preferences_window_get_type, "adw_preferences_window_get_type", libs);
  gidLink(cast(void**)&adw_preferences_window_new, "adw_preferences_window_new", libs);
  gidLink(cast(void**)&adw_preferences_window_add, "adw_preferences_window_add", libs);
  gidLink(cast(void**)&adw_preferences_window_add_toast, "adw_preferences_window_add_toast", libs);
  gidLink(cast(void**)&adw_preferences_window_close_subpage, "adw_preferences_window_close_subpage", libs);
  gidLink(cast(void**)&adw_preferences_window_get_can_navigate_back, "adw_preferences_window_get_can_navigate_back", libs);
  gidLink(cast(void**)&adw_preferences_window_get_search_enabled, "adw_preferences_window_get_search_enabled", libs);
  gidLink(cast(void**)&adw_preferences_window_get_visible_page, "adw_preferences_window_get_visible_page", libs);
  gidLink(cast(void**)&adw_preferences_window_get_visible_page_name, "adw_preferences_window_get_visible_page_name", libs);
  gidLink(cast(void**)&adw_preferences_window_pop_subpage, "adw_preferences_window_pop_subpage", libs);
  gidLink(cast(void**)&adw_preferences_window_present_subpage, "adw_preferences_window_present_subpage", libs);
  gidLink(cast(void**)&adw_preferences_window_push_subpage, "adw_preferences_window_push_subpage", libs);
  gidLink(cast(void**)&adw_preferences_window_remove, "adw_preferences_window_remove", libs);
  gidLink(cast(void**)&adw_preferences_window_set_can_navigate_back, "adw_preferences_window_set_can_navigate_back", libs);
  gidLink(cast(void**)&adw_preferences_window_set_search_enabled, "adw_preferences_window_set_search_enabled", libs);
  gidLink(cast(void**)&adw_preferences_window_set_visible_page, "adw_preferences_window_set_visible_page", libs);
  gidLink(cast(void**)&adw_preferences_window_set_visible_page_name, "adw_preferences_window_set_visible_page_name", libs);

  // PropertyAnimationTarget
  gidLink(cast(void**)&adw_property_animation_target_get_type, "adw_property_animation_target_get_type", libs);
  gidLink(cast(void**)&adw_property_animation_target_new, "adw_property_animation_target_new", libs);
  gidLink(cast(void**)&adw_property_animation_target_new_for_pspec, "adw_property_animation_target_new_for_pspec", libs);
  gidLink(cast(void**)&adw_property_animation_target_get_object, "adw_property_animation_target_get_object", libs);
  gidLink(cast(void**)&adw_property_animation_target_get_pspec, "adw_property_animation_target_get_pspec", libs);

  // ShortcutLabel
  gidLink(cast(void**)&adw_shortcut_label_get_type, "adw_shortcut_label_get_type", libs);
  gidLink(cast(void**)&adw_shortcut_label_new, "adw_shortcut_label_new", libs);
  gidLink(cast(void**)&adw_shortcut_label_get_accelerator, "adw_shortcut_label_get_accelerator", libs);
  gidLink(cast(void**)&adw_shortcut_label_get_disabled_text, "adw_shortcut_label_get_disabled_text", libs);
  gidLink(cast(void**)&adw_shortcut_label_set_accelerator, "adw_shortcut_label_set_accelerator", libs);
  gidLink(cast(void**)&adw_shortcut_label_set_disabled_text, "adw_shortcut_label_set_disabled_text", libs);

  // ShortcutsDialog
  gidLink(cast(void**)&adw_shortcuts_dialog_get_type, "adw_shortcuts_dialog_get_type", libs);
  gidLink(cast(void**)&adw_shortcuts_dialog_new, "adw_shortcuts_dialog_new", libs);
  gidLink(cast(void**)&adw_shortcuts_dialog_add, "adw_shortcuts_dialog_add", libs);

  // ShortcutsItem
  gidLink(cast(void**)&adw_shortcuts_item_get_type, "adw_shortcuts_item_get_type", libs);
  gidLink(cast(void**)&adw_shortcuts_item_new, "adw_shortcuts_item_new", libs);
  gidLink(cast(void**)&adw_shortcuts_item_new_from_action, "adw_shortcuts_item_new_from_action", libs);
  gidLink(cast(void**)&adw_shortcuts_item_get_accelerator, "adw_shortcuts_item_get_accelerator", libs);
  gidLink(cast(void**)&adw_shortcuts_item_get_action_name, "adw_shortcuts_item_get_action_name", libs);
  gidLink(cast(void**)&adw_shortcuts_item_get_direction, "adw_shortcuts_item_get_direction", libs);
  gidLink(cast(void**)&adw_shortcuts_item_get_subtitle, "adw_shortcuts_item_get_subtitle", libs);
  gidLink(cast(void**)&adw_shortcuts_item_get_title, "adw_shortcuts_item_get_title", libs);
  gidLink(cast(void**)&adw_shortcuts_item_set_accelerator, "adw_shortcuts_item_set_accelerator", libs);
  gidLink(cast(void**)&adw_shortcuts_item_set_action_name, "adw_shortcuts_item_set_action_name", libs);
  gidLink(cast(void**)&adw_shortcuts_item_set_direction, "adw_shortcuts_item_set_direction", libs);
  gidLink(cast(void**)&adw_shortcuts_item_set_subtitle, "adw_shortcuts_item_set_subtitle", libs);
  gidLink(cast(void**)&adw_shortcuts_item_set_title, "adw_shortcuts_item_set_title", libs);

  // ShortcutsSection
  gidLink(cast(void**)&adw_shortcuts_section_get_type, "adw_shortcuts_section_get_type", libs);
  gidLink(cast(void**)&adw_shortcuts_section_new, "adw_shortcuts_section_new", libs);
  gidLink(cast(void**)&adw_shortcuts_section_add, "adw_shortcuts_section_add", libs);
  gidLink(cast(void**)&adw_shortcuts_section_get_title, "adw_shortcuts_section_get_title", libs);
  gidLink(cast(void**)&adw_shortcuts_section_set_title, "adw_shortcuts_section_set_title", libs);

  // Sidebar
  gidLink(cast(void**)&adw_sidebar_get_type, "adw_sidebar_get_type", libs);
  gidLink(cast(void**)&adw_sidebar_new, "adw_sidebar_new", libs);
  gidLink(cast(void**)&adw_sidebar_append, "adw_sidebar_append", libs);
  gidLink(cast(void**)&adw_sidebar_get_drop_preload, "adw_sidebar_get_drop_preload", libs);
  gidLink(cast(void**)&adw_sidebar_get_filter, "adw_sidebar_get_filter", libs);
  gidLink(cast(void**)&adw_sidebar_get_item, "adw_sidebar_get_item", libs);
  gidLink(cast(void**)&adw_sidebar_get_items, "adw_sidebar_get_items", libs);
  gidLink(cast(void**)&adw_sidebar_get_menu_model, "adw_sidebar_get_menu_model", libs);
  gidLink(cast(void**)&adw_sidebar_get_mode, "adw_sidebar_get_mode", libs);
  gidLink(cast(void**)&adw_sidebar_get_placeholder, "adw_sidebar_get_placeholder", libs);
  gidLink(cast(void**)&adw_sidebar_get_section, "adw_sidebar_get_section", libs);
  gidLink(cast(void**)&adw_sidebar_get_sections, "adw_sidebar_get_sections", libs);
  gidLink(cast(void**)&adw_sidebar_get_selected, "adw_sidebar_get_selected", libs);
  gidLink(cast(void**)&adw_sidebar_get_selected_item, "adw_sidebar_get_selected_item", libs);
  gidLink(cast(void**)&adw_sidebar_insert, "adw_sidebar_insert", libs);
  gidLink(cast(void**)&adw_sidebar_prepend, "adw_sidebar_prepend", libs);
  gidLink(cast(void**)&adw_sidebar_remove, "adw_sidebar_remove", libs);
  gidLink(cast(void**)&adw_sidebar_remove_all, "adw_sidebar_remove_all", libs);
  gidLink(cast(void**)&adw_sidebar_set_drop_preload, "adw_sidebar_set_drop_preload", libs);
  gidLink(cast(void**)&adw_sidebar_set_filter, "adw_sidebar_set_filter", libs);
  gidLink(cast(void**)&adw_sidebar_set_menu_model, "adw_sidebar_set_menu_model", libs);
  gidLink(cast(void**)&adw_sidebar_set_mode, "adw_sidebar_set_mode", libs);
  gidLink(cast(void**)&adw_sidebar_set_placeholder, "adw_sidebar_set_placeholder", libs);
  gidLink(cast(void**)&adw_sidebar_set_selected, "adw_sidebar_set_selected", libs);
  gidLink(cast(void**)&adw_sidebar_setup_drop_target, "adw_sidebar_setup_drop_target", libs);

  // SidebarItem
  gidLink(cast(void**)&adw_sidebar_item_get_type, "adw_sidebar_item_get_type", libs);
  gidLink(cast(void**)&adw_sidebar_item_new, "adw_sidebar_item_new", libs);
  gidLink(cast(void**)&adw_sidebar_item_get_drag_motion_activate, "adw_sidebar_item_get_drag_motion_activate", libs);
  gidLink(cast(void**)&adw_sidebar_item_get_enabled, "adw_sidebar_item_get_enabled", libs);
  gidLink(cast(void**)&adw_sidebar_item_get_icon_name, "adw_sidebar_item_get_icon_name", libs);
  gidLink(cast(void**)&adw_sidebar_item_get_icon_paintable, "adw_sidebar_item_get_icon_paintable", libs);
  gidLink(cast(void**)&adw_sidebar_item_get_index, "adw_sidebar_item_get_index", libs);
  gidLink(cast(void**)&adw_sidebar_item_get_section, "adw_sidebar_item_get_section", libs);
  gidLink(cast(void**)&adw_sidebar_item_get_section_index, "adw_sidebar_item_get_section_index", libs);
  gidLink(cast(void**)&adw_sidebar_item_get_subtitle, "adw_sidebar_item_get_subtitle", libs);
  gidLink(cast(void**)&adw_sidebar_item_get_suffix, "adw_sidebar_item_get_suffix", libs);
  gidLink(cast(void**)&adw_sidebar_item_get_title, "adw_sidebar_item_get_title", libs);
  gidLink(cast(void**)&adw_sidebar_item_get_tooltip, "adw_sidebar_item_get_tooltip", libs);
  gidLink(cast(void**)&adw_sidebar_item_get_use_underline, "adw_sidebar_item_get_use_underline", libs);
  gidLink(cast(void**)&adw_sidebar_item_get_visible, "adw_sidebar_item_get_visible", libs);
  gidLink(cast(void**)&adw_sidebar_item_set_drag_motion_activate, "adw_sidebar_item_set_drag_motion_activate", libs);
  gidLink(cast(void**)&adw_sidebar_item_set_enabled, "adw_sidebar_item_set_enabled", libs);
  gidLink(cast(void**)&adw_sidebar_item_set_icon_name, "adw_sidebar_item_set_icon_name", libs);
  gidLink(cast(void**)&adw_sidebar_item_set_icon_paintable, "adw_sidebar_item_set_icon_paintable", libs);
  gidLink(cast(void**)&adw_sidebar_item_set_subtitle, "adw_sidebar_item_set_subtitle", libs);
  gidLink(cast(void**)&adw_sidebar_item_set_suffix, "adw_sidebar_item_set_suffix", libs);
  gidLink(cast(void**)&adw_sidebar_item_set_title, "adw_sidebar_item_set_title", libs);
  gidLink(cast(void**)&adw_sidebar_item_set_tooltip, "adw_sidebar_item_set_tooltip", libs);
  gidLink(cast(void**)&adw_sidebar_item_set_use_underline, "adw_sidebar_item_set_use_underline", libs);
  gidLink(cast(void**)&adw_sidebar_item_set_visible, "adw_sidebar_item_set_visible", libs);

  // SidebarSection
  gidLink(cast(void**)&adw_sidebar_section_get_type, "adw_sidebar_section_get_type", libs);
  gidLink(cast(void**)&adw_sidebar_section_new, "adw_sidebar_section_new", libs);
  gidLink(cast(void**)&adw_sidebar_section_append, "adw_sidebar_section_append", libs);
  gidLink(cast(void**)&adw_sidebar_section_bind_model, "adw_sidebar_section_bind_model", libs);
  gidLink(cast(void**)&adw_sidebar_section_get_item, "adw_sidebar_section_get_item", libs);
  gidLink(cast(void**)&adw_sidebar_section_get_items, "adw_sidebar_section_get_items", libs);
  gidLink(cast(void**)&adw_sidebar_section_get_menu_model, "adw_sidebar_section_get_menu_model", libs);
  gidLink(cast(void**)&adw_sidebar_section_get_sidebar, "adw_sidebar_section_get_sidebar", libs);
  gidLink(cast(void**)&adw_sidebar_section_get_title, "adw_sidebar_section_get_title", libs);
  gidLink(cast(void**)&adw_sidebar_section_insert, "adw_sidebar_section_insert", libs);
  gidLink(cast(void**)&adw_sidebar_section_prepend, "adw_sidebar_section_prepend", libs);
  gidLink(cast(void**)&adw_sidebar_section_remove, "adw_sidebar_section_remove", libs);
  gidLink(cast(void**)&adw_sidebar_section_remove_all, "adw_sidebar_section_remove_all", libs);
  gidLink(cast(void**)&adw_sidebar_section_set_menu_model, "adw_sidebar_section_set_menu_model", libs);
  gidLink(cast(void**)&adw_sidebar_section_set_title, "adw_sidebar_section_set_title", libs);

  // SpinRow
  gidLink(cast(void**)&adw_spin_row_get_type, "adw_spin_row_get_type", libs);
  gidLink(cast(void**)&adw_spin_row_new, "adw_spin_row_new", libs);
  gidLink(cast(void**)&adw_spin_row_new_with_range, "adw_spin_row_new_with_range", libs);
  gidLink(cast(void**)&adw_spin_row_configure, "adw_spin_row_configure", libs);
  gidLink(cast(void**)&adw_spin_row_get_adjustment, "adw_spin_row_get_adjustment", libs);
  gidLink(cast(void**)&adw_spin_row_get_climb_rate, "adw_spin_row_get_climb_rate", libs);
  gidLink(cast(void**)&adw_spin_row_get_digits, "adw_spin_row_get_digits", libs);
  gidLink(cast(void**)&adw_spin_row_get_numeric, "adw_spin_row_get_numeric", libs);
  gidLink(cast(void**)&adw_spin_row_get_snap_to_ticks, "adw_spin_row_get_snap_to_ticks", libs);
  gidLink(cast(void**)&adw_spin_row_get_update_policy, "adw_spin_row_get_update_policy", libs);
  gidLink(cast(void**)&adw_spin_row_get_value, "adw_spin_row_get_value", libs);
  gidLink(cast(void**)&adw_spin_row_get_wrap, "adw_spin_row_get_wrap", libs);
  gidLink(cast(void**)&adw_spin_row_set_adjustment, "adw_spin_row_set_adjustment", libs);
  gidLink(cast(void**)&adw_spin_row_set_climb_rate, "adw_spin_row_set_climb_rate", libs);
  gidLink(cast(void**)&adw_spin_row_set_digits, "adw_spin_row_set_digits", libs);
  gidLink(cast(void**)&adw_spin_row_set_numeric, "adw_spin_row_set_numeric", libs);
  gidLink(cast(void**)&adw_spin_row_set_range, "adw_spin_row_set_range", libs);
  gidLink(cast(void**)&adw_spin_row_set_snap_to_ticks, "adw_spin_row_set_snap_to_ticks", libs);
  gidLink(cast(void**)&adw_spin_row_set_update_policy, "adw_spin_row_set_update_policy", libs);
  gidLink(cast(void**)&adw_spin_row_set_value, "adw_spin_row_set_value", libs);
  gidLink(cast(void**)&adw_spin_row_set_wrap, "adw_spin_row_set_wrap", libs);
  gidLink(cast(void**)&adw_spin_row_update, "adw_spin_row_update", libs);

  // Spinner
  gidLink(cast(void**)&adw_spinner_get_type, "adw_spinner_get_type", libs);
  gidLink(cast(void**)&adw_spinner_new, "adw_spinner_new", libs);

  // SpinnerPaintable
  gidLink(cast(void**)&adw_spinner_paintable_get_type, "adw_spinner_paintable_get_type", libs);
  gidLink(cast(void**)&adw_spinner_paintable_new, "adw_spinner_paintable_new", libs);
  gidLink(cast(void**)&adw_spinner_paintable_get_widget, "adw_spinner_paintable_get_widget", libs);
  gidLink(cast(void**)&adw_spinner_paintable_set_widget, "adw_spinner_paintable_set_widget", libs);

  // SplitButton
  gidLink(cast(void**)&adw_split_button_get_type, "adw_split_button_get_type", libs);
  gidLink(cast(void**)&adw_split_button_new, "adw_split_button_new", libs);
  gidLink(cast(void**)&adw_split_button_get_can_shrink, "adw_split_button_get_can_shrink", libs);
  gidLink(cast(void**)&adw_split_button_get_child, "adw_split_button_get_child", libs);
  gidLink(cast(void**)&adw_split_button_get_direction, "adw_split_button_get_direction", libs);
  gidLink(cast(void**)&adw_split_button_get_dropdown_tooltip, "adw_split_button_get_dropdown_tooltip", libs);
  gidLink(cast(void**)&adw_split_button_get_icon_name, "adw_split_button_get_icon_name", libs);
  gidLink(cast(void**)&adw_split_button_get_label, "adw_split_button_get_label", libs);
  gidLink(cast(void**)&adw_split_button_get_menu_model, "adw_split_button_get_menu_model", libs);
  gidLink(cast(void**)&adw_split_button_get_popover, "adw_split_button_get_popover", libs);
  gidLink(cast(void**)&adw_split_button_get_use_underline, "adw_split_button_get_use_underline", libs);
  gidLink(cast(void**)&adw_split_button_popdown, "adw_split_button_popdown", libs);
  gidLink(cast(void**)&adw_split_button_popup, "adw_split_button_popup", libs);
  gidLink(cast(void**)&adw_split_button_set_can_shrink, "adw_split_button_set_can_shrink", libs);
  gidLink(cast(void**)&adw_split_button_set_child, "adw_split_button_set_child", libs);
  gidLink(cast(void**)&adw_split_button_set_direction, "adw_split_button_set_direction", libs);
  gidLink(cast(void**)&adw_split_button_set_dropdown_tooltip, "adw_split_button_set_dropdown_tooltip", libs);
  gidLink(cast(void**)&adw_split_button_set_icon_name, "adw_split_button_set_icon_name", libs);
  gidLink(cast(void**)&adw_split_button_set_label, "adw_split_button_set_label", libs);
  gidLink(cast(void**)&adw_split_button_set_menu_model, "adw_split_button_set_menu_model", libs);
  gidLink(cast(void**)&adw_split_button_set_popover, "adw_split_button_set_popover", libs);
  gidLink(cast(void**)&adw_split_button_set_use_underline, "adw_split_button_set_use_underline", libs);

  // SpringAnimation
  gidLink(cast(void**)&adw_spring_animation_get_type, "adw_spring_animation_get_type", libs);
  gidLink(cast(void**)&adw_spring_animation_new, "adw_spring_animation_new", libs);
  gidLink(cast(void**)&adw_spring_animation_calculate_value, "adw_spring_animation_calculate_value", libs);
  gidLink(cast(void**)&adw_spring_animation_calculate_velocity, "adw_spring_animation_calculate_velocity", libs);
  gidLink(cast(void**)&adw_spring_animation_get_clamp, "adw_spring_animation_get_clamp", libs);
  gidLink(cast(void**)&adw_spring_animation_get_epsilon, "adw_spring_animation_get_epsilon", libs);
  gidLink(cast(void**)&adw_spring_animation_get_estimated_duration, "adw_spring_animation_get_estimated_duration", libs);
  gidLink(cast(void**)&adw_spring_animation_get_initial_velocity, "adw_spring_animation_get_initial_velocity", libs);
  gidLink(cast(void**)&adw_spring_animation_get_spring_params, "adw_spring_animation_get_spring_params", libs);
  gidLink(cast(void**)&adw_spring_animation_get_value_from, "adw_spring_animation_get_value_from", libs);
  gidLink(cast(void**)&adw_spring_animation_get_value_to, "adw_spring_animation_get_value_to", libs);
  gidLink(cast(void**)&adw_spring_animation_get_velocity, "adw_spring_animation_get_velocity", libs);
  gidLink(cast(void**)&adw_spring_animation_set_clamp, "adw_spring_animation_set_clamp", libs);
  gidLink(cast(void**)&adw_spring_animation_set_epsilon, "adw_spring_animation_set_epsilon", libs);
  gidLink(cast(void**)&adw_spring_animation_set_initial_velocity, "adw_spring_animation_set_initial_velocity", libs);
  gidLink(cast(void**)&adw_spring_animation_set_spring_params, "adw_spring_animation_set_spring_params", libs);
  gidLink(cast(void**)&adw_spring_animation_set_value_from, "adw_spring_animation_set_value_from", libs);
  gidLink(cast(void**)&adw_spring_animation_set_value_to, "adw_spring_animation_set_value_to", libs);

  // SpringParams
  gidLink(cast(void**)&adw_spring_params_get_type, "adw_spring_params_get_type", libs);
  gidLink(cast(void**)&adw_spring_params_new, "adw_spring_params_new", libs);
  gidLink(cast(void**)&adw_spring_params_new_full, "adw_spring_params_new_full", libs);
  gidLink(cast(void**)&adw_spring_params_get_damping, "adw_spring_params_get_damping", libs);
  gidLink(cast(void**)&adw_spring_params_get_damping_ratio, "adw_spring_params_get_damping_ratio", libs);
  gidLink(cast(void**)&adw_spring_params_get_mass, "adw_spring_params_get_mass", libs);
  gidLink(cast(void**)&adw_spring_params_get_stiffness, "adw_spring_params_get_stiffness", libs);
  gidLink(cast(void**)&adw_spring_params_ref, "adw_spring_params_ref", libs);
  gidLink(cast(void**)&adw_spring_params_unref, "adw_spring_params_unref", libs);

  // Squeezer
  gidLink(cast(void**)&adw_squeezer_get_type, "adw_squeezer_get_type", libs);
  gidLink(cast(void**)&adw_squeezer_new, "adw_squeezer_new", libs);
  gidLink(cast(void**)&adw_squeezer_add, "adw_squeezer_add", libs);
  gidLink(cast(void**)&adw_squeezer_get_allow_none, "adw_squeezer_get_allow_none", libs);
  gidLink(cast(void**)&adw_squeezer_get_homogeneous, "adw_squeezer_get_homogeneous", libs);
  gidLink(cast(void**)&adw_squeezer_get_interpolate_size, "adw_squeezer_get_interpolate_size", libs);
  gidLink(cast(void**)&adw_squeezer_get_page, "adw_squeezer_get_page", libs);
  gidLink(cast(void**)&adw_squeezer_get_pages, "adw_squeezer_get_pages", libs);
  gidLink(cast(void**)&adw_squeezer_get_switch_threshold_policy, "adw_squeezer_get_switch_threshold_policy", libs);
  gidLink(cast(void**)&adw_squeezer_get_transition_duration, "adw_squeezer_get_transition_duration", libs);
  gidLink(cast(void**)&adw_squeezer_get_transition_running, "adw_squeezer_get_transition_running", libs);
  gidLink(cast(void**)&adw_squeezer_get_transition_type, "adw_squeezer_get_transition_type", libs);
  gidLink(cast(void**)&adw_squeezer_get_visible_child, "adw_squeezer_get_visible_child", libs);
  gidLink(cast(void**)&adw_squeezer_get_xalign, "adw_squeezer_get_xalign", libs);
  gidLink(cast(void**)&adw_squeezer_get_yalign, "adw_squeezer_get_yalign", libs);
  gidLink(cast(void**)&adw_squeezer_remove, "adw_squeezer_remove", libs);
  gidLink(cast(void**)&adw_squeezer_set_allow_none, "adw_squeezer_set_allow_none", libs);
  gidLink(cast(void**)&adw_squeezer_set_homogeneous, "adw_squeezer_set_homogeneous", libs);
  gidLink(cast(void**)&adw_squeezer_set_interpolate_size, "adw_squeezer_set_interpolate_size", libs);
  gidLink(cast(void**)&adw_squeezer_set_switch_threshold_policy, "adw_squeezer_set_switch_threshold_policy", libs);
  gidLink(cast(void**)&adw_squeezer_set_transition_duration, "adw_squeezer_set_transition_duration", libs);
  gidLink(cast(void**)&adw_squeezer_set_transition_type, "adw_squeezer_set_transition_type", libs);
  gidLink(cast(void**)&adw_squeezer_set_xalign, "adw_squeezer_set_xalign", libs);
  gidLink(cast(void**)&adw_squeezer_set_yalign, "adw_squeezer_set_yalign", libs);

  // SqueezerPage
  gidLink(cast(void**)&adw_squeezer_page_get_type, "adw_squeezer_page_get_type", libs);
  gidLink(cast(void**)&adw_squeezer_page_get_child, "adw_squeezer_page_get_child", libs);
  gidLink(cast(void**)&adw_squeezer_page_get_enabled, "adw_squeezer_page_get_enabled", libs);
  gidLink(cast(void**)&adw_squeezer_page_set_enabled, "adw_squeezer_page_set_enabled", libs);

  // StatusPage
  gidLink(cast(void**)&adw_status_page_get_type, "adw_status_page_get_type", libs);
  gidLink(cast(void**)&adw_status_page_new, "adw_status_page_new", libs);
  gidLink(cast(void**)&adw_status_page_get_child, "adw_status_page_get_child", libs);
  gidLink(cast(void**)&adw_status_page_get_description, "adw_status_page_get_description", libs);
  gidLink(cast(void**)&adw_status_page_get_icon_name, "adw_status_page_get_icon_name", libs);
  gidLink(cast(void**)&adw_status_page_get_paintable, "adw_status_page_get_paintable", libs);
  gidLink(cast(void**)&adw_status_page_get_title, "adw_status_page_get_title", libs);
  gidLink(cast(void**)&adw_status_page_set_child, "adw_status_page_set_child", libs);
  gidLink(cast(void**)&adw_status_page_set_description, "adw_status_page_set_description", libs);
  gidLink(cast(void**)&adw_status_page_set_icon_name, "adw_status_page_set_icon_name", libs);
  gidLink(cast(void**)&adw_status_page_set_paintable, "adw_status_page_set_paintable", libs);
  gidLink(cast(void**)&adw_status_page_set_title, "adw_status_page_set_title", libs);

  // StyleManager
  gidLink(cast(void**)&adw_style_manager_get_type, "adw_style_manager_get_type", libs);
  gidLink(cast(void**)&adw_style_manager_get_default, "adw_style_manager_get_default", libs);
  gidLink(cast(void**)&adw_style_manager_get_for_display, "adw_style_manager_get_for_display", libs);
  gidLink(cast(void**)&adw_style_manager_get_accent_color, "adw_style_manager_get_accent_color", libs);
  gidLink(cast(void**)&adw_style_manager_get_accent_color_rgba, "adw_style_manager_get_accent_color_rgba", libs);
  gidLink(cast(void**)&adw_style_manager_get_color_scheme, "adw_style_manager_get_color_scheme", libs);
  gidLink(cast(void**)&adw_style_manager_get_dark, "adw_style_manager_get_dark", libs);
  gidLink(cast(void**)&adw_style_manager_get_display, "adw_style_manager_get_display", libs);
  gidLink(cast(void**)&adw_style_manager_get_document_font_name, "adw_style_manager_get_document_font_name", libs);
  gidLink(cast(void**)&adw_style_manager_get_high_contrast, "adw_style_manager_get_high_contrast", libs);
  gidLink(cast(void**)&adw_style_manager_get_monospace_font_name, "adw_style_manager_get_monospace_font_name", libs);
  gidLink(cast(void**)&adw_style_manager_get_system_supports_accent_colors, "adw_style_manager_get_system_supports_accent_colors", libs);
  gidLink(cast(void**)&adw_style_manager_get_system_supports_color_schemes, "adw_style_manager_get_system_supports_color_schemes", libs);
  gidLink(cast(void**)&adw_style_manager_set_color_scheme, "adw_style_manager_set_color_scheme", libs);

  // SwipeTracker
  gidLink(cast(void**)&adw_swipe_tracker_get_type, "adw_swipe_tracker_get_type", libs);
  gidLink(cast(void**)&adw_swipe_tracker_new, "adw_swipe_tracker_new", libs);
  gidLink(cast(void**)&adw_swipe_tracker_get_allow_long_swipes, "adw_swipe_tracker_get_allow_long_swipes", libs);
  gidLink(cast(void**)&adw_swipe_tracker_get_allow_mouse_drag, "adw_swipe_tracker_get_allow_mouse_drag", libs);
  gidLink(cast(void**)&adw_swipe_tracker_get_allow_window_handle, "adw_swipe_tracker_get_allow_window_handle", libs);
  gidLink(cast(void**)&adw_swipe_tracker_get_enabled, "adw_swipe_tracker_get_enabled", libs);
  gidLink(cast(void**)&adw_swipe_tracker_get_lower_overshoot, "adw_swipe_tracker_get_lower_overshoot", libs);
  gidLink(cast(void**)&adw_swipe_tracker_get_reversed, "adw_swipe_tracker_get_reversed", libs);
  gidLink(cast(void**)&adw_swipe_tracker_get_swipeable, "adw_swipe_tracker_get_swipeable", libs);
  gidLink(cast(void**)&adw_swipe_tracker_get_upper_overshoot, "adw_swipe_tracker_get_upper_overshoot", libs);
  gidLink(cast(void**)&adw_swipe_tracker_set_allow_long_swipes, "adw_swipe_tracker_set_allow_long_swipes", libs);
  gidLink(cast(void**)&adw_swipe_tracker_set_allow_mouse_drag, "adw_swipe_tracker_set_allow_mouse_drag", libs);
  gidLink(cast(void**)&adw_swipe_tracker_set_allow_window_handle, "adw_swipe_tracker_set_allow_window_handle", libs);
  gidLink(cast(void**)&adw_swipe_tracker_set_enabled, "adw_swipe_tracker_set_enabled", libs);
  gidLink(cast(void**)&adw_swipe_tracker_set_lower_overshoot, "adw_swipe_tracker_set_lower_overshoot", libs);
  gidLink(cast(void**)&adw_swipe_tracker_set_reversed, "adw_swipe_tracker_set_reversed", libs);
  gidLink(cast(void**)&adw_swipe_tracker_set_upper_overshoot, "adw_swipe_tracker_set_upper_overshoot", libs);
  gidLink(cast(void**)&adw_swipe_tracker_shift_position, "adw_swipe_tracker_shift_position", libs);

  // Swipeable
  gidLink(cast(void**)&adw_swipeable_get_type, "adw_swipeable_get_type", libs);
  gidLink(cast(void**)&adw_swipeable_get_cancel_progress, "adw_swipeable_get_cancel_progress", libs);
  gidLink(cast(void**)&adw_swipeable_get_distance, "adw_swipeable_get_distance", libs);
  gidLink(cast(void**)&adw_swipeable_get_progress, "adw_swipeable_get_progress", libs);
  gidLink(cast(void**)&adw_swipeable_get_snap_points, "adw_swipeable_get_snap_points", libs);
  gidLink(cast(void**)&adw_swipeable_get_swipe_area, "adw_swipeable_get_swipe_area", libs);

  // SwitchRow
  gidLink(cast(void**)&adw_switch_row_get_type, "adw_switch_row_get_type", libs);
  gidLink(cast(void**)&adw_switch_row_new, "adw_switch_row_new", libs);
  gidLink(cast(void**)&adw_switch_row_get_active, "adw_switch_row_get_active", libs);
  gidLink(cast(void**)&adw_switch_row_set_active, "adw_switch_row_set_active", libs);

  // TabBar
  gidLink(cast(void**)&adw_tab_bar_get_type, "adw_tab_bar_get_type", libs);
  gidLink(cast(void**)&adw_tab_bar_new, "adw_tab_bar_new", libs);
  gidLink(cast(void**)&adw_tab_bar_get_autohide, "adw_tab_bar_get_autohide", libs);
  gidLink(cast(void**)&adw_tab_bar_get_end_action_widget, "adw_tab_bar_get_end_action_widget", libs);
  gidLink(cast(void**)&adw_tab_bar_get_expand_tabs, "adw_tab_bar_get_expand_tabs", libs);
  gidLink(cast(void**)&adw_tab_bar_get_extra_drag_preferred_action, "adw_tab_bar_get_extra_drag_preferred_action", libs);
  gidLink(cast(void**)&adw_tab_bar_get_extra_drag_preload, "adw_tab_bar_get_extra_drag_preload", libs);
  gidLink(cast(void**)&adw_tab_bar_get_inverted, "adw_tab_bar_get_inverted", libs);
  gidLink(cast(void**)&adw_tab_bar_get_is_overflowing, "adw_tab_bar_get_is_overflowing", libs);
  gidLink(cast(void**)&adw_tab_bar_get_start_action_widget, "adw_tab_bar_get_start_action_widget", libs);
  gidLink(cast(void**)&adw_tab_bar_get_tabs_revealed, "adw_tab_bar_get_tabs_revealed", libs);
  gidLink(cast(void**)&adw_tab_bar_get_view, "adw_tab_bar_get_view", libs);
  gidLink(cast(void**)&adw_tab_bar_set_autohide, "adw_tab_bar_set_autohide", libs);
  gidLink(cast(void**)&adw_tab_bar_set_end_action_widget, "adw_tab_bar_set_end_action_widget", libs);
  gidLink(cast(void**)&adw_tab_bar_set_expand_tabs, "adw_tab_bar_set_expand_tabs", libs);
  gidLink(cast(void**)&adw_tab_bar_set_extra_drag_preload, "adw_tab_bar_set_extra_drag_preload", libs);
  gidLink(cast(void**)&adw_tab_bar_set_inverted, "adw_tab_bar_set_inverted", libs);
  gidLink(cast(void**)&adw_tab_bar_set_start_action_widget, "adw_tab_bar_set_start_action_widget", libs);
  gidLink(cast(void**)&adw_tab_bar_set_view, "adw_tab_bar_set_view", libs);
  gidLink(cast(void**)&adw_tab_bar_setup_extra_drop_target, "adw_tab_bar_setup_extra_drop_target", libs);

  // TabButton
  gidLink(cast(void**)&adw_tab_button_get_type, "adw_tab_button_get_type", libs);
  gidLink(cast(void**)&adw_tab_button_new, "adw_tab_button_new", libs);
  gidLink(cast(void**)&adw_tab_button_get_view, "adw_tab_button_get_view", libs);
  gidLink(cast(void**)&adw_tab_button_set_view, "adw_tab_button_set_view", libs);

  // TabOverview
  gidLink(cast(void**)&adw_tab_overview_get_type, "adw_tab_overview_get_type", libs);
  gidLink(cast(void**)&adw_tab_overview_new, "adw_tab_overview_new", libs);
  gidLink(cast(void**)&adw_tab_overview_get_child, "adw_tab_overview_get_child", libs);
  gidLink(cast(void**)&adw_tab_overview_get_enable_new_tab, "adw_tab_overview_get_enable_new_tab", libs);
  gidLink(cast(void**)&adw_tab_overview_get_enable_search, "adw_tab_overview_get_enable_search", libs);
  gidLink(cast(void**)&adw_tab_overview_get_extra_drag_preferred_action, "adw_tab_overview_get_extra_drag_preferred_action", libs);
  gidLink(cast(void**)&adw_tab_overview_get_extra_drag_preload, "adw_tab_overview_get_extra_drag_preload", libs);
  gidLink(cast(void**)&adw_tab_overview_get_inverted, "adw_tab_overview_get_inverted", libs);
  gidLink(cast(void**)&adw_tab_overview_get_open, "adw_tab_overview_get_open", libs);
  gidLink(cast(void**)&adw_tab_overview_get_search_active, "adw_tab_overview_get_search_active", libs);
  gidLink(cast(void**)&adw_tab_overview_get_secondary_menu, "adw_tab_overview_get_secondary_menu", libs);
  gidLink(cast(void**)&adw_tab_overview_get_show_end_title_buttons, "adw_tab_overview_get_show_end_title_buttons", libs);
  gidLink(cast(void**)&adw_tab_overview_get_show_start_title_buttons, "adw_tab_overview_get_show_start_title_buttons", libs);
  gidLink(cast(void**)&adw_tab_overview_get_view, "adw_tab_overview_get_view", libs);
  gidLink(cast(void**)&adw_tab_overview_set_child, "adw_tab_overview_set_child", libs);
  gidLink(cast(void**)&adw_tab_overview_set_enable_new_tab, "adw_tab_overview_set_enable_new_tab", libs);
  gidLink(cast(void**)&adw_tab_overview_set_enable_search, "adw_tab_overview_set_enable_search", libs);
  gidLink(cast(void**)&adw_tab_overview_set_extra_drag_preload, "adw_tab_overview_set_extra_drag_preload", libs);
  gidLink(cast(void**)&adw_tab_overview_set_inverted, "adw_tab_overview_set_inverted", libs);
  gidLink(cast(void**)&adw_tab_overview_set_open, "adw_tab_overview_set_open", libs);
  gidLink(cast(void**)&adw_tab_overview_set_secondary_menu, "adw_tab_overview_set_secondary_menu", libs);
  gidLink(cast(void**)&adw_tab_overview_set_show_end_title_buttons, "adw_tab_overview_set_show_end_title_buttons", libs);
  gidLink(cast(void**)&adw_tab_overview_set_show_start_title_buttons, "adw_tab_overview_set_show_start_title_buttons", libs);
  gidLink(cast(void**)&adw_tab_overview_set_view, "adw_tab_overview_set_view", libs);
  gidLink(cast(void**)&adw_tab_overview_setup_extra_drop_target, "adw_tab_overview_setup_extra_drop_target", libs);

  // TabPage
  gidLink(cast(void**)&adw_tab_page_get_type, "adw_tab_page_get_type", libs);
  gidLink(cast(void**)&adw_tab_page_get_child, "adw_tab_page_get_child", libs);
  gidLink(cast(void**)&adw_tab_page_get_icon, "adw_tab_page_get_icon", libs);
  gidLink(cast(void**)&adw_tab_page_get_indicator_activatable, "adw_tab_page_get_indicator_activatable", libs);
  gidLink(cast(void**)&adw_tab_page_get_indicator_icon, "adw_tab_page_get_indicator_icon", libs);
  gidLink(cast(void**)&adw_tab_page_get_indicator_tooltip, "adw_tab_page_get_indicator_tooltip", libs);
  gidLink(cast(void**)&adw_tab_page_get_keyword, "adw_tab_page_get_keyword", libs);
  gidLink(cast(void**)&adw_tab_page_get_live_thumbnail, "adw_tab_page_get_live_thumbnail", libs);
  gidLink(cast(void**)&adw_tab_page_get_loading, "adw_tab_page_get_loading", libs);
  gidLink(cast(void**)&adw_tab_page_get_needs_attention, "adw_tab_page_get_needs_attention", libs);
  gidLink(cast(void**)&adw_tab_page_get_parent, "adw_tab_page_get_parent", libs);
  gidLink(cast(void**)&adw_tab_page_get_pinned, "adw_tab_page_get_pinned", libs);
  gidLink(cast(void**)&adw_tab_page_get_selected, "adw_tab_page_get_selected", libs);
  gidLink(cast(void**)&adw_tab_page_get_thumbnail_xalign, "adw_tab_page_get_thumbnail_xalign", libs);
  gidLink(cast(void**)&adw_tab_page_get_thumbnail_yalign, "adw_tab_page_get_thumbnail_yalign", libs);
  gidLink(cast(void**)&adw_tab_page_get_title, "adw_tab_page_get_title", libs);
  gidLink(cast(void**)&adw_tab_page_get_tooltip, "adw_tab_page_get_tooltip", libs);
  gidLink(cast(void**)&adw_tab_page_invalidate_thumbnail, "adw_tab_page_invalidate_thumbnail", libs);
  gidLink(cast(void**)&adw_tab_page_set_icon, "adw_tab_page_set_icon", libs);
  gidLink(cast(void**)&adw_tab_page_set_indicator_activatable, "adw_tab_page_set_indicator_activatable", libs);
  gidLink(cast(void**)&adw_tab_page_set_indicator_icon, "adw_tab_page_set_indicator_icon", libs);
  gidLink(cast(void**)&adw_tab_page_set_indicator_tooltip, "adw_tab_page_set_indicator_tooltip", libs);
  gidLink(cast(void**)&adw_tab_page_set_keyword, "adw_tab_page_set_keyword", libs);
  gidLink(cast(void**)&adw_tab_page_set_live_thumbnail, "adw_tab_page_set_live_thumbnail", libs);
  gidLink(cast(void**)&adw_tab_page_set_loading, "adw_tab_page_set_loading", libs);
  gidLink(cast(void**)&adw_tab_page_set_needs_attention, "adw_tab_page_set_needs_attention", libs);
  gidLink(cast(void**)&adw_tab_page_set_thumbnail_xalign, "adw_tab_page_set_thumbnail_xalign", libs);
  gidLink(cast(void**)&adw_tab_page_set_thumbnail_yalign, "adw_tab_page_set_thumbnail_yalign", libs);
  gidLink(cast(void**)&adw_tab_page_set_title, "adw_tab_page_set_title", libs);
  gidLink(cast(void**)&adw_tab_page_set_tooltip, "adw_tab_page_set_tooltip", libs);

  // TabView
  gidLink(cast(void**)&adw_tab_view_get_type, "adw_tab_view_get_type", libs);
  gidLink(cast(void**)&adw_tab_view_new, "adw_tab_view_new", libs);
  gidLink(cast(void**)&adw_tab_view_add_page, "adw_tab_view_add_page", libs);
  gidLink(cast(void**)&adw_tab_view_add_shortcuts, "adw_tab_view_add_shortcuts", libs);
  gidLink(cast(void**)&adw_tab_view_append, "adw_tab_view_append", libs);
  gidLink(cast(void**)&adw_tab_view_append_pinned, "adw_tab_view_append_pinned", libs);
  gidLink(cast(void**)&adw_tab_view_close_other_pages, "adw_tab_view_close_other_pages", libs);
  gidLink(cast(void**)&adw_tab_view_close_page, "adw_tab_view_close_page", libs);
  gidLink(cast(void**)&adw_tab_view_close_page_finish, "adw_tab_view_close_page_finish", libs);
  gidLink(cast(void**)&adw_tab_view_close_pages_after, "adw_tab_view_close_pages_after", libs);
  gidLink(cast(void**)&adw_tab_view_close_pages_before, "adw_tab_view_close_pages_before", libs);
  gidLink(cast(void**)&adw_tab_view_get_default_icon, "adw_tab_view_get_default_icon", libs);
  gidLink(cast(void**)&adw_tab_view_get_is_transferring_page, "adw_tab_view_get_is_transferring_page", libs);
  gidLink(cast(void**)&adw_tab_view_get_menu_model, "adw_tab_view_get_menu_model", libs);
  gidLink(cast(void**)&adw_tab_view_get_n_pages, "adw_tab_view_get_n_pages", libs);
  gidLink(cast(void**)&adw_tab_view_get_n_pinned_pages, "adw_tab_view_get_n_pinned_pages", libs);
  gidLink(cast(void**)&adw_tab_view_get_nth_page, "adw_tab_view_get_nth_page", libs);
  gidLink(cast(void**)&adw_tab_view_get_page, "adw_tab_view_get_page", libs);
  gidLink(cast(void**)&adw_tab_view_get_page_position, "adw_tab_view_get_page_position", libs);
  gidLink(cast(void**)&adw_tab_view_get_pages, "adw_tab_view_get_pages", libs);
  gidLink(cast(void**)&adw_tab_view_get_selected_page, "adw_tab_view_get_selected_page", libs);
  gidLink(cast(void**)&adw_tab_view_get_shortcuts, "adw_tab_view_get_shortcuts", libs);
  gidLink(cast(void**)&adw_tab_view_insert, "adw_tab_view_insert", libs);
  gidLink(cast(void**)&adw_tab_view_insert_pinned, "adw_tab_view_insert_pinned", libs);
  gidLink(cast(void**)&adw_tab_view_invalidate_thumbnails, "adw_tab_view_invalidate_thumbnails", libs);
  gidLink(cast(void**)&adw_tab_view_prepend, "adw_tab_view_prepend", libs);
  gidLink(cast(void**)&adw_tab_view_prepend_pinned, "adw_tab_view_prepend_pinned", libs);
  gidLink(cast(void**)&adw_tab_view_remove_shortcuts, "adw_tab_view_remove_shortcuts", libs);
  gidLink(cast(void**)&adw_tab_view_reorder_backward, "adw_tab_view_reorder_backward", libs);
  gidLink(cast(void**)&adw_tab_view_reorder_first, "adw_tab_view_reorder_first", libs);
  gidLink(cast(void**)&adw_tab_view_reorder_forward, "adw_tab_view_reorder_forward", libs);
  gidLink(cast(void**)&adw_tab_view_reorder_last, "adw_tab_view_reorder_last", libs);
  gidLink(cast(void**)&adw_tab_view_reorder_page, "adw_tab_view_reorder_page", libs);
  gidLink(cast(void**)&adw_tab_view_select_next_page, "adw_tab_view_select_next_page", libs);
  gidLink(cast(void**)&adw_tab_view_select_previous_page, "adw_tab_view_select_previous_page", libs);
  gidLink(cast(void**)&adw_tab_view_set_default_icon, "adw_tab_view_set_default_icon", libs);
  gidLink(cast(void**)&adw_tab_view_set_menu_model, "adw_tab_view_set_menu_model", libs);
  gidLink(cast(void**)&adw_tab_view_set_page_pinned, "adw_tab_view_set_page_pinned", libs);
  gidLink(cast(void**)&adw_tab_view_set_selected_page, "adw_tab_view_set_selected_page", libs);
  gidLink(cast(void**)&adw_tab_view_set_shortcuts, "adw_tab_view_set_shortcuts", libs);
  gidLink(cast(void**)&adw_tab_view_transfer_page, "adw_tab_view_transfer_page", libs);

  // TimedAnimation
  gidLink(cast(void**)&adw_timed_animation_get_type, "adw_timed_animation_get_type", libs);
  gidLink(cast(void**)&adw_timed_animation_new, "adw_timed_animation_new", libs);
  gidLink(cast(void**)&adw_timed_animation_get_alternate, "adw_timed_animation_get_alternate", libs);
  gidLink(cast(void**)&adw_timed_animation_get_duration, "adw_timed_animation_get_duration", libs);
  gidLink(cast(void**)&adw_timed_animation_get_easing, "adw_timed_animation_get_easing", libs);
  gidLink(cast(void**)&adw_timed_animation_get_repeat_count, "adw_timed_animation_get_repeat_count", libs);
  gidLink(cast(void**)&adw_timed_animation_get_reverse, "adw_timed_animation_get_reverse", libs);
  gidLink(cast(void**)&adw_timed_animation_get_value_from, "adw_timed_animation_get_value_from", libs);
  gidLink(cast(void**)&adw_timed_animation_get_value_to, "adw_timed_animation_get_value_to", libs);
  gidLink(cast(void**)&adw_timed_animation_set_alternate, "adw_timed_animation_set_alternate", libs);
  gidLink(cast(void**)&adw_timed_animation_set_duration, "adw_timed_animation_set_duration", libs);
  gidLink(cast(void**)&adw_timed_animation_set_easing, "adw_timed_animation_set_easing", libs);
  gidLink(cast(void**)&adw_timed_animation_set_repeat_count, "adw_timed_animation_set_repeat_count", libs);
  gidLink(cast(void**)&adw_timed_animation_set_reverse, "adw_timed_animation_set_reverse", libs);
  gidLink(cast(void**)&adw_timed_animation_set_value_from, "adw_timed_animation_set_value_from", libs);
  gidLink(cast(void**)&adw_timed_animation_set_value_to, "adw_timed_animation_set_value_to", libs);

  // Toast
  gidLink(cast(void**)&adw_toast_get_type, "adw_toast_get_type", libs);
  gidLink(cast(void**)&adw_toast_new, "adw_toast_new", libs);
  gidLink(cast(void**)&adw_toast_new_format, "adw_toast_new_format", libs);
  gidLink(cast(void**)&adw_toast_dismiss, "adw_toast_dismiss", libs);
  gidLink(cast(void**)&adw_toast_get_action_name, "adw_toast_get_action_name", libs);
  gidLink(cast(void**)&adw_toast_get_action_target_value, "adw_toast_get_action_target_value", libs);
  gidLink(cast(void**)&adw_toast_get_button_label, "adw_toast_get_button_label", libs);
  gidLink(cast(void**)&adw_toast_get_custom_title, "adw_toast_get_custom_title", libs);
  gidLink(cast(void**)&adw_toast_get_priority, "adw_toast_get_priority", libs);
  gidLink(cast(void**)&adw_toast_get_timeout, "adw_toast_get_timeout", libs);
  gidLink(cast(void**)&adw_toast_get_title, "adw_toast_get_title", libs);
  gidLink(cast(void**)&adw_toast_get_use_markup, "adw_toast_get_use_markup", libs);
  gidLink(cast(void**)&adw_toast_set_action_name, "adw_toast_set_action_name", libs);
  gidLink(cast(void**)&adw_toast_set_action_target, "adw_toast_set_action_target", libs);
  gidLink(cast(void**)&adw_toast_set_action_target_value, "adw_toast_set_action_target_value", libs);
  gidLink(cast(void**)&adw_toast_set_button_label, "adw_toast_set_button_label", libs);
  gidLink(cast(void**)&adw_toast_set_custom_title, "adw_toast_set_custom_title", libs);
  gidLink(cast(void**)&adw_toast_set_detailed_action_name, "adw_toast_set_detailed_action_name", libs);
  gidLink(cast(void**)&adw_toast_set_priority, "adw_toast_set_priority", libs);
  gidLink(cast(void**)&adw_toast_set_timeout, "adw_toast_set_timeout", libs);
  gidLink(cast(void**)&adw_toast_set_title, "adw_toast_set_title", libs);
  gidLink(cast(void**)&adw_toast_set_use_markup, "adw_toast_set_use_markup", libs);

  // ToastOverlay
  gidLink(cast(void**)&adw_toast_overlay_get_type, "adw_toast_overlay_get_type", libs);
  gidLink(cast(void**)&adw_toast_overlay_new, "adw_toast_overlay_new", libs);
  gidLink(cast(void**)&adw_toast_overlay_add_toast, "adw_toast_overlay_add_toast", libs);
  gidLink(cast(void**)&adw_toast_overlay_dismiss_all, "adw_toast_overlay_dismiss_all", libs);
  gidLink(cast(void**)&adw_toast_overlay_get_child, "adw_toast_overlay_get_child", libs);
  gidLink(cast(void**)&adw_toast_overlay_set_child, "adw_toast_overlay_set_child", libs);

  // Toggle
  gidLink(cast(void**)&adw_toggle_get_type, "adw_toggle_get_type", libs);
  gidLink(cast(void**)&adw_toggle_new, "adw_toggle_new", libs);
  gidLink(cast(void**)&adw_toggle_get_child, "adw_toggle_get_child", libs);
  gidLink(cast(void**)&adw_toggle_get_description, "adw_toggle_get_description", libs);
  gidLink(cast(void**)&adw_toggle_get_enabled, "adw_toggle_get_enabled", libs);
  gidLink(cast(void**)&adw_toggle_get_icon_name, "adw_toggle_get_icon_name", libs);
  gidLink(cast(void**)&adw_toggle_get_index, "adw_toggle_get_index", libs);
  gidLink(cast(void**)&adw_toggle_get_label, "adw_toggle_get_label", libs);
  gidLink(cast(void**)&adw_toggle_get_name, "adw_toggle_get_name", libs);
  gidLink(cast(void**)&adw_toggle_get_tooltip, "adw_toggle_get_tooltip", libs);
  gidLink(cast(void**)&adw_toggle_get_use_underline, "adw_toggle_get_use_underline", libs);
  gidLink(cast(void**)&adw_toggle_set_child, "adw_toggle_set_child", libs);
  gidLink(cast(void**)&adw_toggle_set_description, "adw_toggle_set_description", libs);
  gidLink(cast(void**)&adw_toggle_set_enabled, "adw_toggle_set_enabled", libs);
  gidLink(cast(void**)&adw_toggle_set_icon_name, "adw_toggle_set_icon_name", libs);
  gidLink(cast(void**)&adw_toggle_set_label, "adw_toggle_set_label", libs);
  gidLink(cast(void**)&adw_toggle_set_name, "adw_toggle_set_name", libs);
  gidLink(cast(void**)&adw_toggle_set_tooltip, "adw_toggle_set_tooltip", libs);
  gidLink(cast(void**)&adw_toggle_set_use_underline, "adw_toggle_set_use_underline", libs);

  // ToggleGroup
  gidLink(cast(void**)&adw_toggle_group_get_type, "adw_toggle_group_get_type", libs);
  gidLink(cast(void**)&adw_toggle_group_new, "adw_toggle_group_new", libs);
  gidLink(cast(void**)&adw_toggle_group_add, "adw_toggle_group_add", libs);
  gidLink(cast(void**)&adw_toggle_group_get_active, "adw_toggle_group_get_active", libs);
  gidLink(cast(void**)&adw_toggle_group_get_active_name, "adw_toggle_group_get_active_name", libs);
  gidLink(cast(void**)&adw_toggle_group_get_can_shrink, "adw_toggle_group_get_can_shrink", libs);
  gidLink(cast(void**)&adw_toggle_group_get_homogeneous, "adw_toggle_group_get_homogeneous", libs);
  gidLink(cast(void**)&adw_toggle_group_get_n_toggles, "adw_toggle_group_get_n_toggles", libs);
  gidLink(cast(void**)&adw_toggle_group_get_toggle, "adw_toggle_group_get_toggle", libs);
  gidLink(cast(void**)&adw_toggle_group_get_toggle_by_name, "adw_toggle_group_get_toggle_by_name", libs);
  gidLink(cast(void**)&adw_toggle_group_get_toggles, "adw_toggle_group_get_toggles", libs);
  gidLink(cast(void**)&adw_toggle_group_remove, "adw_toggle_group_remove", libs);
  gidLink(cast(void**)&adw_toggle_group_remove_all, "adw_toggle_group_remove_all", libs);
  gidLink(cast(void**)&adw_toggle_group_set_active, "adw_toggle_group_set_active", libs);
  gidLink(cast(void**)&adw_toggle_group_set_active_name, "adw_toggle_group_set_active_name", libs);
  gidLink(cast(void**)&adw_toggle_group_set_can_shrink, "adw_toggle_group_set_can_shrink", libs);
  gidLink(cast(void**)&adw_toggle_group_set_homogeneous, "adw_toggle_group_set_homogeneous", libs);

  // ToolbarView
  gidLink(cast(void**)&adw_toolbar_view_get_type, "adw_toolbar_view_get_type", libs);
  gidLink(cast(void**)&adw_toolbar_view_new, "adw_toolbar_view_new", libs);
  gidLink(cast(void**)&adw_toolbar_view_add_bottom_bar, "adw_toolbar_view_add_bottom_bar", libs);
  gidLink(cast(void**)&adw_toolbar_view_add_top_bar, "adw_toolbar_view_add_top_bar", libs);
  gidLink(cast(void**)&adw_toolbar_view_get_bottom_bar_height, "adw_toolbar_view_get_bottom_bar_height", libs);
  gidLink(cast(void**)&adw_toolbar_view_get_bottom_bar_style, "adw_toolbar_view_get_bottom_bar_style", libs);
  gidLink(cast(void**)&adw_toolbar_view_get_content, "adw_toolbar_view_get_content", libs);
  gidLink(cast(void**)&adw_toolbar_view_get_extend_content_to_bottom_edge, "adw_toolbar_view_get_extend_content_to_bottom_edge", libs);
  gidLink(cast(void**)&adw_toolbar_view_get_extend_content_to_top_edge, "adw_toolbar_view_get_extend_content_to_top_edge", libs);
  gidLink(cast(void**)&adw_toolbar_view_get_reveal_bottom_bars, "adw_toolbar_view_get_reveal_bottom_bars", libs);
  gidLink(cast(void**)&adw_toolbar_view_get_reveal_top_bars, "adw_toolbar_view_get_reveal_top_bars", libs);
  gidLink(cast(void**)&adw_toolbar_view_get_top_bar_height, "adw_toolbar_view_get_top_bar_height", libs);
  gidLink(cast(void**)&adw_toolbar_view_get_top_bar_style, "adw_toolbar_view_get_top_bar_style", libs);
  gidLink(cast(void**)&adw_toolbar_view_remove, "adw_toolbar_view_remove", libs);
  gidLink(cast(void**)&adw_toolbar_view_set_bottom_bar_style, "adw_toolbar_view_set_bottom_bar_style", libs);
  gidLink(cast(void**)&adw_toolbar_view_set_content, "adw_toolbar_view_set_content", libs);
  gidLink(cast(void**)&adw_toolbar_view_set_extend_content_to_bottom_edge, "adw_toolbar_view_set_extend_content_to_bottom_edge", libs);
  gidLink(cast(void**)&adw_toolbar_view_set_extend_content_to_top_edge, "adw_toolbar_view_set_extend_content_to_top_edge", libs);
  gidLink(cast(void**)&adw_toolbar_view_set_reveal_bottom_bars, "adw_toolbar_view_set_reveal_bottom_bars", libs);
  gidLink(cast(void**)&adw_toolbar_view_set_reveal_top_bars, "adw_toolbar_view_set_reveal_top_bars", libs);
  gidLink(cast(void**)&adw_toolbar_view_set_top_bar_style, "adw_toolbar_view_set_top_bar_style", libs);

  // ViewStack
  gidLink(cast(void**)&adw_view_stack_get_type, "adw_view_stack_get_type", libs);
  gidLink(cast(void**)&adw_view_stack_new, "adw_view_stack_new", libs);
  gidLink(cast(void**)&adw_view_stack_add, "adw_view_stack_add", libs);
  gidLink(cast(void**)&adw_view_stack_add_named, "adw_view_stack_add_named", libs);
  gidLink(cast(void**)&adw_view_stack_add_titled, "adw_view_stack_add_titled", libs);
  gidLink(cast(void**)&adw_view_stack_add_titled_with_icon, "adw_view_stack_add_titled_with_icon", libs);
  gidLink(cast(void**)&adw_view_stack_get_child_by_name, "adw_view_stack_get_child_by_name", libs);
  gidLink(cast(void**)&adw_view_stack_get_enable_transitions, "adw_view_stack_get_enable_transitions", libs);
  gidLink(cast(void**)&adw_view_stack_get_hhomogeneous, "adw_view_stack_get_hhomogeneous", libs);
  gidLink(cast(void**)&adw_view_stack_get_page, "adw_view_stack_get_page", libs);
  gidLink(cast(void**)&adw_view_stack_get_pages, "adw_view_stack_get_pages", libs);
  gidLink(cast(void**)&adw_view_stack_get_transition_duration, "adw_view_stack_get_transition_duration", libs);
  gidLink(cast(void**)&adw_view_stack_get_transition_running, "adw_view_stack_get_transition_running", libs);
  gidLink(cast(void**)&adw_view_stack_get_vhomogeneous, "adw_view_stack_get_vhomogeneous", libs);
  gidLink(cast(void**)&adw_view_stack_get_visible_child, "adw_view_stack_get_visible_child", libs);
  gidLink(cast(void**)&adw_view_stack_get_visible_child_name, "adw_view_stack_get_visible_child_name", libs);
  gidLink(cast(void**)&adw_view_stack_remove, "adw_view_stack_remove", libs);
  gidLink(cast(void**)&adw_view_stack_set_enable_transitions, "adw_view_stack_set_enable_transitions", libs);
  gidLink(cast(void**)&adw_view_stack_set_hhomogeneous, "adw_view_stack_set_hhomogeneous", libs);
  gidLink(cast(void**)&adw_view_stack_set_transition_duration, "adw_view_stack_set_transition_duration", libs);
  gidLink(cast(void**)&adw_view_stack_set_vhomogeneous, "adw_view_stack_set_vhomogeneous", libs);
  gidLink(cast(void**)&adw_view_stack_set_visible_child, "adw_view_stack_set_visible_child", libs);
  gidLink(cast(void**)&adw_view_stack_set_visible_child_name, "adw_view_stack_set_visible_child_name", libs);

  // ViewStackPage
  gidLink(cast(void**)&adw_view_stack_page_get_type, "adw_view_stack_page_get_type", libs);
  gidLink(cast(void**)&adw_view_stack_page_get_badge_number, "adw_view_stack_page_get_badge_number", libs);
  gidLink(cast(void**)&adw_view_stack_page_get_child, "adw_view_stack_page_get_child", libs);
  gidLink(cast(void**)&adw_view_stack_page_get_icon_name, "adw_view_stack_page_get_icon_name", libs);
  gidLink(cast(void**)&adw_view_stack_page_get_name, "adw_view_stack_page_get_name", libs);
  gidLink(cast(void**)&adw_view_stack_page_get_needs_attention, "adw_view_stack_page_get_needs_attention", libs);
  gidLink(cast(void**)&adw_view_stack_page_get_section_title, "adw_view_stack_page_get_section_title", libs);
  gidLink(cast(void**)&adw_view_stack_page_get_starts_section, "adw_view_stack_page_get_starts_section", libs);
  gidLink(cast(void**)&adw_view_stack_page_get_title, "adw_view_stack_page_get_title", libs);
  gidLink(cast(void**)&adw_view_stack_page_get_use_underline, "adw_view_stack_page_get_use_underline", libs);
  gidLink(cast(void**)&adw_view_stack_page_get_visible, "adw_view_stack_page_get_visible", libs);
  gidLink(cast(void**)&adw_view_stack_page_set_badge_number, "adw_view_stack_page_set_badge_number", libs);
  gidLink(cast(void**)&adw_view_stack_page_set_icon_name, "adw_view_stack_page_set_icon_name", libs);
  gidLink(cast(void**)&adw_view_stack_page_set_name, "adw_view_stack_page_set_name", libs);
  gidLink(cast(void**)&adw_view_stack_page_set_needs_attention, "adw_view_stack_page_set_needs_attention", libs);
  gidLink(cast(void**)&adw_view_stack_page_set_section_title, "adw_view_stack_page_set_section_title", libs);
  gidLink(cast(void**)&adw_view_stack_page_set_starts_section, "adw_view_stack_page_set_starts_section", libs);
  gidLink(cast(void**)&adw_view_stack_page_set_title, "adw_view_stack_page_set_title", libs);
  gidLink(cast(void**)&adw_view_stack_page_set_use_underline, "adw_view_stack_page_set_use_underline", libs);
  gidLink(cast(void**)&adw_view_stack_page_set_visible, "adw_view_stack_page_set_visible", libs);

  // ViewStackPages
  gidLink(cast(void**)&adw_view_stack_pages_get_type, "adw_view_stack_pages_get_type", libs);
  gidLink(cast(void**)&adw_view_stack_pages_get_selected_page, "adw_view_stack_pages_get_selected_page", libs);
  gidLink(cast(void**)&adw_view_stack_pages_set_selected_page, "adw_view_stack_pages_set_selected_page", libs);

  // ViewSwitcher
  gidLink(cast(void**)&adw_view_switcher_get_type, "adw_view_switcher_get_type", libs);
  gidLink(cast(void**)&adw_view_switcher_new, "adw_view_switcher_new", libs);
  gidLink(cast(void**)&adw_view_switcher_get_policy, "adw_view_switcher_get_policy", libs);
  gidLink(cast(void**)&adw_view_switcher_get_stack, "adw_view_switcher_get_stack", libs);
  gidLink(cast(void**)&adw_view_switcher_set_policy, "adw_view_switcher_set_policy", libs);
  gidLink(cast(void**)&adw_view_switcher_set_stack, "adw_view_switcher_set_stack", libs);

  // ViewSwitcherBar
  gidLink(cast(void**)&adw_view_switcher_bar_get_type, "adw_view_switcher_bar_get_type", libs);
  gidLink(cast(void**)&adw_view_switcher_bar_new, "adw_view_switcher_bar_new", libs);
  gidLink(cast(void**)&adw_view_switcher_bar_get_reveal, "adw_view_switcher_bar_get_reveal", libs);
  gidLink(cast(void**)&adw_view_switcher_bar_get_stack, "adw_view_switcher_bar_get_stack", libs);
  gidLink(cast(void**)&adw_view_switcher_bar_set_reveal, "adw_view_switcher_bar_set_reveal", libs);
  gidLink(cast(void**)&adw_view_switcher_bar_set_stack, "adw_view_switcher_bar_set_stack", libs);

  // ViewSwitcherSidebar
  gidLink(cast(void**)&adw_view_switcher_sidebar_get_type, "adw_view_switcher_sidebar_get_type", libs);
  gidLink(cast(void**)&adw_view_switcher_sidebar_new, "adw_view_switcher_sidebar_new", libs);
  gidLink(cast(void**)&adw_view_switcher_sidebar_get_filter, "adw_view_switcher_sidebar_get_filter", libs);
  gidLink(cast(void**)&adw_view_switcher_sidebar_get_mode, "adw_view_switcher_sidebar_get_mode", libs);
  gidLink(cast(void**)&adw_view_switcher_sidebar_get_placeholder, "adw_view_switcher_sidebar_get_placeholder", libs);
  gidLink(cast(void**)&adw_view_switcher_sidebar_get_stack, "adw_view_switcher_sidebar_get_stack", libs);
  gidLink(cast(void**)&adw_view_switcher_sidebar_set_filter, "adw_view_switcher_sidebar_set_filter", libs);
  gidLink(cast(void**)&adw_view_switcher_sidebar_set_mode, "adw_view_switcher_sidebar_set_mode", libs);
  gidLink(cast(void**)&adw_view_switcher_sidebar_set_placeholder, "adw_view_switcher_sidebar_set_placeholder", libs);
  gidLink(cast(void**)&adw_view_switcher_sidebar_set_stack, "adw_view_switcher_sidebar_set_stack", libs);

  // ViewSwitcherTitle
  gidLink(cast(void**)&adw_view_switcher_title_get_type, "adw_view_switcher_title_get_type", libs);
  gidLink(cast(void**)&adw_view_switcher_title_new, "adw_view_switcher_title_new", libs);
  gidLink(cast(void**)&adw_view_switcher_title_get_stack, "adw_view_switcher_title_get_stack", libs);
  gidLink(cast(void**)&adw_view_switcher_title_get_subtitle, "adw_view_switcher_title_get_subtitle", libs);
  gidLink(cast(void**)&adw_view_switcher_title_get_title, "adw_view_switcher_title_get_title", libs);
  gidLink(cast(void**)&adw_view_switcher_title_get_title_visible, "adw_view_switcher_title_get_title_visible", libs);
  gidLink(cast(void**)&adw_view_switcher_title_get_view_switcher_enabled, "adw_view_switcher_title_get_view_switcher_enabled", libs);
  gidLink(cast(void**)&adw_view_switcher_title_set_stack, "adw_view_switcher_title_set_stack", libs);
  gidLink(cast(void**)&adw_view_switcher_title_set_subtitle, "adw_view_switcher_title_set_subtitle", libs);
  gidLink(cast(void**)&adw_view_switcher_title_set_title, "adw_view_switcher_title_set_title", libs);
  gidLink(cast(void**)&adw_view_switcher_title_set_view_switcher_enabled, "adw_view_switcher_title_set_view_switcher_enabled", libs);

  // Window
  gidLink(cast(void**)&adw_window_get_type, "adw_window_get_type", libs);
  gidLink(cast(void**)&adw_window_new, "adw_window_new", libs);
  gidLink(cast(void**)&adw_window_add_breakpoint, "adw_window_add_breakpoint", libs);
  gidLink(cast(void**)&adw_window_get_adaptive_preview, "adw_window_get_adaptive_preview", libs);
  gidLink(cast(void**)&adw_window_get_content, "adw_window_get_content", libs);
  gidLink(cast(void**)&adw_window_get_current_breakpoint, "adw_window_get_current_breakpoint", libs);
  gidLink(cast(void**)&adw_window_get_dialogs, "adw_window_get_dialogs", libs);
  gidLink(cast(void**)&adw_window_get_visible_dialog, "adw_window_get_visible_dialog", libs);
  gidLink(cast(void**)&adw_window_set_adaptive_preview, "adw_window_set_adaptive_preview", libs);
  gidLink(cast(void**)&adw_window_set_content, "adw_window_set_content", libs);

  // WindowTitle
  gidLink(cast(void**)&adw_window_title_get_type, "adw_window_title_get_type", libs);
  gidLink(cast(void**)&adw_window_title_new, "adw_window_title_new", libs);
  gidLink(cast(void**)&adw_window_title_get_subtitle, "adw_window_title_get_subtitle", libs);
  gidLink(cast(void**)&adw_window_title_get_title, "adw_window_title_get_title", libs);
  gidLink(cast(void**)&adw_window_title_set_subtitle, "adw_window_title_set_subtitle", libs);
  gidLink(cast(void**)&adw_window_title_set_title, "adw_window_title_set_title", libs);

  // WrapBox
  gidLink(cast(void**)&adw_wrap_box_get_type, "adw_wrap_box_get_type", libs);
  gidLink(cast(void**)&adw_wrap_box_new, "adw_wrap_box_new", libs);
  gidLink(cast(void**)&adw_wrap_box_append, "adw_wrap_box_append", libs);
  gidLink(cast(void**)&adw_wrap_box_get_align, "adw_wrap_box_get_align", libs);
  gidLink(cast(void**)&adw_wrap_box_get_child_spacing, "adw_wrap_box_get_child_spacing", libs);
  gidLink(cast(void**)&adw_wrap_box_get_child_spacing_unit, "adw_wrap_box_get_child_spacing_unit", libs);
  gidLink(cast(void**)&adw_wrap_box_get_justify, "adw_wrap_box_get_justify", libs);
  gidLink(cast(void**)&adw_wrap_box_get_justify_last_line, "adw_wrap_box_get_justify_last_line", libs);
  gidLink(cast(void**)&adw_wrap_box_get_line_homogeneous, "adw_wrap_box_get_line_homogeneous", libs);
  gidLink(cast(void**)&adw_wrap_box_get_line_spacing, "adw_wrap_box_get_line_spacing", libs);
  gidLink(cast(void**)&adw_wrap_box_get_line_spacing_unit, "adw_wrap_box_get_line_spacing_unit", libs);
  gidLink(cast(void**)&adw_wrap_box_get_natural_line_length, "adw_wrap_box_get_natural_line_length", libs);
  gidLink(cast(void**)&adw_wrap_box_get_natural_line_length_unit, "adw_wrap_box_get_natural_line_length_unit", libs);
  gidLink(cast(void**)&adw_wrap_box_get_pack_direction, "adw_wrap_box_get_pack_direction", libs);
  gidLink(cast(void**)&adw_wrap_box_get_wrap_policy, "adw_wrap_box_get_wrap_policy", libs);
  gidLink(cast(void**)&adw_wrap_box_get_wrap_reverse, "adw_wrap_box_get_wrap_reverse", libs);
  gidLink(cast(void**)&adw_wrap_box_insert_child_after, "adw_wrap_box_insert_child_after", libs);
  gidLink(cast(void**)&adw_wrap_box_prepend, "adw_wrap_box_prepend", libs);
  gidLink(cast(void**)&adw_wrap_box_remove, "adw_wrap_box_remove", libs);
  gidLink(cast(void**)&adw_wrap_box_remove_all, "adw_wrap_box_remove_all", libs);
  gidLink(cast(void**)&adw_wrap_box_reorder_child_after, "adw_wrap_box_reorder_child_after", libs);
  gidLink(cast(void**)&adw_wrap_box_set_align, "adw_wrap_box_set_align", libs);
  gidLink(cast(void**)&adw_wrap_box_set_child_spacing, "adw_wrap_box_set_child_spacing", libs);
  gidLink(cast(void**)&adw_wrap_box_set_child_spacing_unit, "adw_wrap_box_set_child_spacing_unit", libs);
  gidLink(cast(void**)&adw_wrap_box_set_justify, "adw_wrap_box_set_justify", libs);
  gidLink(cast(void**)&adw_wrap_box_set_justify_last_line, "adw_wrap_box_set_justify_last_line", libs);
  gidLink(cast(void**)&adw_wrap_box_set_line_homogeneous, "adw_wrap_box_set_line_homogeneous", libs);
  gidLink(cast(void**)&adw_wrap_box_set_line_spacing, "adw_wrap_box_set_line_spacing", libs);
  gidLink(cast(void**)&adw_wrap_box_set_line_spacing_unit, "adw_wrap_box_set_line_spacing_unit", libs);
  gidLink(cast(void**)&adw_wrap_box_set_natural_line_length, "adw_wrap_box_set_natural_line_length", libs);
  gidLink(cast(void**)&adw_wrap_box_set_natural_line_length_unit, "adw_wrap_box_set_natural_line_length_unit", libs);
  gidLink(cast(void**)&adw_wrap_box_set_pack_direction, "adw_wrap_box_set_pack_direction", libs);
  gidLink(cast(void**)&adw_wrap_box_set_wrap_policy, "adw_wrap_box_set_wrap_policy", libs);
  gidLink(cast(void**)&adw_wrap_box_set_wrap_reverse, "adw_wrap_box_set_wrap_reverse", libs);

  // WrapLayout
  gidLink(cast(void**)&adw_wrap_layout_get_type, "adw_wrap_layout_get_type", libs);
  gidLink(cast(void**)&adw_wrap_layout_new, "adw_wrap_layout_new", libs);
  gidLink(cast(void**)&adw_wrap_layout_get_align, "adw_wrap_layout_get_align", libs);
  gidLink(cast(void**)&adw_wrap_layout_get_child_spacing, "adw_wrap_layout_get_child_spacing", libs);
  gidLink(cast(void**)&adw_wrap_layout_get_child_spacing_unit, "adw_wrap_layout_get_child_spacing_unit", libs);
  gidLink(cast(void**)&adw_wrap_layout_get_justify, "adw_wrap_layout_get_justify", libs);
  gidLink(cast(void**)&adw_wrap_layout_get_justify_last_line, "adw_wrap_layout_get_justify_last_line", libs);
  gidLink(cast(void**)&adw_wrap_layout_get_line_homogeneous, "adw_wrap_layout_get_line_homogeneous", libs);
  gidLink(cast(void**)&adw_wrap_layout_get_line_spacing, "adw_wrap_layout_get_line_spacing", libs);
  gidLink(cast(void**)&adw_wrap_layout_get_line_spacing_unit, "adw_wrap_layout_get_line_spacing_unit", libs);
  gidLink(cast(void**)&adw_wrap_layout_get_natural_line_length, "adw_wrap_layout_get_natural_line_length", libs);
  gidLink(cast(void**)&adw_wrap_layout_get_natural_line_length_unit, "adw_wrap_layout_get_natural_line_length_unit", libs);
  gidLink(cast(void**)&adw_wrap_layout_get_pack_direction, "adw_wrap_layout_get_pack_direction", libs);
  gidLink(cast(void**)&adw_wrap_layout_get_wrap_policy, "adw_wrap_layout_get_wrap_policy", libs);
  gidLink(cast(void**)&adw_wrap_layout_get_wrap_reverse, "adw_wrap_layout_get_wrap_reverse", libs);
  gidLink(cast(void**)&adw_wrap_layout_set_align, "adw_wrap_layout_set_align", libs);
  gidLink(cast(void**)&adw_wrap_layout_set_child_spacing, "adw_wrap_layout_set_child_spacing", libs);
  gidLink(cast(void**)&adw_wrap_layout_set_child_spacing_unit, "adw_wrap_layout_set_child_spacing_unit", libs);
  gidLink(cast(void**)&adw_wrap_layout_set_justify, "adw_wrap_layout_set_justify", libs);
  gidLink(cast(void**)&adw_wrap_layout_set_justify_last_line, "adw_wrap_layout_set_justify_last_line", libs);
  gidLink(cast(void**)&adw_wrap_layout_set_line_homogeneous, "adw_wrap_layout_set_line_homogeneous", libs);
  gidLink(cast(void**)&adw_wrap_layout_set_line_spacing, "adw_wrap_layout_set_line_spacing", libs);
  gidLink(cast(void**)&adw_wrap_layout_set_line_spacing_unit, "adw_wrap_layout_set_line_spacing_unit", libs);
  gidLink(cast(void**)&adw_wrap_layout_set_natural_line_length, "adw_wrap_layout_set_natural_line_length", libs);
  gidLink(cast(void**)&adw_wrap_layout_set_natural_line_length_unit, "adw_wrap_layout_set_natural_line_length_unit", libs);
  gidLink(cast(void**)&adw_wrap_layout_set_pack_direction, "adw_wrap_layout_set_pack_direction", libs);
  gidLink(cast(void**)&adw_wrap_layout_set_wrap_policy, "adw_wrap_layout_set_wrap_policy", libs);
  gidLink(cast(void**)&adw_wrap_layout_set_wrap_reverse, "adw_wrap_layout_set_wrap_reverse", libs);

  // global
  gidLink(cast(void**)&adw_get_enable_animations, "adw_get_enable_animations", libs);
  gidLink(cast(void**)&adw_get_major_version, "adw_get_major_version", libs);
  gidLink(cast(void**)&adw_get_micro_version, "adw_get_micro_version", libs);
  gidLink(cast(void**)&adw_get_minor_version, "adw_get_minor_version", libs);
  gidLink(cast(void**)&adw_init, "adw_init", libs);
  gidLink(cast(void**)&adw_is_initialized, "adw_is_initialized", libs);
  gidLink(cast(void**)&adw_lerp, "adw_lerp", libs);
  gidLink(cast(void**)&adw_rgba_to_standalone, "adw_rgba_to_standalone", libs);
  gidLink(cast(void**)&adw_show_about_dialog, "adw_show_about_dialog", libs);
  gidLink(cast(void**)&adw_show_about_dialog_from_appdata, "adw_show_about_dialog_from_appdata", libs);
  gidLink(cast(void**)&adw_show_about_window, "adw_show_about_window", libs);
  gidLink(cast(void**)&adw_show_about_window_from_appdata, "adw_show_about_window_from_appdata", libs);

  // AccentColor
  gidLink(cast(void**)&adw_accent_color_to_rgba, "adw_accent_color_to_rgba", libs);
  gidLink(cast(void**)&adw_accent_color_to_standalone_rgba, "adw_accent_color_to_standalone_rgba", libs);

  // Easing
  gidLink(cast(void**)&adw_easing_ease, "adw_easing_ease", libs);

  // LengthUnit
  gidLink(cast(void**)&adw_length_unit_from_px, "adw_length_unit_from_px", libs);
  gidLink(cast(void**)&adw_length_unit_to_px, "adw_length_unit_to_px", libs);
}
