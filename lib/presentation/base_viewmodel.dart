import 'package:flutter/material.dart';

/// Base class for all ViewModels in the application.
///
/// Extends [ChangeNotifier] to provide the ability to notify listeners
/// of changes to the ViewModel's state.
abstract class BaseViewModel extends ChangeNotifier {}
