import 'package:flutter/material.dart';
import '../../services/api_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiService apiService = ApiService();
  List<dynamic> curhatList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchCurhatan();
  }

  Future<void> fetchCurhatan() async {
    setState(() => isLoading = true);
    try {
      final data = await apiService.getCurhatan();
      setState(() {
        curhatList = data;
      });
    } catch (e) {
      print("Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal memuat data: $e')),
      );
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MauCurhat.id"),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: fetchCurhatan,
          )
        ],
      ),
      body: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: isLoading
                ? Center(child: CircularProgressIndicator())
                : curhatList.isEmpty
                    ? Center(child: Text("Belum ada curhatan."))
                    : ListView.builder(
                        padding: EdgeInsets.all(16.0),
                        itemCount: curhatList.length,
                        itemBuilder: (context, index) {
                          final curhat = curhatList[index];
                          return _curhatCard(
                            context,
                            curhat['judul'] ?? '',
                            curhat['isi'] ?? '',
                          );
                        },
                      ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, '/add_curhat');
          fetchCurhatan(); // refresh data setelah kembali
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      color: Colors.blue.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Selamat Datang di MauCurhat.id",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(
            "Platform untuk berbagi cerita dan mendapatkan dukungan dari komunitas",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/add_curhat');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple.shade200,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: Text("Buat Curhatan Baru", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _curhatCard(BuildContext context, String title, String content) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(content, maxLines: 2, overflow: TextOverflow.ellipsis),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.favorite, color: Colors.blue),
                  label: Text('Dukung', style: TextStyle(color: Colors.blue)),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/read_more',
                      arguments: {'judul': title, 'isi': content},
                    );
                  },
                  child: Text('Baca Selengkapnya >', style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
