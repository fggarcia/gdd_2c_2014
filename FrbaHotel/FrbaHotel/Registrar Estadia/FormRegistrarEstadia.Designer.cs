namespace FrbaHotel.Registrar_Estadia
{
    partial class FormRegistrarEstadia
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
            this.lblBookingId = new System.Windows.Forms.Label();
            this.buttonSearch = new System.Windows.Forms.Button();
            this.textBoxBookingId = new System.Windows.Forms.TextBox();
            this.dgvBooking = new System.Windows.Forms.DataGridView();
            this.buttonCheckIn = new System.Windows.Forms.Button();
            this.buttonCheckOut = new System.Windows.Forms.Button();
            this.buttonBack = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dgvBooking)).BeginInit();
            this.SuspendLayout();
            // 
            // lblBookingId
            // 
            this.lblBookingId.AutoSize = true;
            this.lblBookingId.Location = new System.Drawing.Point(171, 39);
            this.lblBookingId.Name = "lblBookingId";
            this.lblBookingId.Size = new System.Drawing.Size(67, 13);
            this.lblBookingId.TabIndex = 0;
            this.lblBookingId.Text = "Nro Reserva";
            // 
            // buttonSearch
            // 
            this.buttonSearch.Location = new System.Drawing.Point(236, 79);
            this.buttonSearch.Name = "buttonSearch";
            this.buttonSearch.Size = new System.Drawing.Size(75, 23);
            this.buttonSearch.TabIndex = 1;
            this.buttonSearch.Text = "Buscar";
            this.buttonSearch.UseVisualStyleBackColor = true;
            this.buttonSearch.Click += new System.EventHandler(this.buttonSearch_Click);
            // 
            // textBoxBookingId
            // 
            this.textBoxBookingId.Location = new System.Drawing.Point(268, 36);
            this.textBoxBookingId.Name = "textBoxBookingId";
            this.textBoxBookingId.Size = new System.Drawing.Size(137, 20);
            this.textBoxBookingId.TabIndex = 1;
            // 
            // dgvBooking
            // 
            this.dgvBooking.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvBooking.Location = new System.Drawing.Point(12, 119);
            this.dgvBooking.Name = "dgvBooking";
            this.dgvBooking.Size = new System.Drawing.Size(552, 93);
            this.dgvBooking.TabIndex = 2;
            // 
            // buttonCheckIn
            // 
            this.buttonCheckIn.Location = new System.Drawing.Point(236, 239);
            this.buttonCheckIn.Name = "buttonCheckIn";
            this.buttonCheckIn.Size = new System.Drawing.Size(75, 23);
            this.buttonCheckIn.TabIndex = 3;
            this.buttonCheckIn.Text = "Check In";
            this.buttonCheckIn.UseVisualStyleBackColor = true;
            this.buttonCheckIn.Click += new System.EventHandler(this.buttonCheckIn_Click);
            // 
            // buttonCheckOut
            // 
            this.buttonCheckOut.Location = new System.Drawing.Point(364, 239);
            this.buttonCheckOut.Name = "buttonCheckOut";
            this.buttonCheckOut.Size = new System.Drawing.Size(75, 23);
            this.buttonCheckOut.TabIndex = 4;
            this.buttonCheckOut.Text = "Check Out";
            this.buttonCheckOut.UseVisualStyleBackColor = true;
            this.buttonCheckOut.Click += new System.EventHandler(this.buttonCheckOut_Click);
            // 
            // buttonBack
            // 
            this.buttonBack.Location = new System.Drawing.Point(97, 239);
            this.buttonBack.Name = "buttonBack";
            this.buttonBack.Size = new System.Drawing.Size(75, 23);
            this.buttonBack.TabIndex = 5;
            this.buttonBack.Text = "Volver";
            this.buttonBack.UseVisualStyleBackColor = true;
            this.buttonBack.Click += new System.EventHandler(this.buttonBack_Click);
            // 
            // FormRegistrarEstadia
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(576, 309);
            this.Controls.Add(this.buttonBack);
            this.Controls.Add(this.buttonCheckOut);
            this.Controls.Add(this.buttonCheckIn);
            this.Controls.Add(this.dgvBooking);
            this.Controls.Add(this.textBoxBookingId);
            this.Controls.Add(this.buttonSearch);
            this.Controls.Add(this.lblBookingId);
            this.Name = "FormRegistrarEstadia";
            this.Text = "Registrar Estadia";
            this.Load += new System.EventHandler(this.FormRegistrarEstadia_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvBooking)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblBookingId;
        private System.Windows.Forms.Button buttonSearch;
        private System.Windows.Forms.TextBox textBoxBookingId;
        private System.Windows.Forms.DataGridView dgvBooking;
        private System.Windows.Forms.Button buttonCheckIn;
        private System.Windows.Forms.Button buttonCheckOut;
        private System.Windows.Forms.Button buttonBack;
    }
}