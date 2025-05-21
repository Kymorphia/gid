//!gir Secret-1
//!info description "D binding for the libsecret library - GObject-based library for storing and receiving secrets"
//!info website https://gitlab.gnome.org/GNOME/libsecret
//!info docs https://www.kymorphia.com/gid/secret.html
//!info capi https://gnome.pages.gitlab.gnome.org/libsecret

//# Rename secret parameter since it conflicts with "secret" module path
//!set record[Value].constructor[new_full].parameters.parameter[secret][name] secretData
