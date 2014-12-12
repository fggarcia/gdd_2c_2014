namespace FrbaHotel.ABM_de_Reserva
{
    partial class FormABMReserva
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
            this.buttonModify = new System.Windows.Forms.Button();
            this.buttonDelete = new System.Windows.Forms.Button();
            this.buttonCreate = new System.Windows.Forms.Button();
            this.buttonBack = new System.Windows.Forms.Button();
            this.dgvReserva = new System.Windows.Forms.DataGridView();
            this.buttonSearch = new System.Windows.Forms.Button();
            this.buttonClean = new System.Windows.Forms.Button();
            this.txtNombre = new System.Windows.Forms.TextBox();
            this.lblCliente = new System.Windows.Forms.Label();
            this.TxtNroReserva = new System.Windows.Forms.TextBox();
            this.lblNroreserva = new System.Windows.Forms.Label();
            this.txtApellido = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dgvReserva)).BeginInit();
            this.SuspendLayout();
            // 
            // buttonModify
            // 
            this.buttonModify.Location = new System.Drawing.Point(793, 352);
            this.buttonModify.Name = "buttonModify";
            this.buttonModify.Size = new System.Drawing.Size(111, 23);
            this.buttonModify.TabIndex = 30;
            this.buttonModify.Text = "Modificar Reserva";
            this.buttonModify.UseVisualStyleBackColor = true;
            this.buttonModify.Click += new System.EventHandler(this.buttonModify_Click);
            // 
            // buttonDelete
            // 
            this.buttonDelete.Location = new System.Drawing.Point(569, 352);
            this.buttonDelete.Name = "buttonDelete";
            this.buttonDelete.Size = new System.Drawing.Size(97, 23);
            this.buttonDelete.TabIndex = 29;
            this.buttonDelete.Text = "Baja Reserva";
            this.buttonDelete.UseVisualStyleBackColor = true;
            // 
            // buttonCreate
            // 
            this.buttonCreate.Location = new System.Drawing.Point(290, 352);
            this.buttonCreate.Name = "buttonCreate";
            this.buttonCreate.Size = new System.Drawing.Size(111, 23);
            this.buttonCreate.TabIndex = 28;
            this.buttonCreate.Text = "Crear Reserva";
            this.buttonCreate.UseVisualStyleBackColor = true;
            this.buttonCreate.Click += new System.EventHandler(this.buttonCreate_Click);
            // 
            // buttonBack
            // 
            this.buttonBack.Location = new System.Drawing.Point(45, 353);
            this.buttonBack.Name = "buttonBack";
            this.buttonBack.Size = new System.Drawing.Size(75, 23);
            this.buttonBack.TabIndex = 27;
            this.buttonBack.Text = "Volver";
            this.buttonBack.UseVisualStyleBackColor = true;
            this.buttonBack.Click += new System.EventHandler(this.buttonBack_Click);
            // 
            // dgvReserva
            // 
            this.dgvReserva.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvReserva.Location = new System.Drawing.Point(12, 177);
            this.dgvReserva.Name = "dgvReserva";
            this.dgvReserva.Size = new System.Drawing.Size(920, 150);
            this.dgvReserva.TabIndex = 26;
            // 
            // buttonSearch
            // 
            this.buttonSearch.Location = new System.Drawing.Point(341, 116);
            this.buttonSearch.Name = "buttonSearch";
            this.buttonSearch.Size = new System.Drawing.Size(75, 23);
            this.buttonSearch.TabIndex = 25;
            this.buttonSearch.Text = "Buscar";
            this.buttonSearch.UseVisualStyleBackColor = true;
            this.buttonSearch.Click += new System.EventHandler(this.buttonSearch_Click);
            // 
            // buttonClean
            // 
            this.buttonClean.Location = new System.Drawing.Point(45, 116);
            this.buttonClean.Name = "buttonClean";
            this.buttonClean.Size = new System.Drawing.Size(75, 23);
            this.buttonClean.TabIndex = 24;
            this.buttonClean.Text = "Limpiar";
            this.buttonClean.UseVisualStyleBackColor = true;
            this.buttonClean.Click += new System.EventHandler(this.buttonClean_Click);
            // 
            // txtNombre
            // 
            this.txtNombre.Location = new System.Drawing.Point(177, 30);
            this.txtNombre.Name = "txtNombre";
            this.txtNombre.Size = new System.Drawing.Size(121, 20);
            this.txtNombre.TabIndex = 17;
            // 
            // lblCliente
            // 
            this.lblCliente.AutoSize = true;
            this.lblCliente.Location = new System.Drawing.Point(106, 33);
            this.lblCliente.Name = "lblCliente";
            this.lblCliente.Size = new System.Drawing.Size(44, 13);
            this.lblCliente.TabIndex = 16;
            this.lblCliente.Text = "Nombre";
            // 
            // TxtNroReserva
            // 
            this.TxtNroReserva.Location = new System.Drawing.Point(402, 30);
            this.TxtNroReserva.Name = "TxtNroReserva";
            this.TxtNroReserva.Size = new System.Drawing.Size(121, 20);
            this.TxtNroReserva.TabIndex = 32;
            // 
            // lblNroreserva
            // 
            this.lblNroreserva.AutoSize = true;
            this.lblNroreserva.Location = new System.Drawing.Point(331, 33);
            this.lblNroreserva.Name = "lblNroreserva";
            this.lblNroreserva.Size = new System.Drawing.Size(62, 13);
            this.lblNroreserva.TabIndex = 31;
            this.lblNroreserva.Text = "N° Reserva";
            // 
            // txtApellido
            // 
            this.txtApellido.Location = new System.Drawing.Point(177, 65);
            this.txtApellido.Name = "txtApellido";
            this.txtApellido.Size = new System.Drawing.Size(121, 20);
            this.txtApellido.TabIndex = 33;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(106, 65);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(44, 13);
            this.label1.TabIndex = 34;
            this.label1.Text = "Apellido";
            // 
            // FormABMReserva
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1010, 487);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.txtApellido);
            this.Controls.Add(this.TxtNroReserva);
            this.Controls.Add(this.lblNroreserva);
            this.Controls.Add(this.buttonModify);
            this.Controls.Add(this.buttonDelete);
            this.Controls.Add(this.buttonCreate);
            this.Controls.Add(this.buttonBack);
            this.Controls.Add(this.dgvReserva);
            this.Controls.Add(this.buttonSearch);
            this.Controls.Add(this.buttonClean);
            this.Controls.Add(this.txtNombre);
            this.Controls.Add(this.lblCliente);
            this.Name = "FormABMReserva";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.FormABMReserva_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvReserva)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button buttonModify;
        private System.Windows.Forms.Button buttonDelete;
        private System.Windows.Forms.Button buttonCreate;
        private System.Windows.Forms.Button buttonBack;
        private System.Windows.Forms.DataGridView dgvReserva;
        private System.Windows.Forms.Button buttonSearch;
        private System.Windows.Forms.Button buttonClean;
        private System.Windows.Forms.TextBox txtNombre;
        private System.Windows.Forms.Label lblCliente;
        private System.Windows.Forms.TextBox TxtNroReserva;
        private System.Windows.Forms.Label lblNroreserva;
        private System.Windows.Forms.TextBox txtApellido;
        private System.Windows.Forms.Label label1;
    }
}