# 🐶 Funny Dogs

**Funny Dogs** es una app iOS desarrollada en SwiftUI que muestra una lista de perros divertidos, cada uno con su imagen, descripción y edad. Es un proyecto construido con principios de arquitectura limpia, pruebas unitarias y persistencia local usando SQLite.

---

## 📱 Capturas de pantalla

<p float="left">
  <img src="https://github.com/user-attachments/assets/f6f54faf-110d-4387-86d5-583ad9ce672d" width="200" />

  <img src="https://github.com/user-attachments/assets/4471bcb4-4c4b-4e46-8739-09f75b54921e" width="200" />
</p>

---

## 🚀 Funcionalidades

- Listado de perros con nombre, descripción, edad e imagen.
- Carga de datos desde un caso de uso (Use Case).
- Persistencia local con SQLite.swift.
- Arquitectura desacoplada y probada.
- Manejo de errores con mensajes amigables.

---

## 🧱 Arquitectura

La app sigue una arquitectura modularizada:

- **Vista**: SwiftUI (`FDDogListView`, `FDDogCellView`)
- **ViewModel**: `FDDogListViewModel`
- **UseCase**: `FDGetDogsUseCase`
- **Modelo**: `FDDogViewModel`
- **Persistencia**: `FDDatabase` (usando SQLite.swift)

---

## 🔧 Cómo clonar y correr el proyecto

### 1. Clonar el repositorio

```bash
git clone https://github.com/patroncito/funny-dogs.git
cd funny-dogs
