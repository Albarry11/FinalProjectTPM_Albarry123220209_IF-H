import 'package:sensors_plus/sensors_plus.dart';

class StepTrackingService {
  void startTracking(Function(int) updateSteps) {
    int steps = 0;
    
    // Menggunakan accelerometerEvents untuk mendapatkan data sensor accelerometer
    accelerometerEvents.listen((AccelerometerEvent event) {
      // Logika sederhana untuk mendeteksi langkah berdasarkan perubahan pada akselerasi
      if (event.x.abs() > 1.0 || event.y.abs() > 1.0 || event.z.abs() > 1.0) {  
        steps++; // Menambahkan langkah
        updateSteps(steps); // Memperbarui jumlah langkah
      }
    });
  }
}
