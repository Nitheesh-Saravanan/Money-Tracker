import 'db_helper.dart';
import '../models/transaction_model.dart';

class TransactionService {
  final DBHelper _dbHelper = DBHelper();

  Future<List<Transaction>> getAllTransactions() async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('transactions');

    return List.generate(maps.length, (i) {
      return Transaction.fromMap(maps[i]);
    });
  }

  Future<int> addTransaction(Transaction transaction) async {
    final db = await _dbHelper.database;
    return await db.insert('transactions', transaction.toMap());
  }

  Future<int> updateTransaction(Transaction transaction) async {
    final db = await _dbHelper.database;
    return await db.update(
      'transactions',
      transaction.toMap(),
      where: 'tran_id = ?',
      whereArgs: [transaction.tranId],
    );
  }

  Future<int> deleteTransaction(int id) async {
    final db = await _dbHelper.database;
    return await db.delete(
      'transactions',
      where: 'tran_id = ?',
      whereArgs: [id],
    );
  }
}
