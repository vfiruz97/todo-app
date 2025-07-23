import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/services/settings_service.dart';
import '../../../injection.dart';
import '../../cubit/settings/settings_cubit.dart';
import '../../cubit/settings/settings_state.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(getIt<SettingsService>()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Settings')),
        body: BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) {
            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                // Server Configuration Section
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Server Configuration', style: Theme.of(context).textTheme.titleLarge),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: TextEditingController(text: state.serverUrl),
                          decoration: const InputDecoration(
                            labelText: 'Server URL',
                            hintText: 'http://localhost:8080',
                            prefixIcon: Icon(Icons.link),
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) => context.read<SettingsCubit>().updateServerUrl(value),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            ElevatedButton.icon(
                              onPressed: state.hasUnsavedChanges
                                  ? () => context.read<SettingsCubit>().saveSettings()
                                  : null,
                              icon: const Icon(Icons.save),
                              label: const Text('Save'),
                            ),
                            const SizedBox(width: 8),
                            TextButton.icon(
                              onPressed: () => context.read<SettingsCubit>().resetToDefault(),
                              icon: const Icon(Icons.restore),
                              label: const Text('Reset to Default'),
                            ),
                          ],
                        ),
                        if (state.hasUnsavedChanges)
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              'You have unsaved changes',
                              style: Theme.of(
                                context,
                              ).textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.primary),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Connection Status Section
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Connection Status', style: Theme.of(context).textTheme.titleLarge),
                        const SizedBox(height: 16),
                        _buildConnectionStatus(context, state),
                        const SizedBox(height: 16),
                        ElevatedButton.icon(
                          onPressed: () => context.read<SettingsCubit>().testConnection(),
                          icon: const Icon(Icons.wifi_find),
                          label: const Text('Test Connection'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildConnectionStatus(BuildContext context, SettingsState state) {
    Color statusColor;
    IconData statusIcon;
    String statusText;

    switch (state.connectionStatus) {
      case ConnectionStatus.connected:
        statusColor = Theme.of(context).colorScheme.primary;
        statusIcon = Icons.wifi;
        statusText = 'Connected';
        break;
      case ConnectionStatus.disconnected:
        statusColor = Theme.of(context).colorScheme.error;
        statusIcon = Icons.wifi_off;
        statusText = 'Disconnected';
        break;
      case ConnectionStatus.testing:
        statusColor = Theme.of(context).colorScheme.outline;
        statusIcon = Icons.hourglass_empty;
        statusText = 'Testing...';
        break;
      case ConnectionStatus.unknown:
        statusColor = Theme.of(context).colorScheme.outline;
        statusIcon = Icons.help_outline;
        statusText = 'Unknown';
        break;
    }

    return Row(
      children: [
        Icon(statusIcon, color: statusColor, size: 24),
        const SizedBox(width: 12),
        Text(
          statusText,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: statusColor, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
