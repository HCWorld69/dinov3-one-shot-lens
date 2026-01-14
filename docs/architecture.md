# Architecture

This fork keeps the upstream runtime flow intact and documents the main data path.

```mermaid
graph TD
  UI[CameraScreen / CameraView] -->|frames| Cubit[SegmentationCubit]
  Cubit -->|isolate compute| Iso[Segmentation Isolate]
  Iso -->|ONNX session| ONNX[flutter_onnxruntime]
  Cubit -->|overlay image| Overlay[OverlayPainter]
  UI -->|preview| Camera[CameraController]
```

## Data flow summary
1. CameraController streams frames to CameraView.
2. SegmentationCubit throttles frames using frameSkipCount.
3. The isolate preprocesses frames and runs the ONNX session.
4. Similarity scores are thresholded to produce the overlay.
5. OverlayPainter renders the mask over the camera preview.

## Key modules
- lib/camera_screen.dart: UI, camera preview, and controls.
- lib/cubit/segmentation_cubit.dart: state orchestration and isolate calls.
- lib/segmentation_isolate.dart: preprocessing and ONNX inference.
- lib/constants.dart: runtime tuning constants.
