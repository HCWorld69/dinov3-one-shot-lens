# DINOv3 One-Shot Lens (Flutter) - Portfolio Fork

Upstream: https://github.com/IoT-gamer/flutter_dinov3_one_shot_demo  
License: MIT (see LICENSE). This fork preserves the upstream LICENSE and attribution.  
Maintained by Harsh Chandra.

This repository is a maintained fork intended for portfolio review. It builds on the original work by Sean P. Leary and the IoT-gamer organization; it is not a from-scratch implementation.

## Overview
This Flutter app demonstrates one-shot object segmentation on a live camera feed using a DINOv3 feature extractor. Users provide a single RGBA reference image to create a prototype, then the app segments matching objects in real time.

## Screenshots
<div style="display: flex; gap: 3px; flex-wrap: wrap; justify-content: left; align-items: left;">
<figure>
<img src="docs/images/no_mask.jpg" alt="no mask" height="200"/>
<figcaption>No Mask</figcaption>
</figure>
<figure>
<img src="docs/images/low_res_mask.jpg" alt="low res mask" height="200"/>
<figcaption>Low-res Mask</figcaption>
</figure>
<figure>
<img src="docs/images/high_res_mask.jpg" alt="high res mask" height="200"/>
<figcaption>High-res Mask</figcaption>
</figure>
</div>

## What I changed
- Added GitHub Actions CI running format, analyze, and test on each PR.
- Added NOTICE-based attribution alongside the preserved MIT LICENSE.
- Added developer scripts (tool/dev.sh, Makefile) for repeatable format/analyze/test.
- Added architecture documentation with a data-flow diagram in docs/architecture.md.
- Expanded docs with setup, model notes, limitations, troubleshooting, and demo flow.
- Updated package metadata (name, description, version, repository links).

## Setup and run
1. Prerequisites:
   - Flutter SDK (Dart >= 3.10.0)
   - CMake (required by opencv_dart)
   - A physical Android or iOS device
2. Clone:
   - git clone https://github.com/HCWorld69/dinov3-one-shot-lens.git
   - cd dinov3-one-shot-lens
3. Model:
   - Export dinov3_feature_extractor.onnx using:
     https://github.com/IoT-gamer/segment-anything-dinov3-onnx/blob/main/notebooks/dinov3_onnx_export.ipynb
   - Place the file at assets/dinov3_feature_extractor.onnx
4. Install dependencies:
   - flutter pub get
5. iOS setup:
   - In ios/Podfile, set platform :ios, '16.0'
   - In ios/Podfile, set use_frameworks! :linkage => :static
6. Run:
   - flutter run

## Developer workflow
- tool/dev.sh get|format|analyze|test|run|ci
- make get|format|analyze|test|run|ci

## Model and embedding notes
- Model: DINOv3 feature extractor ONNX (assets/dinov3_feature_extractor.onnx).
- Inference: flutter_onnxruntime on a background isolate with NNAPI (Android), Core ML (iOS), CPU fallback.
- Input sizes: 320/400/512/768; patch size 16; similarity threshold 0.5 to 0.9.
- Performance caveats: larger inputs reduce FPS; adjust frameSkipCount in lib/constants.dart.

## Demo flow
1. Prepare an RGBA PNG with a transparent background (only the object should be opaque).
2. Launch the app and tap the upload icon to set the reference prototype.
3. Tap Play to start segmentation and Stop to pause.
4. Use the Tune slider to adjust similarity threshold.
5. Use the filter icon to keep only the largest segmented area.

## Troubleshooting
- Failed to initialize model: confirm the ONNX file exists in assets/ and is listed in pubspec.yaml.
- Invalid file after upload: ensure the reference image is RGBA PNG with transparency.
- Camera not showing: verify Android permissions in AndroidManifest.xml or iOS entries in Info.plist.
- Build errors with opencv_dart: install CMake and re-run flutter pub get.
- Slow performance: lower input size and increase frameSkipCount.

## Limitations
- Segmentation quality depends on clean RGBA reference images.
- On-device FPS varies widely by hardware; high input sizes are expensive.
- No persistence of the reference prototype across app restarts.

## Release packaging guidance
- Android: flutter build apk --release or flutter build appbundle and include MIT attribution in in-app licenses.
- iOS: update Podfile settings above, then flutter build ios --release with proper signing.

## Attribution
This fork is derived from IoT-gamer/flutter_dinov3_one_shot_demo by Sean P. Leary. See NOTICE and LICENSE for details.

## License
MIT. See LICENSE.
