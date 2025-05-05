package com.example.mathapp4

import android.os.Bundle
import android.widget.*
import androidx.appcompat.app.AppCompatActivity

class MainActivity : AppCompatActivity() {

    private lateinit var leftTextBox: EditText
    private lateinit var rightTextBox: EditText
    private var currentValue: Double = 0.0

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        leftTextBox = findViewById(R.id.leftTextBox)
        rightTextBox = findViewById(R.id.rightTextBox)

        val btnAdd = findViewById<Button>(R.id.btnAdd)
        val btnSubtract = findViewById<Button>(R.id.btnSubtract)
        val btnMultiply = findViewById<Button>(R.id.btnMultiply)
        val btnDivide = findViewById<Button>(R.id.btnDivide)

        btnAdd.setOnClickListener { applyOperation("+") }
        btnSubtract.setOnClickListener { applyOperation("-") }
        btnMultiply.setOnClickListener { applyOperation("*") }
        btnDivide.setOnClickListener { applyOperation("/") }
    }

    private fun applyOperation(op: String) {
        val input = rightTextBox.text.toString().toDoubleOrNull()
        if (input == null) {
            Toast.makeText(this, "Enter a valid number", Toast.LENGTH_SHORT).show()
            return
        }

        currentValue = when (op) {
            "+" -> currentValue + input
            "-" -> currentValue - input
            "*" -> currentValue * input
            "/" -> if (input != 0.0) currentValue / input else {
                Toast.makeText(this, "Can't divide by zero", Toast.LENGTH_SHORT).show()
                return
            }
            else -> currentValue
        }

        leftTextBox.setText(currentValue.toString())
    }
}
