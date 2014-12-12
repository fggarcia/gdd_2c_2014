namespace FrbaHotel.ABM_de_Reserva
{
    partial class FormAltaReserva
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
            this.dTDesde = new System.Windows.Forms.DateTimePicker();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.dTHasta = new System.Windows.Forms.DateTimePicker();
            this.dgvRegimen = new System.Windows.Forms.DataGridView();
            this.label4 = new System.Windows.Forms.Label();
            this.button_consultar = new System.Windows.Forms.Button();
            this.button_volver = new System.Windows.Forms.Button();
            this.dgvTipoHabitacion = new System.Windows.Forms.DataGridView();
            this.label3 = new System.Windows.Forms.Label();
            this.cmbHotel = new System.Windows.Forms.ComboBox();
            this.lblHotel = new System.Windows.Forms.Label();
            this.buttonAddClient = new System.Windows.Forms.Button();
            this.dgvClient = new System.Windows.Forms.DataGridView();
            this.buttonSearch = new System.Windows.Forms.Button();
            this.textBoxDocumentNumber = new System.Windows.Forms.TextBox();
            this.lblNroDocument = new System.Windows.Forms.Label();
            this.textBoxLastName = new System.Windows.Forms.TextBox();
            this.lblLastName = new System.Windows.Forms.Label();
            this.textBoxName = new System.Windows.Forms.TextBox();
            this.lblName = new System.Windows.Forms.Label();
            this.buttonClean = new System.Windows.Forms.Button();
            this.buttonReservar = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dgvRegimen)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvTipoHabitacion)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvClient)).BeginInit();
            this.SuspendLayout();
            // 
            // dTDesde
            // 
            this.dTDesde.Location = new System.Drawing.Point(116, 23);
            this.dTDesde.Name = "dTDesde";
            this.dTDesde.Size = new System.Drawing.Size(190, 20);
            this.dTDesde.TabIndex = 0;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(23, 23);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(74, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = "Fecha Desde:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(23, 74);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(71, 13);
            this.label2.TabIndex = 3;
            this.label2.Text = "Fecha Hasta:";
            // 
            // dTHasta
            // 
            this.dTHasta.Location = new System.Drawing.Point(116, 74);
            this.dTHasta.Name = "dTHasta";
            this.dTHasta.Size = new System.Drawing.Size(190, 20);
            this.dTHasta.TabIndex = 2;
            // 
            // dgvRegimen
            // 
            this.dgvRegimen.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvRegimen.Location = new System.Drawing.Point(12, 148);
            this.dgvRegimen.Name = "dgvRegimen";
            this.dgvRegimen.Size = new System.Drawing.Size(335, 134);
            this.dgvRegimen.TabIndex = 6;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(155, 122);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(77, 13);
            this.label4.TabIndex = 7;
            this.label4.Text = "Regimen Hotel";
            // 
            // button_consultar
            // 
            this.button_consultar.Location = new System.Drawing.Point(346, 12);
            this.button_consultar.Name = "button_consultar";
            this.button_consultar.Size = new System.Drawing.Size(88, 35);
            this.button_consultar.TabIndex = 8;
            this.button_consultar.Text = "Consultar";
            this.button_consultar.UseVisualStyleBackColor = true;
            this.button_consultar.Click += new System.EventHandler(this.button_consultar_Click);
            // 
            // button_volver
            // 
            this.button_volver.Location = new System.Drawing.Point(346, 63);
            this.button_volver.Name = "button_volver";
            this.button_volver.Size = new System.Drawing.Size(88, 35);
            this.button_volver.TabIndex = 9;
            this.button_volver.Text = "Volver";
            this.button_volver.UseVisualStyleBackColor = true;
            this.button_volver.Click += new System.EventHandler(this.button_volver_Click);
            // 
            // dgvTipoHabitacion
            // 
            this.dgvTipoHabitacion.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvTipoHabitacion.Location = new System.Drawing.Point(363, 148);
            this.dgvTipoHabitacion.Name = "dgvTipoHabitacion";
            this.dgvTipoHabitacion.Size = new System.Drawing.Size(167, 150);
            this.dgvTipoHabitacion.TabIndex = 10;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(406, 122);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(82, 13);
            this.label3.TabIndex = 11;
            this.label3.Text = "Tipo Habitacion";
            // 
            // cmbHotel
            // 
            this.cmbHotel.FormattingEnabled = true;
            this.cmbHotel.Location = new System.Drawing.Point(472, 47);
            this.cmbHotel.Name = "cmbHotel";
            this.cmbHotel.Size = new System.Drawing.Size(58, 21);
            this.cmbHotel.TabIndex = 12;
            this.cmbHotel.SelectedIndexChanged += new System.EventHandler(this.cmbHotel_SelectedIndexChanged);
            // 
            // lblHotel
            // 
            this.lblHotel.AutoSize = true;
            this.lblHotel.Location = new System.Drawing.Point(469, 23);
            this.lblHotel.Name = "lblHotel";
            this.lblHotel.Size = new System.Drawing.Size(46, 13);
            this.lblHotel.TabIndex = 13;
            this.lblHotel.Text = "ID Hotel";
            // 
            // buttonAddClient
            // 
            this.buttonAddClient.Location = new System.Drawing.Point(656, 312);
            this.buttonAddClient.Name = "buttonAddClient";
            this.buttonAddClient.Size = new System.Drawing.Size(116, 23);
            this.buttonAddClient.TabIndex = 19;
            this.buttonAddClient.Text = "Agregar Cliente";
            this.buttonAddClient.UseVisualStyleBackColor = true;
            this.buttonAddClient.Click += new System.EventHandler(this.buttonAddClient_Click);
            // 
            // dgvClient
            // 
            this.dgvClient.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvClient.Location = new System.Drawing.Point(562, 148);
            this.dgvClient.Name = "dgvClient";
            this.dgvClient.Size = new System.Drawing.Size(315, 150);
            this.dgvClient.TabIndex = 18;
            // 
            // buttonSearch
            // 
            this.buttonSearch.Location = new System.Drawing.Point(789, 112);
            this.buttonSearch.Name = "buttonSearch";
            this.buttonSearch.Size = new System.Drawing.Size(75, 23);
            this.buttonSearch.TabIndex = 20;
            this.buttonSearch.Text = "Buscar";
            this.buttonSearch.UseVisualStyleBackColor = true;
            this.buttonSearch.Click += new System.EventHandler(this.buttonSearch_Click);
            // 
            // textBoxDocumentNumber
            // 
            this.textBoxDocumentNumber.Location = new System.Drawing.Point(706, 82);
            this.textBoxDocumentNumber.Name = "textBoxDocumentNumber";
            this.textBoxDocumentNumber.Size = new System.Drawing.Size(100, 20);
            this.textBoxDocumentNumber.TabIndex = 23;
            // 
            // lblNroDocument
            // 
            this.lblNroDocument.AutoSize = true;
            this.lblNroDocument.Location = new System.Drawing.Point(609, 85);
            this.lblNroDocument.Name = "lblNroDocument";
            this.lblNroDocument.Size = new System.Drawing.Size(82, 13);
            this.lblNroDocument.TabIndex = 26;
            this.lblNroDocument.Text = "Nro Documento";
            // 
            // textBoxLastName
            // 
            this.textBoxLastName.Location = new System.Drawing.Point(706, 47);
            this.textBoxLastName.Name = "textBoxLastName";
            this.textBoxLastName.Size = new System.Drawing.Size(100, 20);
            this.textBoxLastName.TabIndex = 22;
            // 
            // lblLastName
            // 
            this.lblLastName.AutoSize = true;
            this.lblLastName.Location = new System.Drawing.Point(609, 50);
            this.lblLastName.Name = "lblLastName";
            this.lblLastName.Size = new System.Drawing.Size(44, 13);
            this.lblLastName.TabIndex = 25;
            this.lblLastName.Text = "Apellido";
            // 
            // textBoxName
            // 
            this.textBoxName.Location = new System.Drawing.Point(706, 12);
            this.textBoxName.Name = "textBoxName";
            this.textBoxName.Size = new System.Drawing.Size(100, 20);
            this.textBoxName.TabIndex = 21;
            // 
            // lblName
            // 
            this.lblName.AutoSize = true;
            this.lblName.Location = new System.Drawing.Point(609, 15);
            this.lblName.Name = "lblName";
            this.lblName.Size = new System.Drawing.Size(44, 13);
            this.lblName.TabIndex = 24;
            this.lblName.Text = "Nombre";
            // 
            // buttonClean
            // 
            this.buttonClean.Location = new System.Drawing.Point(612, 111);
            this.buttonClean.Name = "buttonClean";
            this.buttonClean.Size = new System.Drawing.Size(75, 23);
            this.buttonClean.TabIndex = 27;
            this.buttonClean.Text = "Limpiar";
            this.buttonClean.UseVisualStyleBackColor = true;
            this.buttonClean.Click += new System.EventHandler(this.buttonClean_Click);
            // 
            // buttonReservar
            // 
            this.buttonReservar.Location = new System.Drawing.Point(472, 82);
            this.buttonReservar.Name = "buttonReservar";
            this.buttonReservar.Size = new System.Drawing.Size(88, 35);
            this.buttonReservar.TabIndex = 28;
            this.buttonReservar.Text = "Confirmar Reserva";
            this.buttonReservar.UseVisualStyleBackColor = true;
            this.buttonReservar.Click += new System.EventHandler(this.buttonReservar_Click);
            // 
            // FormAltaReserva
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(907, 367);
            this.Controls.Add(this.buttonReservar);
            this.Controls.Add(this.buttonClean);
            this.Controls.Add(this.textBoxDocumentNumber);
            this.Controls.Add(this.lblNroDocument);
            this.Controls.Add(this.textBoxLastName);
            this.Controls.Add(this.lblLastName);
            this.Controls.Add(this.textBoxName);
            this.Controls.Add(this.lblName);
            this.Controls.Add(this.buttonSearch);
            this.Controls.Add(this.buttonAddClient);
            this.Controls.Add(this.dgvClient);
            this.Controls.Add(this.lblHotel);
            this.Controls.Add(this.cmbHotel);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.dgvTipoHabitacion);
            this.Controls.Add(this.button_volver);
            this.Controls.Add(this.button_consultar);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.dgvRegimen);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.dTHasta);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.dTDesde);
            this.Name = "FormAltaReserva";
            this.Text = "FormAltaReserva";
            this.Load += new System.EventHandler(this.FormAltaReserva_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvRegimen)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvTipoHabitacion)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvClient)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DateTimePicker dTDesde;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.DateTimePicker dTHasta;
        private System.Windows.Forms.DataGridView dgvRegimen;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Button button_consultar;
        private System.Windows.Forms.Button button_volver;
        private System.Windows.Forms.DataGridView dgvTipoHabitacion;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.ComboBox cmbHotel;
        private System.Windows.Forms.Label lblHotel;
        private System.Windows.Forms.Button buttonAddClient;
        private System.Windows.Forms.DataGridView dgvClient;
        private System.Windows.Forms.Button buttonSearch;
        private System.Windows.Forms.TextBox textBoxDocumentNumber;
        private System.Windows.Forms.Label lblNroDocument;
        private System.Windows.Forms.TextBox textBoxLastName;
        private System.Windows.Forms.Label lblLastName;
        private System.Windows.Forms.TextBox textBoxName;
        private System.Windows.Forms.Label lblName;
        private System.Windows.Forms.Button buttonClean;
        private System.Windows.Forms.Button buttonReservar;
    }
}