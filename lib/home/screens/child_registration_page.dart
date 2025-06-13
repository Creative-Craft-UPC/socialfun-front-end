import 'package:flutter/material.dart';
import 'package:social_fun/app_colors.dart';
import 'package:social_fun/home/screens/child_list_page.dart';
import 'package:social_fun/shared/widgets/return_app_bar.dart';

class RegisterChildScreen extends StatefulWidget {
  const RegisterChildScreen({super.key});

  @override
  State<RegisterChildScreen> createState() => _RegisterChildScreenState();
}

class _RegisterChildScreenState extends State<RegisterChildScreen> {
  // Controladores
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _genderController = TextEditingController();
  final _severityController = TextEditingController();
  final _verbalLevelController = TextEditingController();
  final _preferredColorsController = TextEditingController();
  final _stimuliController = TextEditingController();

  // Opciones
  String _instructionLevel = 'Media';
  final Map<String, bool> _emotions = {
    'Alegría': false,
    'Miedo': false,
    'Tristeza': false,
    'Sorpresa': false,
    'Enojo': false,
    'Asco': false,
  };

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _genderController.dispose();
    _severityController.dispose();
    _verbalLevelController.dispose();
    _preferredColorsController.dispose();
    _stimuliController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: SocialFunReturnAppBar(
        onBack: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 6),
              // Campos del formulario
              _buildTextField('Nombre del niño', _nameController),
              _buildTextField('Edad', _ageController,
                  inputType: TextInputType.number),
              _buildTextField('Sexo', _genderController),
              _buildTextField(
                  'Nivel de severidad DSM (2 o 3)', _severityController),
              _buildTextField(
                  'Comprensión verbal (1 a 5)', _verbalLevelController),

              const SizedBox(height: 12),
              _buildRadioGroup(),
              const SizedBox(height: 12),
              _buildCheckboxGroup(),

              _buildTextField('Colores preferidos', _preferredColorsController),
              _buildTextField('Estímulos a evitar', _stimuliController),

              const SizedBox(height: 20),
              _buildAvatarUpload(),

              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChildListScreen(
                          childrenNames: ('Juan, Romina').split(', '),
                        ),
                      )
                    );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                child: const Text(
                  'REGISTRAR',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {TextInputType inputType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextField(
        controller: controller,
        keyboardType: inputType,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
    );
  }

  Widget _buildRadioGroup() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Comprensión de instrucciones simples'),
        RadioListTile(
          title: const Text('Avanzada'),
          value: 'Avanzada',
          groupValue: _instructionLevel,
          onChanged: (value) => setState(() => _instructionLevel = value!),
        ),
        RadioListTile(
          title: const Text('Media'),
          value: 'Media',
          groupValue: _instructionLevel,
          onChanged: (value) => setState(() => _instructionLevel = value!),
        ),
        RadioListTile(
          title: const Text('Baja'),
          value: 'Baja',
          groupValue: _instructionLevel,
          onChanged: (value) => setState(() => _instructionLevel = value!),
        ),
      ],
    );
  }

  Widget _buildCheckboxGroup() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Emociones que comprende mejor'),
        Wrap(
          spacing: 10,
          children: _emotions.keys.map((emotion) {
            return FilterChip(
              label: Text(emotion),
              selected: _emotions[emotion]!,
              onSelected: (val) => setState(() => _emotions[emotion] = val),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildAvatarUpload() {
    return Column(
      children: [
        const Text('Avatar'),
        const SizedBox(height: 8),
        ElevatedButton.icon(
          onPressed: () {
            // TODO: Agregar lógica para subir imagen
          },
          icon: const Icon(Icons.upload),
          label: const Text('Subir archivo'),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.black,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
        ),
        const SizedBox(height: 12),
        const CircleAvatar(
          radius: 40,
          backgroundImage:
              AssetImage('assets/avatar_placeholder.png'), // Imagen por defecto
        )
      ],
    );
  }
}
