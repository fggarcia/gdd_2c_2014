namespace FrbaHotel.ABM_de_Habitacion
{
    partial class FormABMHabitacion
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.lblHotel = new System.Windows.Forms.Label();
            this.lblRoom = new System.Windows.Forms.Label();
            this.lblFloor = new System.Windows.Forms.Label();
            this.textBoxFloor = new System.Windows.Forms.TextBox();
            this.lblFront = new System.Windows.Forms.Label();
            this.comboBoxFront = new System.Windows.Forms.ComboBox();
            this.lblType = new System.Windows.Forms.Label();
            this.comboBoxType = new System.Windows.Forms.ComboBox();
            this.lblDescription = new System.Windows.Forms.Label();
            this.textBoxDescription = new System.Windows.Forms.TextBox();
            this.comboBoxHotel = new System.Windows.Forms.ComboBox();
            this.textBoxRoom = new System.Windows.Forms.TextBox();
            this.buttonClean = new System.Windows.Forms.Button();
            this.buttonSearch = new System.Windows.Forms.Button();
            this.dgvRoom = new System.Windows.Forms.DataGridView();
            this.buttonBack = new System.Windows.Forms.Button();
            this.buttonCreate = new System.Windows.Forms.Button();
            this.buttonModify = new System.Windows.Forms.Button();
            this.buttonDisablePeriod = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dgvRoom)).BeginInit();
            this.SuspendLayout();
            // 
            // lblHotel
            // 
            this.lblHotel.AutoSize = true;
            this.lblHotel.Location = new System.Drawing.Point(43, 13);
            this.lblHotel.Name = "lblHotel";
            this.lblHotel.Size = new System.Drawing.Size(32, 13);
            this.lblHotel.TabIndex = 0;
            this.lblHotel.Text = "Hotel";
            // 
            // lblRoom
            // 
            this.lblRoom.AutoSize = true;
            this.lblRoom.Location = new System.Drawing.Point(429, 13);
            this.lblRoom.Name = "lblRoom";
            this.lblRoom.Size = new System.Drawing.Size(58, 13);
            this.lblRoom.TabIndex = 2;
            this.lblRoom.Text = "Habitacion";
            // 
            // lblFloor
            // 
            this.lblFloor.AutoSize = true;
            this.lblFloor.Location = new System.Drawing.Point(43, 58);
            this.lblFloor.Name = "lblFloor";
            this.lblFloor.Size = new System.Drawing.Size(27, 13);
            this.lblFloor.TabIndex = 4;
            this.lblFloor.Text = "Piso";
            // 
            // textBoxFloor
            // 
            this.textBoxFloor.Location = new System.Drawing.Point(123, 55);
            this.textBoxFloor.Name = "textBoxFloor";
            this.textBoxFloor.Size = new System.Drawing.Size(121, 20);
            this.textBoxFloor.TabIndex = 3;
            // 
            // lblFront
            // 
            this.lblFront.AutoSize = true;
            this.lblFront.Location = new System.Drawing.Point(429, 55);
            this.lblFront.Name = "lblFront";
            this.lblFront.Size = new System.Drawing.Size(37, 13);
            this.lblFront.TabIndex = 6;
            this.lblFront.Text = "Frente";
            // 
            // comboBoxFront
            // 
            this.comboBoxFront.FormattingEnabled = true;
            this.comboBoxFront.Location = new System.Drawing.Point(493, 51);
            this.comboBoxFront.Name = "comboBoxFront";
            this.comboBoxFront.Size = new System.Drawing.Size(121, 21);
            this.comboBoxFront.TabIndex = 4;
            // 
            // lblType
            // 
            this.lblType.AutoSize = true;
            this.lblType.Location = new System.Drawing.Point(43, 98);
            this.lblType.Name = "lblType";
            this.lblType.Size = new System.Drawing.Size(28, 13);
            this.lblType.TabIndex = 8;
            this.lblType.Text = "Tipo";
            // 
            // comboBoxType
            // 
            this.comboBoxType.FormattingEnabled = true;
            this.comboBoxType.Location = new System.Drawing.Point(123, 95);
            this.comboBoxType.Name = "comboBoxType";
            this.comboBoxType.Size = new System.Drawing.Size(121, 21);
            this.comboBoxType.TabIndex = 5;
            // 
            // lblDescription
            // 
            this.lblDescription.AutoSize = true;
            this.lblDescription.Location = new System.Drawing.Point(429, 98);
            this.lblDescription.Name = "lblDescription";
            this.lblDescription.Size = new System.Drawing.Size(63, 13);
            this.lblDescription.TabIndex = 10;
            this.lblDescription.Text = "Descripcion";
            // 
            // textBoxDescription
            // 
            this.textBoxDescription.Location = new System.Drawing.Point(493, 94);
            this.textBoxDescription.Name = "textBoxDescription";
            this.textBoxDescription.Size = new System.Drawing.Size(121, 20);
            this.textBoxDescription.TabIndex = 6;
            // 
            // comboBoxHotel
            // 
            this.comboBoxHotel.FormattingEnabled = true;
            this.comboBoxHotel.Location = new System.Drawing.Point(123, 10);
            this.comboBoxHotel.Name = "comboBoxHotel";
            this.comboBoxHotel.Size = new System.Drawing.Size(121, 21);
            this.comboBoxHotel.TabIndex = 1;
            // 
            // textBoxRoom
            // 
            this.textBoxRoom.Location = new System.Drawing.Point(493, 10);
            this.textBoxRoom.Name = "textBoxRoom";
            this.textBoxRoom.Size = new System.Drawing.Size(121, 20);
            this.textBoxRoom.TabIndex = 2;
            // 
            // buttonClean
            // 
            this.buttonClean.Location = new System.Drawing.Point(105, 133);
            this.buttonClean.Name = "buttonClean";
            this.buttonClean.Size = new System.Drawing.Size(75, 23);
            this.buttonClean.TabIndex = 13;
            this.buttonClean.Text = "Limpiar";
            this.buttonClean.UseVisualStyleBackColor = true;
            this.buttonClean.Click += new System.EventHandler(this.buttonClean_Click);
            // 
            // buttonSearch
            // 
            this.buttonSearch.Location = new System.Drawing.Point(493, 132);
            this.buttonSearch.Name = "buttonSearch";
            this.buttonSearch.Size = new System.Drawing.Size(75, 23);
            this.buttonSearch.TabIndex = 14;
            this.buttonSearch.Text = "Buscar";
            this.buttonSearch.UseVisualStyleBackColor = true;
            this.buttonSearch.Click += new System.EventHandler(this.buttonSearch_Click);
            // 
            // dgvRoom
            // 
            this.dgvRoom.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvRoom.Location = new System.Drawing.Point(19, 171);
            this.dgvRoom.Name = "dgvRoom";
            this.dgvRoom.Size = new System.Drawing.Size(667, 150);
            this.dgvRoom.TabIndex = 15;
            // 
            // buttonBack
            // 
            this.buttonBack.Location = new System.Drawing.Point(46, 353);
            this.buttonBack.Name = "buttonBack";
            this.buttonBack.Size = new System.Drawing.Size(75, 23);
            this.buttonBack.TabIndex = 16;
            this.buttonBack.Text = "Volver";
            this.buttonBack.UseVisualStyleBackColor = true;
            this.buttonBack.Click += new System.EventHandler(this.buttonBack_Click);
            // 
            // buttonCreate
            // 
            this.buttonCreate.Location = new System.Drawing.Point(230, 352);
            this.buttonCreate.Name = "buttonCreate";
            this.buttonCreate.Size = new System.Drawing.Size(75, 23);
            this.buttonCreate.TabIndex = 17;
            this.buttonCreate.Text = "Crear";
            this.buttonCreate.UseVisualStyleBackColor = true;
            this.buttonCreate.Click += new System.EventHandler(this.buttonCreate_Click);
            // 
            // buttonModify
            // 
            this.buttonModify.Location = new System.Drawing.Point(591, 353);
            this.buttonModify.Name = "buttonModify";
            this.buttonModify.Size = new System.Drawing.Size(75, 23);
            this.buttonModify.TabIndex = 20;
            this.buttonModify.Text = "Modificar";
            this.buttonModify.UseVisualStyleBackColor = true;
            this.buttonModify.Click += new System.EventHandler(this.buttonModify_Click);
            // 
            // buttonDisablePeriod
            // 
            this.buttonDisablePeriod.Location = new System.Drawing.Point(417, 352);
            this.buttonDisablePeriod.Name = "buttonDisablePeriod";
            this.buttonDisablePeriod.Size = new System.Drawing.Size(75, 23);
            this.buttonDisablePeriod.TabIndex = 21;
            this.buttonDisablePeriod.Text = "Baja Periodo";
            this.buttonDisablePeriod.UseVisualStyleBackColor = true;
            this.buttonDisablePeriod.Click += new System.EventHandler(this.buttonDisablePeriod_Click);
            // 
            // FormABMHabitacion
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(717, 424);
            this.Controls.Add(this.buttonDisablePeriod);
            this.Controls.Add(this.buttonModify);
            this.Controls.Add(this.buttonCreate);
            this.Controls.Add(this.buttonBack);
            this.Controls.Add(this.dgvRoom);
            this.Controls.Add(this.buttonSearch);
            this.Controls.Add(this.buttonClean);
            this.Controls.Add(this.comboBoxHotel);
            this.Controls.Add(this.textBoxDescription);
            this.Controls.Add(this.lblDescription);
            this.Controls.Add(this.comboBoxType);
            this.Controls.Add(this.lblType);
            this.Controls.Add(this.comboBoxFront);
            this.Controls.Add(this.lblFront);
            this.Controls.Add(this.textBoxFloor);
            this.Controls.Add(this.lblFloor);
            this.Controls.Add(this.textBoxRoom);
            this.Controls.Add(this.lblRoom);
            this.Controls.Add(this.lblHotel);
            this.Name = "FormABMHabitacion";
            this.Text = "FormABMHabitacion";
            this.Load += new System.EventHandler(this.FormABMHabitacion_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvRoom)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblHotel;
        private System.Windows.Forms.Label lblRoom;
        private System.Windows.Forms.Label lblFloor;
        private System.Windows.Forms.TextBox textBoxFloor;
        private System.Windows.Forms.Label lblFront;
        private System.Windows.Forms.ComboBox comboBoxFront;
        private System.Windows.Forms.Label lblType;
        private System.Windows.Forms.ComboBox comboBoxType;
        private System.Windows.Forms.Label lblDescription;
        private System.Windows.Forms.TextBox textBoxDescription;
        private System.Windows.Forms.ComboBox comboBoxHotel;
        private System.Windows.Forms.TextBox textBoxRoom;
        private System.Windows.Forms.Button buttonClean;
        private System.Windows.Forms.Button buttonSearch;
        private System.Windows.Forms.DataGridView dgvRoom;
        private System.Windows.Forms.Button buttonBack;
        private System.Windows.Forms.Button buttonCreate;
        private System.Windows.Forms.Button buttonModify;
        private System.Windows.Forms.Button buttonDisablePeriod;
    }
}